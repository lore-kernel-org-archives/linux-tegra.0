Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9556B19CC0C;
	Sun,  4 May 2025 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746350631; cv=none; b=PBqeZDXRoyhl3Lpmzf6Pj4cH8BOFTsf5FJ7Oz3PbNMWmY4j4NBAgb9awlm8U9cPqri+uEz6wFLMM/Jkqtlcxhrb9qKSQ+k4oTPZoFh6z3z4SufXlLODfqLPuDzXQT6heL44wdKiKBjNCFJuBO2jEUeIc3+SJ4s8SCjw1F0lL8oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746350631; c=relaxed/simple;
	bh=cK9WAwRhhSNRyK0T4dx847LP/vG/JLNdFHOtwY58X7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeZOGXoRxs/s1GbScBS/uNxwFrxNSbkCN7fKukcTdk81ZGK4AzmXqAG6DIoKllynU4O42ayYXWSUiYJ2OpTgd3l1IuPoSIv+ExvNM1rAY58Mq2mN8sCfMzCMNUj+L42io/raeE/04hILMZKHPtqp007BEd3fvfbuc+aXSZo4W4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrr83JQC; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrr83JQC"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acb415dd8faso519170066b.2;
        Sun, 04 May 2025 02:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746350628; x=1746955428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iW4V6J4dFIFOJYrNpWhGGsg7MG0RWfT7+wnXuhoGRvo=;
        b=mrr83JQCL3aDC13PCTHQkaeD2a91+qOmelOsFSxBn5b22T0e84a3E67//TPKFH5HFN
         W+DZp2oLiMS0NHMefDYVPU9Xj/whRGFYA0seoJbtcIrV2JltzNCV89tw+KNCVP1ofkLO
         gpTxGq6hTKmwn9xBP+VFR0Ysb+tUgre8/fFiDZ58kpA+D0dSrVPrBxlmmIJXGMOS7Gnt
         JDVd6geDQ8UGdp+hqnqdOpXGm+ZeNnVWZRJuCLlclZ2ezq2W5g5O8ci2RkG53kgZLlkF
         KS7JBpFdQdy7ken6toryAABo9nxBlot6uWpuMh9me0ReI9uq7wVR7A2qu5Gq59T9znD2
         1cNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746350628; x=1746955428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iW4V6J4dFIFOJYrNpWhGGsg7MG0RWfT7+wnXuhoGRvo=;
        b=BVAHHekyKpIgDLMk5/m1snIQvMnZEr81Qc2R3UciFSRR0ah+6OgFhwj+YuKM2tfDWf
         CWP+g+szlIimC1IYQ27PvfjdcITOcBgX743xh7gf2m/soTfMcZk9AeGct2hDLl/f66sf
         XxBa8uiuTVeiMRg3McxD0HduV2Yorb3rSGzQTX3/MwaG1X6CWO9zQ9TDpiEf6RZjMDdP
         7sMoWC4QzOMiXY3uRU4UCELe8NPb/5QgDZhQGogwPsMY7PKvWuxiEUaFCB5WTTVXQRNl
         Qu4BAW1+TPzxZtw+33BFi0TYTehdx4+tnEZK6dPvR6urJVmfmpLGy/9DPF/FV7jT/Evq
         9Lxg==
X-Forwarded-Encrypted: i=1; AJvYcCUQTFYcskVkfncaZjwEC/O1mOQqq94a6G52JIPUlBq7Er1ofrSYCJMJmaRBZNMv+ronN39BmWg5UXRjuBg=@vger.kernel.org, AJvYcCXeO7/c9cJiOSvn9fu5P0v24MGRsaBNBsSz4LU6xDyaiX5OUi1fLvfgVp/qIG7YJWCap7Vy8lXXmnzuFI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3bt6SyQoYWmGB+4NvjhhkB3cHnLmwYkuXD7tfM7xW1UxbKAQv
	7XZLxfm6Bxyacrui5kYjJJQsy0zMo9lOeLlE5w7ewMmnVZEg/dVN
X-Gm-Gg: ASbGncusspQax7xHikWXb6FUFcqxRK83MJVP0OoQW4kCyuyZP0g4gmr6koTbPopJIMS
	VyUl7IXXXOO+rHttR/2w5j0RqMYT1DIXDy15bcobpPuMhQZi+jXLMGXMTaYI7TFj9gyMQ+s6Ife
	eKqVKO6cd269lMOHGDxXl5ZKJRXCECvcYJluAfCLJNV0/hOjprczN2A7rCi2qkIaATs2Qp2Xt22
	vdHpVyFBbB4gFFQ+tcd62CNjznQHFFS12/79thw9ck5y/sx4ZLwpHUChBS1ajY5zWYYqGnqs4Mr
	bIFtHOtQ7OyEtqgnDSlGZgnfhS6bsF8E
X-Google-Smtp-Source: AGHT+IF0I/62ARz83PhtAiELQYU04oF8c3RHR1/FUIC/XK6sa33DAW3mz27J/fCe8UjJ/RWk8MJD5A==
X-Received: by 2002:a17:907:971e:b0:ace:828e:dccb with SMTP id a640c23a62f3a-ad1a4b7a344mr248285466b.61.1746350627486;
        Sun, 04 May 2025 02:23:47 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a26bdsm306050266b.43.2025.05.04.02.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 02:23:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] ARM: tegra114: complete HOST1X devices binding
Date: Sun,  4 May 2025 12:23:23 +0300
Message-ID: <20250504092324.10802-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250504092324.10802-1-clamor95@gmail.com>
References: <20250504092324.10802-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for devices on the HOST1X bus: VI, EPP, ISP, MSENC and TSEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 65 ++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 4caf2073c556..9279a7f37ddf 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -47,6 +47,45 @@ host1x@50000000 {
 
 		ranges = <0x54000000 0x54000000 0x01000000>;
 
+		vi@54080000 {
+			compatible = "nvidia,tegra114-vi";
+			reg = <0x54080000 0x00040000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_VI>;
+			resets = <&tegra_car 20>;
+			reset-names = "vi";
+
+			iommus = <&mc TEGRA_SWGROUP_VI>;
+
+			status = "disabled";
+		};
+
+		epp@540c0000 {
+			compatible = "nvidia,tegra114-epp";
+			reg = <0x540c0000 0x00040000>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_EPP>;
+			resets = <&tegra_car TEGRA114_CLK_EPP>;
+			reset-names = "epp";
+
+			iommus = <&mc TEGRA_SWGROUP_EPP>;
+
+			status = "disabled";
+		};
+
+		isp@54100000 {
+			compatible = "nvidia,tegra114-isp";
+			reg = <0x54100000 0x00040000>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_ISP>;
+			resets = <&tegra_car TEGRA114_CLK_ISP>;
+			reset-names = "isp";
+
+			iommus = <&mc TEGRA_SWGROUP_ISP>;
+
+			status = "disabled";
+		};
+
 		gr2d@54140000 {
 			compatible = "nvidia,tegra114-gr2d";
 			reg = <0x54140000 0x00040000>;
@@ -149,6 +188,32 @@ dsib: dsi@54400000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
+		msenc@544c0000 {
+			compatible = "nvidia,tegra114-msenc";
+			reg = <0x544c0000 0x00040000>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_MSENC>;
+			resets = <&tegra_car TEGRA114_CLK_MSENC>;
+			reset-names = "mpe";
+
+			iommus = <&mc TEGRA_SWGROUP_MSENC>;
+
+			status = "disabled";
+		};
+
+		tsec@54500000 {
+			compatible = "nvidia,tegra114-tsec";
+			reg = <0x54500000 0x00040000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_TSEC>;
+			resets = <&tegra_car TEGRA114_CLK_TSEC>;
+			reset-names = "tsec";
+
+			iommus = <&mc TEGRA_SWGROUP_TSEC>;
+
+			status = "disabled";
+		};
 	};
 
 	gic: interrupt-controller@50041000 {
-- 
2.48.1

