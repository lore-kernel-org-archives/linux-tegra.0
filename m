Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378484;
	b=W2ooXjlgcebuSaZegBRU7NInvowaPszU024gzJkMl3rProMkR+YuuhuHp9fgwM7hWWHI
	 7oghBgrvo/MEFMApM+cCiSYy1YQ5+ZLqqm+lLxjYvDo5bvsS1CWa6AVm5La/XL8RgWKbU
	 ZGJYvjzrame7k6lxGZbVyxTJnm1iHeIskwQqm5YvKrIivNstdO+JL1A4bg7kJkNWw2Wwm
	 LWEOuGgiqIFM9J0hRjK3cRO/w4vQ5xHwyPELVGYZZpSmF7iJDeDOe5zhwyHNBIBxayN7A
	 2UKeFrn/xvfcpxUjI6jkxCbLuNFGsHroFieZwEux5hENWILxWCHpljm0I1H7eqaDaHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SFXSMcHcVJkmYFbJzBFz4HPTepM54SZHk3SlIxX3SZk=;
	b=ehtQXqrok7375lLGcsmAVh1pzceuoJhQA++Wgf2s4aXWxYmzm9gx8EOVi8KnCI1x8Fqo
	 xo0htPj9vBmt75kbIoLjvI6qwgCsmohcfcVkZ/PUGRlVECHmyIqRzX3Ea6Y0UwIEHRoSb
	 BtHHWSGliDj4IRqKOKaQNotPe3H4LQhCHSQ63nKm81xDTs80xPHy/rPCKhyeDit9VDnQO
	 yaDTIl68dklrHo2ykKT0aH+B4vUXwSrBKnXUBPErUjdnYEvjEatvbkGuAryUL80ZA4ILO
	 G2PlJELuyWjOj5uATcx2x6ZfANREuMEDroJG8msgACTGr6RtFW9l5OtSVewHdXuN/RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q5v0tZRI;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0105A606A33C
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0105A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q5v0tZRI
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso3142867a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378482; x=1795983282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFXSMcHcVJkmYFbJzBFz4HPTepM54SZHk3SlIxX3SZk=;
        b=Q5v0tZRIUKu5FfuMA0WHjv+4y7OME8e13al3F655WqumlxdAsuBho9J5fjY9oSETzn
         u61qF89lyEUxgkv+HMDUrf6fQto1lWNA63NNwHinVZq5upgD4tw7cAR5sVGrCPlDIKi+
         0zHOHOBnoXNBpBs5YGKDjZff/L6aQdsKI0YXrIZQlE+fbob2+hmXPCqjQvFHGYe6BLhy
         FF3iUj6VpVVxKhOtqmE5aap2FfW+FUT8AAEBdxBtERTlWrcM2nUA/XMDFEyH1QpnbMkK
         L8H9o5YsPcs6eJWgBDZ4J78O5w/M5DB9fXOEwClUCWUVmzxwZolWWl0Dk+JsnuS2rnP8
         GQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378482; x=1795983282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SFXSMcHcVJkmYFbJzBFz4HPTepM54SZHk3SlIxX3SZk=;
        b=KGAG1f72o1CB8nyY4Kp6ViV68uMNTmGZXCEjVn7QLFMfWEO04FM8PqiOtOKCG/LPYo
         4bs12NyTlIRk6JFxkb1dK96OXmZWtvsmYYy375HNl7WU7oyScIQTfg0k6B1ou002XjjD
         sCOdpho+JkdW9wG1nZalhAtgnNi20ZAgXe1ylzTmELJYmZOYbNaFLUaWul3KKinIA7mC
         Z8TuoShj11YW+uh9xION8X12fz4ZHUoR2nb/L5C+YgqE2MmUxvn4i+tbnkLSI7eYFdBI
         UtKwu0QyEQJqGn05WJ1N24yDU0HdEgT2AmIy994VpbbCvicSwzSdYW9I7Ku5qdCgdty4
         3nkw==
X-Forwarded-Encrypted: i=1; AL+hErEtZl21ijGgIgkq1k6dhchprYksMtRTwbazUo5IGFBZQdfxTwptGzdIAzwTGepPUtWMQ+ZbBuVMA8Ieag==@vger.kernel.org
X-Gm-Message-State: APuU4Z+trxMq4i/jHpFZc9rWF29eOYEnZU+3QYKiLqI+qNNJd9RPjTeR
	ETScU7Ny+OSqiFxol8wNXVxnuJq56ybwJg6RTvPuPWoh/IBQ2OebZj3W
X-Gm-Gg: AZFdTZf6qBPzJI1hwdLEYUdHGIpp9fCLnrtee8tIseO8pSmcixQQMTM2Ac+IErAy50y
	T2eQCceTaBZtkvbTqVykuV0h/A3PrgspJoF2kZNeGMz2vFIg2UgAuZuiKWZi5MXulXSvXVI50NC
	saQ0/Mz0gMI1j8/iXuxzWYc1lBNQHMvkEdjb1eKtaiYszNVE7c6vfZ6ZuI/hyA+J0UpgWAgr3fX
	BDVYR3kdEUxHei4SiybnJv2+fHabZtoWxCBtcf8L2C9aiSal5ddvcUGHeFKSypfyriE3hVx3FKJ
	hUK5oaA2giR31/9RmcLSoaquL5fwU1u2ewc6mhctMnto961eji5CrR8pVg1Uxzu5WRfAcGhClKV
	g1YBZBA5yzX6S3YVyz8vW3ZVeXzmG5kzRVhRk84U3lHEBbUnf8CP9fw25q5OyyTLkQ7qXCEplEI
	Cc9tMuF5zb6ql4KTDh2vHegMftWXQq/CoAwsJlCBVdgNFotDC9CLYfoe/zQpzOB44hcJnMSA/9x
	aIAeUDFns5SfMrWKODlQf7p7+veWMdzNhsCHRsKyhOoArw8/QwFi1zexYW3Y6V+UOM4GF0dAwMc
	ePv0sXE6et60DllB5whtYbOOm9GVBKfZkB6T1cwmkJ5LQzN9cROxVEfF+1rcUyuKX2xJdZTFrrA
	q97VBfTuhMD0=
X-Received: by 2002:a05:6402:434c:b0:6ba:2a44:8ed0 with SMTP id 4fb4d7f45d1cf-6ba37e97bd6mr6781529a12.23.1795378482319;
        Sun, 22 Nov 2026 12:14:42 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/18] ARM: tegra: tegratab: Configure MMC devices
Date: Sun, 22 Nov 2026 22:13:56 +0200
Message-ID: <20261122201407.23742-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tegratab board uses three MMC controllers of four that Tegra SoC has
(the second one is unused).

The first is used for Wi-Fi SDIO, the third for microSD card support, and
the fourth for the internal eMMC device. Configure all controllers
accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 56 ++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 2ccee3b70aac9..b7a14e24df79b 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -13,6 +13,10 @@ chosen {
 	};
 
 	aliases {
+		mmc0 = &sdmmc4; /* eMMC */
+		mmc1 = &sdmmc3; /* uSD slot */
+		mmc2 = &sdmmc1; /* WiFi */
+
 		serial0 = &uartd;
 	};
 
@@ -1254,11 +1258,61 @@ i2c-thermtrip {
 		};
 	};
 
+	/* Wifi */
+	sdmmc1: mmc@78000000 {
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
+		cap-power-off-card;
+		bus-width = <4>;
+		non-removable;
+
+		sd-uhs-ddr50;
+		sd-uhs-sdr104;
+
+		nvidia,default-tap = <0x2>;
+		nvidia,default-trim = <0x2>;
+
+		vmmc-supply = <&vdd_3v3_com>;
+		vqmmc-supply = <&vdd_1v8_vio>;
+	};
+
+	/* MicroSD */
+	sdmmc3: mmc@78000400 {
+		status = "okay";
+		bus-width = <4>;
+
+		sd-uhs-ddr50;
+
+		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+		power-gpios = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+
+		nvidia,default-tap = <0x3>;
+		nvidia,default-trim = <0x3>;
+
+		vmmc-supply = <&vcore_emmc>;
+		vqmmc-supply = <&vddio_usd>;
+	};
+
 	/* eMMC */
-	mmc@78000600 {
+	sdmmc4: mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
+
+		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
 		non-removable;
+
+		vmmc-supply = <&vcore_emmc>;
+		vqmmc-supply = <&vdd_1v8_vio>;
 	};
 
 	/* Micro USB */
-- 
2.53.0

