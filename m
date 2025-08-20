Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FA236CDE2;
	Wed, 20 Aug 2025 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702828; cv=none; b=fNsWwZuSf62V6XQ1OdG8HO67OjjZUbuBuCPUd34C0EXL2ux10T9UlFlPVgDmVe78+RBiliBBIUkX6Rs3tPMNI4BpxvVkc1hPHT68W8fvPXKk6QhGjRxo32Ei3GvLLHgDXXbEiHl5x7qt5tuCOz8hqIZxqwWx2yuuGYmhwsxkcIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702828; c=relaxed/simple;
	bh=ZDSXXj58rUAEjXLEfjhSO8J+XnuG1JUcpgaVKqDxNew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOUrt0jJmZZ1lJmtUbOldK9IXG6ZBV4mLKclhuRdDoImG8isF7GNYkhuPy5QWhpAEI1dTFQ+t7PHdSUcQixwu6PGM2o9JTSTcYWQXHBAp0N3gC3c+bkV7azbrXZwJBttdedktF+nBUKwnuVsqWFaNPumPXajm+opigbbwCtxflI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBC8vIll; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBC8vIll"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb79db329so911301766b.2;
        Wed, 20 Aug 2025 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755702825; x=1756307625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7fNJYH3TpLpR48oi/prsq76N0R4oxFjE9Vs+dN0up8=;
        b=GBC8vIlldbV2sJmXiMRUi7ReIWeAzB41aC5vQCHw0sTwf3GB9jJxL95zetve0usCMu
         W147cfEuNOpVs+0/qfyWZ/faqdRbQBh91tyEjTVNCjtegDdvuQqr+sOTiayXOqsa+n+0
         YBuiGcZu2XznQQLV7vmefg2GBvYflsgh80AJaXUZoCzrShRjydIyeUtmFmgMAyNl/txt
         yuiUI1JHuAREES9gRJFTCeRkRVNaHDYzMLeVxHRdr+p0YMd8aVafv34YOPC9VtNYCkTK
         fh2gyrSQRxCYOJKmeYWf+QD7VGT60yZNsZdlZYmsHQPTgRHuMAw5alllll3pvawWXqam
         mkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755702825; x=1756307625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7fNJYH3TpLpR48oi/prsq76N0R4oxFjE9Vs+dN0up8=;
        b=WfNlA6P/KWnIIeGOP7Q3QS53UxQNkkWCQV1vTn6WvlWSMymASjzrxApOr3Kus3v5kW
         LksOTJCyMcN923t8o3FO632Y4y1kGj3T7PjX4fL5yk7J0U+cjvzqlayTM3I6Vek3TqBD
         MB6xeTBueLxnQoZQRP6nWrFzLe8HvHoi2h1H2NoVaRP4lIcytM5xpy2Elo6EhuLnDOVF
         KvtDTLWwFTXitTiSQbrxsqqfS5tV8iTlEZroI3XF28jUoroN6UqUegZioGOqt9FFhZKd
         aKnjpzG7weGIiC9gAMh5lVoFhFg9hKrov96+yw+auZL69aYa/A7J5iIuUre9wH57MJT6
         KOgA==
X-Forwarded-Encrypted: i=1; AJvYcCU6NfLbeQSDv4CEgi3qhPNsAGdAamrO9j3kU4EJ4Ebf4ABrvB4LvwfXbzuO8fW2zMAqCFwQdQ0kzE0m@vger.kernel.org, AJvYcCUEQG8de7um2gTP/c9ZOZm33H9ZpHl5fxE5orDs67ot+HLgT3PYbd8jawF1ix9pI0gxjlOgRiWnmPyK6mE=@vger.kernel.org, AJvYcCWV+tgG9ya/TxXWA42Icc7urfBFPdUAx+40VZWFDbxnQj2bbhr0jiOn+PoOxpL/jRt8XvL5f32h1mDo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6rj0pZY5ZHQlQPP77kUrAemCH7Ja30k5vn/Yuu5nhHrHA1aKD
	V+Jb1b5VtYdKZKw4voq3fFaUNR0BFYNFn5/vy6Ppm6yY6C/nuW/tEF0N
X-Gm-Gg: ASbGncvDRMfqoKdwTiv2D/tMt2IPWbbDcg1eZAIxx/52FsFdXsllZ61A3ZfHOM31r8O
	Mqmqe042CKGNqzqE9L7iexz8bdmeP4yNcsWHSReevjfPa3L+R4zvea/OrbNtIR3qDDYD+fsfdir
	YkjKCsr3cGu6aD/JiNm9yttiF6EbI4BcKU14jcf/Z6wfOWYWD2XY8NLNeOrBm9yrQQU41fi1cHN
	Tu4wJGY7mwoW8LwB5JXTyKIB1T+nTlOv/m3t17lk1Tv3VRE+FoageRF3AVYhDayztSYNoBciIMI
	XXPsHediwRA5fBsvhJjzX8Xr+5njEw7xDcE6hm74RHEJTENDR3csEuMRzBajvRtuxWSHVtPgx4K
	y/mFT4arL3gVGIpMJWf+jj+F0
X-Google-Smtp-Source: AGHT+IGhfPi+mnYdhEQqnRsF2UNoAd3TU4CGjFbLGBVPynHiRGXOAUQN3lzzXLVBqvtm3MsnmaPzag==
X-Received: by 2002:a17:907:7f05:b0:af9:8c1c:b9be with SMTP id a640c23a62f3a-afdf00fb012mr274498466b.14.1755702824860;
        Wed, 20 Aug 2025 08:13:44 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdef1d34f8sm175905166b.83.2025.08.20.08.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:13:44 -0700 (PDT)
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
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/9] ARM: tegra: Add ACTMON support on Tegra114
Date: Wed, 20 Aug 2025 18:13:15 +0300
Message-ID: <20250820151323.167772-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820151323.167772-1-clamor95@gmail.com>
References: <20250820151323.167772-1-clamor95@gmail.com>
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

Actmon driver has T30 and T124 compatibles, T124 fits for T114 as well.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index d9c51e6900d8..5a6999eb4357 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -248,6 +248,18 @@ ahb: ahb@6000c000 {
 		reg = <0x6000c000 0x150>;
 	};
 
+	actmon: actmon@6000c800 {
+		compatible = "nvidia,tegra114-actmon", "nvidia,tegra124-actmon";
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

