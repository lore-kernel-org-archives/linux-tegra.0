From: Dongjiu Geng <gengdongjiu@huawei.com>
Subject: [PATCH v2] usb: xhci: remove the code build warning
Date: Wed, 6 Jun 2018 22:36:59 +0800
Message-ID: <20180606143659.1476-1-gengdongjiu@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, gengdongjiu@huawei.com
List-Id: linux-tegra@vger.kernel.org

Initialize the 'err' variate to remove the build warning,
the warning is shown as below:

drivers/usb/host/xhci-tegra.c: In function 'tegra_xusb_mbox_thread':
drivers/usb/host/xhci-tegra.c:552:6: warning: 'err' may be used uninitialized in this function [-Wuninitialized]
drivers/usb/host/xhci-tegra.c:482:6: note: 'err' was declared here

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
How to reproduce:
1. make defconfig ARCH=arm
2. make -j100 CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm

Then you can see below warnings:
drivers/usb/host/xhci-tegra.c: In function 'tegra_xusb_mbox_thread':
drivers/usb/host/xhci-tegra.c:552:6: warning: 'err' may be used uninitialized in this function [-Wuninitialized]
drivers/usb/host/xhci-tegra.c:482:6: note: 'err' was declared here
---
 drivers/usb/host/xhci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index a8c1d07..d50549f 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -481,7 +481,7 @@ static void tegra_xusb_mbox_handle(struct tegra_xusb *tegra,
 	unsigned long mask;
 	unsigned int port;
 	bool idle, enable;
-	int err;
+	int err = 0;
 
 	memset(&rsp, 0, sizeof(rsp));
 
-- 
1.9.1
