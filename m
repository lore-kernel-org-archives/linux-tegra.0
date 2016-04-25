From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V5 0/4] gpio: tegra: Cleanups and support for debounce
Date: Mon, 25 Apr 2016 16:08:30 +0530
Message-ID: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, thierry.reding@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add support for the debounce as Tegra210 support debounce in HW.
Also do the clenaups to remove all global variables.

Changes from V3:
- Rearranging debounce registers and lock the DB CNT registers.
Changes from V4:
- Get rid of tegra_gpio_chip and tegra_irq_chip as global.

Laxman Dewangan (4):
  gpio: tegra: Don't open code of_device_get_match_data()
  gpio: tegra: Make of_device_id compatible data to constant
  gpio: tegra: Get rid of all file scoped global variables
  gpio: tegra: Add support for gpio debounce

 drivers/gpio/gpio-tegra.c | 407 +++++++++++++++++++++++++++++-----------------
 1 file changed, 261 insertions(+), 146 deletions(-)

-- 
2.1.4
