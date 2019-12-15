From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/2] Bluetooth: hci_bcm: Add device-tree compatible for BCM4329
Date: Sun, 15 Dec 2019 21:52:52 +0300
Message-ID: <20191215185253.14024-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Driver supports BCM4329, but there is no device-tree compatible for
that chip. Let's add it in order to allow boards to specify Bluetooth
in theirs device-trees, in particular this is useful for NVIDIA Tegra20
boards.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/bluetooth/hci_bcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 9f52d57c56de..6f9d7c0e0061 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -1470,6 +1470,7 @@ static struct bcm_device_data bcm4354_device_data = {
 
 static const struct of_device_id bcm_bluetooth_of_match[] = {
 	{ .compatible = "brcm,bcm20702a1" },
+	{ .compatible = "brcm,bcm4329-bt" },
 	{ .compatible = "brcm,bcm4345c5" },
 	{ .compatible = "brcm,bcm4330-bt" },
 	{ .compatible = "brcm,bcm43438-bt" },
-- 
2.24.0
