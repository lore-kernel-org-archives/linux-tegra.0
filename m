Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307C043F096;
	Wed,  2 Sep 2026 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344259; cv=none; b=in4mtm13YwvLWLif+JeN+HdHFGCvDqH5PZBJg1B1gBM4tYKOSKRGA9Q54VmMx/KgxuPpQ7kxX5Bo7R3toFyko1KU2t7YVlxJy4DbxsW9kjdMyZdcmZQyd+t98yzqxjXfhTUTYDy7Of4Sv3fX3krUBinna3jXJLdM7WkD0d8bGho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344259; c=relaxed/simple;
	bh=GVbZfsCygRgsRtYuI2Xnt2AWQuOPjB5vkyAwVLfzSbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cw+puyovlu7mk+PWDnJixH584gN3+ACLHiiYGeRGY+tzMAhDZvpORb8Rh3b766cZ+XDHeeQCU0CaZA6ycx20fhWRoshHOhw0gyCXt7+nfy4SiYmjX7tENszE2qFxLv9SN5ApIJ7u2jogP/YQVT/20uK+q4Q/YTRUrx1PBOniNnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXUjactp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXUjactp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDC11F00A3F;
	Wed,  2 Sep 2026 10:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344256;
	bh=R/woTi0j/0dOqXMSbz4vdbVLyGfYK/eNVIKu2mMr1XI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RXUjactp5+WhkITsFwIZux9W/MsD65jWhcQL0oJltxAx9nIGg0nXBsjqNONFjzDTS
	 i8GnWtlY9GwVVc11WWzH396AcfBm6p2N+Y87Fkr36LA/TEV2TqRstUm12wP2ioIL/X
	 DadJI2zYz47wkNjAu3pvU7fTNX8mr//ZEqvIAaMxTLn3L4suO1g2s0uISBaYyHumez
	 Al0DwsU9vPDnhdzmzmdNtGWZpizVF92OtTeUrK18/NLoL3VsoikYijYNPrwMSsY2Wf
	 waqxTW5PImRcH/vtVZsegmsXAjkS7R/g7h56FKupjYkWfsa6WFWhGZKZaEYcjvzV6B
	 iAotbSXQ9Gniw==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 02 Sep 2026 12:17:42 +0200
Subject: [PATCH 6/8] arm64: tegra: Clean up AHUB on Tegra234
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-tegra-ahub-dt-cleanup-v1-6-028f3c5e72f6@nvidia.com>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
In-Reply-To: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10939; i=treding@nvidia.com;
 h=from:subject:message-id; bh=WT8ymqFWkLY1Ro1AD/3nGXACUszqWSLYryOIK7D1E+s=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBql/fHzD9FzdyV22RExrGdHF3MtZG5ggvKyThTA
 AebO2q7dtuJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapf3xwAKCRDdI6zXfz6z
 od3iD/90NJX0MgJPYLUUAOuUo6BdEBLRg5jomlDBxkN2ek8XUxVYzfUr1+5kQxJ3+KE1tyMAmfC
 XpPiKg25bhFRldhlyB3iamvItepiJCt4Ylz9cX9mEsdf+pPWcb05E4hTHTIwd75Di86JwNpynKU
 IwdYycEjR2XemYYbvdwmXIB/VGwZ3HtfE1ToU1k5irsqk3MLDDBncbqCBcSxLdYez92/u9b30bU
 3bKiXgQ29LKEXBGXAOjYzPPqU/jyN7YzvN3+CbZeTDPqlyJ0xIpRy0zSB89fopTH6HmEcog7QHA
 aQGufuxedbcpey/xVCfM4/0mIWK6+z6mexhpe2sNFFABfH/V8nOrysc9nomvdkMb8akmq3rl746
 tMaExWlfnsUE4sMmPBajktKwCAzjI/mvpN17tRhqZVCmD07vYJVqVGmMpnevT14xSuKpYqxtWxB
 ULfvfFoABAGunrkfv6XV8JbvCJ9yBjTSngGhPt59IzHGYDsPkbsjxGDQqiaBMTypFW05r6X2Cym
 rapay9uvdlcFP00tpbbZ3Qn6IFM/NVZxFtPrKJQ4lMROg3zfOlk5qBUTtuJxNjHM3woAt/vHOKt
 hIBaaneqiqBvcYOxA2X3syvxMhiU96U3kw451ColFMUp2MbBN3LG1ufmK89eVuM7HN6SyvX9Ve+
 jqL/9gV/60P5knw==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Use #address-cells = <1> and #size-cells = <1> because we don't need
64-bit register addressing for this hardware. While at it, also adjust
the ranges property to encompass the entire AHUB range as per the TRM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 74 ++++++++++++++++----------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 5e29316a4d75..5311245334de 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -245,14 +245,14 @@ tegra_ahub: ahub@2900800 {
 				assigned-clock-rates = <81600000>;
 				status = "disabled";
 
-				#address-cells = <2>;
-				#size-cells = <2>;
-				ranges = <0x0 0x02900800 0x0 0x02900800 0x0 0x11800>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x02900000 0x0 0x02900000 0x20000>;
 
 				tegra_i2s1: i2s@2901000 {
 					compatible = "nvidia,tegra234-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x0 0x2901000 0x0 0x100>;
+					reg = <0x2901000 0x100>;
 					clocks = <&bpmp TEGRA234_CLK_I2S1>,
 						 <&bpmp TEGRA234_CLK_I2S1_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -288,7 +288,7 @@ i2s1_dap: endpoint {
 				tegra_i2s2: i2s@2901100 {
 					compatible = "nvidia,tegra234-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x0 0x2901100 0x0 0x100>;
+					reg = <0x2901100 0x100>;
 					clocks = <&bpmp TEGRA234_CLK_I2S2>,
 						 <&bpmp TEGRA234_CLK_I2S2_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -324,7 +324,7 @@ i2s2_dap: endpoint {
 				tegra_i2s3: i2s@2901200 {
 					compatible = "nvidia,tegra234-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x0 0x2901200 0x0 0x100>;
+					reg = <0x2901200 0x100>;
 					clocks = <&bpmp TEGRA234_CLK_I2S3>,
 						 <&bpmp TEGRA234_CLK_I2S3_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -360,7 +360,7 @@ i2s3_dap: endpoint {
 				tegra_i2s4: i2s@2901300 {
 					compatible = "nvidia,tegra234-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x0 0x2901300 0x0 0x100>;
+					reg = <0x2901300 0x100>;
 					clocks = <&bpmp TEGRA234_CLK_I2S4>,
 						 <&bpmp TEGRA234_CLK_I2S4_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -396,7 +396,7 @@ i2s4_dap: endpoint {
 				tegra_i2s5: i2s@2901400 {
 					compatible = "nvidia,tegra234-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x0 0x2901400 0x0 0x100>;
+					reg = <0x2901400 0x100>;
 					clocks = <&bpmp TEGRA234_CLK_I2S5>,
 						 <&bpmp TEGRA234_CLK_I2S5_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -432,7 +432,7 @@ i2s5_dap: endpoint {
 				tegra_i2s6: i2s@2901500 {
 					compatible = "nvidia,tegra234-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x0 0x2901500 0x0 0x100>;
+					reg = <0x2901500 0x100>;
 					clocks = <&bpmp TEGRA234_CLK_I2S6>,
 						 <&bpmp TEGRA234_CLK_I2S6_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -468,7 +468,7 @@ i2s6_dap: endpoint {
 				tegra_sfc1: sfc@2902000 {
 					compatible = "nvidia,tegra234-sfc",
 						     "nvidia,tegra210-sfc";
-					reg = <0x0 0x2902000 0x0 0x200>;
+					reg = <0x2902000 0x200>;
 					sound-name-prefix = "SFC1";
 
 					ports {
@@ -496,7 +496,7 @@ sfc1_cif_out: endpoint {
 				tegra_sfc2: sfc@2902200 {
 					compatible = "nvidia,tegra234-sfc",
 						     "nvidia,tegra210-sfc";
-					reg = <0x0 0x2902200 0x0 0x200>;
+					reg = <0x2902200 0x200>;
 					sound-name-prefix = "SFC2";
 
 					ports {
@@ -524,7 +524,7 @@ sfc2_cif_out: endpoint {
 				tegra_sfc3: sfc@2902400 {
 					compatible = "nvidia,tegra234-sfc",
 						     "nvidia,tegra210-sfc";
-					reg = <0x0 0x2902400 0x0 0x200>;
+					reg = <0x2902400 0x200>;
 					sound-name-prefix = "SFC3";
 
 					ports {
@@ -552,7 +552,7 @@ sfc3_cif_out: endpoint {
 				tegra_sfc4: sfc@2902600 {
 					compatible = "nvidia,tegra234-sfc",
 						     "nvidia,tegra210-sfc";
-					reg = <0x0 0x2902600 0x0 0x200>;
+					reg = <0x2902600 0x200>;
 					sound-name-prefix = "SFC4";
 
 					ports {
@@ -580,7 +580,7 @@ sfc4_cif_out: endpoint {
 				tegra_amx1: amx@2903000 {
 					compatible = "nvidia,tegra234-amx",
 						     "nvidia,tegra194-amx";
-					reg = <0x0 0x2903000 0x0 0x100>;
+					reg = <0x2903000 0x100>;
 					sound-name-prefix = "AMX1";
 
 					ports {
@@ -632,7 +632,7 @@ amx1_out: endpoint {
 				tegra_amx2: amx@2903100 {
 					compatible = "nvidia,tegra234-amx",
 						     "nvidia,tegra194-amx";
-					reg = <0x0 0x2903100 0x0 0x100>;
+					reg = <0x2903100 0x100>;
 					sound-name-prefix = "AMX2";
 
 					ports {
@@ -684,7 +684,7 @@ amx2_out: endpoint {
 				tegra_amx3: amx@2903200 {
 					compatible = "nvidia,tegra234-amx",
 						     "nvidia,tegra194-amx";
-					reg = <0x0 0x2903200 0x0 0x100>;
+					reg = <0x2903200 0x100>;
 					sound-name-prefix = "AMX3";
 
 					ports {
@@ -736,7 +736,7 @@ amx3_out: endpoint {
 				tegra_amx4: amx@2903300 {
 					compatible = "nvidia,tegra234-amx",
 						     "nvidia,tegra194-amx";
-					reg = <0x0 0x2903300 0x0 0x100>;
+					reg = <0x2903300 0x100>;
 					sound-name-prefix = "AMX4";
 
 					ports {
@@ -788,7 +788,7 @@ amx4_out: endpoint {
 				tegra_adx1: adx@2903800 {
 					compatible = "nvidia,tegra234-adx",
 						     "nvidia,tegra210-adx";
-					reg = <0x0 0x2903800 0x0 0x100>;
+					reg = <0x2903800 0x100>;
 					sound-name-prefix = "ADX1";
 
 					ports {
@@ -840,7 +840,7 @@ adx1_out4: endpoint {
 				tegra_adx2: adx@2903900 {
 					compatible = "nvidia,tegra234-adx",
 						     "nvidia,tegra210-adx";
-					reg = <0x0 0x2903900 0x0 0x100>;
+					reg = <0x2903900 0x100>;
 					sound-name-prefix = "ADX2";
 
 					ports {
@@ -892,7 +892,7 @@ adx2_out4: endpoint {
 				tegra_adx3: adx@2903a00 {
 					compatible = "nvidia,tegra234-adx",
 						     "nvidia,tegra210-adx";
-					reg = <0x0 0x2903a00 0x0 0x100>;
+					reg = <0x2903a00 0x100>;
 					sound-name-prefix = "ADX3";
 
 					ports {
@@ -944,7 +944,7 @@ adx3_out4: endpoint {
 				tegra_adx4: adx@2903b00 {
 					compatible = "nvidia,tegra234-adx",
 						     "nvidia,tegra210-adx";
-					reg = <0x0 0x2903b00 0x0 0x100>;
+					reg = <0x2903b00 0x100>;
 					sound-name-prefix = "ADX4";
 
 					ports {
@@ -997,7 +997,7 @@ adx4_out4: endpoint {
 				tegra_dmic1: dmic@2904000 {
 					compatible = "nvidia,tegra234-dmic",
 						     "nvidia,tegra210-dmic";
-					reg = <0x0 0x2904000 0x0 0x100>;
+					reg = <0x2904000 0x100>;
 					clocks = <&bpmp TEGRA234_CLK_DMIC1>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA234_CLK_DMIC1>;
@@ -1031,7 +1031,7 @@ dmic1_dap: endpoint {
 				tegra_dmic2: dmic@2904100 {
 					compatible = "nvidia,tegra234-dmic",
 						     "nvidia,tegra210-dmic";
-					reg = <0x0 0x2904100 0x0 0x100>;
+					reg = <0x2904100 0x100>;
 					clocks = <&bpmp TEGRA234_CLK_DMIC2>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA234_CLK_DMIC2>;
@@ -1065,7 +1065,7 @@ dmic2_dap: endpoint {
 				tegra_dmic3: dmic@2904200 {
 					compatible = "nvidia,tegra234-dmic",
 						     "nvidia,tegra210-dmic";
-					reg = <0x0 0x2904200 0x0 0x100>;
+					reg = <0x2904200 0x100>;
 					clocks = <&bpmp TEGRA234_CLK_DMIC3>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA234_CLK_DMIC3>;
@@ -1099,7 +1099,7 @@ dmic3_dap: endpoint {
 				tegra_dmic4: dmic@2904300 {
 					compatible = "nvidia,tegra234-dmic",
 						     "nvidia,tegra210-dmic";
-					reg = <0x0 0x2904300 0x0 0x100>;
+					reg = <0x2904300 0x100>;
 					clocks = <&bpmp TEGRA234_CLK_DMIC4>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA234_CLK_DMIC4>;
@@ -1133,7 +1133,7 @@ dmic4_dap: endpoint {
 				tegra_dspk1: dspk@2905000 {
 					compatible = "nvidia,tegra234-dspk",
 						     "nvidia,tegra186-dspk";
-					reg = <0x0 0x2905000 0x0 0x100>;
+					reg = <0x2905000 0x100>;
 					clocks = <&bpmp TEGRA234_CLK_DSPK1>;
 					clock-names = "dspk";
 					assigned-clocks = <&bpmp TEGRA234_CLK_DSPK1>;
@@ -1167,7 +1167,7 @@ dspk1_dap: endpoint {
 				tegra_dspk2: dspk@2905100 {
 					compatible = "nvidia,tegra234-dspk",
 						     "nvidia,tegra186-dspk";
-					reg = <0x0 0x2905100 0x0 0x100>;
+					reg = <0x2905100 0x100>;
 					clocks = <&bpmp TEGRA234_CLK_DSPK2>;
 					clock-names = "dspk";
 					assigned-clocks = <&bpmp TEGRA234_CLK_DSPK2>;
@@ -1201,23 +1201,23 @@ dspk2_dap: endpoint {
 				tegra_ope1: processing-engine@2908000 {
 					compatible = "nvidia,tegra234-ope",
 						     "nvidia,tegra210-ope";
-					reg = <0x0 0x2908000 0x0 0x100>;
+					reg = <0x2908000 0x100>;
 					sound-name-prefix = "OPE1";
 
-					#address-cells = <2>;
-					#size-cells = <2>;
+					#address-cells = <1>;
+					#size-cells = <1>;
 					ranges;
 
 					equalizer@2908100 {
 						compatible = "nvidia,tegra234-peq",
 							     "nvidia,tegra210-peq";
-						reg = <0x0 0x2908100 0x0 0x100>;
+						reg = <0x2908100 0x100>;
 					};
 
 					dynamic-range-compressor@2908200 {
 						compatible = "nvidia,tegra234-mbdrc",
 							     "nvidia,tegra210-mbdrc";
-						reg = <0x0 0x2908200 0x0 0x200>;
+						reg = <0x2908200 0x200>;
 					};
 
 					ports {
@@ -1247,7 +1247,7 @@ ope1_cif_out_ep: endpoint {
 				tegra_mvc1: mvc@290a000 {
 					compatible = "nvidia,tegra234-mvc",
 						     "nvidia,tegra210-mvc";
-					reg = <0x0 0x290a000 0x0 0x200>;
+					reg = <0x290a000 0x200>;
 					sound-name-prefix = "MVC1";
 
 					ports {
@@ -1275,7 +1275,7 @@ mvc1_cif_out: endpoint {
 				tegra_mvc2: mvc@290a200 {
 					compatible = "nvidia,tegra234-mvc",
 						     "nvidia,tegra210-mvc";
-					reg = <0x0 0x290a200 0x0 0x200>;
+					reg = <0x290a200 0x200>;
 					sound-name-prefix = "MVC2";
 
 					ports {
@@ -1303,7 +1303,7 @@ mvc2_cif_out: endpoint {
 				tegra_amixer: amixer@290bb00 {
 					compatible = "nvidia,tegra234-amixer",
 						     "nvidia,tegra210-amixer";
-					reg = <0x0 0x290bb00 0x0 0x800>;
+					reg = <0x290bb00 0x800>;
 					sound-name-prefix = "MIXER1";
 
 					ports {
@@ -1435,7 +1435,7 @@ mix_out5: endpoint {
 				tegra_admaif: admaif@290f000 {
 					compatible = "nvidia,tegra234-admaif",
 						     "nvidia,tegra186-admaif";
-					reg = <0x0 0x0290f000 0x0 0x1000>;
+					reg = <0x0290f000 0x1000>;
 					dmas = <&adma 1>, <&adma 1>,
 					       <&adma 2>, <&adma 2>,
 					       <&adma 3>, <&adma 3>,
@@ -1650,7 +1650,7 @@ admaif19: endpoint {
 				tegra_asrc: asrc@2910000 {
 					compatible = "nvidia,tegra234-asrc",
 						     "nvidia,tegra186-asrc";
-					reg = <0x0 0x2910000 0x0 0x2000>;
+					reg = <0x2910000 0x2000>;
 					sound-name-prefix = "ASRC1";
 
 					ports {

-- 
2.55.0

