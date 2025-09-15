Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10CF2EA728
	for <linux-tegra@vger.kernel.org>; Mon, 15 Sep 2025 08:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757923348; cv=none; b=Ra5O2AamX+lk0ravA5G+xbLLeqVna4mXdrtdiTZn7fVc3uoog0l/2jKYRcmiqyMGQRvz1W40rjHAicOePyVc55POfaVFZc6RxPAxvyTvhAh/NEqai5gl/5j1F0Oat+5WMldrvp5U+iHLD0ynkIt+JSQB+0mAEZ8R7qtVCQoalbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757923348; c=relaxed/simple;
	bh=y84VDV0rZer94jeWEUGutZ+DiGlWK+mnb2KewZUqkys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BtK2aegoQGU/vQFNTsyiWM7jKHIb6FD3GsiR+wgXLT9oBrI//gBTW8T6Gp3elOtsVr8dgz4WcqvIRTylhVbvpjjtC/6ZVbv0X5N+QtQh6MB87fEMjHaI5ySQOTwoCrNBG/5WE+HgMUSMB5jwtdpdIYnboQLnhjcnntnLoRxLpag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wv/toyx9; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wv/toyx9"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f72452a8eso4512995e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 15 Sep 2025 01:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757923344; x=1758528144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFtIJBuALfkec7VGR4PeH5fwH/AzmTzDZVD8lAug6hM=;
        b=Wv/toyx9Ty3pulYm0UcY4Q/22F4JSMxYIgAJgtualy/TduDl02If2eBvuqedo1soNX
         3r6JqdGUftebh7ifqZMCbnlclJ17cHGe8auMfd+SxsSUflkOzCUmO7WEyZdwfhJCY4V0
         0BY3MSYlqtP31LbKNUrpvGQZPhoWm+zHkyF0apmA0n9QytU3xh5uDQLlzu4blI2muobw
         YoCiSoIwFj/0kVVS/gij0aVwIJrz+rNg6TgME+6y8cbPzkv4JHpu6wnTE7Is2TdUYCSz
         xE8lCCvcQLvzMyIFFAMWt+mfn6+12PQtZ+mVTvFbqJ8Uy9BBUv7/wbkEEk4dgb9B+ty9
         awtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757923344; x=1758528144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFtIJBuALfkec7VGR4PeH5fwH/AzmTzDZVD8lAug6hM=;
        b=jVgczFpd0xTsy8O6W07Lw9DKnrIRZS/quoZ4Ovq1iF1RvpdVB1Ph8X5A92a4MhqOIQ
         n+zARFyUi+r8zD66DPhTwQV7gDhwEiHJEu9Q1ca0wwNxmmFMjBgk5VMAnzmFhrlA6VXV
         DkW/nBcGs2ad5ti0sJiDFA/QhRPjonhFWqoKhJe0U+Yo9VpVgBp8X4fFo16VDZCCVd67
         Y+FihD1xB1ZgkGnAKQ2SyHQxLwJ/Tfv9BJC7G/dTFMWSDhM4/6X/IdmDOnkrM9FXeGXj
         MW1AuqWiEAyk4fFITOUkftRV3Z3TwpMXfjpXw36RxtrGrhUM+EfRNlw2FaadGTpFl9P/
         gQhw==
X-Forwarded-Encrypted: i=1; AJvYcCXAJELD1YEkaqyGwU5dJjDTCgpjvHKU9gdyCWf7KYoO5WY7lS1DUff4/bzxE/cGCvdCDF9JNVqJENTpnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB3+XjnqnwIOpt1SSWSEB40KAnBc3bszRyVxZwNj54kqPeuBou
	+x0qJehUIVPc+OF2SA0nfVPWhrZQ6+B46OrLbgVdmL329wFjvNdXVa2f
X-Gm-Gg: ASbGncvK45eD3n0tLKlmg9BY/XS/Ferb/OZeUqJch0wCwjLxivcwxvan3yWTXU+S7E2
	LO1vCVaFB6Wk+qR5OfRKIgNLTN0zEH/qUc1nmmPFIrmmxJWwMbkzWw5q1xqh0uSX4lAiKgqKeut
	2luUqhLzX8aSEf24ImS3gwl6tJRybNHy+3kpMw8rVi7Xyq0D6gjrB/ZYyXVxcH2WeD05BPDCgyy
	NMwQhIOpQPcp8vH9Ud4SmELeoUUM5OnLsZld0mLkVnmewRUzPXdFFCRtrw/PH4HvPU6er6Ry/N/
	rQq1zwoL+X2W+wy+xwBc8nhQ6D7uxcTRCXkL5Yigydyi65GuNSyGB9IKymgPsduMmam4nWqfsdq
	b/iS94VKS10g7x2EH2NH7WbsG
X-Google-Smtp-Source: AGHT+IFe/jx4tFil9RjxwhD7bREzvIlC8fQ/134z0bvttum74XEn5yTMqRq0eo1UbfObzzjuNO/n+Q==
X-Received: by 2002:ac2:4f01:0:b0:56c:4159:4e39 with SMTP id 2adb3069b0e04-57049f1b51fmr3830912e87.16.1757923343830;
        Mon, 15 Sep 2025 01:02:23 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460dec4sm3392381e87.103.2025.09.15.01.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:02:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 02/11] ARM: tegra: Add ACTMON node to Tegra114 device tree
Date: Mon, 15 Sep 2025 11:01:48 +0300
Message-ID: <20250915080157.28195-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250915080157.28195-1-clamor95@gmail.com>
References: <20250915080157.28195-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for ACTMON on Tegra114. This is used to monitor activity from
different components. Based on the collected statistics, the rate at which
the external memory needs to be clocked can be derived.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 5e695431ad2e..08f81a3d11de 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -248,6 +248,18 @@ ahb: ahb@6000c000 {
 		reg = <0x6000c000 0x150>;
 	};
 
+	actmon: actmon@6000c800 {
+		compatible = "nvidia,tegra114-actmon";
+		reg = <0x6000c800 0x400>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA114_CLK_ACTMON>,
+			 <&tegra_car TEGRA114_CLK_EMC>;
+		clock-names = "actmon", "emc";
+		resets = <&tegra_car TEGRA114_CLK_ACTMON>;
+		reset-names = "actmon";
+		#cooling-cells = <2>;
+	};
+
 	gpio: gpio@6000d000 {
 		compatible = "nvidia,tegra114-gpio", "nvidia,tegra30-gpio";
 		reg = <0x6000d000 0x1000>;
-- 
2.48.1

