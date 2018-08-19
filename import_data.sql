CREATE TABLE IF NOT EXISTS `omnichat` (
  `appeal_id` int(11) NOT NULL,
  `dt` datetime NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `msg_type` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `channel_type` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `answer_time` int(11) DEFAULT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

TRUNCATE omnichat;

LOAD DATA LOCAL INFILE 'DATA/dialogs_2.csv' 
INTO TABLE omnichat 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(appeal_id, dt, @client_id, @user_id, @msg_type, @channel_id, @channel_name, @channel_type, @answer_time, @text)
SET
client_id = nullif(@client_id, ''),
user_id = nullif(@user_id, ''),
msg_type = nullif(@msg_type, ''),
channel_id = nullif(@channel_id, ''),
channel_name = nullif(@channel_name, ''),
channel_type = nullif(@channel_type, ''),
answer_time = nullif(@answer_time, ''),
text = nullif(@text, '');