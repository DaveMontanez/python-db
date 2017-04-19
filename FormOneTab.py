import pymysql
from PyQt5.QtWidgets import QPushButton, QWidget, QVBoxLayout, QHBoxLayout, \
    QGridLayout, QLabel, QLineEdit, QGroupBox


class FormOne(QWidget):

    id_list = []
    name_list = []
    level_list = []
    guild_list = []

    index = None

    def __init__(self, parent):
        global index
        index = 0
        super(QWidget, self).__init__(parent)

        self.id_label = QLabel('Player ID')
        self.name_label = QLabel('Character Name')
        self.level_label = QLabel('Character Level')
        self.guild_label = QLabel('Guild')
        self.id_le = QLineEdit()
        self.name_le = QLineEdit()
        self.level_le = QLineEdit()
        self.guild_le = QLineEdit()
        self.first_btn = QPushButton('First')
        self.prev_btn = QPushButton('Previous')
        self.next_btn = QPushButton('Next')
        self.last_btn = QPushButton('Last')

        self.first_btn.clicked.connect(self.on_click)
        self.prev_btn.clicked.connect(self.on_click)
        self.next_btn.clicked.connect(self.on_click)
        self.last_btn.clicked.connect(self.on_click)

        self.main_groupbox = QGroupBox('Character Info')
        self.button_box = QGroupBox()

        self.init_ui()
        self.db_connect()



    def init_ui(self):
        self.layout = QVBoxLayout(self)

        self.create_grid_layout()
        self.layout.addWidget(self.main_groupbox)
        self.create_buttonbox()
        self.layout.addWidget(self.button_box)

        self.setLayout(self.layout)



    def create_grid_layout(self):
        grid_layout = QGridLayout()
        grid_layout.setColumnStretch(0, 1)
        grid_layout.setColumnStretch(1, 3)
        grid_layout.setColumnStretch(2, 2)

        grid_layout.addWidget(self.id_label, 0, 0)
        grid_layout.addWidget(self.id_le, 0, 1)
        grid_layout.addWidget(self.name_label, 1, 0)
        grid_layout.addWidget(self.name_le, 1, 1)
        grid_layout.addWidget(self.level_label, 2, 0)
        grid_layout.addWidget(self.level_le, 2, 1)
        grid_layout.addWidget(self.guild_label, 3, 0)
        grid_layout.addWidget(self.guild_le, 3, 1)

        self.main_groupbox.setLayout(grid_layout)

    def create_buttonbox(self):
        button_layout = QHBoxLayout()
        button_layout.addWidget(self.first_btn)
        button_layout.addWidget(self.prev_btn)
        button_layout.addWidget(self.next_btn)
        button_layout.addWidget(self.last_btn)
        self.button_box.setLayout(button_layout)

    def on_click(self):
        global index

        sender = self.sender()

        if sender.text() == 'First':
            index = 0
            self.id_le.setText(str(id_list[0]))
            self.name_le.setText(name_list[0])
            self.level_le.setText(str(level_list[0]))
            self.guild_le.setText(guild_list[0])

        if sender.text() == 'Previous':
            if index > 0:
                index -= 1
                self.id_le.setText(str(id_list[index]))
                self.name_le.setText(name_list[index])
                self.level_le.setText(str(level_list[index]))
                self.guild_le.setText(guild_list[index])
                print(index)

        if sender.text() == 'Next':
            if index < 9:
                index += 1
                self.id_le.setText(str(id_list[index]))
                self.name_le.setText(name_list[index])
                self.level_le.setText(str(level_list[index]))
                self.guild_le.setText(guild_list[index])
                print(index)

        if sender.text() == 'Last':
            index = 9
            self.id_le.setText(str(id_list[9]))
            self.name_le.setText(name_list[9])
            self.level_le.setText(str(level_list[9]))
            self.guild_le.setText(guild_list[9])

    def db_connect(self):
        global id_list
        global name_list
        global level_list
        global guild_list

        # Open database connection
        con = pymysql.connect("localhost", "testuser", "test123", "final_fantasy")

        # prepare a cursor object using cursor() method
        cursor = con.cursor()

        # execute SQL query using execute() method.
        cursor.execute("SELECT member_id, char_name, char_lvl, guild_name FROM characters;")

        # grab all data from query
        data = cursor.fetchall()

        # unpack tuple of tuples into separate lists
        id_list = [x[0] for x in data]
        name_list = [x[1] for x in data]
        level_list = [x[2] for x in data]
        guild_list = [x[3] for x in data]

