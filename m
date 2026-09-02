Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F06D43CE7E;
	Wed,  2 Sep 2026 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344254; cv=none; b=bmyUC/GMA/LTTLKc3TG7ytHeVknn6xbMI2RXcy46z+AVacrunpDsJkHZrvLA+QGWxgOXrsK/1rTbs1U4S1g2kSDvT7XE7TaSOU3h48puRss3fQ8Ml8BeWP+dCEhyQ73M4Gq18s5Ogsw1qLQeKo5nHAaBp9MhmHUCmeJyOJn2PK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344254; c=relaxed/simple;
	bh=6bcqWblRKpqpQZ9sqOeIybNdtbPHL97nRqrBeUHO4/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lqOXjli5K/uZ5T3NIQKx3L/4rz1JwjHggJpxlrRikJWTD0XFd3J1O4NOhMmOkz71em0ikWXnbK0QOGl1w1TpOHaQJA0NOPMzrDL0SoVVapCkh32fhwto/lyfARi9e91VPtYfBOb10Z9TpfNMNJDU9rWQw7MWbgBxYgbusgBxAJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=manso9Nq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="manso9Nq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AFA1F000E9;
	Wed,  2 Sep 2026 10:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344251;
	bh=41jVJO8G26mYTHVILyoQBOQnZmXsYy0cm3FiQK04Rcs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=manso9Nqz7tijKJiDoVSqSydWPCKuF4HHBnMFXqeX+GRlklNhRrRFs0RPQVr/etdt
	 XIjzW91Mif5x1prATJEic6G7TfAHCsYA622t+3v5LreLVSQDiN7kisZuyI/OaG8Nz+
	 2RjHdCPninOktY6KUhCFRewZ5eFS5Tn69CK+K5qCk4ErcbK2ndMkMhHKxTNl9O1Q4B
	 /kpMIN444wGdLhdWHm/hc6qBlcVIA9TPRD2tMky2OmKsb9oEAoorBRcd3U/s755AaS
	 9CWJYNA6kkGLAQBiVi6W7OCCNe+t2C+o/0fsY94bBHF5eshAEV6BlKvla/ua4Y1UOG
	 G8IwNqhrGJnTQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 02 Sep 2026 12:17:40 +0200
Subject: [PATCH 4/8] arm64: tegra: Clean up AHUB on Tegra186
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-tegra-ahub-dt-cleanup-v1-4-028f3c5e72f6@nvidia.com>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
In-Reply-To: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10860; i=treding@nvidia.com;
 h=from:subject:message-id; bh=j5jnheSxYU0q+VC9CegVr/kwAiwUCY7+wPx3JN8fObk=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBql/fG8V3K9ksjAYJ3Il834A3X2DFUffN4oKRL8
 aNtS5joc8mJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapf3xgAKCRDdI6zXfz6z
 oUdeD/97i+ft0wtwRKn8opxw8VXYo7gse6pfX32uBareSz/3pwfsaWRhcFGrwL4sL9s/Vp+Fx88
 zC9lzyzhs4i5Gd3EwqV0CX6ET8maQDuW5GovqJjlT9tEFRNvXSYKEPZWyGVcq5KUF1d+NM/qeFI
 zdR/7c9XpsbZLpKmepmhomKGJQYJvIfXoSzwrp+dwIordtiPi64uQPJBUFGapyHqOxC+CqBAQIj
 pjieCpuKbcJ8TjKL3WJprbRoYFZd9Juqohqy3NJnqZYj6lijM/wemC6D3y/u4Gt0UdfTE/qiU/m
 IwF7ZOVVsGFkAC2bXuBH5gy8Bb/CkKPzcA802siRKXBB4POp9BNC6nk1u/H9wNpZGiu3g8GYRjm
 KdJtX9dBcodB4SgNXqtNqpYp6dVGzCmMhi5E1gqBdKNsJuJjJmAsHJrYFZpnrY/01XYUcvZo52l
 ofrLHJuIq2DeYd7YXJ3YFuthwKPMu0yKUHT1ei4TC4IBgyVcIzo74OAiCY9A2RZ+v90OwOGs+N/
 ikBmRg/pAyYz1gIKD4U3iEAgvoLDCCOacQIh5s8513E5YwqlDGAXIRfuQW6n3sQ80TsqO74b+cn
 zLXyHhqvLnb1UX2vex0mvy3OocXOhPCc13txazLEIhg6CNOFAhKIER0l9ZJZegWqXoLS7ykjZLx
 gQh7Y5GnU9NDgkA==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Use #address-cells = <1> and #size-cells = <1> because we don't need
64-bit register addressing for this hardware. While at it, also adjust
the ranges property to encompass the entire AHUB range as per the TRM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 74 ++++++++++++++++----------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 705af0373a09..623d5e654323 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -142,15 +142,15 @@ tegra_ahub: ahub@2900800 {
 			assigned-clocks = <&bpmp TEGRA186_CLK_AHUB>;
 			assigned-clock-parents = <&bpmp TEGRA186_CLK_PLLP_OUT0>;
 			assigned-clock-rates = <81600000>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges = <0x0 0x02900800 0x0 0x02900800 0x0 0x11800>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x02900000 0x0 0x02900000 0x20000>;
 			status = "disabled";
 
 			tegra_i2s1: i2s@2901000 {
 				compatible = "nvidia,tegra186-i2s",
 					     "nvidia,tegra210-i2s";
-				reg = <0x0 0x2901000 0x0 0x100>;
+				reg = <0x2901000 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_I2S1>,
 					 <&bpmp TEGRA186_CLK_I2S1_SYNC_INPUT>;
 				clock-names = "i2s", "sync_input";
@@ -164,7 +164,7 @@ tegra_i2s1: i2s@2901000 {
 			tegra_i2s2: i2s@2901100 {
 				compatible = "nvidia,tegra186-i2s",
 					     "nvidia,tegra210-i2s";
-				reg = <0x0 0x2901100 0x0 0x100>;
+				reg = <0x2901100 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_I2S2>,
 					 <&bpmp TEGRA186_CLK_I2S2_SYNC_INPUT>;
 				clock-names = "i2s", "sync_input";
@@ -178,7 +178,7 @@ tegra_i2s2: i2s@2901100 {
 			tegra_i2s3: i2s@2901200 {
 				compatible = "nvidia,tegra186-i2s",
 					     "nvidia,tegra210-i2s";
-				reg = <0x0 0x2901200 0x0 0x100>;
+				reg = <0x2901200 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_I2S3>,
 					 <&bpmp TEGRA186_CLK_I2S3_SYNC_INPUT>;
 				clock-names = "i2s", "sync_input";
@@ -192,7 +192,7 @@ tegra_i2s3: i2s@2901200 {
 			tegra_i2s4: i2s@2901300 {
 				compatible = "nvidia,tegra186-i2s",
 					     "nvidia,tegra210-i2s";
-				reg = <0x0 0x2901300 0x0 0x100>;
+				reg = <0x2901300 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_I2S4>,
 					 <&bpmp TEGRA186_CLK_I2S4_SYNC_INPUT>;
 				clock-names = "i2s", "sync_input";
@@ -206,7 +206,7 @@ tegra_i2s4: i2s@2901300 {
 			tegra_i2s5: i2s@2901400 {
 				compatible = "nvidia,tegra186-i2s",
 					     "nvidia,tegra210-i2s";
-				reg = <0x0 0x2901400 0x0 0x100>;
+				reg = <0x2901400 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_I2S5>,
 					 <&bpmp TEGRA186_CLK_I2S5_SYNC_INPUT>;
 				clock-names = "i2s", "sync_input";
@@ -220,7 +220,7 @@ tegra_i2s5: i2s@2901400 {
 			tegra_i2s6: i2s@2901500 {
 				compatible = "nvidia,tegra186-i2s",
 					     "nvidia,tegra210-i2s";
-				reg = <0x0 0x2901500 0x0 0x100>;
+				reg = <0x2901500 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_I2S6>,
 					 <&bpmp TEGRA186_CLK_I2S6_SYNC_INPUT>;
 				clock-names = "i2s", "sync_input";
@@ -234,7 +234,7 @@ tegra_i2s6: i2s@2901500 {
 			tegra_sfc1: sfc@2902000 {
 				compatible = "nvidia,tegra186-sfc",
 					     "nvidia,tegra210-sfc";
-				reg = <0x0 0x2902000 0x0 0x200>;
+				reg = <0x2902000 0x200>;
 				sound-name-prefix = "SFC1";
 				status = "disabled";
 			};
@@ -242,7 +242,7 @@ tegra_sfc1: sfc@2902000 {
 			tegra_sfc2: sfc@2902200 {
 				compatible = "nvidia,tegra186-sfc",
 					     "nvidia,tegra210-sfc";
-				reg = <0x0 0x2902200 0x0 0x200>;
+				reg = <0x2902200 0x200>;
 				sound-name-prefix = "SFC2";
 				status = "disabled";
 			};
@@ -250,7 +250,7 @@ tegra_sfc2: sfc@2902200 {
 			tegra_sfc3: sfc@2902400 {
 				compatible = "nvidia,tegra186-sfc",
 					     "nvidia,tegra210-sfc";
-				reg = <0x0 0x2902400 0x0 0x200>;
+				reg = <0x2902400 0x200>;
 				sound-name-prefix = "SFC3";
 				status = "disabled";
 			};
@@ -258,7 +258,7 @@ tegra_sfc3: sfc@2902400 {
 			tegra_sfc4: sfc@2902600 {
 				compatible = "nvidia,tegra186-sfc",
 					     "nvidia,tegra210-sfc";
-				reg = <0x0 0x2902600 0x0 0x200>;
+				reg = <0x2902600 0x200>;
 				sound-name-prefix = "SFC4";
 				status = "disabled";
 			};
@@ -266,7 +266,7 @@ tegra_sfc4: sfc@2902600 {
 			tegra_amx1: amx@2903000 {
 				compatible = "nvidia,tegra186-amx",
 					     "nvidia,tegra210-amx";
-				reg = <0x0 0x2903000 0x0 0x100>;
+				reg = <0x2903000 0x100>;
 				sound-name-prefix = "AMX1";
 				status = "disabled";
 			};
@@ -274,7 +274,7 @@ tegra_amx1: amx@2903000 {
 			tegra_amx2: amx@2903100 {
 				compatible = "nvidia,tegra186-amx",
 					     "nvidia,tegra210-amx";
-				reg = <0x0 0x2903100 0x0 0x100>;
+				reg = <0x2903100 0x100>;
 				sound-name-prefix = "AMX2";
 				status = "disabled";
 			};
@@ -282,7 +282,7 @@ tegra_amx2: amx@2903100 {
 			tegra_amx3: amx@2903200 {
 				compatible = "nvidia,tegra186-amx",
 					     "nvidia,tegra210-amx";
-				reg = <0x0 0x2903200 0x0 0x100>;
+				reg = <0x2903200 0x100>;
 				sound-name-prefix = "AMX3";
 				status = "disabled";
 			};
@@ -290,7 +290,7 @@ tegra_amx3: amx@2903200 {
 			tegra_amx4: amx@2903300 {
 				compatible = "nvidia,tegra186-amx",
 					     "nvidia,tegra210-amx";
-				reg = <0x0 0x2903300 0x0 0x100>;
+				reg = <0x2903300 0x100>;
 				sound-name-prefix = "AMX4";
 				status = "disabled";
 			};
@@ -298,7 +298,7 @@ tegra_amx4: amx@2903300 {
 			tegra_adx1: adx@2903800 {
 				compatible = "nvidia,tegra186-adx",
 					     "nvidia,tegra210-adx";
-				reg = <0x0 0x2903800 0x0 0x100>;
+				reg = <0x2903800 0x100>;
 				sound-name-prefix = "ADX1";
 				status = "disabled";
 			};
@@ -306,7 +306,7 @@ tegra_adx1: adx@2903800 {
 			tegra_adx2: adx@2903900 {
 				compatible = "nvidia,tegra186-adx",
 					     "nvidia,tegra210-adx";
-				reg = <0x0 0x2903900 0x0 0x100>;
+				reg = <0x2903900 0x100>;
 				sound-name-prefix = "ADX2";
 				status = "disabled";
 			};
@@ -314,7 +314,7 @@ tegra_adx2: adx@2903900 {
 			tegra_adx3: adx@2903a00 {
 				compatible = "nvidia,tegra186-adx",
 					     "nvidia,tegra210-adx";
-				reg = <0x0 0x2903a00 0x0 0x100>;
+				reg = <0x2903a00 0x100>;
 				sound-name-prefix = "ADX3";
 				status = "disabled";
 			};
@@ -322,14 +322,14 @@ tegra_adx3: adx@2903a00 {
 			tegra_adx4: adx@2903b00 {
 				compatible = "nvidia,tegra186-adx",
 					     "nvidia,tegra210-adx";
-				reg = <0x0 0x2903b00 0x0 0x100>;
+				reg = <0x2903b00 0x100>;
 				sound-name-prefix = "ADX4";
 				status = "disabled";
 			};
 
 			tegra_dmic1: dmic@2904000 {
 				compatible = "nvidia,tegra210-dmic";
-				reg = <0x0 0x2904000 0x0 0x100>;
+				reg = <0x2904000 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_DMIC1>;
 				clock-names = "dmic";
 				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC1>;
@@ -341,7 +341,7 @@ tegra_dmic1: dmic@2904000 {
 
 			tegra_dmic2: dmic@2904100 {
 				compatible = "nvidia,tegra210-dmic";
-				reg = <0x0 0x2904100 0x0 0x100>;
+				reg = <0x2904100 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_DMIC2>;
 				clock-names = "dmic";
 				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC2>;
@@ -353,7 +353,7 @@ tegra_dmic2: dmic@2904100 {
 
 			tegra_dmic3: dmic@2904200 {
 				compatible = "nvidia,tegra210-dmic";
-				reg = <0x0 0x2904200 0x0 0x100>;
+				reg = <0x2904200 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_DMIC3>;
 				clock-names = "dmic";
 				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC3>;
@@ -365,7 +365,7 @@ tegra_dmic3: dmic@2904200 {
 
 			tegra_dmic4: dmic@2904300 {
 				compatible = "nvidia,tegra210-dmic";
-				reg = <0x0 0x2904300 0x0 0x100>;
+				reg = <0x2904300 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_DMIC4>;
 				clock-names = "dmic";
 				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC4>;
@@ -377,7 +377,7 @@ tegra_dmic4: dmic@2904300 {
 
 			tegra_dspk1: dspk@2905000 {
 				compatible = "nvidia,tegra186-dspk";
-				reg = <0x0 0x2905000 0x0 0x100>;
+				reg = <0x2905000 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_DSPK1>;
 				clock-names = "dspk";
 				assigned-clocks = <&bpmp TEGRA186_CLK_DSPK1>;
@@ -389,7 +389,7 @@ tegra_dspk1: dspk@2905000 {
 
 			tegra_dspk2: dspk@2905100 {
 				compatible = "nvidia,tegra186-dspk";
-				reg = <0x0 0x2905100 0x0 0x100>;
+				reg = <0x2905100 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_DSPK2>;
 				clock-names = "dspk";
 				assigned-clocks = <&bpmp TEGRA186_CLK_DSPK2>;
@@ -402,9 +402,9 @@ tegra_dspk2: dspk@2905100 {
 			tegra_ope1: processing-engine@2908000 {
 				compatible = "nvidia,tegra186-ope",
 					     "nvidia,tegra210-ope";
-				reg = <0x0 0x2908000 0x0 0x100>;
-				#address-cells = <2>;
-				#size-cells = <2>;
+				reg = <0x2908000 0x100>;
+				#address-cells = <1>;
+				#size-cells = <1>;
 				ranges;
 				sound-name-prefix = "OPE1";
 				status = "disabled";
@@ -412,20 +412,20 @@ tegra_ope1: processing-engine@2908000 {
 				equalizer@2908100 {
 					compatible = "nvidia,tegra186-peq",
 						     "nvidia,tegra210-peq";
-					reg = <0x0 0x2908100 0x0 0x100>;
+					reg = <0x2908100 0x100>;
 				};
 
 				dynamic-range-compressor@2908200 {
 					compatible = "nvidia,tegra186-mbdrc",
 						     "nvidia,tegra210-mbdrc";
-					reg = <0x0 0x2908200 0x0 0x200>;
+					reg = <0x2908200 0x200>;
 				};
 			};
 
 			tegra_mvc1: mvc@290a000 {
 				compatible = "nvidia,tegra186-mvc",
 					     "nvidia,tegra210-mvc";
-				reg = <0x0 0x290a000 0x0 0x200>;
+				reg = <0x290a000 0x200>;
 				sound-name-prefix = "MVC1";
 				status = "disabled";
 			};
@@ -433,7 +433,7 @@ tegra_mvc1: mvc@290a000 {
 			tegra_mvc2: mvc@290a200 {
 				compatible = "nvidia,tegra186-mvc",
 					     "nvidia,tegra210-mvc";
-				reg = <0x0 0x290a200 0x0 0x200>;
+				reg = <0x290a200 0x200>;
 				sound-name-prefix = "MVC2";
 				status = "disabled";
 			};
@@ -441,14 +441,14 @@ tegra_mvc2: mvc@290a200 {
 			tegra_amixer: amixer@290bb00 {
 				compatible = "nvidia,tegra186-amixer",
 					     "nvidia,tegra210-amixer";
-				reg = <0x0 0x290bb00 0x0 0x800>;
+				reg = <0x290bb00 0x800>;
 				sound-name-prefix = "MIXER1";
 				status = "disabled";
 			};
 
 			tegra_admaif: admaif@290f000 {
 				compatible = "nvidia,tegra186-admaif";
-				reg = <0x0 0x0290f000 0x0 0x1000>;
+				reg = <0x0290f000 0x1000>;
 				dmas = <&adma 1>, <&adma 1>,
 				       <&adma 2>, <&adma 2>,
 				       <&adma 3>, <&adma 3>,
@@ -494,7 +494,7 @@ tegra_admaif: admaif@290f000 {
 
 			tegra_asrc: asrc@2910000 {
 				compatible = "nvidia,tegra186-asrc";
-				reg = <0x0 0x2910000 0x0 0x2000>;
+				reg = <0x2910000 0x2000>;
 				sound-name-prefix = "ASRC1";
 				status = "disabled";
 			};

-- 
2.55.0

