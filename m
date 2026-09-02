Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D720F438010;
	Wed,  2 Sep 2026 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344245; cv=none; b=AUgJTD6klAJ6rfJVdwFhOjwzZG8MtvYyTPGzjMxGv0j9n+9AXU6E/8nZ7woGW/NH2MOvRVsrzoHtNJdS9G4Uk7Lx8G1IzCkSbUy1Ngk7wNOVFMsxIZyXV2dyxNZGUTD5IxgqfcrCOzYrAgR5JdXQfhZQRhcK8+jhe5u7VfmclJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344245; c=relaxed/simple;
	bh=uXGoHVoCMVAvk/7IMrwWDqOKU6jWK4CSoPbCqiJ75Uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u77jzBuxWa9AeS+m8/bYenwjAi0EfEW5YN8gsiw0Mu9408xjo5cSUnQeiKORrwlVFqraNiney6GDooyt72qJjSPJEA6BVLb3AOsSOIHLxLWy9qSvRAdE9fOgMFsze5fl2s9Vok9E8kUFWYxJfpzqMjIN+26/CyIQG+iwzfb0jBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aey/hSzq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aey/hSzq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7601F000E9;
	Wed,  2 Sep 2026 10:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344243;
	bh=nycq3aRWVmMkJG98XrfmSjFlDVof1o+Pu6wjD3dM7JU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Aey/hSzq/zcodAEWtBmn3vlyJVIhne9U9azupruwV2/V09dZ1mC4shTvqKALCdsGW
	 V6tqNUzJvQZyLyAUmnyMsj7RuMNrfQJ/l61GY2PgP3sEu4uih77pTApkPAYeq4aqA0
	 LzZ9NwpPWRSN/k9q15zHPDFw7+UElgdl/TSfKt+pWIZJYbaMLz0jnfd/js3dEdY+Lk
	 yJqNFwIHSAP+R+5d9wcoxdikbVzn+0OIKHRppRRUDrbpkhzrUrPdsiiwzn/tyiaiVU
	 toFxnjFqfK84vskd9c7RmBo0//TlRMz7uKHU1OzXaE0MPgiQ+/MknnL4OlRrDfgba4
	 8SCKXMh3imTzA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 02 Sep 2026 12:17:37 +0200
Subject: [PATCH 1/8] ARM: tegra: Clean up AHUB on Tegra124
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-tegra-ahub-dt-cleanup-v1-1-028f3c5e72f6@nvidia.com>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
In-Reply-To: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2437; i=treding@nvidia.com;
 h=from:subject:message-id; bh=GwIyfv32VB2Odbu5JQ3LyQj4clsaBfk7P0iiNSXE28s=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBql/fGS9hE1d1FuvuhZa+Mr4l2n2ARx67nl5VBn
 0UKKSC5Xu2JAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapf3xgAKCRDdI6zXfz6z
 of9sD/0XcKmSdFGQmaVl7VUy4CqVUC+zkci5PshHWRG9hWCPluruecRrQZiYcqCCkgLZEbdhz0F
 DnJxeK9SLAZbUbKDx0jDrOt/fnIeUNkZL3b5qF2zpr/Hy2CSuKvRIbbCbPOZo5aWBZyZ7WAjabA
 r/aqyj8eTOgTpAxT04df7Tco7UZizJy/c9yBWzf16sOXEj4x2NysNGFKmqGTBBZWn4fLD+ACCG0
 M7ypZ7P8q0FZWK8bi2DogWwzIZ5WIre6GJqN8FT6a8D27Zy/vJPw49Hn49OjufXiboj7zqr9bEO
 EVSV21ZEC9jVkWK8eoezQN6SJ63EiHEt81Ayi5SDadzwwZq1zswXk6SKGRt/oVf7qNQsqGvrmFG
 FuB0YaaaQ0ab81jNvGSD7TJxs08A9ULTunQI76AN2zkZRqLLIapmkHHpi8/ouYQmgeMWYoB9cXU
 +48NHi9TEWOeV54giiISPqoVKaBE7qZYLb/umBXE9pDbWe8vRWoIyJ63YZjQMWZAakP+Ykp869V
 IrOkg93fBoNITzKUD9OeSpl77kMcKSWXtZgTAdP+zvdLnjr5HFflXUeYclG+hx53DwNgiy0Wnpd
 siyYIuhZ361kZVcUT0b0FC6mVYPC1IU9tUgUCjCE3LVX1d5Ls3yC0ytA39oLJNN9LDJ9U9PDzAg
 YfyRinuBH8iKFuQ==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Use #address-cells = <1> and #size-cells = <1> because we don't need
64-bit register addressing for this hardware. While at it, also adjust
the ranges property to encompass the entire AHUB range as per the TRM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra124.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra124.dtsi b/arch/arm/boot/dts/nvidia/tegra124.dtsi
index ce4efa1de509..7a71dba42dc0 100644
--- a/arch/arm/boot/dts/nvidia/tegra124.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124.dtsi
@@ -1114,13 +1114,13 @@ ahub@70300000 {
 			    "rx3", "tx3", "rx4", "tx4", "rx5", "tx5",
 			    "rx6", "tx6", "rx7", "tx7", "rx8", "tx8",
 			    "rx9", "tx9";
-		ranges;
-		#address-cells = <2>;
-		#size-cells = <2>;
+		ranges = <0x7030000 0x0 0x70300000 0x10000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
 		tegra_i2s0: i2s@70301000 {
 			compatible = "nvidia,tegra124-i2s";
-			reg = <0x0 0x70301000 0x0 0x100>;
+			reg = <0x70301000 0x100>;
 			nvidia,ahub-cif-ids = <4 4>;
 			clocks = <&tegra_car TEGRA124_CLK_I2S0>;
 			resets = <&tegra_car 30>;
@@ -1130,7 +1130,7 @@ tegra_i2s0: i2s@70301000 {
 
 		tegra_i2s1: i2s@70301100 {
 			compatible = "nvidia,tegra124-i2s";
-			reg = <0x0 0x70301100 0x0 0x100>;
+			reg = <0x70301100 0x100>;
 			nvidia,ahub-cif-ids = <5 5>;
 			clocks = <&tegra_car TEGRA124_CLK_I2S1>;
 			resets = <&tegra_car 11>;
@@ -1140,7 +1140,7 @@ tegra_i2s1: i2s@70301100 {
 
 		tegra_i2s2: i2s@70301200 {
 			compatible = "nvidia,tegra124-i2s";
-			reg = <0x0 0x70301200 0x0 0x100>;
+			reg = <0x70301200 0x100>;
 			nvidia,ahub-cif-ids = <6 6>;
 			clocks = <&tegra_car TEGRA124_CLK_I2S2>;
 			resets = <&tegra_car 18>;
@@ -1150,7 +1150,7 @@ tegra_i2s2: i2s@70301200 {
 
 		tegra_i2s3: i2s@70301300 {
 			compatible = "nvidia,tegra124-i2s";
-			reg = <0x0 0x70301300 0x0 0x100>;
+			reg = <0x70301300 0x100>;
 			nvidia,ahub-cif-ids = <7 7>;
 			clocks = <&tegra_car TEGRA124_CLK_I2S3>;
 			resets = <&tegra_car 101>;
@@ -1160,7 +1160,7 @@ tegra_i2s3: i2s@70301300 {
 
 		tegra_i2s4: i2s@70301400 {
 			compatible = "nvidia,tegra124-i2s";
-			reg = <0x0 0x70301400 0x0 0x100>;
+			reg = <0x70301400 0x100>;
 			nvidia,ahub-cif-ids = <8 8>;
 			clocks = <&tegra_car TEGRA124_CLK_I2S4>;
 			resets = <&tegra_car 102>;

-- 
2.55.0

