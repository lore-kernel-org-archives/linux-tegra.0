Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E0F275B08;
	Thu, 28 Aug 2025 05:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756359871; cv=none; b=k8KLbDla0kjAUJwxbhyXrkfE/tmS6xnUUsG3lbP2t+dox3rI6BcqXWgyeMdgn10ObUq9wER2Hhv4Q3gGTIWVFQ/AROglHF7dUfQPyUyNdmjPzkuJq4RJsFep640TDCsnukIpU7bqp32mMtvCFIOK+Y6PqI9zGZHKBCDMBN2riig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756359871; c=relaxed/simple;
	bh=bKMv08pYzfZNh3XAkHhywuKCW3GIoKRCHRWx9yc8PQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCgROIyAKjYsh7sU/EUbOXF6Lcohn4xQcZVRlyGFTRE81g17zelt0z6x5HKzShhUCcSP7vZzlavZ/WxNrtRxMjx8n2g5WVSMTsIqS2QX78euyKU2CGBaHoKRQrf2pJ0fXi9EmzNd38yWJiWBHixmF8/3aONk3U032J8lYJvTyAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/uH/6fh; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/uH/6fh"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61c22dceb25so802369a12.2;
        Wed, 27 Aug 2025 22:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756359868; x=1756964668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezkjvVnoTmWZ8Z/hdWLthloMFZUE/Ig6WMH5vWf3Y5U=;
        b=f/uH/6fhrys7jCTzk8DxVmoksUaUsnN75FkhmeizsRZhcdG3EciF/VmWAMSE9XHxXv
         aIe27y8p/PTas22K0Ns6LB9rbHK9ooyMmATjzfSdsTh9vQVyDyrzi++65Rry/eETBXtv
         FttXc7ocNz1rBSc4Prp1JoPS8oZ6+zHThLRQx7HoCjHxXaLsoMd2Uroyr5N14r+FqcCM
         IK4kAHsQpa7QvI/9MGPQi5CiOLD6GfTFe3qYmvVb1ettjiwozso2K+9mCsauV2xLEdt8
         4fEHKdqZ/nidWR7BWwL+PcGxvTIbz6t20/+cKgI42rH7ivdYjBf3b5e75q4vFm6YUZdo
         h+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756359868; x=1756964668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezkjvVnoTmWZ8Z/hdWLthloMFZUE/Ig6WMH5vWf3Y5U=;
        b=dmgnD1MiP1heqCBZFUssFHcGZrNV/NgMfdrr13hn0zr0wJRXyfITilUPIJrAoRvUCe
         2a7rcVTxRdi6CGmoWk6NCRL+mc0iINO+RWIIRn2QrJCvrw9CnLgIKD8pcik41AZZDWGo
         bV5WbUg2GfkUn51mNG4dJz8Nk8vF7n8uuRJEtJAISuE+G8xijzqVH6suF8D8eg1eQvxX
         6wqADDM2gDQP0OMnt4B+K2YI446w/j3CO3Rw1owyVAFTHuKMZsNmLrh88cCi8CopMrfW
         hfKO/U2JxrZa4AsuuvOjX5ggHfOySIsOkji6hBmPGpebxqST+dpXKzGsKI60UKOaJttV
         /rCg==
X-Forwarded-Encrypted: i=1; AJvYcCUmaNstFA6wsnZHP55+IuZ/biN+Aj3/WRP2BmgQKWj6+K94lbcdwLuhd1fAfiNMFOdw5sbWJoC7I7GiMDs=@vger.kernel.org, AJvYcCVQLEWku1fVv0ssba1oD6wd4A/aU3GKvRZfd+q4GMfzS5OqVKBcMbVi7A+yVNxzIuODO+jkedqc+QFwzeFF@vger.kernel.org, AJvYcCWjsszR3AREziwdkF4Dq7gzg9diu972NQG7mIFEVkvrxXlZ5AkGQNLO4R1HaHxok+DMPgLWITIbcw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsD4rNFxzKDcQve2l/DTI299GUE0AyO5riLrVDLFI4vVjpiKKS
	46sPkTmFPsJ9Nug1noQQKVi/fHKjC5W8A6vxoiKLLzzsFMzaGPO1OyV58IoSmA==
X-Gm-Gg: ASbGncu2GmRg8mA7mQZrPrwVjvZSpuuT8q3BOu3q8xlMShcrNy6HDBKSB0mYXRGtGJJ
	JMT85jah61dp552kKg4xa3ez9kTO2W0r7HO1Xt/S3MX9rq4sA5inUULy4jas01Z/fTmAchF9+XT
	F0YR83uzy1d/Cc/0KN0qtvUJgbqIy24TNpa8pVWsgPvYurf/j7KTKDl77e7G9xjdL/rvJCqEgjX
	QXeZL+IgtscggHFc3N1DRKNvla/h3pUmUnxpvDIz7WkSy8VZ12LCNzxUaI0M4wukEj5tIglnJFs
	ATzen4K0AlTJyqOHIc0UvbxDAYDp8iC9ra33i5ffFtSdZPxe+ewti/cEsIuSMfU9kG3JZrE5cdj
	x6vrFP2Mek1gZkGHIkAtTfIqk
X-Google-Smtp-Source: AGHT+IEQgRWTZ73WBDH00nDeYpZe45RNhcdmiyrv9seYxVjrxJnZcWKrIDMUaL7cLf9soQ14OPaFzg==
X-Received: by 2002:a05:6402:13d4:b0:61c:4436:a0eb with SMTP id 4fb4d7f45d1cf-61c4437049dmr15107600a12.26.1756359867769;
        Wed, 27 Aug 2025 22:44:27 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cbbdac051sm2102841a12.29.2025.08.27.22.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 22:44:27 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 4/4] ARM: tegra: Add DFLL clock support for Tegra114
Date: Thu, 28 Aug 2025 08:44:03 +0300
Message-ID: <20250828054403.7112-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250828054403.7112-1-clamor95@gmail.com>
References: <20250828054403.7112-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DFLL clock node to common Tegra114 device tree along with clocks
property to cpu node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 4caf2073c556..c429478eb122 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/memory/tegra114-mc.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/tegra114-car.h>
 #include <dt-bindings/soc/tegra-pmc.h>
 
 / {
@@ -693,6 +694,29 @@ mipi: mipi@700e3000 {
 		#nvidia,mipi-calibrate-cells = <1>;
 	};
 
+	dfll: clock@70110000 {
+		compatible = "nvidia,tegra114-dfll";
+		reg = <0x70110000 0x100>, /* DFLL control */
+		      <0x70110000 0x100>, /* I2C output control */
+		      <0x70110100 0x100>, /* Integrated I2C controller */
+		      <0x70110200 0x100>; /* Look-up table RAM */
+		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA114_CLK_DFLL_SOC>,
+			 <&tegra_car TEGRA114_CLK_DFLL_REF>,
+			 <&tegra_car TEGRA114_CLK_I2C5>;
+		clock-names = "soc", "ref", "i2c";
+		resets = <&tegra_car TEGRA114_RST_DFLL_DVCO>;
+		reset-names = "dvco";
+		#clock-cells = <0>;
+		clock-output-names = "dfllCPU_out";
+		nvidia,droop-ctrl = <0x00000f00>;
+		nvidia,force-mode = <1>;
+		nvidia,cf = <10>;
+		nvidia,ci = <0>;
+		nvidia,cg = <2>;
+		status = "disabled";
+	};
+
 	mmc@78000000 {
 		compatible = "nvidia,tegra114-sdhci";
 		reg = <0x78000000 0x200>;
@@ -824,6 +848,15 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0>;
+
+			clocks = <&tegra_car TEGRA114_CLK_CCLK_G>,
+				 <&tegra_car TEGRA114_CLK_CCLK_LP>,
+				 <&tegra_car TEGRA114_CLK_PLL_X>,
+				 <&tegra_car TEGRA114_CLK_PLL_P>,
+				 <&dfll>;
+			clock-names = "cpu_g", "cpu_lp", "pll_x", "pll_p", "dfll";
+			/* FIXME: what's the actual transition time? */
+			clock-latency = <300000>;
 		};
 
 		cpu1: cpu@1 {
-- 
2.48.1

