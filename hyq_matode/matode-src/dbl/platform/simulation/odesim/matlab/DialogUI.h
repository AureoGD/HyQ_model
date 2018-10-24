/********************************************************************************
** Form generated from reading UI file 'Dialog.ui'
**
** Created: Thu Apr 7 14:32:00 2011
**      by: Qt User Interface Compiler version 4.6.2
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef DIALOGUI_H
#define DIALOGUI_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QCheckBox>
#include <QtGui/QGridLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QMainWindow>
#include <QtGui/QStatusBar>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>
#include <SimVisWidget.h>

QT_BEGIN_NAMESPACE

class Ui_Dialog
{
public:
    QWidget *mCentralWidget;
    QGridLayout *gridLayout;
    QVBoxLayout *verticalLayout;
    CSimVisWidget *mGLWidget;
    QCheckBox *mCbxEnableGraphics;
    QStatusBar *mStatusBar;

    void setupUi(QMainWindow *Dialog)
    {
        if (Dialog->objectName().isEmpty())
            Dialog->setObjectName(QString::fromUtf8("Dialog"));
        Dialog->resize(800, 600);
        QSizePolicy sizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(Dialog->sizePolicy().hasHeightForWidth());
        Dialog->setSizePolicy(sizePolicy);
        mCentralWidget = new QWidget(Dialog);
        mCentralWidget->setObjectName(QString::fromUtf8("mCentralWidget"));
        gridLayout = new QGridLayout(mCentralWidget);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        mGLWidget = new CSimVisWidget(mCentralWidget);
        mGLWidget->setObjectName(QString::fromUtf8("mGLWidget"));
        QSizePolicy sizePolicy1(QSizePolicy::Expanding, QSizePolicy::Preferred);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(mGLWidget->sizePolicy().hasHeightForWidth());
        mGLWidget->setSizePolicy(sizePolicy1);

        verticalLayout->addWidget(mGLWidget);

        mCbxEnableGraphics = new QCheckBox(mCentralWidget);
        mCbxEnableGraphics->setObjectName(QString::fromUtf8("mCbxEnableGraphics"));
        mCbxEnableGraphics->setChecked(true);

        verticalLayout->addWidget(mCbxEnableGraphics);


        gridLayout->addLayout(verticalLayout, 0, 0, 1, 1);

        Dialog->setCentralWidget(mCentralWidget);
        mStatusBar = new QStatusBar(Dialog);
        mStatusBar->setObjectName(QString::fromUtf8("mStatusBar"));
        Dialog->setStatusBar(mStatusBar);

        retranslateUi(Dialog);

        QMetaObject::connectSlotsByName(Dialog);
    } // setupUi

    void retranslateUi(QMainWindow *Dialog)
    {
        Dialog->setWindowTitle(QApplication::translate("Dialog", "MatODE visualization", 0, QApplication::UnicodeUTF8));
        mCbxEnableGraphics->setText(QApplication::translate("Dialog", "Enable graphics", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class Dialog: public Ui_Dialog {};
} // namespace Ui

QT_END_NAMESPACE

#endif // DIALOGUI_H
