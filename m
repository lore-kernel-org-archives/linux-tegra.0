Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE6543B6C4;
	Wed,  2 Sep 2026 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344247; cv=none; b=VuWxW/IWxnbeKOGjtcOa6QT3i6na/v+2ClosHubV2LKZUPI8uPYXG6+CMdGKP96kafHkMWAsZUvk/L11YYR5TBqxKVJdWSxBXmLoQWHtbMaar2vUsWO5Dm6wjMsOTw6Kb5AFQJeSaIN7ejvnkWzAMAMOdihfag5DwbSEO4V3DNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344247; c=relaxed/simple;
	bh=b5ocjX1uZKWrTipsTHbilDXcuEv7ZmBp7DfEQW1TF74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oyPu4JEwWGoRF+vgDlN7aAFp7hhloZGxFghgJNGJo01it1ebOCESEgaFzEfgUyfc03S/LzXua1+ljsOaps0vLQCubPpW4ScwkkwEgqDOmuwF/OMNIbGnVVMmxbHLdto3h1WD6e8S6cHPWUZFbitfagMqjMxeUf86mKBsv2liPG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNRtNt2S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNRtNt2S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3301F000E9;
	Wed,  2 Sep 2026 10:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344246;
	bh=ARSj6gM0JXBX78XhPk+c+5I3mJVqUQHjlBmGj3y6XOs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PNRtNt2Sq3YSmBfKT7HBceJMHeNDE/s2xJS5LjQqH4HNsTSKWX+TrYVQt21/A/lxU
	 ICMui56jqEuyd3623kK3oqeFbzQ7L1N7zpAqAiKoQDYQSi3vtrDi6bgBnoOrUEg0/b
	 5TMXaG2zJohr6jhIlOgqU1i2IbSBfCyu+C7YmCSCzwXfvWogKmQIqFoyeA+z+QvsLq
	 tj99v2b/NRdT1pvhbaPLcBYtLD01+dL9CestLSqjUQBEQReEKHzZgaAuPjtEogQdyA
	 d2+VAvXMu6K0u/VCbw/ZPhtEsqidpupxovbUv1agp6nM6oOImzGX9n68Op1ix8zxCz
	 pR0VOGTON/wPA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 02 Sep 2026 12:17:38 +0200
Subject: [PATCH 2/8] arm64: tegra: Clean up AHUB on Tegra132
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-tegra-ahub-dt-cleanup-v1-2-028f3c5e72f6@nvidia.com>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
In-Reply-To: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2411; i=treding@nvidia.com;
 h=from:subject:message-id; bh=xa5Fo3iMsEIKGVGw/Pg80JVWUf6K1Niu6e7SNFgp5v4=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBql/fGKuS57cc/ImUqHapohuaepkVp9QWzHbzf0
 Ug1Zy5TT6uJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapf3xgAKCRDdI6zXfz6z
 oam8D/0eQQgbPL7cAfJ3dSIFSY62t7R/2xr8TrwBQtOkgQFWIGmgFVrw9fWDpi40MFFpw9Qb12N
 DM5JwJdCmUCZkzKSciq0XHEFPByHYl/QHCGOwKnoVMhQoWFQSj5qdu8sMtX/5Rw34QkPqwaHagO
 on/ttHqU34R4KJO2R88ptnRm8CJOHQVi3t0PhhrAvnlzKKoWDdSmvXV+LaLnsAePzTFwjNl0xkI
 3pyKjoDH6BP7e/6ya48jB2DogVaj/+TGSmVydUDWKlh5qu/dLUkCaRMwWaudOUrjHJS9e1x7ekl
 blHcY7fyM9bgLEAQWrULnDt1s3TRHCz6KNTUcqDcnMfaOslV4/Zq9imHy7AHIj0cClOP56j82gj
 U8rxQ7cU5kmlo/6We0XHtzZAzTihX7PI7kDyBK4soHQLRcjEsh9RDP5fxcykKVsjaj8Mmm/56wD
 ohlXcjnjpGUPlHUUHiITm0bJnma8oFTkZaVmvwfzkK5PVVKCGaTszfYrgO4c9PXpMuRZqK6O47a
 NoGNxurhZEVCnU2xEnI/x7kKsWEKfUCbJOOxaAmfnsdHU4LlGV8iy+7tyLRmPZZr+u7sYDQf0f3
 wqnttChhXZIlvsuLgM0T0i9XjFKxPQNHNAWADlh1cilzxhIcv4VwvUfMwg8D5HjEMB/LcWHEIre
 kKah2X+AMxqCR0A==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Use #address-cells = <1> and #size-cells = <1> because we don't need
64-bit register addressing for this hardware. While at it, also adjust
the ranges property to encompass the entire AHUB range as per the TRM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 26cd11a8a4a1..3463fa637b37 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -936,13 +936,13 @@ ahub@70300000 {
 			    "rx3", "tx3", "rx4", "tx4", "rx5", "tx5",
 			    "rx6", "tx6", "rx7", "tx7", "rx8", "tx8",
 			    "rx9", "tx9";
-		ranges;
-		#address-cells = <2>;
-		#size-cells = <2>;
+		ranges = <0x70300000 0x0 0x70300000 0x10000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
 		tegra_i2s0: i2s@70301000 {
 			compatible = "nvidia,tegra124-i2s";
-			reg = <0x0 0x70301000 0x0 0x100>;
+			reg = <0x70301000 0x100>;
 			nvidia,ahub-cif-ids = <4 4>;
 			clocks = <&tegra_car TEGRA124_CLK_I2S0>;
 			clock-names = "i2s";
@@ -953,7 +953,7 @@ tegra_i2s0: i2s@70301000 {
 
 		tegra_i2s1: i2s@70301100 {
 			compatible = "nvidia,tegra124-i2s";
-			reg = <0x0 0x70301100 0x0 0x100>;
+			reg = <0x70301100 0x100>;
 			nvidia,ahub-cif-ids = <5 5>;
 			clocks = <&tegra_car TEGRA124_CLK_I2S1>;
 			clock-names = "i2s";
@@ -964,7 +964,7 @@ tegra_i2s1: i2s@70301100 {
 
 		tegra_i2s2: i2s@70301200 {
 			compatible = "nvidia,tegra124-i2s";
-			reg = <0x0 0x70301200 0x0 0x100>;
+			reg = <0x70301200 0x100>;
 			nvidia,ahub-cif-ids = <6 6>;
 			clocks = <&tegra_car TEGRA124_CLK_I2S2>;
 			clock-names = "i2s";
@@ -975,7 +975,7 @@ tegra_i2s2: i2s@70301200 {
 
 		tegra_i2s3: i2s@70301300 {
 			compatible = "nvidia,tegra124-i2s";
-			reg = <0x0 0x70301300 0x0 0x100>;
+			reg = <0x70301300 0x100>;
 			nvidia,ahub-cif-ids = <7 7>;
 			clocks = <&tegra_car TEGRA124_CLK_I2S3>;
 			clock-names = "i2s";
@@ -986,7 +986,7 @@ tegra_i2s3: i2s@70301300 {
 
 		tegra_i2s4: i2s@70301400 {
 			compatible = "nvidia,tegra124-i2s";
-			reg = <0x0 0x70301400 0x0 0x100>;
+			reg = <0x70301400 0x100>;
 			nvidia,ahub-cif-ids = <8 8>;
 			clocks = <&tegra_car TEGRA124_CLK_I2S4>;
 			clock-names = "i2s";

-- 
2.55.0

