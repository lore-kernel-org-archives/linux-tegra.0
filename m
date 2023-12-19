Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94DC35268;
	Tue, 19 Dec 2023 17:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMB1tAp3"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a22f59c6aeaso564838566b.2;
        Tue, 19 Dec 2023 09:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703006128; x=1703610928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rP16a1SZyv7erlw5UIZnK6nQRzkpC0bkH1p5QX76mR8=;
        b=QMB1tAp3T7K6z8yxfRj4y0ugSH75DsHcOOKpRAQ6F46sxzpOVkI6+8kV2AtUBjpSTg
         zbHpYa30RfINXmqzgw/IxEfcTqej1UH7Dpv2vAPMsNB8/7nwiyhqFD4kRfYq2ESxO9X3
         C6gHhxuMo3bkZqixSENf+cUG0ZLqKb8rcNVwmIe6v71ulgp6PDwplJVS9EMd6cfM+LTX
         B0zyeETohFBRD2B7FoonBC1EBj16RLuRd0Lshy/+BnkjG1AXlMoYAKZSvNFJADOPJ6/X
         bxIwV3BeDYy4wVHzabFaKahPfq3beiDyAfFxRclvlAkYoD7ftpOpMHVry279+P5rLc6g
         ZYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703006128; x=1703610928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rP16a1SZyv7erlw5UIZnK6nQRzkpC0bkH1p5QX76mR8=;
        b=Da7i3mTo4Z4XknLAfVDnhn6xtrjSWNxslCXkir2F1axdQ1YNBLkc24Mr/RahImuEgC
         91lmNpaR70OLp5wMjsrLfIV6O7vua8sD2dAVr+gU5r0W/j5ETl888WyyW/zIgAYibIR4
         xnEdO5wIcYHLArYpQNFeelM7tgdnu7o6SFxqnAgtfMR1bTJICYVJNr3FS0bzNRSvI+oA
         dHzbRb4FWzqSVCV5Yf/OeN8IlDo+bPlvnRbpr/vlJ0n43pGlGA+wxBO/SjoiQKFxnv/h
         oV3cYbEezuVzbke0A+HbRAryKFGXJVNCfQof+n4ZoVjN7ii7Vm+PnFGMMPZZw305IBY7
         FhZw==
X-Gm-Message-State: AOJu0Yx6Ej3JWwy5cEDqJClf6YRx3l/O/IIpshAdibYR22gJWwsAH0xY
	8ExdbYdWiGHvWxgpwIo+Hik=
X-Google-Smtp-Source: AGHT+IGOI4m2B3qsa+ucqdHZOZTlDmC+VWvgv3I/P4TsBWG/RSOA+lHzcxOJsvRWnePEKdqTsuoYhg==
X-Received: by 2002:a17:906:e24b:b0:a23:6fd9:b088 with SMTP id gq11-20020a170906e24b00b00a236fd9b088mr1116378ejb.102.1703006127839;
        Tue, 19 Dec 2023 09:15:27 -0800 (PST)
Received: from localhost (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ze11-20020a170906ef8b00b00a2684d2e684sm643464ejb.92.2023.12.19.09.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:15:27 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Russell Xiao <russellx@nvidia.com>,
	Brad Griffis <bgriffis@nvidia.com>,
	Jimmy Zhang <jimmzhang@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: tegra: Use consistent SD/MMC aliases on Tegra234
Date: Tue, 19 Dec 2023 18:15:23 +0100
Message-ID: <20231219171523.557928-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Tegra234 boards use a mixture of aliases for the SD/MMC hardware blocks,
which can lead to confusion. A common method was to use mmc3 as the
alias for the eMMC because "SDMMC3" happens to be the name of the
corresponding controller in the reference manual. This isn't a great
choice because there is no hardware named SDMMC0, so the mmc0 alias
would never get used with that nomenclature and in fact mmc1 and mmc2
wouldn't either in many configurations, thereby creating weird
discontiguous enumeration.

Instead of trying to match the aliases to the hardware block names, use
mmc0 to denote the device's primary SD/MMC controller (typically eMMC)
and mmc1 for the secondary SD/MMC controller (typically removable SD).
In cases where eMMC is the only controller we can omit the mmc1 alias
and if a device has no eMMC, the removable SD card can be aliased to
mmc0 instead.

Co-developed-by: Russell Xiao <russellx@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi               | 5 +++++
 .../arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 1 -
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi               | 4 ++++
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts              | 1 -
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
index db6ef711674a..90f5adeba0f5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
@@ -3,6 +3,11 @@
 / {
 	compatible = "nvidia,p3701", "nvidia,tegra234";
 
+	aliases {
+		mmc0 = "/bus@0/mmc@3460000";
+		mmc1 = "/bus@0/mmc@3400000";
+	};
+
 	bus@0 {
 		aconnect@2900000 {
 			status = "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index b4a6cee0b9e3..a132b3eb5697 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -24,7 +24,6 @@ fb: framebuffer@0 {
 	};
 
 	aliases {
-		mmc3 = "/bus@0/mmc@3460000";
 		serial0 = &tcu;
 		serial1 = &uarta;
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
index 59c14ded5e9f..bf93a32c343b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -5,6 +5,10 @@
 / {
 	compatible = "nvidia,p3767", "nvidia,tegra234";
 
+	aliases {
+		mmc0 = "/bus@0/mmc@3400000";
+	};
+
 	bus@0 {
 		i2c@3160000 {
 			status = "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts b/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
index 9f3e9f30c3f7..292e28376eec 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
@@ -8,7 +8,6 @@ / {
 	compatible = "nvidia,tegra234-vdk", "nvidia,tegra234";
 
 	aliases {
-		mmc3 = "/bus@0/mmc@3460000";
 		serial0 = &uarta;
 	};
 
-- 
2.43.0

