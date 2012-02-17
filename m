From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/3] Open drain/open source support from gpio library
Date: Fri, 17 Feb 2012 20:26:19 +0530
Message-ID: <1329490582-22107-2-git-send-email-ldewangan@nvidia.com>
References: <1329490582-22107-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1329490582-22107-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch is as per discussion on the patch
[PATCH V1] regulator: fixed: Support for open-drain gpio 
where it was suggested to push the handling of open drain gpios
into the gpio libray.

This is series of patches  to add support of the open drain and open
source gpios in standard gpio library.
- Added GPIOF_OPEN_DRAIN flag so that client can request the
  gpio with this flag. Handle open drain gpio configuration properly.
- Added GPIOF_OPEN_SOURCE flag so that client can request the
  gpio with this flag. Handle open source gpio configuration properly.
- Gpio documentation changes to have support for open-drain.

From the patch series of V1, it is discussed to
- remove the sysfs interface supportsi for open drain.
- Added open source support as a new change.

Laxman Dewangan (3):
  Documentation: gpio: Add details of open-drain/source configuration
  gpio: gpiolib: Support for open drain/collector gpios
  gpio: gpiolib: Support for open source/emitter gpios

 Documentation/gpio.txt |   17 +++++++++-
 drivers/gpio/gpiolib.c |   83 ++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/gpio.h   |    6 +++
 3 files changed, 102 insertions(+), 4 deletions(-)
