/*
 *    Copyright (C) 2012 Wouter Caarls (DBL)
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU Lesser General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU Lesser General Public License for more details.
 *
 *    You should have received a copy of the GNU Lesser General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <QtGui>

#include "Dialog.h"

Dialog::Dialog(Simulator *sim) :
  mSim(sim)
{
  mLogDebugLn("Dialog constructor");

  setupUi(this); // this sets up GUI
  mGLWidget->enableTimeDisplay(false);
  mGLWidget->init();  // Do not forget to initialize the GLWidget
  setWindowFlags(Qt::CustomizeWindowHint | Qt::WindowTitleHint | Qt::WindowMinimizeButtonHint | Qt::WindowMaximizeButtonHint | Qt::WindowCloseButtonHint);

  // Set sim
  mGLWidget->setSim(sim->getSim());
  mGLWidget->dsSetShadows(0);

  // signals/slots mechanism
  connect(sim, SIGNAL(drawFrame()), this, SLOT(drawGLWidget()));
  connect(mCbxEnableGraphics, SIGNAL(toggled(bool)), this, SLOT(enableGraphics(bool)));
}

Dialog::~Dialog(void)
{
  mLogDebugLn("Dialog destructor");
}

void Dialog::drawGLWidget()
{
  char timeStr[20];
  sprintf(timeStr, "Time: %.4f", mSim->getSim()->getTime());
  mStatusBar->showMessage(timeStr);

  mGLWidget->update();
}

void Dialog::enableGraphics(bool enabled)
{
  mGLWidget->enableGraphics(enabled);
  mGLWidget->update();
}
