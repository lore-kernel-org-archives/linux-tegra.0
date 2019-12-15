From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/2] dt-bindings: net: broadcom-bluetooth: Document BCM4329 support
Date: Sun, 15 Dec 2019 21:52:53 +0300
Message-ID: <20191215185253.14024-2-digetx@gmail.com>
References: <20191215185253.14024-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191215185253.14024-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The BCM4329 is a 802.11 a/b/g/n WiFi + Bluetooth 2.1 chip which is found
in Azurewave AW-NH611 WiFi+BT module.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
index b5eadee4a9a7..c44a30dbe43d 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -11,6 +11,7 @@ Required properties:
 
  - compatible: should contain one of the following:
    * "brcm,bcm20702a1"
+   * "brcm,bcm4329-bt"
    * "brcm,bcm4330-bt"
    * "brcm,bcm43438-bt"
    * "brcm,bcm4345c5"
-- 
2.24.0
