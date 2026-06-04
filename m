Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C063DD51B
	for <linux-tegra@vger.kernel.org>; Thu,  4 Jun 2026 06:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556187; cv=none; b=HsMht8erEBJZ+Erx8DqFbPavpaqGFElKnwOTCL++1Nk96ONi2woXh6zxO5XGPAFF+g3b56zJCZY77+Aj2I0H4Hbn0ELO3NPNwUhRC7JrV+klhPzsKCoCj4JgXrbqZIQlAiE1o0JqV7dUqNZ5U5u6x9qDDQ0KgkX7ALFqOWnXJ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556187; c=relaxed/simple;
	bh=mLqNH1tZT4PDvi9JL9X+OcDESHIRxNZrzPbcXi2+FgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gl+Fj+y9u5Z17RpViApP6omdMEeCjsBBpiSziGacp1hXvCCM0XVHwkEtK0V9Zv0uaWwvv9EnZme+l6ULmj/rWlDR7lheJ8ja7syvFsUC0vSRMeJSyiTVb9QI0BvbXZ+mW5kGyhDd/VlP2VjFRef7K4D7ZKoccbBvxwyQsMnc8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wi16XjE3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wi16XjE3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bef8b97655eso239529766b.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2026 23:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556182; x=1781160982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Brk5Q3maRfMkheVWKLawYZfMADdxRxJPeRIKMtKkN+M=;
        b=Wi16XjE33SHwDtZy5NufQyaH2maZyqnSMC8knPCY6IqcJNYzwnzP7qHNfttlkVnECv
         c5e81ILS74dc4Co6mWx4NVYRHRwzMXsZXSdakRxwJB629E+ktmrJLyOk6NGzH8kOakRB
         otIfs/rpyZDq89gBK6CjhvlC4b1U5CeD3f10V6ZP9RjHUksu8aSE2/2IiA3KLGAN5Qxw
         LSKcONkSlYbV2IxHJ0OGmCm0CcUvrnYikCHz9YDXAkZmEKyZclAu85+VjFl5510AbbPV
         YiZoUhrZOIABLEakBc799r0zglT2eegFWSL57rsv1ufQQJMWx7V9Wr+EUm3B1BPt8i52
         uVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556182; x=1781160982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Brk5Q3maRfMkheVWKLawYZfMADdxRxJPeRIKMtKkN+M=;
        b=YFrEm68ROiwD4W5ycVPJKMWuxSu0fzENQXSQQsiLTxQY6R3ZQGXhHF55V7oIXlkubd
         IU2ZHr85oRNiJpS8Wlphtn7pBkzJBX6TtA+SDsCG4+c6pLFzihX23rvu2bYhklo5ToeI
         McV5imU88WMMGPD2KLrtd5zVkK8/k9IdZqivXkHO8JQSZN7Kr9jyl6nRf7u976MzjzyA
         kh9CPMc1fSbt1kSYRlzpC+PuZ+MmhlhUodxlf+4fRiNwSgLC5zj0flwVFbeAhZXUTykb
         kCa5euIP3QXBBK5DRW+kuchl7QapHhS6YZF2afsJ4XmFB0ZZz2AaLkh/JuadzuHtb1zI
         Nw1g==
X-Forwarded-Encrypted: i=1; AFNElJ9oXjSzNjzRsi4p+h9VGrXMHjt5BTj/k32RA/9769054wL8Z5TUFE0hUua36f/Br4fxKQt9enRAGCgGWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygSD3KZDE9MJsyxMHYXsyMd83YuDescx8YsGFtBcFs7Qk8DUR3
	TC5LHYz22VPxcxniru+r93hd4rvCHmtwsy4VXamtI2KzSmwIREDqi3+P
X-Gm-Gg: Acq92OEt7k7Yv24uu3P0X11L7gxb2Lf1nG9ApyK9A4uZzxMhDE2+BlOstQJpl2ZOuyM
	EGrcXjrctc36nd7avl0nyYDnHSmGP7A4QFlzSddEklityLbrsrp0+AqjF1ul0dqO5+R2pJDf+AD
	8Qa5o00YqjEMHwbcjGNe9b2OT4afE4puLf4/3K2exPq7h9YdPk98R4d0dXm7E7eWvBHmIVKY9SO
	Pk0caMH+j40gHWM1FWk+3ckodcyvHgJ0wnqHIEC5454uPhLBeTXlSpsPf9If2IYwBkD6CHXQ5h8
	aJqt16xPj8dX9PAssFH8bKMDqjoXJaW7FaxT9rTp17dh2Lg0QKlejAsS88AeVqyKh+r4NUBi3w1
	iSoyhrTyv3yE7b+Cz00ar1gB02PoTP4hFCtmCUJBCbDT09IcjLK7F+NpTaH1KHl0Y0v+tsrQrfZ
	XRYoaD+l0JhNonrcitF4aqUiVJd+nHKszTHA==
X-Received: by 2002:a17:907:cca7:b0:bf2:6d61:3268 with SMTP id a640c23a62f3a-bf26d707c73mr23050166b.23.1780556182337;
        Wed, 03 Jun 2026 23:56:22 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:21 -0700 (PDT)
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
Subject: [PATCH v1 07/10] ARM: tegra: tf701t: Fix BCM4334 configuration
Date: Thu,  4 Jun 2026 09:55:53 +0300
Message-ID: <20260604065556.137614-8-clamor95@gmail.com>
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

Drop reset GPIO from bluetooth part and add lpo clock to both WiFi and
bluetooth nodes.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 73276f2aa7fe..e3e0b4ba7eb8 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1300,8 +1300,9 @@ bluetooth {
 			compatible = "brcm,bcm4334-bt";
 			max-speed = <4000000>;
 
-			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
-			clock-names = "txco";
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>,
+				 <&palmas_clk32k>;
+			clock-names = "txco", "lpo";
 
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
@@ -1309,7 +1310,6 @@ bluetooth {
 
 			device-wakeup-gpios = <&gpio TEGRA_GPIO(EE, 1) GPIO_ACTIVE_HIGH>;
 			shutdown-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
-			reset-gpios = <&gpio TEGRA_GPIO(Q, 6) GPIO_ACTIVE_LOW>;
 
 			vbat-supply = <&vdd_3v3_com>;
 			vddio-supply = <&vdd_1v8_vio>;
@@ -1450,7 +1450,7 @@ palmas_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
-			palmas_clk32kg@0 {
+			palmas_clk32k: palmas_clk32kg@0 {
 				compatible = "ti,palmas-clk32kg";
 				#clock-cells = <0>;
 			};
@@ -2382,9 +2382,12 @@ mmc@78000000 {
 		vqmmc-supply = <&vdd_1v8_vio>;
 
 		wifi@1 {
-			compatible = "brcm,bcm4329-fmac";
+			compatible = "brcm,bcm43340-fmac", "brcm,bcm4329-fmac";
 			reg = <1>;
 
+			clocks = <&palmas_clk32k>;
+			clock-names = "lpo";
+
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "host-wake";
-- 
2.53.0

