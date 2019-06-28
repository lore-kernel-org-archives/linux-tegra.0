From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pci: tegra: use correct gpio/consumer.h header
Date: Fri, 28 Jun 2019 12:29:45 +0200
Message-ID: <20190628102953.2369879-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, Thierry Reding <treding@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

linux/gpio.h is not the correct header for modern interfaces and
causes a build failure without CONFIG_GPIOLIB:

drivers/pci/controller/pci-tegra.c: In function 'tegra_pcie_port_reset':
drivers/pci/controller/pci-tegra.c:551:3: error: implicit declaration of function 'gpiod_set_value'; did you mean 'gpio_set_value'? [-Werror=implicit-function-declaration]
   gpiod_set_value(port->reset_gpio, 1);
   ^~~~~~~~~~~~~~~

Use linux/gpio/consumer.h instead.

Fixes: 5e5e9c23f82a ("PCI: tegra: Add support for GPIO based PERST#")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pci/controller/pci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 9cc03a2549c0..1775b88c0aec 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -17,7 +17,7 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/export.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
-- 
2.20.0
