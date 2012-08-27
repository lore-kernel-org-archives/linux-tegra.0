From: Wei Ni <wni@nvidia.com>
Subject: [PATCH 6/6] ARM: tegra: enable wireless in defconfig
Date: Mon, 27 Aug 2012 18:25:14 +0800
Message-ID: <1346063114-30361-7-git-send-email-wni@nvidia.com>
References: <1346063114-30361-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1346063114-30361-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, brudley@broadcom.com, rvossen@broadcom.com
Cc: krakesh@nvidia.com, ldewangan@nvidia.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

New options enabled:
* WIRELESS: (dependency)
* CFG80211_WEXT: (dependency)
* WLAN: (dependency)
* BRCMFMAC: wlan driver, enable as module.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 arch/arm/configs/tegra_defconfig |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index ef2c679..8fab9e0 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -73,7 +73,11 @@ CONFIG_BT_RFCOMM=y
 CONFIG_BT_BNEP=y
 CONFIG_BT_HIDP=y
 CONFIG_BT_HCIBTUSB=m
+CONFIG_WLAN=y
+CONFIG_BRCMFMAC=m
+CONFIG_WIRELESS=y
 CONFIG_CFG80211=y
+CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=y
 CONFIG_RFKILL=y
 CONFIG_RFKILL_INPUT=y
-- 
1.7.1
