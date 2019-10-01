From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] tegra: use regulator_bulk_set_supply_names()
Date: Tue,  1 Oct 2019 15:23:30 +0200
Message-ID: <20191001132333.20146-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The regulator_bulk_set_supply_names() helper was merged upstream. Use it
in a couple tegra drivers.

Bartosz Golaszewski (3):
  ahci: tegra: use regulator_bulk_set_supply_names()
  phy: tegra: use regulator_bulk_set_supply_names()
  usb: host: xhci-tegra: use regulator_bulk_set_supply_names()

 drivers/ata/ahci_tegra.c      | 6 +++---
 drivers/phy/tegra/xusb.c      | 6 +++---
 drivers/usb/host/xhci-tegra.c | 5 +++--
 3 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.23.0
