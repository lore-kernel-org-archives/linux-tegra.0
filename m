From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 0/4] gpio: hierarchical IRQ improvements
Date: Mon,  8 Jul 2019 07:01:34 -0400
Message-ID: <20190708110138.24657-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com, tglx@linutronix.de, marc.zyngier@arm.com, ilina@codeaurora.org, jonathanh@nvidia.com, skomatineni@nvidia.com, bbiswas@nvidia.com, linux-tegra@vger.kernel.org, david.daney@cavium.com, yamada.masahiro@socionext.com, treding@nvidia.com, bjorn.andersson@linaro.org, agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This builds on top of Linus Walleij's existing patches that adds
hierarchical IRQ support to the GPIO core [1] so that Qualcomm's
spmi-gpio and ssbi-gpio can be converted to use these new helpers.

Linus: Feel free to squash these into your existing patches if you'd
like to use any of this code. Just give me some kind of mention in the
commit description.

[1] https://lore.kernel.org/linux-gpio/20190624132531.6184-1-linus.walleij@linaro.org/

Brian Masney (4):
  gpio: introduce gpiochip_populate_parent_fwspec_{two,four}cell
    functions
  gpio: allow customizing hierarchical IRQ chips
  gpio: use handler in gpio_irq_chip instead of handle_bad_irq
  qcom: spmi-gpio: convert to hierarchical IRQ helpers in gpio core

 drivers/gpio/gpiolib.c                   | 78 ++++++++++++++++----
 drivers/pinctrl/qcom/Kconfig             |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 92 +++++++-----------------
 include/linux/gpio/driver.h              | 65 +++++++++++++++++
 4 files changed, 154 insertions(+), 82 deletions(-)

-- 
2.20.1
