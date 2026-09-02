Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7893943CED9;
	Wed,  2 Sep 2026 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344256; cv=none; b=nqwJIMZrdiGj+iMfoRHiWaOnizw8ajnwbbIhyDHgk/cT2SY7c8Iw3p8c22bTYgfoyyRKn2gz9eF6+mMkWV9JTx0zc3bGYirxc934jzfsTFd1v69arJq/flQlcOiyyo9zs08AjN+oCoxQkW6nCXNhjq1QjRH6kLGH5IY82ItJxq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344256; c=relaxed/simple;
	bh=DIyPyT1d1hVZBjj2lIAoAXGZf2UUKtlwUk/eLSN5KSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tm8/p7uOx9X+L/YwRTDtH+tr06pnAJQh6BChcyfnod2zPzRuaH/sHPJu3fxADinOHLjqVPbniEhyWcnwgkc7w2G9oH0yDAuD1zXC0b3a9wSoeXXYpjTTknL4XodYOTKw2NEnzmMcOtB3GpYWVC3A8TKijQYusPtj/8f9q/rVYrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjCBDcDn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjCBDcDn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9762B1F00A3A;
	Wed,  2 Sep 2026 10:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344254;
	bh=+z6uJyg0DjV9dklIbBUSdexJwbjtKZcYR7PmbkazHMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UjCBDcDn8EWNMTJ7tjmv3zdgodYYWh3zrpRCQR4k5bHi8JRNtMCQs/abyDLSM7GHW
	 1pmgwf4wrNfPNZTOFDvfjXlX0XI1oRP6bfvze26FhId4i4GvGoySPB/zPcMy0vB+i/
	 NcV1Mb7bjBUlGHQYJVB+TVV9WZDjdTboOFSKMp2MvvZS5Mgz8gzgIXMon3PMHRTynf
	 27SRNvSHFTPF7vVoSqnnsEYUoYdaAcFbNbuNacd+XXV1IQ1U2Ctt3BQg81kdTF3KFo
	 8GJ23qbsAvXCSUfkHd206NiOMCUy75OPY9bHFoXyfi8Fb+DXYzfg4DYkDbdwzOfETy
	 VOL5S+1qXmp1Q==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 02 Sep 2026 12:17:41 +0200
Subject: [PATCH 5/8] arm64: tegra: Clean up AHUB on Tegra194
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-tegra-ahub-dt-cleanup-v1-5-028f3c5e72f6@nvidia.com>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
In-Reply-To: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11004; i=treding@nvidia.com;
 h=from:subject:message-id; bh=hbQL2klgrEPLzSnyomCfTSbDn1+k23jngl5f6rHZZvE=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBql/fGNPJbHVRq2nS3/msNw0JZheoiKkz8khgu/
 lSjhm8bn+yJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapf3xgAKCRDdI6zXfz6z
 oU0qEACAeQ2ohpv7bdWlr+OIwEzT03/P8KTrRQqYY7+/HG/PDB7ESC2x3l0qXTNNlZp3r9ys3+O
 C6a6SANknJbYD1fcg0hkQPp5e93dQYKaAK5+AFJmIxd/0G8vp7OMPHQvc7AJlT2FwoFg1sr499h
 QDoT9kSh271qk3GFWH+2+ydw72el4NzDdZ+xN4aGLghujGmtWoszZOZGhOMm7bg1L+u/bY4E1uF
 tIs22cWmQA0pEjmlBsFu/WlevrtCuQlRnEiXlUBOIMklx7yEpQ001NM7QGmOwe8t0/UKHVr82Dg
 Q3+kQZZIP4EVL6dwqoEXtf3C/nFiNP6M8R0uQtW8yzshoGRS6vLcQ6f0bCPKskoKpt8vzoytVtj
 ZTSdenpt/EurdgLa9Z58Mb9kccQ5kqz9gZuj6q1MA8oh54egLRTFF4U7o9AjRvH7mJO92gdjkHc
 cXpoYRoE+HZ3BAVk7fJ87AAbWUo2uycRCKFyrHb/69xv8E0OB59FcxZwezbvjJSrnrtLkWXnha7
 JRNGuevMUubFpjyuGFIjCXGHGRtJRV19GgN57XrshmPiwLtim6eTcoFk8S7e9nnKZzDlG78u6va
 7iIwlpJydVU13JQjdg/uyX6eAHC+eIzvD606q31i5EJPPDjZPd4YHl6R8eEmLWTtxVpF3M9BaTv
 DuH6ant2eoLDFfw==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Use #address-cells = <1> and #size-cells = <1> because we don't need
64-bit register addressing for this hardware. While at it, also adjust
the ranges property to encompass the entire AHUB range as per the TRM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 74 ++++++++++++++++----------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 2b5001d2c3ab..13a95008c186 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -231,14 +231,14 @@ tegra_ahub: ahub@2900800 {
 				assigned-clock-rates = <81600000>;
 				status = "disabled";
 
-				#address-cells = <2>;
-				#size-cells = <2>;
-				ranges = <0x0 0x02900800 0x0 0x02900800 0x0 0x11800>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x02900000 0x0 0x02900000 0x20000>;
 
 				tegra_i2s1: i2s@2901000 {
 					compatible = "nvidia,tegra194-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x0 0x2901000 0x0 0x100>;
+					reg = <0x2901000 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_I2S1>,
 						 <&bpmp TEGRA194_CLK_I2S1_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -252,7 +252,7 @@ tegra_i2s1: i2s@2901000 {
 				tegra_i2s2: i2s@2901100 {
 					compatible = "nvidia,tegra194-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x0 0x2901100 0x0 0x100>;
+					reg = <0x2901100 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_I2S2>,
 						 <&bpmp TEGRA194_CLK_I2S2_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -266,7 +266,7 @@ tegra_i2s2: i2s@2901100 {
 				tegra_i2s3: i2s@2901200 {
 					compatible = "nvidia,tegra194-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x0 0x2901200 0x0 0x100>;
+					reg = <0x2901200 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_I2S3>,
 						 <&bpmp TEGRA194_CLK_I2S3_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -280,7 +280,7 @@ tegra_i2s3: i2s@2901200 {
 				tegra_i2s4: i2s@2901300 {
 					compatible = "nvidia,tegra194-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x0 0x2901300 0x0 0x100>;
+					reg = <0x2901300 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_I2S4>,
 						 <&bpmp TEGRA194_CLK_I2S4_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -294,7 +294,7 @@ tegra_i2s4: i2s@2901300 {
 				tegra_i2s5: i2s@2901400 {
 					compatible = "nvidia,tegra194-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x0 0x2901400 0x0 0x100>;
+					reg = <0x2901400 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_I2S5>,
 						 <&bpmp TEGRA194_CLK_I2S5_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -308,7 +308,7 @@ tegra_i2s5: i2s@2901400 {
 				tegra_i2s6: i2s@2901500 {
 					compatible = "nvidia,tegra194-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x0 0x2901500 0x0 0x100>;
+					reg = <0x2901500 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_I2S6>,
 						 <&bpmp TEGRA194_CLK_I2S6_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -322,7 +322,7 @@ tegra_i2s6: i2s@2901500 {
 				tegra_sfc1: sfc@2902000 {
 					compatible = "nvidia,tegra194-sfc",
 						     "nvidia,tegra210-sfc";
-					reg = <0x0 0x2902000 0x0 0x200>;
+					reg = <0x2902000 0x200>;
 					sound-name-prefix = "SFC1";
 					status = "disabled";
 				};
@@ -330,7 +330,7 @@ tegra_sfc1: sfc@2902000 {
 				tegra_sfc2: sfc@2902200 {
 					compatible = "nvidia,tegra194-sfc",
 						     "nvidia,tegra210-sfc";
-					reg = <0x0 0x2902200 0x0 0x200>;
+					reg = <0x2902200 0x200>;
 					sound-name-prefix = "SFC2";
 					status = "disabled";
 				};
@@ -338,7 +338,7 @@ tegra_sfc2: sfc@2902200 {
 				tegra_sfc3: sfc@2902400 {
 					compatible = "nvidia,tegra194-sfc",
 						     "nvidia,tegra210-sfc";
-					reg = <0x0 0x2902400 0x0 0x200>;
+					reg = <0x2902400 0x200>;
 					sound-name-prefix = "SFC3";
 					status = "disabled";
 				};
@@ -346,35 +346,35 @@ tegra_sfc3: sfc@2902400 {
 				tegra_sfc4: sfc@2902600 {
 					compatible = "nvidia,tegra194-sfc",
 						     "nvidia,tegra210-sfc";
-					reg = <0x0 0x2902600 0x0 0x200>;
+					reg = <0x2902600 0x200>;
 					sound-name-prefix = "SFC4";
 					status = "disabled";
 				};
 
 				tegra_amx1: amx@2903000 {
 					compatible = "nvidia,tegra194-amx";
-					reg = <0x0 0x2903000 0x0 0x100>;
+					reg = <0x2903000 0x100>;
 					sound-name-prefix = "AMX1";
 					status = "disabled";
 				};
 
 				tegra_amx2: amx@2903100 {
 					compatible = "nvidia,tegra194-amx";
-					reg = <0x0 0x2903100 0x0 0x100>;
+					reg = <0x2903100 0x100>;
 					sound-name-prefix = "AMX2";
 					status = "disabled";
 				};
 
 				tegra_amx3: amx@2903200 {
 					compatible = "nvidia,tegra194-amx";
-					reg = <0x0 0x2903200 0x0 0x100>;
+					reg = <0x2903200 0x100>;
 					sound-name-prefix = "AMX3";
 					status = "disabled";
 				};
 
 				tegra_amx4: amx@2903300 {
 					compatible = "nvidia,tegra194-amx";
-					reg = <0x0 0x2903300 0x0 0x100>;
+					reg = <0x2903300 0x100>;
 					sound-name-prefix = "AMX4";
 					status = "disabled";
 				};
@@ -382,7 +382,7 @@ tegra_amx4: amx@2903300 {
 				tegra_adx1: adx@2903800 {
 					compatible = "nvidia,tegra194-adx",
 						     "nvidia,tegra210-adx";
-					reg = <0x0 0x2903800 0x0 0x100>;
+					reg = <0x2903800 0x100>;
 					sound-name-prefix = "ADX1";
 					status = "disabled";
 				};
@@ -390,7 +390,7 @@ tegra_adx1: adx@2903800 {
 				tegra_adx2: adx@2903900 {
 					compatible = "nvidia,tegra194-adx",
 						     "nvidia,tegra210-adx";
-					reg = <0x0 0x2903900 0x0 0x100>;
+					reg = <0x2903900 0x100>;
 					sound-name-prefix = "ADX2";
 					status = "disabled";
 				};
@@ -398,7 +398,7 @@ tegra_adx2: adx@2903900 {
 				tegra_adx3: adx@2903a00 {
 					compatible = "nvidia,tegra194-adx",
 						     "nvidia,tegra210-adx";
-					reg = <0x0 0x2903a00 0x0 0x100>;
+					reg = <0x2903a00 0x100>;
 					sound-name-prefix = "ADX3";
 					status = "disabled";
 				};
@@ -406,7 +406,7 @@ tegra_adx3: adx@2903a00 {
 				tegra_adx4: adx@2903b00 {
 					compatible = "nvidia,tegra194-adx",
 						     "nvidia,tegra210-adx";
-					reg = <0x0 0x2903b00 0x0 0x100>;
+					reg = <0x2903b00 0x100>;
 					sound-name-prefix = "ADX4";
 					status = "disabled";
 				};
@@ -414,7 +414,7 @@ tegra_adx4: adx@2903b00 {
 				tegra_dmic1: dmic@2904000 {
 					compatible = "nvidia,tegra194-dmic",
 						     "nvidia,tegra210-dmic";
-					reg = <0x0 0x2904000 0x0 0x100>;
+					reg = <0x2904000 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_DMIC1>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC1>;
@@ -427,7 +427,7 @@ tegra_dmic1: dmic@2904000 {
 				tegra_dmic2: dmic@2904100 {
 					compatible = "nvidia,tegra194-dmic",
 						     "nvidia,tegra210-dmic";
-					reg = <0x0 0x2904100 0x0 0x100>;
+					reg = <0x2904100 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_DMIC2>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC2>;
@@ -440,7 +440,7 @@ tegra_dmic2: dmic@2904100 {
 				tegra_dmic3: dmic@2904200 {
 					compatible = "nvidia,tegra194-dmic",
 						     "nvidia,tegra210-dmic";
-					reg = <0x0 0x2904200 0x0 0x100>;
+					reg = <0x2904200 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_DMIC3>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC3>;
@@ -453,7 +453,7 @@ tegra_dmic3: dmic@2904200 {
 				tegra_dmic4: dmic@2904300 {
 					compatible = "nvidia,tegra194-dmic",
 						     "nvidia,tegra210-dmic";
-					reg = <0x0 0x2904300 0x0 0x100>;
+					reg = <0x2904300 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_DMIC4>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC4>;
@@ -466,7 +466,7 @@ tegra_dmic4: dmic@2904300 {
 				tegra_dspk1: dspk@2905000 {
 					compatible = "nvidia,tegra194-dspk",
 						     "nvidia,tegra186-dspk";
-					reg = <0x0 0x2905000 0x0 0x100>;
+					reg = <0x2905000 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_DSPK1>;
 					clock-names = "dspk";
 					assigned-clocks = <&bpmp TEGRA194_CLK_DSPK1>;
@@ -479,7 +479,7 @@ tegra_dspk1: dspk@2905000 {
 				tegra_dspk2: dspk@2905100 {
 					compatible = "nvidia,tegra194-dspk",
 						     "nvidia,tegra186-dspk";
-					reg = <0x0 0x2905100 0x0 0x100>;
+					reg = <0x2905100 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_DSPK2>;
 					clock-names = "dspk";
 					assigned-clocks = <&bpmp TEGRA194_CLK_DSPK2>;
@@ -492,31 +492,31 @@ tegra_dspk2: dspk@2905100 {
 				tegra_ope1: processing-engine@2908000 {
 					compatible = "nvidia,tegra194-ope",
 						     "nvidia,tegra210-ope";
-					reg = <0x0 0x2908000 0x0 0x100>;
+					reg = <0x2908000 0x100>;
 					sound-name-prefix = "OPE1";
 					status = "disabled";
 
-					#address-cells = <2>;
-					#size-cells = <2>;
+					#address-cells = <1>;
+					#size-cells = <1>;
 					ranges;
 
 					equalizer@2908100 {
 						compatible = "nvidia,tegra194-peq",
 							     "nvidia,tegra210-peq";
-						reg = <0x0 0x2908100 0x0 0x100>;
+						reg = <0x2908100 0x100>;
 					};
 
 					dynamic-range-compressor@2908200 {
 						compatible = "nvidia,tegra194-mbdrc",
 							     "nvidia,tegra210-mbdrc";
-						reg = <0x0 0x2908200 0x0 0x200>;
+						reg = <0x2908200 0x200>;
 					};
 				};
 
 				tegra_mvc1: mvc@290a000 {
 					compatible = "nvidia,tegra194-mvc",
 						     "nvidia,tegra210-mvc";
-					reg = <0x0 0x290a000 0x0 0x200>;
+					reg = <0x290a000 0x200>;
 					sound-name-prefix = "MVC1";
 					status = "disabled";
 				};
@@ -524,7 +524,7 @@ tegra_mvc1: mvc@290a000 {
 				tegra_mvc2: mvc@290a200 {
 					compatible = "nvidia,tegra194-mvc",
 						     "nvidia,tegra210-mvc";
-					reg = <0x0 0x290a200 0x0 0x200>;
+					reg = <0x290a200 0x200>;
 					sound-name-prefix = "MVC2";
 					status = "disabled";
 				};
@@ -532,7 +532,7 @@ tegra_mvc2: mvc@290a200 {
 				tegra_amixer: amixer@290bb00 {
 					compatible = "nvidia,tegra194-amixer",
 						     "nvidia,tegra210-amixer";
-					reg = <0x0 0x290bb00 0x0 0x800>;
+					reg = <0x290bb00 0x800>;
 					sound-name-prefix = "MIXER1";
 					status = "disabled";
 				};
@@ -540,7 +540,7 @@ tegra_amixer: amixer@290bb00 {
 				tegra_admaif: admaif@290f000 {
 					compatible = "nvidia,tegra194-admaif",
 						     "nvidia,tegra186-admaif";
-					reg = <0x0 0x0290f000 0x0 0x1000>;
+					reg = <0x0290f000 0x1000>;
 					dmas = <&adma 1>, <&adma 1>,
 					       <&adma 2>, <&adma 2>,
 					       <&adma 3>, <&adma 3>,
@@ -591,7 +591,7 @@ tegra_admaif: admaif@290f000 {
 				tegra_asrc: asrc@2910000 {
 					compatible = "nvidia,tegra194-asrc",
 						     "nvidia,tegra186-asrc";
-					reg = <0x0 0x2910000 0x0 0x2000>;
+					reg = <0x2910000 0x2000>;
 					sound-name-prefix = "ASRC1";
 					status = "disabled";
 				};

-- 
2.55.0

