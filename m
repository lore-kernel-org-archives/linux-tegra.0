From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH AUTOSEL 4.19 105/172] arm64: tegra: Fix ethernet phy-mode for Jetson Xavier
Date: Wed, 17 Jun 2020 21:21:11 -0400
Message-ID: <20200618012218.607130-105-sashal@kernel.org>
References: <20200618012218.607130-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200618012218.607130-1-sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

[ Upstream commit bba25915b172c72f6fa635f091624d799e3c9cae ]

The 'phy-mode' property is currently defined as 'rgmii' for Jetson
Xavier. This indicates that the RGMII RX and TX delays are set by the
MAC and the internal delays set by the PHY are not used.

If the Marvell PHY driver is enabled, such that it is used and not the
generic PHY, ethernet failures are seen (DHCP is failing to obtain an
IP address) and this is caused because the Marvell PHY driver is
disabling the internal RX and TX delays. For Jetson Xavier the internal
PHY RX and TX delay should be used and so fix this by setting the
'phy-mode' to 'rgmii-id' and not 'rgmii'.

Fixes: f89b58ce71a9 ("arm64: tegra: Add ethernet controller on Tegra194")
Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 57d3f00464ce..7352954e12be 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -32,7 +32,7 @@ ethernet@2490000 {
 
 			phy-reset-gpios = <&gpio TEGRA194_MAIN_GPIO(G, 5) GPIO_ACTIVE_LOW>;
 			phy-handle = <&phy>;
-			phy-mode = "rgmii";
+			phy-mode = "rgmii-id";
 
 			mdio {
 				#address-cells = <1>;
-- 
2.25.1
