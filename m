From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 0/2] Improvements for MAX77620 GPIO driver
Date: Wed,  8 Jul 2020 18:58:32 +0300
Message-ID: <20200708155834.19762-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello!

This series addresses a problem that I discovered on Nexus 7 device where
GPIO interrupts may be left enabled after bootloader and the driver isn't
prepared to this, it also makes a small improvement to the code.

Changelog:

v2: - Addressed review comment that were made by Andy Shevchenko to v1:

        - Generic init_hw() callback is used now for resetting interrupts.

        - These v1 patches are dropped:

           gpio: max77620: Replace interrupt-enable array with bitmap
           gpio: max77620: Don't handle disabled interrupts
           gpio: max77620: Move variable declaration

Dmitry Osipenko (2):
  gpio: max77620: Initialize interrupts state
  gpio: max77620: Replace 8 with MAX77620_GPIO_NR

 drivers/gpio/gpio-max77620.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

-- 
2.26.0
