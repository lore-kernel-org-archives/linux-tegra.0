Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7BF2EA174;
	Thu,  9 Oct 2025 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760019787; cv=none; b=S5Yl0SeC0/VvsnV3caznZqqAWScJ8C9D5clRKDnoBxrPty3l8BJIOiEfWN+EmigEX0gpkaKhcVrMHpTRmTb3uS/GS9qVeHjCEnnX092jOPEPqrTAisC7aVHXJHK8JRgkjM7AY9Gs46FT+YHE5zQI4BYZU2Fh4cVCw1fhnLWV1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760019787; c=relaxed/simple;
	bh=Q/tpqVF/xgJnjAYBWiBS25wI4aUpCbn/XAA7fZMFgrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GFK2IBJB2X5B/9om9gaOAgUzWaOKkOhGT/0LIkbua53tOMPVNl1QfbGwtkuyenVE6FrsG+Jf/jlBPGiUi1RLc2SZvz+1cuFAAUadDLaLYGjHAYM8fceGET+gg+VVn8xSnztQOVpvLVyQVbZFSREquPwj4OEvW73yGPwnZGkD+20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOfh1p2O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOfh1p2O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6240C4CEE7;
	Thu,  9 Oct 2025 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760019787;
	bh=Q/tpqVF/xgJnjAYBWiBS25wI4aUpCbn/XAA7fZMFgrY=;
	h=From:To:Cc:Subject:Date:From;
	b=MOfh1p2OuzWBGHXBwda4FgBM4gXOBYtfyfvsw7TH1+QHS6vf89xBfMXERGqF+5M9A
	 niEcs7/nZCtruQnYLhezcMnHoXD1OgoZOlj9IHMaorOHiwIoz/al3/bEk3ugxNVNyA
	 NvgisOkKUzp9MUw53ZxTye3W3ReCQugTusOgM2uqo9dj5K4WvBmKhVbHeFfuR5z76S
	 xghFchHiWBgtANnwEUtQfcLrfFIy0DSM6cxxKOwd84tmokByk1FvQVjHH66fYYOGzy
	 WFdcvSe5vxX+uPcsAvEnimcQ65V2CfFow1nbpen3GIxuW7vdK2a0AFVkO0HXIq7woq
	 U8kamJHA/wfYw==
From: Niklas Cassel <cassel@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Vedant Deshpande <vedantd@nvidia.com>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Niklas Cassel <cassel@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3] arm64: tegra: Add pinctrl definitions for pcie-ep nodes
Date: Thu,  9 Oct 2025 16:22:54 +0200
Message-ID: <20251009142253.2563075-2-cassel@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4642; i=cassel@kernel.org; h=from:subject; bh=Q/tpqVF/xgJnjAYBWiBS25wI4aUpCbn/XAA7fZMFgrY=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDKeH7UtXaj5Qf+uj06+1FKWJU/kcv5sufPEIu+zfP4V7 +pF0tHnOkpZGMS4GGTFFFl8f7jsL+52n3Jc8Y4NzBxWJpAhDFycAjCRwx8Z/nAV7Pt7KbtY2awi ePLZJwL+06fZSpqfurbMZvm+pWZNng0Mf0V3ihYkiEa/nqF2jlns1VITC2sBI/+qQ9PS+6+tnpI 4iQUA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit

When the PCIe controller is running in endpoint mode, the controller
initialization is triggered by a PERST# (PCIe reset) GPIO deassertion.

The driver has configured an IRQ to trigger when the PERST# GPIO changes
state. Without the pinctrl definition, we do not get an IRQ when PERST#
is deasserted, so the PCIe controller never gets initialized.

Add the missing definitions, so that the controller actually gets
initialized.

Fixes: ec142c44b026 ("arm64: tegra: Add P2U and PCIe controller nodes to Tegra234 DT")
Fixes: 0580286d0d22 ("arm64: tegra: Add Tegra234 PCIe C4 EP definition")
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
Changes since v2:
-Add pinctrl definitions to all pcie-ep nodes, not just C4 controller.

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 57 ++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index df034dbb82853..cc929e1a00744 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/power/tegra234-powergate.h>
 #include <dt-bindings/reset/tegra234-reset.h>
 #include <dt-bindings/thermal/tegra234-bpmp-thermal.h>
+#include <dt-bindings/pinctrl/pinctrl-tegra.h>
 
 / {
 	compatible = "nvidia,tegra234";
@@ -127,6 +128,52 @@ gpio: gpio@2200000 {
 		pinmux: pinmux@2430000 {
 			compatible = "nvidia,tegra234-pinmux";
 			reg = <0x0 0x2430000 0x0 0x19100>;
+
+			pex_rst_c4_in_state: pinmux-pex-rst-c4-in {
+				pex_rst {
+					nvidia,pins = "pex_l4_rst_n_pl1";
+					nvidia,function = "rsvd1";
+					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+					nvidia,tristate = <TEGRA_PIN_ENABLE>;
+					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				};
+			};
+			pex_rst_c5_in_state: pinmux-pex-rst-c5-in {
+				pex_rst {
+					nvidia,pins = "pex_l5_rst_n_paf1";
+					nvidia,function = "rsvd1";
+					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+					nvidia,tristate = <TEGRA_PIN_ENABLE>;
+					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				};
+			};
+			pex_rst_c6_in_state: pinmux-pex-rst-c6-in {
+				pex_rst {
+					nvidia,pins = "pex_l6_rst_n_paf3";
+					nvidia,function = "rsvd1";
+					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+					nvidia,tristate = <TEGRA_PIN_ENABLE>;
+					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				};
+			};
+			pex_rst_c7_in_state: pinmux-pex-rst-c7-in {
+				pex_rst {
+					nvidia,pins = "pex_l7_rst_n_pag1";
+					nvidia,function = "rsvd1";
+					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+					nvidia,tristate = <TEGRA_PIN_ENABLE>;
+					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				};
+			};
+			pex_rst_c10_in_state: pinmux-pex-rst-c10-in {
+				pex_rst {
+					nvidia,pins = "pex_l10_rst_n_pag7";
+					nvidia,function = "rsvd1";
+					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+					nvidia,tristate = <TEGRA_PIN_ENABLE>;
+					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				};
+			};
 		};
 
 		gpcdma: dma-controller@2600000 {
@@ -4630,6 +4677,8 @@ pcie-ep@140e0000 {
 				 <&bpmp TEGRA234_RESET_PEX2_CORE_10>;
 			reset-names = "apb", "core";
 
+			pinctrl-names = "default";
+			pinctrl-0 = <&pex_rst_c10_in_state>;
 			interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
 			interrupt-names = "intr";
 
@@ -4881,6 +4930,8 @@ pcie-ep@14160000 {
 			       <&bpmp TEGRA234_RESET_PEX0_CORE_4>;
 			reset-names = "apb", "core";
 
+			pinctrl-names = "default";
+			pinctrl-0 = <&pex_rst_c4_in_state>;
 			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;  /* controller interrupt */
 			interrupt-names = "intr";
 			nvidia,bpmp = <&bpmp 4>;
@@ -5023,6 +5074,8 @@ pcie-ep@141a0000 {
 				 <&bpmp TEGRA234_RESET_PEX1_CORE_5>;
 			reset-names = "apb", "core";
 
+			pinctrl-names = "default";
+			pinctrl-0 = <&pex_rst_c5_in_state>;
 			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
 			interrupt-names = "intr";
 
@@ -5115,6 +5168,8 @@ pcie-ep@141c0000 {
 				 <&bpmp TEGRA234_RESET_PEX1_CORE_6>;
 			reset-names = "apb", "core";
 
+			pinctrl-names = "default";
+			pinctrl-0 = <&pex_rst_c6_in_state>;
 			interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
 			interrupt-names = "intr";
 
@@ -5207,6 +5262,8 @@ pcie-ep@141e0000 {
 				 <&bpmp TEGRA234_RESET_PEX2_CORE_7>;
 			reset-names = "apb", "core";
 
+			pinctrl-names = "default";
+			pinctrl-0 = <&pex_rst_c7_in_state>;
 			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
 			interrupt-names = "intr";
 
-- 
2.51.0

