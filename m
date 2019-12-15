From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/3] Tegra GPIO: Minor code clean up
Date: Sun, 15 Dec 2019 21:30:44 +0300
Message-ID: <20191215183047.9414-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

I was investigating why CPU hangs during of GPIO driver suspend and in
the end it turned out that it is a Broadcom WiFi driver problem because
it keeps OOB wake-interrupt enabled while WLAN interface is DOWN and this
may cause a bit weird CPU hang on writing to INT_ENB register during of
GPIO driver suspend. Meanwhile I also noticed that a few things could be
improved in the driver, that's what this small series addresses.

Dmitry Osipenko (3):
  gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
  gpio: tegra: Properly handle irq_set_irq_wake() error
  gpio: tegra: Use NOIRQ phase for suspend/resume

 drivers/gpio/gpio-tegra.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

-- 
2.24.0
