From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V10 8/8] arm64: defconfig: Enable tegra XUDC support
Date: Mon, 23 Sep 2019 13:55:52 +0530
Message-ID: <1569227152-3030-9-git-send-email-nkristam@nvidia.com>
References: <1569227152-3030-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569227152-3030-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Enable Nvidia XUSB device mode controller driver and USB GPIO Based
Connection Detection Driver as module.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8e05c39..bf027fe 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -581,6 +581,7 @@ CONFIG_SND_SIMPLE_CARD=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_I2C_HID=m
 CONFIG_USB=y
+CONFIG_USB_CONN_GPIO=m
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_TEGRA=y
@@ -606,6 +607,7 @@ CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_USB_RENESAS_USB3=m
+CONFIG_USB_TEGRA_XUDC=m
 CONFIG_TYPEC=m
 CONFIG_TYPEC_HD3SS3220=m
 CONFIG_MMC=y
-- 
2.7.4
