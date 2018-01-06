From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/3] ARM: tegra: paz00: drop nonstandard 'backlight-boot-off'
Date: Fri,  5 Jan 2018 16:47:56 -0800
Message-ID: <20180106004757.8239-2-briannorris@chromium.org>
References: <20180106004757.8239-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180106004757.8239-1-briannorris@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, Lin Huang <hl@rock-chips.com>, Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

This was used out-of-tree as a hack for resolving issues where some
systems expect the backlight to turn on automatically at boot, while
others expect to manage the backlight status via a DRM/panel driver.
Those issues have since been fixed upstream in pwm_bl.c without device
tree hacks, and so this un-documented property should no longer be
useful.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 30436969adc0..12c63b23ed5e 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -504,8 +504,6 @@
 
 		brightness-levels = <0 16 32 48 64 80 96 112 128 144 160 176 192 208 224 240 255>;
 		default-brightness-level = <10>;
-
-		backlight-boot-off;
 	};
 
 	clocks {
-- 
2.16.0.rc0.223.g4a4ac83678-goog
