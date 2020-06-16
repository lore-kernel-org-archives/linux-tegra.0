From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 60/73] arm64: tegra: Remove unneeded power supplies
Date: Tue, 16 Jun 2020 15:52:25 +0200
Message-ID: <20200616135238.3001888-61-thierry.reding@gmail.com>
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

On Tegra186 and later, the BPMP is responsible for enabling/disabling
the PCIe related power supplies of the pad controller and there is no
need for the operating system to control them, so they can be removed.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 43b8d643e7a1..482ed7b0fcff 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -119,10 +119,6 @@ padctl@3520000 {
 
 		avdd-pll-erefeut-supply = <&vdd_1v8_pll>;
 		avdd-usb-supply = <&vdd_3v3_sys>;
-		dvdd-pex-supply = <&vdd_pex>;
-		dvdd-pex-pll-supply = <&vdd_pex>;
-		hvdd-pex-supply = <&vdd_1v8>;
-		hvdd-pex-pll-supply = <&vdd_1v8>;
 		vclamp-usb-supply = <&vdd_1v8>;
 		vddio-hsic-supply = <&gnd>;
 
-- 
2.24.1
