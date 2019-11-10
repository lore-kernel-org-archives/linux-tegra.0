From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 142/191] ARM: dts: paz00: fix wakeup gpio keycode
Date: Sat,  9 Nov 2019 21:39:24 -0500
Message-ID: <20191110024013.29782-142-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Marc Dietrich <marvin24@gmx.de>, Nicolas Chauvet <kwizart@gmail.com>, Thierry Reding <treding@nvidia.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Marc Dietrich <marvin24@gmx.de>

[ Upstream commit ebea2a43fdafdbce918bd7e200b709d6c33b9f3b ]

The power key is controlled solely by the EC, which only tiggeres this
gpio after wakeup.
Fixes immediately return to suspend after wake from LP1.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index ef245291924f0..4f9b4a889febe 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -524,10 +524,10 @@
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		power {
-			label = "Power";
+		wakeup {
+			label = "Wakeup";
 			gpios = <&gpio TEGRA_GPIO(J, 7) GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_POWER>;
+			linux,code = <KEY_WAKEUP>;
 			wakeup-source;
 		};
 	};
-- 
2.20.1
