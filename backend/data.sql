CREATE TABLE user_profiles (
	# profile details
	profile_id int(11) not null auto_increment,
	profile_name varchar(50) not null,
	profile_password varchar(40) not null,
	profile_email varchar(50) not null,
	profile_mobile varchar(15) not null,
	profile_age tinyint(11) not null,
	profile_sex enum('M','F') not null,
	profile_dob timestamp not null,
	profile_place varchar(20) not null,
	profile_hometown varchar(20) not null,
	profile_height_in_cm tinyint not null,
	profile_weight tinyint not null,
	profile_color varchar(10) not null,
	#horoscope details
	profile_rasi varchar(15) not null,
	profile_nakshatram varchar(15) not null,
	profile_paatham varchar(15) not null,
	profile_ghernav varchar(30) not null,
	profile_gothru varchar(20) not null,
	#contact details
	primary_contact_name varchar(15) not null,
	primary_contact_mobile varchar(15) not null,
	primary_contact_relation varchar(15) not null,
	primary_contact_address varchar(50) not null,
	#family details
	profile_brothers_unmarried tinyint not null,
	profile_brothers_married tinyint not null,
	profile_sisters_unmarried tinyint not null,
	profile_sisters_married tinyint not null,
	profile_family_status varchar(10) not null,
	#profession details
	education varchar(30) not null,
	profession varchar(30) not null,
	salary int(11) not null,
	hobby text not null,
	nri_status varchar(30) not null,
	about_me text not null,
	expectations text not null,
	#photos
	profile_image_urls text not null,
	profile_horoscope_url text not null,
	#timestamp details
	created_time timestamp not null default current_timestamp,
	updated_time timestamp null on update current_timestamp,
	last_login_time timestamp not null default current_timestamp,
	last_seen timestamp not null default current_timestamp,
	#premium details
	is_premium enum('0','1') not null default '0',
	premium_expiry_date timestamp default current_timestamp,
	primary key(profile_id),
	key profile_email(profile_email),
	key profile_mobile(profile_mobile)
	) engine=innodb auto_increment=1000;

CREATE TABLE profile_viewed_history (
	history_id int(11) not null auto_increment,
	profile_id int(11) not null,
	visitor_id int(11) not null,
	is_shortlist enum('0','1') not null default '0',
	last_visit_time timestamp null on update current_timestamp,
	primary key (history_id),
	key profile_id (profile_id),
	key visitor_id (visitor_id)
	) engine=innodb;

CREATE TABLE profile_notifications (
	profile_id int(11) not null,
	notification_id int(11) not null,
	notification_counter tinyint not null,
	primary key(profile_id)
	) engine=innodb;


CREATE TABLE profile_filters (
	id int(11) not null auto_increment,
	filter_id int(11) not null,
	profile_id int(11) not null,
	filter_key text not null,
	primary key(id),
	key profile_id(profile_id)
	) engine=innodb;

CREATE TABLE profile_transactions (
	profile_id int(11) not null,
	transaction_id int(11) not null,
	premium_key varchar(50) not null comment 'like website certificate',
	transaction_details varchar(100) not null,
	transaction_issues varchar(100) not null,
	primary key(profile_id),
	key transaction_id(transaction_id)
	) engine=innodb;

CREATE TABLE profile_chat_history (
	chat_id int not null auto_increment,
	from_id int not null,
	to_id int not null,
	history_id int not null,
	is_blocked_by int not null,
	message_content text not null,
	message_is_deleted enum('0','1') default '0',
	message_time timestamp default current_timestamp,
	primary key (chat_id),
	key from_id(from_id),
	key to_id(to_id)
	) engine=innodb;

CREATE TABLE feedback (
	profile_id int not null,
	feedback_content text not null,
	primary key (profile_id)
	) engine=innodb;
