Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C9C43F4CF;
	Wed,  2 Sep 2026 10:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344261; cv=none; b=PxMVQKOeYQgBcKe3pZvyOm5JewfHfrzYCQwlkUK0EWK+Y+v7Y5vrucnxDNrsz9Evy/DH8FAnqoXGVfps9wzOAf3zmC5U4uWrs1R9cvr+ySPt15+HkkvDqIfeg56t/Zotuitfc3WZUVltsc42NxQtn/MO3KLCAMCd1pyw8ytFEys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344261; c=relaxed/simple;
	bh=O7pzptQDsoQjKIOLLBy/hHBOa5v3YC5+QEaW/vzDj7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TLd6hx6ARS/jfijKkVrJIBmY0I9LURthd7k08g3V3j+bVbrUSwQv99BBWIbFzF0fAykc96gTaQ/ZAMYSXCYbjDBHC4/pAnhHgLO4DuAm39sWhY7VWQAf8XnfSONovr+MZJvabaSEKxLB9b4/6klVEUBNH35vvTvms2pUT0ipa24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdQ3DbJo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdQ3DbJo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5211F000E9;
	Wed,  2 Sep 2026 10:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344259;
	bh=n0SJRaGdS4MG/TqpmgJaAYbQroom687Cpb0dW+qqIm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WdQ3DbJoOwFmyD0lG336eEfmrsGzJz6OeQBjZMIjztwTgAMiTVsDGgF+SORtVVmtG
	 rPda2OR8MF1KtOXW02npDJne2+yKFCBeKesOBOxaGF1mAHYRonKPCCau/KNR7Xuvqt
	 sEzEqBBi61sAMlxLLs807BFzmwhOIauL8X8GVQbjjupGWx3GcBbH11Qv0a9sGxbuUQ
	 gr8TfKGdVMBP98X8KUGRAYVIqhEz1Hiz59mT1oe4RCjCK6O39eT1rc2AOHLBSY1h80
	 a+yihtjpz8gV7otg5dqwS6HSP/6THDa9C08HHnzfM0q9clPJQQ3CpTPTfCiy3rMAVI
	 gVTDlbBdn3jvw==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 02 Sep 2026 12:17:43 +0200
Subject: [PATCH 7/8] arm64: tegra: Clean up AHUB on Tegra264
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-tegra-ahub-dt-cleanup-v1-7-028f3c5e72f6@nvidia.com>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
In-Reply-To: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14819; i=treding@nvidia.com;
 h=from:subject:message-id; bh=Fg7OXYlKaGbuG+e+HbJtqhs1kKlQeZ6u5a6MZnvgHvk=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBql/fHLGzw824u+UXrf0rPMIb/sEce5YhBxWRra
 jboJrJnj9aJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapf3xwAKCRDdI6zXfz6z
 oSlLD/9omvIGaiDdmEcGHHY1iQNioQ0pndO7g7bADhqtRFrD+dNWfcK2l83ckAQ240CftBYIaZX
 1zLBoBW8no/AfPquI0PwzNQGZZ5stf8sYV7BGaCPjJVt+ELIFxwSVrFxl+wlFOCo/g/+TPmcwtf
 rob8qCjCaQi/XpAO71I3/y1PEX/9cdh4in7kY++e7WwPP8V9/PUIMB2ml8p4fOiefOTprVohGC4
 paRiLMNmoQQjT/ZzUrajAICsmQsu8VfaOeDXoXF7635l0LhmmUdX62aDW19NV48uuYg6mOxliQg
 zil4P/WX20ObhUCcg6PKfS7WoURACs8Te0HMNfOyKI3Nvp3rWKt7SpbotLg5fnIusGLDIpHJgvL
 BrKtJ5IXK/g4E4mG01fqYsV0OFD+OucxXYfQ3VMLooa9GgXg8EKeJOl3j2AU0SpNYf9R0WL7iEH
 TmuMkMYMODSKZbEBZvC8VeBbpI1C+trAvXS1Dd4zPJNStTIJdIfZU7PZdyhAvoWF5SvvkFHBPrt
 7oL3ST+vPEyRfG97jFlUEe3oOK22NE6jAiFIG4nM+g8av5TUUm+pkkI0TvaRlaCum/6odCJeGPp
 YhhvcLiCMM7IdJoGqVsnkas+uIMO1floWQSGWwxzJJckWb7Qup0c2AHQnajcFIsZmQ5/cgFcit3
 xaeBhvYxQ8Ipzzw==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Use #address-cells = <1> and #size-cells = <1> because we don't need
64-bit register addressing for this hardware. While at it, also adjust
the ranges property to encompass the entire AHUB range as per the TRM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 118 +++++++++++++++----------------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 6b2e3a6ab810..4ed7dabafee5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -129,13 +129,13 @@ aconnect@9000000 {
 			power-domains = <&bpmp TEGRA264_POWER_DOMAIN_AUD>;
 			status = "disabled";
 
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges = <0x0 0x9000000 0x0 0x9000000 0x0 0x2000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x9000000 0x0 0x9000000 0x2000000>;
 
 			adma: dma-controller@9440000 {
 				compatible = "nvidia,tegra264-adma";
-				reg = <0x0 0x9440000 0x0 0xb0000>;
+				reg = <0x9440000 0xb0000>;
 				interrupt-parent = <&agic_page0>;
 				interrupts = <GIC_SPI 0x90 IRQ_TYPE_LEVEL_HIGH>,
 					   <GIC_SPI 0x91 IRQ_TYPE_LEVEL_HIGH>,
@@ -209,22 +209,22 @@ adma: dma-controller@9440000 {
 
 			tegra_ahub: ahub@9630000 {
 				compatible = "nvidia,tegra264-ahub";
-				reg = <0x0 0x9630000 0x0 0x10000>;
+				reg = <0x9630000 0x10000>;
 				clocks = <&bpmp TEGRA264_CLK_AHUB>;
 				clock-names = "ahub";
 				assigned-clocks = <&bpmp TEGRA264_CLK_AHUB>;
 				assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLAON_APE>;
 				status = "disabled";
 
-				#address-cells = <2>;
-				#size-cells = <2>;
+				#address-cells = <1>;
+				#size-cells = <1>;
 				/* ADMA is under AHUB range, its excluded in the defined range */
-				ranges = <0x0 0x9280000 0x0 0x9280000 0x0 0x1c0000>,
-					<0x0 0x9510000 0x0 0x9510000 0x0 0x370000>;
+				ranges = <0x9280000 0x0 0x9280000 0x1c0000>,
+					 <0x9510000 0x0 0x9510000 0x370000>;
 
 				tegra_i2s1: i2s@9280000 {
 					compatible = "nvidia,tegra264-i2s";
-					reg = <0x0 0x9280000 0x0 0x10000>;
+					reg = <0x9280000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S1>,
 					       <&bpmp TEGRA264_CLK_I2S1_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
@@ -259,7 +259,7 @@ i2s1_dap: endpoint {
 
 				tegra_i2s2: i2s@9290000 {
 					compatible = "nvidia,tegra264-i2s";
-					reg = <0x0 0x9290000 0x0 0x10000>;
+					reg = <0x9290000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S2>,
 						 <&bpmp TEGRA264_CLK_I2S2_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
@@ -294,7 +294,7 @@ i2s2_dap: endpoint {
 
 				tegra_i2s3: i2s@92a0000 {
 					compatible = "nvidia,tegra264-i2s";
-					reg = <0x0 0x92a0000 0x0 0x10000>;
+					reg = <0x92a0000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S3>,
 					       <&bpmp TEGRA264_CLK_I2S3_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
@@ -329,7 +329,7 @@ i2s3_dap: endpoint {
 
 				tegra_i2s4: i2s@92b0000 {
 					compatible = "nvidia,tegra264-i2s";
-					reg = <0x0 0x92b0000 0x0 0x10000>;
+					reg = <0x92b0000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S4>,
 					       <&bpmp TEGRA264_CLK_I2S4_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
@@ -364,7 +364,7 @@ i2s4_dap: endpoint {
 
 				tegra_i2s5: i2s@92c0000 {
 					compatible = "nvidia,tegra264-i2s";
-					reg = <0x0 0x92c0000 0x0 0x10000>;
+					reg = <0x92c0000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S5>,
 					       <&bpmp TEGRA264_CLK_I2S5_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
@@ -399,7 +399,7 @@ i2s5_dap: endpoint {
 
 				tegra_i2s6: i2s@92d0000 {
 					compatible = "nvidia,tegra264-i2s";
-					reg = <0x0 0x92d0000 0x0 0x10000>;
+					reg = <0x92d0000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S6>,
 					       <&bpmp TEGRA264_CLK_I2S6_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
@@ -434,7 +434,7 @@ i2s6_dap: endpoint {
 
 				tegra_i2s7: i2s@92e0000 {
 					compatible = "nvidia,tegra264-i2s";
-					reg = <0x0 0x92e0000 0x0 0x10000>;
+					reg = <0x92e0000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S7>,
 					       <&bpmp TEGRA264_CLK_I2S7_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
@@ -469,7 +469,7 @@ i2s7_dap: endpoint {
 
 				tegra_i2s8: i2s@92f0000 {
 					compatible = "nvidia,tegra264-i2s";
-					reg = <0x0 0x92f0000 0x0 0x10000>;
+					reg = <0x92f0000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S8>,
 					       <&bpmp TEGRA264_CLK_I2S8_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
@@ -505,7 +505,7 @@ i2s8_dap: endpoint {
 				tegra_dmic1: dmic@9300000 {
 					compatible = "nvidia,tegra264-dmic",
 							"nvidia,tegra210-dmic";
-					reg = <0x0 0x9300000 0x0 0x10000>;
+					reg = <0x9300000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_DMIC1>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA264_CLK_DMIC1>;
@@ -539,7 +539,7 @@ dmic1_dap: endpoint {
 				tegra_dmic2: dmic@9310000 {
 					compatible = "nvidia,tegra264-dmic",
 						   "nvidia,tegra210-dmic";
-					reg = <0x0 0x9310000 0x0 0x10000>;
+					reg = <0x9310000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_DMIC1>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA264_CLK_DMIC1>;
@@ -573,7 +573,7 @@ dmic2_dap: endpoint {
 				tegra_dspk1: dspk@9380000 {
 					compatible = "nvidia,tegra264-dspk",
 							"nvidia,tegra186-dspk";
-					reg = <0x0 0x9380000 0x0 0x10000>;
+					reg = <0x9380000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_DSPK1>;
 					clock-names = "dspk";
 					assigned-clocks = <&bpmp TEGRA264_CLK_DSPK1>;
@@ -606,7 +606,7 @@ dspk1_dap: endpoint {
 
 				tegra_amx1: amx@9510000 {
 					compatible = "nvidia,tegra264-amx";
-					reg = <0x0 0x9510000 0x0 0x10000>;
+					reg = <0x9510000 0x10000>;
 					sound-name-prefix = "AMX1";
 
 					ports {
@@ -657,7 +657,7 @@ amx1_out: endpoint {
 
 				tegra_amx2: amx@9520000 {
 					compatible = "nvidia,tegra264-amx";
-					reg = <0x0 0x9520000 0x0 0x10000>;
+					reg = <0x9520000 0x10000>;
 					sound-name-prefix = "AMX2";
 
 					ports {
@@ -708,7 +708,7 @@ amx2_out: endpoint {
 
 				tegra_amx3: amx@9530000 {
 					compatible = "nvidia,tegra264-amx";
-					reg = <0x0 0x9530000 0x0 0x10000>;
+					reg = <0x9530000 0x10000>;
 					sound-name-prefix = "AMX3";
 
 					ports {
@@ -759,7 +759,7 @@ amx3_out: endpoint {
 
 				tegra_amx4: amx@9540000 {
 					compatible = "nvidia,tegra264-amx";
-					reg = <0x0 0x9540000 0x0 0x10000>;
+					reg = <0x9540000 0x10000>;
 					sound-name-prefix = "AMX4";
 
 					ports {
@@ -810,7 +810,7 @@ amx4_out: endpoint {
 
 				tegra_amx5: amx@9550000 {
 					compatible = "nvidia,tegra264-amx";
-					reg = <0x0 0x9550000 0x0 0x10000>;
+					reg = <0x9550000 0x10000>;
 					sound-name-prefix = "AMX5";
 
 					ports {
@@ -861,7 +861,7 @@ amx5_out: endpoint {
 
 				tegra_amx6: amx@9560000 {
 					compatible = "nvidia,tegra264-amx";
-					reg = <0x0 0x9560000 0x0 0x10000>;
+					reg = <0x9560000 0x10000>;
 					sound-name-prefix = "AMX6";
 
 					ports {
@@ -912,7 +912,7 @@ amx6_out: endpoint {
 
 				tegra_adx1: adx@9590000 {
 					compatible = "nvidia,tegra264-adx";
-					reg = <0x0 0x9590000 0x0 0x10000>;
+					reg = <0x9590000 0x10000>;
 					sound-name-prefix = "ADX1";
 
 					ports {
@@ -963,7 +963,7 @@ adx1_out4: endpoint {
 
 				tegra_adx2: adx@95a0000 {
 					compatible = "nvidia,tegra264-adx";
-					reg = <0x0 0x95a0000 0x0 0x10000>;
+					reg = <0x95a0000 0x10000>;
 					sound-name-prefix = "ADX2";
 
 					ports {
@@ -1014,7 +1014,7 @@ adx2_out4: endpoint {
 
 				tegra_adx3: adx@95b0000 {
 					compatible = "nvidia,tegra264-adx";
-					reg = <0x0 0x95b0000 0x0 0x10000>;
+					reg = <0x95b0000 0x10000>;
 					sound-name-prefix = "ADX3";
 
 					ports {
@@ -1065,7 +1065,7 @@ adx3_out4: endpoint {
 
 				tegra_adx4: adx@95c0000 {
 					compatible = "nvidia,tegra264-adx";
-					reg = <0x0 0x95c0000 0x0 0x10000>;
+					reg = <0x95c0000 0x10000>;
 					sound-name-prefix = "ADX4";
 
 					ports {
@@ -1116,7 +1116,7 @@ adx4_out4: endpoint {
 
 				tegra_adx5: adx@95d0000 {
 					compatible = "nvidia,tegra264-adx";
-					reg = <0x0 0x95d0000 0x0 0x10000>;
+					reg = <0x95d0000 0x10000>;
 					sound-name-prefix = "ADX5";
 
 					ports {
@@ -1167,7 +1167,7 @@ adx5_out4: endpoint {
 
 				tegra_adx6: adx@95e0000 {
 					compatible = "nvidia,tegra264-adx";
-					reg = <0x0 0x95e0000 0x0 0x10000>;
+					reg = <0x95e0000 0x10000>;
 					sound-name-prefix = "ADX6";
 
 					ports {
@@ -1218,7 +1218,7 @@ adx6_out4: endpoint {
 
 				tegra_admaif: admaif@9610000 {
 					compatible = "nvidia,tegra264-admaif";
-					reg = <0x0 0x9610000 0x0 0x10000>;
+					reg = <0x9610000 0x10000>;
 					dmas = <&adma 1>, <&adma 1>,
 					     <&adma 2>, <&adma 2>,
 					     <&adma 3>, <&adma 3>,
@@ -1556,7 +1556,7 @@ admaif31: endpoint {
 				tegra_sfc1: sfc@9700000 {
 					compatible = "nvidia,tegra264-sfc",
 							"nvidia,tegra210-sfc";
-					reg = <0x0 0x9700000 0x0 0x10000>;
+					reg = <0x9700000 0x10000>;
 					sound-name-prefix = "SFC1";
 
 					ports {
@@ -1584,7 +1584,7 @@ sfc1_cif_out: endpoint {
 				tegra_sfc2: sfc@9710000 {
 					compatible = "nvidia,tegra264-sfc",
 							"nvidia,tegra210-sfc";
-					reg = <0x0 0x9710000 0x0 0x10000>;
+					reg = <0x9710000 x0 0x10000>;
 					sound-name-prefix = "SFC2";
 
 					ports {
@@ -1612,7 +1612,7 @@ sfc2_cif_out: endpoint {
 				tegra_sfc3: sfc@9720000 {
 					compatible = "nvidia,tegra264-sfc",
 							"nvidia,tegra210-sfc";
-					reg = <0x0 0x9720000 0x0 0x10000>;
+					reg = <0x9720000 0x10000>;
 					sound-name-prefix = "SFC3";
 
 					ports {
@@ -1640,7 +1640,7 @@ sfc3_cif_out: endpoint {
 				tegra_sfc4: sfc@9730000 {
 					compatible = "nvidia,tegra264-sfc",
 							"nvidia,tegra210-sfc";
-					reg = <0x0 0x9730000 0x0 0x10000>;
+					reg = <0x9730000 0x10000>;
 					sound-name-prefix = "SFC4";
 
 					ports {
@@ -1668,22 +1668,22 @@ sfc4_cif_out: endpoint {
 				tegra_ope1: processing-engine@9780000 {
 					compatible = "nvidia,tegra264-ope",
 							"nvidia,tegra210-ope";
-					reg = <0x0 0x9780000 0x0 0x10000>;
-					#address-cells = <2>;
-					#size-cells = <2>;
-					ranges = <0x0 0x9780000 0x0 0x9780000 0x0 0x30000>;
+					reg = <0x9780000 0x10000>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0x9780000 0x9780000 0x30000>;
 					sound-name-prefix = "OPE1";
 
 					equalizer@9790000 {
 						compatible = "nvidia,tegra264-peq",
 								"nvidia,tegra210-peq";
-						reg = <0x0 0x9790000 0x0 0x10000>;
+						reg = <0x9790000 0x10000>;
 					};
 
 					dynamic-range-compressor@97a0000 {
 						compatible = "nvidia,tegra264-mbdrc",
 								"nvidia,tegra210-mbdrc";
-						reg = <0x0 0x97a0000 0x0 0x10000>;
+						reg = <0x97a0000 0x10000>;
 					};
 
 					ports {
@@ -1713,7 +1713,7 @@ ope1_cif_out_ep: endpoint {
 				tegra_mvc1: mvc@9800000 {
 					compatible = "nvidia,tegra264-mvc",
 							"nvidia,tegra210-mvc";
-					reg = <0x0 0x9800000 0x0 0x10000>;
+					reg = <0x9800000 0x10000>;
 					sound-name-prefix = "MVC1";
 
 					ports {
@@ -1741,7 +1741,7 @@ mvc1_cif_out: endpoint {
 				tegra_mvc2: mvc@9810000 {
 					compatible = "nvidia,tegra264-mvc",
 							"nvidia,tegra210-mvc";
-					reg = <0x0 0x9810000 0x0 0x10000>;
+					reg = <0x9810000 0x10000>;
 					sound-name-prefix = "MVC2";
 
 					ports {
@@ -1769,7 +1769,7 @@ mvc2_cif_out: endpoint {
 				tegra_amixer: amixer@9820000 {
 					compatible = "nvidia,tegra264-amixer",
 							"nvidia,tegra210-amixer";
-					reg = <0x0 0x9820000 0x0 0x10000>;
+					reg = <0x9820000 0x10000>;
 					sound-name-prefix = "MIXER1";
 
 					ports {
@@ -1900,7 +1900,7 @@ mix_out5: endpoint {
 
 				tegra_asrc: asrc@9850000 {
 					compatible = "nvidia,tegra264-asrc";
-					reg = <0x0 0x9850000 0x0 0x10000>;
+					reg = <0x9850000 0x10000>;
 					sound-name-prefix = "ASRC1";
 
 					ports {
@@ -3197,8 +3197,8 @@ agic_page0: interrupt-controller@9960000 {
 						"nvidia,tegra210-agic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
-				reg = <0x0 0x9961000 0x0 0x1000>,
-					<0x0 0x9962000 0x0 0x1000>;
+				reg = <0x9961000 0x1000>,
+				      <0x9962000 0x1000>;
 				interrupts = <GIC_SPI 0x230
 					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 				clocks = <&bpmp TEGRA264_CLK_ADSP>;
@@ -3211,8 +3211,8 @@ agic_page1: interrupt-controller@9970000 {
 					   "nvidia,tegra210-agic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
-				reg = <0x0 0x9971000 0x0 0x1000>,
-					<0x0 0x9972000 0x0 0x1000>;
+				reg = <0x9971000 0x1000>,
+				      <0x9972000 0x1000>;
 				interrupts = <GIC_SPI 0x231
 					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 				clocks = <&bpmp TEGRA264_CLK_ADSP>;
@@ -3225,8 +3225,8 @@ agic_page2: interrupt-controller@9980000 {
 						"nvidia,tegra210-agic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
-				reg = <0x0 0x9981000 0x0 0x1000>,
-					<0x0 0x9982000 0x0 0x1000>;
+				reg = <0x9981000 0x1000>,
+				      <0x9982000 0x1000>;
 				interrupts = <GIC_SPI 0x232
 					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 				clocks = <&bpmp TEGRA264_CLK_ADSP>;
@@ -3239,8 +3239,8 @@ agic_page3: interrupt-controller@9990000 {
 						"nvidia,tegra210-agic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
-				reg = <0x0 0x9991000 0x0 0x1000>,
-					<0x0 0x9992000 0x0 0x1000>;
+				reg = <0x9991000 0x1000>,
+				      <0x9992000 0x1000>;
 				interrupts = <GIC_SPI 0x233
 					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 				clocks = <&bpmp TEGRA264_CLK_ADSP>;
@@ -3253,8 +3253,8 @@ agic_page4: interrupt-controller@99a0000 {
 						"nvidia,tegra210-agic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
-				reg = <0x0 0x99a1000 0x0 0x1000>,
-					<0x0 0x99a2000 0x0 0x1000>;
+				reg = <0x99a1000 0x1000>,
+				      <0x99a2000 0x1000>;
 				interrupts = <GIC_SPI 0x234
 					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 				clocks = <&bpmp TEGRA264_CLK_ADSP>;
@@ -3267,8 +3267,8 @@ agic_page5: interrupt-controller@99b0000 {
 						"nvidia,tegra210-agic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
-				reg = <0x0 0x99b1000 0x0 0x1000>,
-					<0x0 0x99b2000 0x0 0x1000>;
+				reg = <0x99b1000 0x1000>,
+				      <0x99b2000 0x1000>;
 				interrupts = <GIC_SPI 0x235
 					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 				clocks = <&bpmp TEGRA264_CLK_ADSP>;

-- 
2.55.0

