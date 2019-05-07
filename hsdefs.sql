create table card (
	card_id int not null,
	mana_cost int not null,
	card_name varchar(255) not null,
	rarity varchar(255),
	description varchar(255),
	card_type varchar(255) not null,
	primary key (card_id)
);

INSERT INTO card(card_id, card_name, mana_cost, rarity, description, card_type) VALUES (1, 'Abomination', 5, 'Rare', 'Deal 2 damage to ALL characters.', 'Neutral');


create table card_weapon (
	card_id int not null,
	weapon_id int not null,
	primary key (card_id, weapon_id),
	constraint fk_card_weapon_card foreign key (card_id) 
	references card(card_id),
	constraint fk_card_weapon_weapon foreign key (weapon_id) 
	references weapon(weapon_id)
);

create table weapon (
	weapon_id int not null,
	ap int not null,
	durability int not null,
	primary key (weapon_id)
);

create table weapon_mechanics (
	weapon_id int not null,
	mech_id int not null,
	primary key (weapon_id, mech_id),
	foreign key (weapon_id) references weapon(weapon_id),
	foreign key (weapon_id) references mechanics(mech_id)
);

create table card_minion (
	card_id int not null,
	minion_id int not null,
	primary key (card_id, minion_id),
	foreign key (card_id) references card(card_id),
	foreign key (minion_id) references minion(minion_id)
);
INSERT INTO card_minion (card_id, minion_id) VALUES (1, 1);

create table minion (
	minion_id int not null,
	ap int not null,
	hp int not null,
	primary key (minion_id)
);

INSERT INTO minion (minion_id, ap, hp) VALUES (1, 4, 4);

create table minion_mechanics (
	minion_id int not null,
	mech_id int not null,
	primary key (minion_id,mech_id),
	foreign key (minion_id) references minion(minion_id),
	foreign key (mech_id) references mechanics(mech_id)
);

create table mechanics (
	mech_id int not null,
	name varchar(255),
	primary key (mech_id)
);

create table card_spell (
	card_id int not null,
	spell_id int not null,
	primary key (card_id, spell_id),
	foreign key (card_id) references card(card_id),
	foreign key (spell_id) references spell(spell_id)
);

create table spell (
	spell_id int not null,
	primary key (spell_id)
);

