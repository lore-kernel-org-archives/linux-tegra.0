From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/5] Improvements for MAX77620 GPIO driver
Date: Wed,  8 Jul 2020 11:26:29 +0300
Message-ID: <20200708082634.30191-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello!

This series addresses a problem that I discovered on Nexus 7 device where
GPIO interrupts may be left enabled after bootloader and the driver isn't
prepared to this. Secondly, I made few very minor cleanup improvements to
the code.

Dmitry Osipenko (5):
  gpio: max77620: Initialize interrupts state
  gpio: max77620: Replace 8 with MAX77620_GPIO_NR
  gpio: max77620: Replace interrupt-enable array with bitmap
  gpio: max77620: Don't handle disabled interrupts
  gpio: max77620: Move variable declaration

 drivers/gpio/gpio-max77620.c | 44 ++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 10 deletions(-)

-- 
2.26.0
