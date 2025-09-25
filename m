Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95903313E12
	for <linux-tegra@vger.kernel.org>; Thu, 25 Sep 2025 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813473; cv=none; b=lZwfHi/DxNzfW4Xzrb7vXmZXQimDElbvPkGZpcX7B0OZuYGrRDt1zn/cxz/YRyCLxrMyql1v+Wry4OMsakDlZn3qendGXyOUVD9XqFtqhxc2Bff2PthjWh+JfOYQxxaZQMR4iRaRR7QZjY/e0cDqh8tEO9QIAg5xqGhgTlZAFC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813473; c=relaxed/simple;
	bh=iiHfTmqTpfmKU38rkhczSgtC8/xhyV+ts8JmJCC3QqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ki3QmlCTFkUOJxQBJeC/WtlKb/Tw63ydp2EuK2+gYO0hl1g2dCYn3m7vMhhzF4O+n5M8qSe7EK/4cBe7gbK2kySGlnwB1yv6xqvJq8kiLURbmLIfqtpqiDsRHVa4rkkA2GyEzeHttKuyhdL6SeiCSwgO+sfpv/wJvAbwM+ZqS28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HS+8Us55; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HS+8Us55"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-579d7104c37so1453481e87.3
        for <linux-tegra@vger.kernel.org>; Thu, 25 Sep 2025 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813468; x=1759418268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
        b=HS+8Us55YUrl1SpKCLgXLcg4nv83bV1Un1pNSEJd5981Ifvski/CNWikYAHWDua7WM
         XA60yIae3ORvMM3xXL+SI07nmqt/RO/jKWZZ8RRhXRRu3qrXEVvnSWiiuOyV8jTeX86z
         84CHMk/EIQNupoaklXuqxkw+dpmxhKjMDARl0Y9zItX1Ib4FgbD2X+OrejzrPbrVXxQn
         Xgdy81l0UcdpQNBwFyCepB2F0EoLfcZYGaePYdMLkQA46bYX9KxSxdG54hQrKcy0Sz55
         oBooCuHg4bcjkYXjEQrenkg+me11NLw0FNc4Fw1qoDdoA6a4UG+20vxxhWn1rhSHvnmC
         4LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813468; x=1759418268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
        b=D+WSMmFO7v+M6fSZ7/yvfqlWjmi5nBAoZex5DzR/ftSSdsjuA/AwNk9hUY9dOWcNtW
         7IhdXhgCAw/5l9AY8uWfpu3I2mxcyjZX6QKRi0/WOrcXcpJzz4TeK2xD360POC18QjHB
         LiIZ6gQuQ5wEao6l6mFaRaQCHZQPK8YlZT8TesnDHid+qO973V7vr/cCtQwzNzXeqIaZ
         iXgpvCH0708T22Aa4K7t31ZZvb30tFpx2c3/qG6n3y8VRTThQ/9H1Ounv9vWmvDxu4tZ
         Kh6tDIwuiH7zbcpiEA2TcUYHfTggQDPvU/7URtHsZSCwYYO5B00UJKM5TgYVFIBBxoHh
         TXGA==
X-Forwarded-Encrypted: i=1; AJvYcCXaDMSBHPLdHCYcwupA5em3CZvLjrrX1+NYBZ3pLOePXDSzAh0qi4RddQSahI7R8eiQruGoOUCPWGPy0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO3CClrAajmTkI2WN/IYHyhrXm5j5M/DpnJ0U+KNlBZ+S1UPrA
	3hxvouHU72U39PxyQ9xI/jkmYrluBx0Euuhf+vVRt9Z2tuM47Et0pdbN
X-Gm-Gg: ASbGnctXPfFj4Fe479nZDI+QSDTmVmRPocq7L+vWrDvT8ZqKpcszoOfHuYefj/phY/r
	+di0vuqJKhkF8QbB+KrI7xloNHe0lpqdd1c69mVE7eOZ344BQu7wKHUbLIfOIHpv8REmotzQ2Nu
	9oqvXupiPj8ahYTqsOZQsxr8dl9ITdHTy4Eb+ausyjX/69tWyifpnZyqpCk4DpfiBYEebJ3SIHD
	PonlVzHEjX3AfNQX/DU347CnIAN7Nlk2biPoqKoXUAEVA23MZML5RF4aAnoyHzAcSUQp1Gy0QfW
	+n8oaOBX9Ql4eEOKLsacydBfOe9tesf/6llWtPlkp4crNkalXxMseaA2MYSniDYTb6eG5HbOvhU
	1lbrxh1G8h2cetw==
X-Google-Smtp-Source: AGHT+IEgIvTgxxL5WIN2ZRYvGEcMitZUM+cSp6l2oZhWq93Lx+b6iM39RU57IOUk08HihxonasaaBg==
X-Received: by 2002:a05:6512:6193:b0:577:35c5:9a41 with SMTP id 2adb3069b0e04-582d3ba0826mr1107436e87.53.1758813468072;
        Thu, 25 Sep 2025 08:17:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 21/22] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
Date: Thu, 25 Sep 2025 18:16:47 +0300
Message-ID: <20250925151648.79510-22-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CSI node to Tegra20 and Tegra30 device trees.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 19 ++++++++++++++++++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 24 ++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 6ae07b316c8a..5cdbf1246cf8 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -64,7 +64,7 @@ mpe@54040000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra20-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -72,6 +72,23 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi: csi@800 {
+				compatible = "nvidia,tegra20-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA20_CLK_CSI>;
+				power-domains = <&pd_venc>;
+				#nvidia,mipi-calibrate-cells = <1>;
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 20b3248d4d2f..be752a245a55 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,8 +150,8 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi";
-			reg = <0x54080000 0x00040000>;
+			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -162,6 +162,26 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi: csi@800 {
+				compatible = "nvidia,tegra30-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA30_CLK_CSI>,
+					 <&tegra_car TEGRA30_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA30_CLK_CSIB_PAD>;
+				clock-names = "csi", "csia-pad", "csib-pad";
+				power-domains = <&pd_venc>;
+				#nvidia,mipi-calibrate-cells = <1>;
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.48.1

