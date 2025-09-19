Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE60530F524;
	Fri, 19 Sep 2025 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758283777; cv=none; b=pZQrC1Zh96y9e2uZD3PBAV30xdcw6aPr3avLEqoKnX+HS6DNI1eRl/bIAah8rLbZnPMpBmFtpnrVw5ZdpRG3oqjPo9QTrHuNIR0G0ZCuh+SgRbry9eyLmuORIe/axX4YaqlFeNzEE3RmFoXVOvBFH2zTxJQ4lwzJl+jaujC3aig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758283777; c=relaxed/simple;
	bh=nE7CjEN93m/oNEp01yjvabEyJ+B5r4NoAiMXwlhLc/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLldyqOSXUkmSrki7nRiFxeRNeN8HWVBBZasPwWjsKFzVWjTKGhWBhZ7uEd4pJ/8lpbxmZ35tEpuDIIKi8hQl4KPT5yFVpoHUat599mBSlDtgUzXvG/5asNu04gOzz6N/IqXYwKj6iFAVG4FT3dJefWSel1dLCCB1z4DzOZTRHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Me5hewL/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Me5hewL/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819F9C4CEF5;
	Fri, 19 Sep 2025 12:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758283776;
	bh=nE7CjEN93m/oNEp01yjvabEyJ+B5r4NoAiMXwlhLc/8=;
	h=From:To:Cc:Subject:Date:From;
	b=Me5hewL/k3EeKjVQYOUuogz2PZblV4MmAzBgaBDxLfYkF5HY0dmPs3MKpUSzl/B/9
	 Kw/vwxr2qXCXDHZj+bn0ToK1jsBzugmXv47ADfz9aZbxDXzarCpBOl2oJsQlfULEHt
	 KgJxkrFkp+iiV8e7za/5AstpS0DGp7E81a6MOH2RpfW3WP+3ZHQONcGq/4lM7Yvfa6
	 Zi3RfixcJCE4a+csZfZKyJUCvosY4HrviUEjCtwnfLSIKtE/e/5KNmcpJhhx6He1LS
	 8RYPOlYYJJhubdkoSDhFGwBsLcF+jmDhLmy/GyNUTJNN/w3WYD9r6C1oKgo9aLxx4l
	 dpCngTsdKg1zQ==
From: Niklas Cassel <cassel@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Vidya Sagar <vidyas@nvidia.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Gautham Srinivasan <gauthams@nvidia.com>,
	Niklas Cassel <cassel@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2] arm64: tegra: Add pinctrl definition for PCIe C4 EP
Date: Fri, 19 Sep 2025 14:09:21 +0200
Message-ID: <20250919120920.158497-2-cassel@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2153; i=cassel@kernel.org; h=from:subject; bh=b7UFFXM/Z0jGgN9vk/3tLaIbV3dnpxJW0BAe/naqpWw=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDLOun+YHtP49O2RFMc9EdMOvArIzly7uX9jyt17f1i2+ P35zq54p6OUhUGMi0FWTJHF94fL/uJu9ynHFe/YwMxhZQIZwsDFKQATmf+SkeFmzzPBjYtrz1++ 6lCxw/+503Obz2x/dkoEaU398tq4eVI4I0PbxMfXDrt7hD6+kXqq7+uKPK68xXwWxza5brBnu7H n0jxeAA==
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit

From: Gautham Srinivasan <gauthams@nvidia.com>

Commit 0580286d0d22 ("arm64: tegra: Add Tegra234 PCIe C4 EP definition")
added the device tree entry "pcie-ep@14160000" for C4 endpoint. However,
it missed pinctrl definition. Without the pinctl definition, the C4
endpoint of Jetson Orin Nano does not work. Add the missing definition.

Signed-off-by: Gautham Srinivasan <gauthams@nvidia.com>
[cassel: Add to the existing nodes instead of creating new ones.
Remove non-existing nvidia,lpdr property. Rename node to match dtschema.]
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
Changes since v1:
-Remove non-existing nvidia,lpdr pinmux property.
-Rename pex_rst_c4_in to pinmux-pex-rst-c4-in to match dtschema requirement.

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index df034dbb82853..2df89ad9ffdd0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/power/tegra234-powergate.h>
 #include <dt-bindings/reset/tegra234-reset.h>
 #include <dt-bindings/thermal/tegra234-bpmp-thermal.h>
+#include <dt-bindings/pinctrl/pinctrl-tegra.h>
 
 / {
 	compatible = "nvidia,tegra234";
@@ -127,6 +128,16 @@ gpio: gpio@2200000 {
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
 		};
 
 		gpcdma: dma-controller@2600000 {
@@ -4881,6 +4892,8 @@ pcie-ep@14160000 {
 			       <&bpmp TEGRA234_RESET_PEX0_CORE_4>;
 			reset-names = "apb", "core";
 
+			pinctrl-names = "default";
+			pinctrl-0 = <&pex_rst_c4_in_state>;
 			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;  /* controller interrupt */
 			interrupt-names = "intr";
 			nvidia,bpmp = <&bpmp 4>;
-- 
2.51.0

