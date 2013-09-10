From: Johan Hovold <jhovold@gmail.com>
Subject: [PATCH 0/4] serial: fix tty-kref leaks
Date: Tue, 10 Sep 2013 12:50:47 +0200
Message-ID: <1378810251-28499-1-git-send-email-jhovold@gmail.com>
Return-path: <linux-serial-owner@vger.kernel.org>
Sender: linux-serial-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>, Stephen Warren <swarren@wwwdotorg.org>, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, Johan Hovold <jhovold@gmail.com>
List-Id: linux-tegra@vger.kernel.org

These patches fix a few tty-kref leaks in the tegra and pch_uart
drivers.

Note that the tegra patch is completely untested, whereas the pch_uart
ones are compile-tested only.

Thanks,
Johan


Johan Hovold (4):
  serial: tegra: fix tty-kref leak
  serial: pch_uart: fix tty-kref leak in rx-error path
  serial: pch_uart: fix tty-kref leak in dma-rx path
  serial: pch_uart: remove unnecessary tty_port_tty_get

 drivers/tty/serial/pch_uart.c     | 13 +++----------
 drivers/tty/serial/serial-tegra.c |  4 +++-
 2 files changed, 6 insertions(+), 11 deletions(-)

-- 
1.8.3.2

