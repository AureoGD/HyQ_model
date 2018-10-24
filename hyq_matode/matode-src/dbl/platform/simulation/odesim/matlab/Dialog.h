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

#ifndef DIALOG_H_
#define DIALOG_H_

#include <QtGui/QDialog>

#include "MatlabODE.h"
#include "Simulator.h"
#include "DialogUI.h"

class Dialog : public QMainWindow, public Ui::Dialog, protected MainLog
{
  Q_OBJECT

protected:
  Simulator *mSim;

public:
  Dialog(Simulator *sim);
  ~Dialog();

public slots:
  void enableGraphics(bool);
  void drawGLWidget();
};

#endif /* DIALOG_H_ */
