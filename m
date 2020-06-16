From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 29/73] ARM: tegra: seaboard: Use standard battery bindings
Date: Tue, 16 Jun 2020 15:51:54 +0200
Message-ID: <20200616135238.3001888-30-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Seaboard uses a non-existing, possibly obsoleted, binding for the
battery. Move to the standard binding which seems to be a super-
set of the odl binding.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-seaboard.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index f1baf16c5010..c24d4a37613e 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -394,10 +394,10 @@ lvds_ddc: i2c@1 {
 			#size-cells = <0>;
 
 			smart-battery@b {
-				compatible = "ti,bq20z75", "smart-battery-1.1";
+				compatible = "ti,bq20z75", "sbs,sbs-battery";
 				reg = <0xb>;
-				ti,i2c-retry-count = <2>;
-				ti,poll-retry-count = <10>;
+				sbs,i2c-retry-count = <2>;
+				sbs,poll-retry-count = <10>;
 			};
 		};
 	};
-- 
2.24.1
