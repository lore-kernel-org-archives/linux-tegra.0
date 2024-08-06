Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5D21C8228;
	Tue,  6 Aug 2024 12:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722947981; cv=none; b=U15mPSmNH9IoKfzb3zkE8EbEceUv3lePVVkobpnjSbrpZCBIXuvBRNG8YQsiioE6PKcnraOvF16fnbjji/waO0qkTGcUiji7j9BP9uh+pV+7nbip4FOBJ6jj8AJJ9XCP+LZwU5EfgOS2NGEXcOiqfiKfjadcwU6Jibt0J7nqBPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722947981; c=relaxed/simple;
	bh=QzElBNuj1J8hJv9PDx8DoYO0GVDznjYrxqtE1dbgYko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLVTYrop82hP84av6GQhWPASXPTIO73W+G2E7RMALq0TjdiWEb3yBdYDrIEkZAbzjT105JTCbIWt1ASD6ajjlZXKa5nBbNJSJBnpQ8WAh3nF/oGYl/SGw9bwDvZA9PS5M8MVNpl0qqgqIDLmHExNTeNYl8Z7B5VS9rEohfXZgcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkzs/U0q; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkzs/U0q"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso5770001fa.1;
        Tue, 06 Aug 2024 05:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722947977; x=1723552777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwWVwEo5Wg0A+BqBi7xOEQ6wmwPi2hgeCgjQEqA9Ros=;
        b=hkzs/U0q7drFMRw4FxByXK9gqfamIACopIOwfOC3C8f8HGYpFd3FFf/1RazlKhfl6t
         4Jpmj8ImZHEJuQhnqA75CnymjRS2SU4yJ48XwhHej1k0pt/82ctwz/2LhIcvEf9oWooM
         ZVRb7agtPfWjXPZHcPGb2gIGTtqYoI7p9x7r35bs79ZdAZPXn/g/G+8C1RpjRu6RwKEE
         Dk8HykhIJpBFf3D7fiY7o+PNOdb8mqkx7VDMpknx4bTZrNhXkKIhirWzoYxyATCKK0lL
         392cRcJDi3ZldZ/70jmtZM4i87PaByrv29ehIK3DGOBy2+bEWGsoUeOP2NXmcRYuCDQd
         Iy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722947977; x=1723552777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwWVwEo5Wg0A+BqBi7xOEQ6wmwPi2hgeCgjQEqA9Ros=;
        b=WzG1gp5/0nyNMIC+yFcAP5aWsPphiFIqUVjO17/fuc4ZVnyqNrcqUkEjqMZx01rFG1
         4Elnk2UqTXneDPOpV2ek8Itg0kg8PFMWEOU/VdjFpJDnlBPSHFqTE65k6TwXIBa5xQrk
         53mnodUpJkj4tpdxe6aJlysGRRv6yYhhTRHpL/2oYV/eM8xXO/fvH+kPauHDqr6KZgTT
         lyJEGGF/Nb2MgTJp7D7jnd4TUMxLy8AEeBLWRAEq/fiMeYSnNQSjBB78MoZjrtxfET2K
         PJYDRVXQOYjnZdToy2lJNj9n8BjD5uh8tlAxYXP21Ha2o9ErJNlVwCSXQ1F2aJfGFmcJ
         1bQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv0qpyIqn+vkxnbR5pCqtqv0X+e1ssKBFHz5H2BFxzUM14eL48jF51528oZIFiLyFU6bkd0NExvS5kGblIRShZrqmjOuzsNx6eHYcnGxBPJkZh7IrNSXFsCEjR5PASeCI2LoN4PilQw3I=
X-Gm-Message-State: AOJu0YwOZjPbTjGCyoFjrTD02Zo+Z0+83DPOWlRSIfm5kshqFeluxALY
	g1utWcrg24k4/W1LRbcGzP4PuDLSsPNIRxKtKwHuNGLYRIE8DY/x
X-Google-Smtp-Source: AGHT+IESEywxb4J+BS2OsvkSe3szVw3MJ5nI9XEFbDksvBUkM+kMTL8eL+OCEo5/0BTO80h0D/3NXw==
X-Received: by 2002:a05:6512:31ca:b0:52c:e556:b7e4 with SMTP id 2adb3069b0e04-530bb3b14c1mr9344873e87.15.1722947977246;
        Tue, 06 Aug 2024 05:39:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d8a4b1sm546428366b.151.2024.08.06.05.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:39:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/11] ARM: nvidia: tf701t: bind WIFI SDIO and EMMC
Date: Tue,  6 Aug 2024 15:39:03 +0300
Message-ID: <20240806123906.161218-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806123906.161218-1-clamor95@gmail.com>
References: <20240806123906.161218-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mmc nodes configuration along with WIFI binging to ASUS TF701T device-tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 57 ++++++++++++++++++-
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 9596cb495c10..1fca3e2e5aa1 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1529,8 +1529,53 @@ i2s@70080600 {		/* i2s3 */
 		};
 	};
 
+	brcm_wifi_pwrseq: pwrseq-wifi {
+		compatible = "mmc-pwrseq-simple";
+
+		clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
+		clock-names = "ext_clock";
+
+		reset-gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <300>;
+		power-off-delay-us = <300>;
+	};
+
+	/* WiFi */
 	mmc@78000000 {
-		/* WiFi */
+		status = "okay";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		assigned-clocks = <&tegra_car TEGRA114_CLK_SDMMC1>;
+		assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>;
+		assigned-clock-rates = <82000000>;
+
+		max-frequency = <82000000>;
+		keep-power-in-suspend;
+		bus-width = <4>;
+		non-removable;
+
+		sd-uhs-ddr50;
+		mmc-ddr-1_8v;
+
+		power-gpios = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HIGH>;
+
+		nvidia,default-tap = <0x2>;
+		nvidia,default-trim = <0x2>;
+
+		mmc-pwrseq = <&brcm_wifi_pwrseq>;
+		vmmc-supply = <&vdd_3v3_com>;
+		vqmmc-supply = <&vdd_1v8_vio>;
+
+		wifi@1 {
+			compatible = "brcm,bcm4329-fmac";
+			reg = <1>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "host-wake";
+		};
 	};
 
 	/* MicroSD card */
@@ -1547,8 +1592,16 @@ mmc@78000400 {
 		vqmmc-supply = <&vddio_usd>;
 	};
 
+	/* eMMC */
 	mmc@78000600 {
-		/* eMMC */
+		status = "okay";
+		bus-width = <8>;
+
+		non-removable;
+		mmc-ddr-1_8v;
+
+		vmmc-supply = <&vcore_emmc>;
+		vqmmc-supply = <&vdd_1v8_vio>;
 	};
 
 	usb@7d000000 {
-- 
2.43.0

