From: Wolfram Sang <wsa@the-dreams.de>
Subject: [RFC 0/9] i2c: slave: improve i2c client address spaces and their DT support
Date: Fri, 17 Jul 2015 16:08:20 +0200
Message-ID: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa@the-dreams.de>, Andrey Danin <danindrey@mail.ru>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

As promised here is my RFC to improve address spaces for I2C. This should give
i2c seperate address spaces for standard clients, 10 bit clients, and our own
slave clients. So, you can now have a 7 bit slave at 0x50 and a 10 bit slave at
0x050. Or, you can have a slave driver listening at some address and at the
same time have a client driver talking to this address. Note that this is only
the core support for that separation, I am still not sure if there is hardware
being able talking to its own slave address, but we will see.

This RFC and while I did some quick tests, it is not thoroughly tested. But I
wanted to push it out before I leave the computer for the weekend. It still
shows what path I chose to solve the problem. So, comments on that and further
testing are more than welcome!

BTW Andrey, I did not modify your patch and couldn't get the i2c-slave-eeprom driver
to work with my Jetson TK1. Does this work for you?

Thanks,

   Wolfram


Andrey Danin (1):
  i2c: tegra: implement slave mode

Wolfram Sang (8):
  dt-bindings: add header for generic I2C flags in bindings
  i2c: add a flag to mark clients as slaves
  i2c: apply address offset for slaves, too
  i2c: rename address check functions
  i2c: make address check indpendent from client struct
  i2c: apply DT flags when probing
  i2c: take address space into account when checking for used addresses
  dts: tegra: WIP: hack dts to test new dt flags for i2c

 arch/arm/boot/dts/tegra124-jetson-tk1.dts |   7 ++
 drivers/i2c/busses/Kconfig                |   1 +
 drivers/i2c/busses/i2c-tegra.c            | 119 ++++++++++++++++++++++++++++++
 drivers/i2c/i2c-core.c                    |  69 +++++++++++------
 include/dt-bindings/i2c/i2c.h             |  18 +++++
 include/linux/i2c.h                       |   9 ++-
 6 files changed, 197 insertions(+), 26 deletions(-)
 create mode 100644 include/dt-bindings/i2c/i2c.h

-- 
2.1.4

