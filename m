From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 64/73] arm64: tegra: Fix {clock,reset}-names ordering
Date: Tue, 16 Jun 2020 15:52:29 +0200
Message-ID: <20200616135238.3001888-65-thierry.reding@gmail.com>
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

It's very difficult to describe string lists that can be in arbitrary
order using the json-schema based validation tooling. Since the OS is
not going to care either way, take the easy way out and reorder these
entries to match the order defined in the bindings.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 1cd369ac48d2..a73050ec61a7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -799,15 +799,15 @@ pcie@10003000 {
 			 <0x02000000 0 0x50100000 0x0 0x50100000 0 0x07f00000>, /* non-prefetchable memory (127 MiB) */
 			 <0x42000000 0 0x58000000 0x0 0x58000000 0 0x28000000>; /* prefetchable memory (640 MiB) */
 
-		clocks = <&bpmp TEGRA186_CLK_AFI>,
-			 <&bpmp TEGRA186_CLK_PCIE>,
+		clocks = <&bpmp TEGRA186_CLK_PCIE>,
+			 <&bpmp TEGRA186_CLK_AFI>,
 			 <&bpmp TEGRA186_CLK_PLLE>;
-		clock-names = "afi", "pex", "pll_e";
+		clock-names = "pex", "afi", "pll_e";
 
-		resets = <&bpmp TEGRA186_RESET_AFI>,
-			 <&bpmp TEGRA186_RESET_PCIE>,
+		resets = <&bpmp TEGRA186_RESET_PCIE>,
+			 <&bpmp TEGRA186_RESET_AFI>,
 			 <&bpmp TEGRA186_RESET_PCIEXCLK>;
-		reset-names = "afi", "pex", "pcie_x";
+		reset-names = "pex", "afi", "pcie_x";
 
 		interconnects = <&mc TEGRA186_MEMORY_CLIENT_AFIR &emc>,
 				<&mc TEGRA186_MEMORY_CLIENT_AFIW &emc>;
-- 
2.24.1
