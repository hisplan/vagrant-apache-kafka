import glob
import time
from kafka import SimpleProducer, KafkaClient

kafka = KafkaClient('192.168.200.200:9092')
producer = SimpleProducer(kafka)

# note that the application is responsible for encoding messages to type bytes
flist = glob.glob("/vagrant/examples/query_log.txt.*.log")

for fname in flist:
	f = open(fname, "r")
	print fname
	for line in f:
		line = line.strip()
		if not line: continue
		producer.send_messages(b'my-topic', line)
		# time.sleep(0.1)
	f.close()


