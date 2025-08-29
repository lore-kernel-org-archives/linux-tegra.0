Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96FA317715;
	Fri, 29 Aug 2025 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756470185; cv=none; b=TLf08DU2wNNvIpq1lH9DwxIMaUYzhuayI9vr4YIZ4Q/FbXufiexfsj2DyMdS/WG/sNlGT3i2TEg0I39CLlccE+I7BXyg2Z/D5GIhbriJ4pEyg52HsSVpkYR7INbqnZeiXxlkbbi2GgmkIhONEU3Wx7nY5RklrBtYzVF7xyFktUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756470185; c=relaxed/simple;
	bh=MXUu9QPmMd3rT7yOj7o+ms6cmx2K03QYdIn0E/ZLtF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwNrE/giFPdLBUxMepXyXRf2mooG8eapBnNrZgaFBbCZ7RRh3VEwsLha2vDbeMU0KqGZolU7+xFX+R21yClwjL53r4M2AbLzlM99zVNeQwNDkzYGKlkUymNezK+RX0f0fbjsdInt32mVZd5ryL3AKXTqnGxSqXtlt9/W+9c1qyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5WpQMN7; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5WpQMN7"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afe9358fe77so257325566b.1;
        Fri, 29 Aug 2025 05:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756470182; x=1757074982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QV/43b5wZcr7oH1WYrVSWi9FWU3xmsqmK7c9FuV3Om4=;
        b=H5WpQMN7V8d4tzjyimoWHoqELUiaBaEjES+VoiPogF/yRdSBjPtgmDZWNGGxXbJhj5
         Ti72+CPKskT2fmQMePMG+J4FYhij5sWJPiFURaJ1AvXCFclOVSn7HDEPqpHqFimKBzJd
         uWeFldfBLjk/1RYAR5f5yD7PxHjk61ZBRPfgyYFzCLzV06JYkpjNbugMeDqfp8rDvIEH
         9m7a/uUR6wK7kwL2GPYqyz/GLPIpWF3tdBWYQZlsDzwV/OEW9TeWEUfxK0NbnSruDPrl
         jdiG7yqw9jlS7jFYDM7XsSvI/GxW2hrF4/1C8P0aMPwr/PYRX4J/Wioqwaxz1evsPYmY
         ACeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756470182; x=1757074982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QV/43b5wZcr7oH1WYrVSWi9FWU3xmsqmK7c9FuV3Om4=;
        b=GPaOkied5dZ9ju8LZUmZQPNdXZ10RRfwrlqBjD8CSMHE5WoDMVygWE6oqfSiRP4gL4
         oA2nE7ZjXIDwga9VSaCuy8WC4mNn0l6oKjhhW0IHIROUqUWyHQ2RPJW14IBcCpvhx5u/
         wk/w8pTl1Tnrx/R8KRLm7U9GiGPUEY8blwNJV28zVlnpIiq/CjnRVhzcN/PmP8gf7qha
         bXbfvNlrjzirBGZ+gU0TlP3yU7A6t1p+dhx8LHRaZG9GIIDOB0jn6KGiaLPlmR0/lcDg
         PLwafaOPn56ypP4BGj11fis6hIq0IoEymM1e9FOsEkLujodi7Tft+mRYQlKJL2vRpiHl
         gQFA==
X-Forwarded-Encrypted: i=1; AJvYcCXDCiALGy6vNYO4aGBSPOnminD0O1diZEZd4KGxR4w8SdVIileJ7/KO5n+y6Z0UTPUU4EMVmmrcCJExSVQz@vger.kernel.org, AJvYcCXEYWuCZnZOLKtulOfxq0x/di3YwC4LNzxXxBrS5BfD2peEhDLPvmbVngB8hhH1SVJm4VeZrFTnBec=@vger.kernel.org, AJvYcCXdw78i9dqWmwYxBQKZM8G8D/oPVghB4nNycVotoHjj59rrnHagZa7JOGb+qci9snOrc6hxhvU8zLGHOp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIMqYUVgtjAoYW7sGYXYOthjC+0heoE5RHeiEV6ZziOvkRw+Ya
	5MLZuT11318wjSPLliEzSVIV6T5FZaZJqBLz5Sdkknzl9RCT9J3QWuJA
X-Gm-Gg: ASbGncuKylG5OuNCOc7AyCpsP4IEwimMUdyFtKNf1P8QQPaQfrQSdZcVJq5SNQIKIKz
	Rd/DikTAQYO5jotGMaF9whMgGuBYUEU9A6x4N47gxk7VzD1+4zZmexbIj+E/mJuABhp0FmzQtd7
	Iaa5qZTVaFQqlJRh6Fz1LaImXUlWmNYCPwJUh87EGX67nCiIzXo/jR2QQ7oH5cduC8O/9saTVZ7
	YrBlDuiJzr3xYW2xMBKHuJwakd2ensFTC9XwnzZkcUpgpdk2wYYPQdJ9ntBzlhO6Z6khxdGk5B9
	r8qNSaI0N6xYSokOyWiI8Hsi9rsvXDUOINUE+L7EuIgZeBeXHcO8aeUPMUPQDtKXgzMpKvApxcW
	AUc64cbYZCyjtCaj+yhZtBTPo
X-Google-Smtp-Source: AGHT+IGvpJb6E7O7Cx1ORoFMxIhbdRAYFHmg2T22N2yoFC3HZ0zze+lDuibNTZqMBpYt2X2E/gXPrQ==
X-Received: by 2002:a17:907:2d2c:b0:ad8:a935:b905 with SMTP id a640c23a62f3a-afe29031d11mr2364154966b.22.1756470181806;
        Fri, 29 Aug 2025 05:23:01 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcbd7047sm188662166b.51.2025.08.29.05.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 05:23:01 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 4/4] ARM: tegra: Add DFLL clock support for Tegra114
Date: Fri, 29 Aug 2025 15:22:34 +0300
Message-ID: <20250829122235.119745-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250829122235.119745-1-clamor95@gmail.com>
References: <20250829122235.119745-1-clamor95@gmail.com>
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
index 4caf2073c556..a2a50f959927 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/memory/tegra114-mc.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/nvidia,tegra114-car.h>
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

