import pymysql
from PyQt5.QtWidgets import QPushButton, QWidget, QVBoxLayout, QGridLayout, \
    QLabel, QLineEdit, QGroupBox


class FormThree(QWidget):
    id_query = ""
    query_data = []


    def __init__(self, parent):
        super(QWidget, self).__init__(parent)

        self.id_label = QLabel('Player ID')
        self.id_le = QLineEdit()
        self.submit_btn = QPushButton('Submit')
        self.submit_btn.clicked.connect(self.on_click)

        self.fname_label = QLabel('First Name')
        self.lname_label = QLabel('Last Name')
        self.phone_label = QLabel('Phone')
        self.email_label = QLabel('Email')

        self.fname_le = QLineEdit()
        self.lname_le = QLineEdit()
        self.phone_le = QLineEdit()
        self.email_le = QLineEdit()

        self.button_box = QGroupBox('Enter Player ID (1-10) to retrieve player information')
        self.info_groupbox = QGroupBox()

        self.init_ui()

    def init_ui(self):
        self.layout = QVBoxLayout(self)

        self.create_buttonbox()
        self.layout.addWidget(self.button_box)

        self.create_grid_layout()
        self.layout.addWidget(self.info_groupbox)

        self.setLayout(self.layout)

    def create_grid_layout(self):
        grid_layout = QGridLayout()
        grid_layout.setColumnStretch(0, 1)
        grid_layout.setColumnStretch(1, 3)
        grid_layout.setColumnStretch(2, 2)

        grid_layout.addWidget(self.fname_label, 0, 0)
        grid_layout.addWidget(self.fname_le, 0, 1)
        grid_layout.addWidget(self.lname_label, 1, 0)
        grid_layout.addWidget(self.lname_le, 1, 1)
        grid_layout.addWidget(self.phone_label, 2, 0)
        grid_layout.addWidget(self.phone_le, 2, 1)
        grid_layout.addWidget(self.email_label, 3, 0)
        grid_layout.addWidget(self.email_le, 3, 1)

        self.info_groupbox.setLayout(grid_layout)

    def create_buttonbox(self):
        button_layout = QGridLayout()
        button_layout.addWidget(self.id_label, 0, 0)
        button_layout.addWidget(self.id_le, 0, 1)
        button_layout.addWidget(self.submit_btn, 1, 1)
        self.button_box.setLayout(button_layout)

    def on_click(self):
        global id_query
        global query_data

        id = self.id_le.text()
        if len(id) > 0:
            id_query = ("SELECT f_name, l_name, contact_phone, email FROM player "
                               "WHERE member_id = %s" % id)
            self.db_connect()

            self.fname_le.setText(query_data[0])
            self.lname_le.setText(query_data[1])
            self.phone_le.setText(query_data[2])
            self.email_le.setText(query_data[3])

    def db_connect(self):
        global query_data

        # Open database connection
        con = pymysql.connect("localhost", "testuser", "test123", "final_fantasy")

        with con:
            # prepare a cursor object using cursor() method
            cursor = con.cursor()

            # execute SQL query using id_query string.
            cursor.execute(id_query)

            # grab tuple from query
            data = cursor.fetchall()

            # unpack data tuple into list
            query_data = [x for i in data for x in i]

            print(query_data)






