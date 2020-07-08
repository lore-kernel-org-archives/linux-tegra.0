From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/6] Improvements for MAX77620 GPIO driver
Date: Wed,  8 Jul 2020 23:23:49 +0300
Message-ID: <20200708202355.28507-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello!

This series addresses a problem that I discovered on Nexus 7 device where
GPIO interrupts may be left enabled after bootloader and the driver isn't
prepared to this. It also makes a small improvements to the code, fixes the
non-released interrupt bug and converts driver to use irqchip template.

Changelog:

v3: - Addressed review comment that were made by Andy Shevchenko to v2:

        - Improved the commit message of the "Initialize hardware state of
          interrupts" patch.

        - Added these new patches:

           gpio: max77620: Don't set of_node
           gpio: max77620: Don't shadow error code of platform_get_irq()
           gpio: max77620: Use irqchip template

    - Added "Fix missing release of interrupt" patch.

v2: - Addressed review comment that were made by Andy Shevchenko to v1:

        - Generic init_hw() callback is used now for resetting interrupts.

        - These v1 patches are dropped:

           gpio: max77620: Replace interrupt-enable array with bitmap
           gpio: max77620: Don't handle disabled interrupts
           gpio: max77620: Move variable declaration

Dmitry Osipenko (6):
  gpio: max77620: Replace 8 with MAX77620_GPIO_NR
  gpio: max77620: Fix missing release of interrupt
  gpio: max77620: Don't set of_node
  gpio: max77620: Don't shadow error code of platform_get_irq()
  gpio: max77620: Use irqchip template
  gpio: max77620: Initialize hardware state of interrupts

 drivers/gpio/gpio-max77620.c | 65 ++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 21 deletions(-)

-- 
2.26.0
