From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] regulator: add and use a helper for setting supply names
Date: Fri, 30 Aug 2019 09:17:36 +0200
Message-ID: <20190830071740.4267-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There are ~80 users of regulator bulk APIs that set the supply names
in a for loop before using the bulk helpers.

This series proposes to add a helper function for setting supply names
and uses it in a couple tegra drivers. If accepted: a coccinelle script
should be easy to develop that would address this in other drivers.

Bartosz Golaszewski (4):
  regulator: provide regulator_bulk_set_supply_names()
  ahci: tegra: use regulator_bulk_set_supply_names()
  phy: tegra: use regulator_bulk_set_supply_names()
  usb: host: xhci-tegra: use regulator_bulk_set_supply_names()

 drivers/ata/ahci_tegra.c           |  6 +++---
 drivers/phy/tegra/xusb.c           |  6 +++---
 drivers/regulator/helpers.c        | 21 +++++++++++++++++++++
 drivers/usb/host/xhci-tegra.c      |  5 +++--
 include/linux/regulator/consumer.h | 12 ++++++++++++
 5 files changed, 42 insertions(+), 8 deletions(-)

-- 
2.21.0
