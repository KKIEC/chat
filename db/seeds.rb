user1 = User.create(username: 'Krzychu', password: 'xxxxxxxx')
user2 = User.create(username: 'Jonsnow', password: 'password')
user3 = User.create(username: 'Arya', password: 'password')
user4 = User.create(username: 'Frodo', password: 'password')
user5 = User.create(username: 'Gandalf', password: 'password')

mes1 = Message.create(body: 'New message', user_id: user1.id)
mes2 = Message.create(body: 'New message no. 2', user_id: user1.id)
mes3 = Message.create(body: 'New message from another user', user_id: user2.id)
