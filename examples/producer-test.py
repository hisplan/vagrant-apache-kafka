from kafka import SimpleProducer, KafkaClient

# To send messages synchronously
kafka = KafkaClient('192.168.200.200:9092')
producer = SimpleProducer(kafka)

# Note that the application is responsible for encoding messages to type bytes
producer.send_messages(b'my-topic', b'Hello, World!')
