Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09FE3594F;
	Thu, 10 Apr 2025 06:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267172; cv=none; b=q6keK1k3SX/1yXFutaAKPTVsjx17+AsdFFJ3SfQI0LfHoS3tSmKtRs9ypvdtWssTm5uWJJICtuJRPQs3jzr38uXHjF/bEHgR0BUXufjAbiWAezTnH8T3ROIcfCZkXamnJKTK+HTM/olMmTCz9wCbgHPAjL1zMCGvPd2jXIybCIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267172; c=relaxed/simple;
	bh=DeOBabiwzSpNzgmvHAIm3HCn1UjmvmUWeuTxwxUChvE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y4r1bG8y3qcfBLr37PJ/xEBqjhvAHtYrcgoQTHzLUoNoRdwJiFkXcqj2A391GgNWgfqEKjkhbOymIEVZFZaV5gmLt29NrddiG2V+P8x3HmyX/ZSbL3fQSmkHKFChoY1MEbd0EQTa/hkuVPmzf4PB4CFgtfmW8jpSEHP8QDq8G9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=KoGsfqOW; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="KoGsfqOW"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 80F6D1F902;
	Thu, 10 Apr 2025 08:39:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744267168;
	bh=A1hNPAkZxUqx56ldFx7Q1sUmsZ7riPmThTz12iJw8wk=; h=From:To:Subject;
	b=KoGsfqOWWZU/sFkHLpNPJ/Vary9VNh8R/IfzW+3c/GVmNfPA//jC7/YTZ+XpesCUs
	 sIGvmNvhR4WZWS6d4CUneamXteSyKv0ayvhiJ7SyW5y9pEzWCaOajjipYtEZaiK7iu
	 ofawD/cHCiK6fmMZy/cFJg0K0MVuN4d2T0m4UhNfMLxkFM1Ae9a747rKoqy6opj7wK
	 diKn1pqDWLEmvUl0jepL+bQORNRBmabrUuEaIqnX3QjznrCujCMcxgl7kK+Hr8nBww
	 X/RDcZdpvkUfsy1ibbcWoHWiFPvgRITwQGO6gz4iPHDvM4TAOz80uJkztbSPWTH8zy
	 YDOK95QvNkEMw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ARM: tegra: apalis-eval: remove pcie-switch node
Date: Thu, 10 Apr 2025 08:39:19 +0200
Message-Id: <20250410063919.11199-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The compatible "plx,pex8605" does not exist, there is no DT binding for
it and there was never a driver matching this compatible, remove it.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts      | 5 -----
 arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts | 5 -----
 arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts       | 5 -----
 arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts  | 5 -----
 4 files changed, 20 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts b/arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts
index 0f3debeb294b..1aa7265554d9 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts
@@ -84,11 +84,6 @@ i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
-		pcie-switch@58 {
-			compatible = "plx,pex8605";
-			reg = <0x58>;
-		};
-
 		/* M41T0M6 real time clock on carrier board */
 		rtc@68 {
 			compatible = "st,m41t0";
diff --git a/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts
index d13b8d25ca6a..23158bb82173 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts
@@ -85,11 +85,6 @@ i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
-		pcie-switch@58 {
-			compatible = "plx,pex8605";
-			reg = <0x58>;
-		};
-
 		/* M41T0M6 real time clock on carrier board */
 		rtc@68 {
 			compatible = "st,m41t0";
diff --git a/arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts b/arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts
index fc284155cd76..ccb9f29c5de3 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts
@@ -91,11 +91,6 @@ i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
-		pcie-switch@58 {
-			compatible = "plx,pex8605";
-			reg = <0x58>;
-		};
-
 		/* M41T0M6 real time clock on carrier board */
 		rtc@68 {
 			compatible = "st,m41t0";
diff --git a/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts b/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts
index 9d08e2b094b4..bc353324df43 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts
@@ -92,11 +92,6 @@ i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
-		pcie-switch@58 {
-			compatible = "plx,pex8605";
-			reg = <0x58>;
-		};
-
 		/* M41T0M6 real time clock on carrier board */
 		rtc@68 {
 			compatible = "st,m41t0";
-- 
2.39.5

