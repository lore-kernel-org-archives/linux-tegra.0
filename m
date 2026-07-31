Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00C340F744
	for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 11:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498094; cv=none; b=L18fUQqTOfbr7gNpTUYtPrJfFcvgYrdgJGWncHozEKnD+/Cj2e17yUBWOXAr3fl92uDbl1FilLMvQStooO60gYQ12c3T6lqbuo8rz656l4MEgCHL5YxmLhyOTPJ5eZsFQJhImRoPCTDFZJhL8Gwi0O1AnJ4ej32ULo7Nr0qBFlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498094; c=relaxed/simple;
	bh=1ptPF6D3l4ogZ55JYiMe1y/Z2KW1D3T2ZUgXVDQfEPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oD9UlJza8XRUAdmFL/JDpBBUtVLtIoe3gFP+Hoplvj5qNXyAVknH2/2np1vDp0xsHZjtvWpAcsM8i8zKech1TAMRqx4bUduO5PNqw22cS0xwsO8qEU9MUamH9kOGK3+xmNn/89BFOKIU46CnLNIf1iVZabcvgOEH+MBGrM9JLJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U14L8HNJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U14L8HNJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-472326ca506so615058f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 04:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498091; x=1786102891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8g4yw5HQR3HalmnujLpu+cNj6OL09Yny/eMKy5zvLbE=;
        b=U14L8HNJE+Cyx/f5cPyjl1IStIEn7L23PKm8clK2lr1WwkfzIHgCswmWywCDk7CfAv
         B/xGwXYO4ucVpszF5zbb0oxRUEa+DMJzUU/n47lCexxL+940t5Lmc0ZXBDG7Eb15NuPI
         lkjCkpyd9IH/kvwGTGrphKECCBXhES74QtZH80GvYlbMxzYAZBt0M2v7x9OqSj1gt6dS
         xp1eO/HUT3oXtUZwg/zNHhU9o+PvTAkXJn/YjUMFZoZCz0uiHME5NN/NaVdFxMoAsEfX
         AMdv3DY+C2+L7FHYGhXC/gHbSF8+u/T8x0SW40AeEmggT9C4+mAAha9Nu6xUnAR2EN5b
         RHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498091; x=1786102891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8g4yw5HQR3HalmnujLpu+cNj6OL09Yny/eMKy5zvLbE=;
        b=eiMLbpeVQCaPLj4o3NSzwLNgRTHeCvPksRSQ23Bpkk3C6BZjTVTWG4zA2kWQ/KuPDJ
         5BIsXgTJhOGWt6FLjm5GlJECmW4O4DMKUZvRvsW6LsY1JxzL4XdYDXtWmVyKgehVQmAx
         IEiy0wY3Fp5WRMxIY9vXyzYN5fVMlMmA4vAoPCaIXZcVK9CVotTsrsoPLgFDKSIn8u54
         v/M843bnO53JkkFkxuPdZSV6fc1QselqrIxbPHhZ5Pk9J4ud6hZc7eDPQoImtf7uHYJm
         oKRH+7hVuzv6XMJsDcli3Fukvc0rpQXIphVMj8Sxy0gNSRB0f4sjZKcwMUr/oOY7wgTr
         h0aQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGzLEk1OxKQaytMwEppVNSUWuHg+HErJnKwBUkrK+PnNpZUm/+yfsAAmUasvzBctLpXf4cYqjrT9ZNpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Z0ZRWXmNx+6UX3qpmBblXL+JWIgqQQXw0pr+SSuXPpjFsE62
	13byECK/0AxohnFjSdlYD/odiGKbDSAjf7i1o+5NRW952qxHWkWKmtKf
X-Gm-Gg: AR+sD10YEFjyOpcYWJPwetYaEoXgGRNsnWXOVSEWL8vHs1zoWAJ+PihExxbDpL14wrs
	4Ry5t556uno76F1lTezcTcZqOq+/7PnDxKJQVL2HJyM9vLycPgCNyMpOt/CaD521IjzIWb4YzLQ
	2tQpjmn9yg85adVs7dPO0EV5v0XxLQyEREpBTGENTLC2zjLB5LDWOQVmsJzNjVXsEMOTgQ6JnCl
	3Oaw5/5evJawTfYpuWK2KzIu8O4+kbsSNlsfDtvLFTQyqz1D0973LKPBIfkkFUoRBMKOyvuEmx7
	WJwa7zp1+lM0INa4aS2Mvp0ADocJzK4+NB9toIpx/na0mBdCn2EsvsXqXioBcBATiEBUwNHd50s
	6jghjuSMHoHDRJPScG8MANTPNpfqV98uJPJ2v7pnpgGQf5FJGgU1GMuQZZvlRnzJH7z4y2ABv/g
	u9ldI7yaZ2ZiolqQ6wFTkhSZ0G1xq5IowaNeA9dKlUoQhePhfORIf+HrajkRsKm6S+C4Nnt6MaX
	XMI98AO+w==
X-Received: by 2002:a05:6000:38d:b0:47f:90a4:ff42 with SMTP id ffacd0b85a97d-47fd2ab7ae6mr4125371f8f.5.1785498090889;
        Fri, 31 Jul 2026 04:41:30 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/10] ARM: tegra: tf701t: Tune MMC devices
Date: Fri, 31 Jul 2026 14:41:02 +0300
Message-ID: <20260731114106.169398-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SDR104 mode to WiFi SDIO and uSD device nodes, remove mmc-ddr-1_8v
which is eMMC specific and improve their power sequences. The uSD card
refuses to work reliably with fixed regulator and 1.8V IO supply. Adjust
configuration to mimic setup proposed by the vendor in the downstream
kernel. Add HS200 mode support to the eMMC sdmmc device node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 35 +++++++------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 83f8dd84d28a2..3de5c84d5f009 100644
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
@@ -2372,9 +2372,7 @@ mmc@78000000 {
 		non-removable;
 
 		sd-uhs-ddr50;
-		mmc-ddr-1_8v;
-
-		power-gpios = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HIGH>;
+		sd-uhs-sdr104;
 
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
+		sd-uhs-ddr50;
+		sd-uhs-sdr104;
 
 		nvidia,default-tap = <0x3>;
 		nvidia,default-trim = <0x3>;
 
-		vmmc-supply = <&vdd_2v9_usd>;
+		vmmc-supply = <&vcore_emmc>;
 		vqmmc-supply = <&vddio_usd>;
 	};
 
@@ -2414,6 +2416,7 @@ mmc@78000600 {
 
 		non-removable;
 		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
 
 		vmmc-supply = <&vcore_emmc>;
 		vqmmc-supply = <&vdd_1v8_vio>;
@@ -2608,17 +2611,6 @@ hdmi_5v0_sys: regulator-hdmi {
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
@@ -2655,7 +2647,6 @@ vdd_3v3_com: regulator-com {
 		regulator-name = "vdd_3v3_com";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
 		regulator-boot-on;
 		gpio = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-- 
2.53.0

