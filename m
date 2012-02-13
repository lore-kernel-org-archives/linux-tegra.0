From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1 0/3] Support for open drain gpios in gpilib/fixed regulators.
Date: Mon, 13 Feb 2012 11:59:45 +0530
Message-ID: <1329114588-15430-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, dunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch is as per discussion on the patch
[PATCH V1] regulator: fixed: Support for open-drain gpio 
where it was suggested to push the handling of open drain gpios
into the gpio libray.
Also gpio documentation says the possibility of open-drain gpio support.

This is series of patches  to add support of the open drain gpios
in standard gpio library and using this in fixed regulators.
- Added GPIOF_OD flag so that client can request the gpio with this flag.
- Added support for the sysfs interface for open-drain.
- Handle open drain gpio configuration properly.
- Use this flag in fixed regualtor to tell that gpio is open drain.
- Gpio documentation changes to have support for open-drain.

Laxman Dewangan (3):
  gpio: gpiolib: Support for open drain gpios
  Documentation: gpio: Add details of open-drain configuration
  regulator: fixed: Support for open-drain gpio

 Documentation/gpio.txt          |   21 +++++-
 drivers/gpio/gpiolib.c          |  144 ++++++++++++++++++++++++++++++++++++++-
 drivers/regulator/fixed.c       |   29 ++++----
 include/linux/gpio.h            |    3 +
 include/linux/regulator/fixed.h |    7 ++
 5 files changed, 184 insertions(+), 20 deletions(-)
