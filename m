Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ECA3DD500
	for <linux-tegra@vger.kernel.org>; Thu,  4 Jun 2026 06:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556186; cv=none; b=i37iza8wwA4BJrqJMG9dvUrilNPNHwQ01fCyrMP6ODrphyVK3ce56VQSXyzVo68KK245jBoAaHuMavZ63DItiTrBVITnmuzi/LfhYQ3vrq8ngUaKXNLSRBad+1qegxHKVlqnVhJTBtvsISpNarna5C8XFhCgYnMl+MuG6c4FUNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556186; c=relaxed/simple;
	bh=74c2+EdyIjHTyeZ+NFsgiYzpE1mENWj5YYqu9FDW5XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Njt+CoQfVpQmR0m5Y31n3gbx1xin5AKNFf8imt4R2tWLfuAXGWeQIdR/LRHIg9rlNLi/gEeqG2HLCN5YLjQZdBnSgolqjnGYzU/mkbZ9AFclP/1rL38Xesmf6MmM/7HAWKkM7rLDhfkmcp2Kw6olehecypAYbjGA/PZt4mCZKKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq53YfVp; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq53YfVp"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bec405a6ea5so44252866b.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2026 23:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556181; x=1781160981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhqotlkyoOnYDxs8tXDl3w5aFlnumJhN/b8jC9ZAfX8=;
        b=Aq53YfVpdGSA2APa75UF6SCoG64kV34B4LTI3ULqx99eKf4///AJeXlIK7iHjYV56v
         zJ8pRbS540eDENGWW/TsyT4iIvGQW/OXgT2sfU/uPg45eEtQix7jgkGDy7cMUVmkDFyg
         CpkhWgJphVlJjZo8Ic+osHGLNAsCo0DWJenFEf9FK2ZqM6dkp0K5Ag8Ml9Z4vQrwwLBt
         Gtsgndu/5hJp7oVTshlbzxbLe/2N5JMPbS/+n5DGWJQRKkp39+u91BGANbJJGH0rJMCZ
         Hf9UPYOuTdZ6M4YgXufb5JuIytBMiqQD8xvqrvzwJz2Og8hvAHTXmuIfKilnBVqbRA/P
         apJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556181; x=1781160981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lhqotlkyoOnYDxs8tXDl3w5aFlnumJhN/b8jC9ZAfX8=;
        b=hNLIHhFs3M0BucCJrRowwtop9QSCeKeUJEW1mvAMUY96WoObpR7QeBdndw8yt5zOV1
         7UAjx779aAyVU/J+5K8HYMzb1p1fJvCnkBKkCynea8dGszWCiv5YjVbd4rnDTWA3Kq0T
         rIhyQz3I++hVgHd4dWQ6BiSF6nE4DYKauFObJpCoVjxIoyOtSF2t3e9riQAm4IHljkok
         bqV4SB5hc7tW5ki7/87Bu9QogbEQmpbbnHfzIp3IvGGLKSJ7OjjdDUGSF+ziKnGa7ubN
         ypq/6XmiP9rscWQq3Bwr58UYWBTH5rNYx/JBITzikrgU3H4aMlQyMqU0sE8D9fwqydSA
         Yrkw==
X-Forwarded-Encrypted: i=1; AFNElJ9mrAWs4UyWJXmHAq3NGG/KYMj10HeQ7+9mHSJuHp6yK8zC2b9SPZUXw92hM7uGLlTGS3fHPFnX1eC+9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcAaRHz7YxTDA/mLyJeyONoy9ILOb/UFMreIaG1qQ22IS0lZEC
	ejVgX1INhrDfn6NvJWb9cXs6u9nltyJwPyV5Sxfuqhp1AaK4YEk/yCbZ
X-Gm-Gg: Acq92OHXaR4djQVdtt0g+0kkywJpEE9JDX575ncnV8TD78YVajvug0fsxUQK8LgM5F9
	NZFBL7oO4ohvHT406YKOidNTfjzqUSyqoZ8hfTDGHQP2h0rOJTRqTrek3n3Q1StFtrwz9T7usoQ
	0AdqjpoA3tGfMoASF/xz2O3rcREENcnJgHxI4UizNvWKfLhJaZSSX/Kxe74uzehSd5eVVwckDbX
	G2HE1kIwpeIn5/AqHgusGHNJ/yHPHwoVtp57ZzBVBxwlR7kLo0ltBwAmdgPZ5g4tn9JenNCWVGw
	VzaLD17rCiEdHgPjvW1fzWJmnmk85MZzejltJG92HB9MKY4Jit4v1PQMV5/ZqaXbZJbHxoI8fYb
	4bbCumyfbQdf3tXumfZOGFllyQbJSIiOMadWwN1AfZII170PeEY6D01GIB8BpuqzXgnvUz1WYT3
	lbuDrtqakSpdiQf4/PuE7cMqs=
X-Received: by 2002:a17:907:7248:b0:bed:8f7e:d85b with SMTP id a640c23a62f3a-bf0af50a2b0mr329317566b.42.1780556181344;
        Wed, 03 Jun 2026 23:56:21 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/10] ARM: tegra: tf701t: Tune MMC devices
Date: Thu,  4 Jun 2026 09:55:52 +0300
Message-ID: <20260604065556.137614-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604065556.137614-1-clamor95@gmail.com>
References: <20260604065556.137614-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set WiFi sdmmc device to SDR104 and improve power sequence. Set uSD sdmmc
device to SDR104 and reconfigure its power supply. Set eMMC sdmmc device
to HS200.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 36 +++++++------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 3e2bc611e2f7..73276f2aa7fe 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1645,9 +1645,9 @@ ldo8 {
 
 					vddio_usd: ldo9 {
 						regulator-name = "vddio_usd";
-						/* min voltage of 1.8v is not stable */
-						regulator-min-microvolt = <2900000>;
+						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <2900000>;
+						regulator-boot-on;
 					};
 
 					avdd_hdmi: ldoln {
@@ -2350,9 +2350,9 @@ brcm_wifi_pwrseq: pwrseq-wifi {
 		clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
 		clock-names = "ext_clock";
 
-		reset-gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
-		post-power-on-delay-ms = <300>;
-		power-off-delay-us = <300>;
+		reset-gpios = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <100>;
 	};
 
 	/* WiFi */
@@ -2371,11 +2371,9 @@ mmc@78000000 {
 		bus-width = <4>;
 		non-removable;
 
-		sd-uhs-ddr50;
+		sd-uhs-sdr104;
 		mmc-ddr-1_8v;
 
-		power-gpios = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HIGH>;
-
 		nvidia,default-tap = <0x2>;
 		nvidia,default-trim = <0x2>;
 
@@ -2396,14 +2394,18 @@ wifi@1 {
 	/* MicroSD card */
 	mmc@78000400 {
 		status = "okay";
-
 		bus-width = <4>;
+
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+		power-gpios = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+
+		sd-uhs-sdr104;
+		mmc-ddr-1_8v;
 
 		nvidia,default-tap = <0x3>;
 		nvidia,default-trim = <0x3>;
 
-		vmmc-supply = <&vdd_2v9_usd>;
+		vmmc-supply = <&vcore_emmc>;
 		vqmmc-supply = <&vddio_usd>;
 	};
 
@@ -2413,7 +2415,7 @@ mmc@78000600 {
 		bus-width = <8>;
 
 		non-removable;
-		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
 
 		vmmc-supply = <&vcore_emmc>;
 		vqmmc-supply = <&vdd_1v8_vio>;
@@ -2614,17 +2616,6 @@ hdmi_5v0_sys: regulator-hdmi {
 		vin-supply = <&vdd_smps10_out2>;
 	};
 
-	vdd_2v9_usd: regulator-vdd-usd {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_sd_slot";
-		regulator-min-microvolt = <2900000>;
-		regulator-max-microvolt = <2900000>;
-		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vcore_emmc>;
-	};
-
 	vdd_1v8_cam: regulator-cam-vio {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v8_cam";
@@ -2661,7 +2652,6 @@ vdd_3v3_com: regulator-com {
 		regulator-name = "vdd_3v3_com";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
 		regulator-boot-on;
 		gpio = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-- 
2.53.0

