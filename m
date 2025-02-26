Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738E0254AE7;
	Wed, 26 Feb 2025 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740567404; cv=none; b=ZBDY6niX5huH5t8eML77ibEr4pbTeb1UNjbhKIkoRObTD3auw3gnREGMWYItT53ofOL6IFfmfKUdLYNn9hrJGlGl+mFhk0in6X8p7Am/uvTlFHlp2EE6WNqjWmEXqalRoCBQJWOH5fcrAw9x6teT5Ndci9Bdjb9aHAEo89OGTEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740567404; c=relaxed/simple;
	bh=vipXrssnj8kz2KjBt/rEO3MgSq6CgBP7HQs5kD5whLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUBhobvqNZSTr6ub1e59cEBjeWQUVYII3BEUUeu3GTptyY69IXIA31dmxei6jMGxqzRr9Q81DY43/76xUL78FF3U2052h64gM1tCqNO6gd6aAaFuDj9hUJYxFfdiq7vWoZ2oK5uQDkGlhqU4DIeLb9LyWd+ZftFG7+EZaISGWuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuKSx3R4; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuKSx3R4"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abbdc4a0b5aso145186366b.0;
        Wed, 26 Feb 2025 02:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740567401; x=1741172201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6Z+Hj6qi2T4t107ctalIyB/ngMx8qQGhx6GDOGMZ34=;
        b=YuKSx3R4/4bdz2COYtH5olLayvafxRmrCVyQusUyrjy542tfass6DKDWkY7Fn/rJOB
         TLv0oKVQsolwEb/36kecMEOIVBMSCMgh7dYNgozs0tncJp/k1OIYgwNGLqkyDdiVFbk8
         CV/S8fNw71b0r1Lbmsrz+dE8l3KqFtV/r+pNJpLWgaDcrtSTZtjMzc99LpsxpabaimDp
         lNBIbAsxPFzp6nVLzzcPFrMo2RhTjhpRDMNSOCFvdzdu+NOGoM5tqF6YDO3Xx2uk1xRN
         0MHfDHfC6lVOyCG3WITkozUOby15Axzhk8vEGHFZR79hyNibJtCbId0TL2t/FDKbFWWA
         Bipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740567401; x=1741172201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6Z+Hj6qi2T4t107ctalIyB/ngMx8qQGhx6GDOGMZ34=;
        b=XKU1/6AYoDkKsLgKgHK5+LGI9dRRf9ua+HxjUqKWf8VUMc3RySIaVFLERjFOtr9SSU
         2U2wxxeJtKENfJ1rwrOnncWZsCiBpKamEpzjhPIXBgSRBQs/YH9Sk0HloSj9eq9LvZKa
         d5/puSOYyu6lUaYCFR8VVaYiYV+61ovXWQFdE8kdFIKVieWluD2faSe8rNR0x2WHWpDe
         xeqLYchnrf1dSFSOv+l91uTdY96fK3Xrej7/+sMkZoBVmLlKZ4VmvhyJlOs6qQuWtjen
         vLaLgF0S44AluX9jyzUEo6iVma5MU/fIiQEnSZH7tqNh8Zm9w/utZc69tJAz7/Aaoio0
         BKNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/kk4Nc3x9SUmg8J85y7P2Xbt4MqDhD1qAQ/3jbpZ/HLpeWZFNRubrA6xmOrWyk2YuvpD+xH7pOMRaLWM=@vger.kernel.org, AJvYcCWKpvQROzQm0grlFfP03VwOxwsn5Y74QSvSUT8iYGQPqaR2qrfOV5uOemywPM+3ylPviT9B/9bxSWO8M1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPbH+FW2le3enLJmQNvmlKltykfxRDRK61NK5+gjEB42bLOCRx
	EnGp1cBQFqedmQEoWXHiDA+g15Uq+9SAlAwVwU6ef2IL/dMSiOfw
X-Gm-Gg: ASbGncu6cRriy/jeCPID/fzQmCGFRoaGfjwmWxyvfExmFrHtqCpoFYR6LyLUW7pDU2k
	31Syw2UFDhcMxQtN4b6xvhb8Ap17BerYUSOcPKLBGw+AgFfa6XAs2IoH/Sf9qey2fzrmG3Gmnrr
	Nn8pjnKp9EhQSYhlB7WB5W7mglo97TeytQeATwfD2SicFfA+wL4WmtUscPuDS67diKGmZqBr7wV
	ns5EmAjImOguKeMi8YaMErHq74JqfwtDt32TcA4tlozKNgjUivbVDlLGvz/1bKHxzz+ywmZqChx
	OzI7iB3/f33s/a3eTQ==
X-Google-Smtp-Source: AGHT+IFx+Pd6Als0NDc8SD0Wt0wdCgaBbwwN7wh8dJGN11uuKukwG1GVnyZSgxTx5zyhOt0NwHBpdA==
X-Received: by 2002:a17:907:7a88:b0:ab7:d44b:355f with SMTP id a640c23a62f3a-abc0b0c6077mr1918667666b.25.1740567400517;
        Wed, 26 Feb 2025 02:56:40 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205e53fsm299771266b.159.2025.02.26.02.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:56:40 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/6] ARM: tegra124: complete HOST1X devices binding
Date: Wed, 26 Feb 2025 12:56:15 +0200
Message-ID: <20250226105615.61087-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226105615.61087-1-clamor95@gmail.com>
References: <20250226105615.61087-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for devices on the HOST1X bus: VI, ISP, ISPB, MSENC and TSEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra124.dtsi | 65 ++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra124.dtsi b/arch/arm/boot/dts/nvidia/tegra124.dtsi
index ec4f0e346b2b..8181e5d88654 100644
--- a/arch/arm/boot/dts/nvidia/tegra124.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124.dtsi
@@ -103,6 +103,45 @@ host1x@50000000 {
 
 		ranges = <0 0x54000000 0 0x54000000 0 0x01000000>;
 
+		vi@54080000 {
+			compatible = "nvidia,tegra124-vi";
+			reg = <0x0 0x54080000 0x0 0x00040000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_VI>;
+			resets = <&tegra_car 20>;
+			reset-names = "vi";
+
+			iommus = <&mc TEGRA_SWGROUP_VI>;
+
+			status = "disabled";
+		};
+
+		isp@54600000 {
+			compatible = "nvidia,tegra124-isp";
+			reg = <0x0 0x54600000 0x0 0x00040000>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_ISP>;
+			resets = <&tegra_car TEGRA124_CLK_ISP>;
+			reset-names = "isp";
+
+			iommus = <&mc TEGRA_SWGROUP_ISP2>;
+
+			status = "disabled";
+		};
+
+		isp@54680000 {
+			compatible = "nvidia,tegra124-isp";
+			reg = <0x0 0x54680000 0x0 0x00040000>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_ISPB>;
+			resets = <&tegra_car TEGRA124_CLK_ISPB>;
+			reset-names = "ispb";
+
+			iommus = <&mc TEGRA_SWGROUP_ISP2B>;
+
+			status = "disabled";
+		};
+
 		dc@54200000 {
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54200000 0x0 0x00040000>;
@@ -209,6 +248,32 @@ dsib: dsi@54400000 {
 			#size-cells = <0>;
 		};
 
+		msenc@544c0000 {
+			compatible = "nvidia,tegra124-msenc";
+			reg = <0x0 0x544c0000 0x0 0x00040000>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_MSENC>;
+			resets = <&tegra_car TEGRA124_CLK_MSENC>;
+			reset-names = "msenc";
+
+			iommus = <&mc TEGRA_SWGROUP_MSENC>;
+
+			status = "disabled";
+		};
+
+		tsec@54500000 {
+			compatible = "nvidia,tegra124-tsec";
+			reg = <0x0 0x54500000 0x0 0x00040000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_TSEC>;
+			resets = <&tegra_car TEGRA124_CLK_TSEC>;
+			reset-names = "tsec";
+
+			iommus = <&mc TEGRA_SWGROUP_TSEC>;
+
+			status = "disabled";
+		};
+
 		sor@54540000 {
 			compatible = "nvidia,tegra124-sor";
 			reg = <0x0 0x54540000 0x0 0x00040000>;
-- 
2.43.0

