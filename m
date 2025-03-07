Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21C11DACB8;
	Fri,  7 Mar 2025 08:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741335087; cv=none; b=BdUDHrjefm1RI7PGAA7Ma4z1Z2ZfBSbzKAw4W6nRJQ/ds9H4stK9FoyNi2V0DWxhLs+Be+kWvqCogedVTz2mTk2XfxKsxkXLczqX2JxfL5cfV88YVCatbOUKYKRwBTxXUx747m+GqAwyM6iRLO4Kw+lBFb58qsvfs+yJ8FbZeUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741335087; c=relaxed/simple;
	bh=vipXrssnj8kz2KjBt/rEO3MgSq6CgBP7HQs5kD5whLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHy+kaBQgarZuJljVozOLcYHk5LVe7+alX+ncIbHtq+lZ7G8pH5nRpO57YsSPaIkmFFL/jWqhCwpm6QU6uLPAra/Pt7M1KBHShXuLHNIJvsU4g7sQ7klv0z0e9flO6YAyJN3/aARj5s+SG7xcWEbz0cf8Tqbu9zQuZl1kfitM7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alKqjIS3; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alKqjIS3"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54298ec925bso2358339e87.3;
        Fri, 07 Mar 2025 00:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741335084; x=1741939884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6Z+Hj6qi2T4t107ctalIyB/ngMx8qQGhx6GDOGMZ34=;
        b=alKqjIS3AfpO9giSUIhKELOm2cWxvowFOVI+Sw1ksJe6Q6/YgrycyMerW6A8dy8nXD
         TrktqUv33XHcCssK0evekJ5WpLR1fDUXGQqnOZlZD9AZWW736vXMuJ03WXYdFPQ9XOdl
         cCcvYnYzfurcH1I+0se62OzX5mkKtvmtkkAmTQrtoualrT6dxsXy8dIiPpImVWJaOWTu
         1f2hcEa+YBu3lKPsTufxzcYLp4mFlsg8J9Hk4V7ZMjBfXUh1iZpOGlAxv+b0QsSQNAQA
         qX+7hmp63O8/0GpIBvwOsgC/EpCGoKKPWTdQ99j7HqxZr0FDx7FARAiR3AxpJaL/7jgG
         Gshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741335084; x=1741939884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6Z+Hj6qi2T4t107ctalIyB/ngMx8qQGhx6GDOGMZ34=;
        b=BSQItZu+2Fynb/LVNTx5quOGaaxwHwRCOG4x/oXGZaaxEyoLUrhl8OjCIDS7mQuaBx
         J+k+IFnySblsAmpbYNgjco+mPYNjShlffrYwRuuVi1mj8f9AwIasASjf2yBBaP91Hb//
         GlutvdGjjYX50l2gPrCzmaF2OHVow3GLj81svx2Zq/gRtTexI0UhkgchEc7Y5O9QsPbN
         WOivzNvAOgSSaHtw7r6kl0jhFYnBtZW6nL8VfWafAEJjt0qrYdlJSEPvPCR1cmNXXMRe
         E9nsuOeSyIoZPV0mQs3GvT7CGoW+U7v6tXi5ixOK9FXNIJKDAtcxPkCA6mvn80bV9VZp
         SnBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsqTesi4Ui7HQsKSL3JpOxQ+0O6CWjW/9k1giafTXTr2jG0TB2Bxmlfc/5M21uGz49B6XRog44CcwplgM=@vger.kernel.org, AJvYcCXcrhuwR3XuGTC+u2nnggnevtBay2RC3fwYR1E2ABVHk85CODmBHGPfNEjCTLAWmlXumVkDkPxR4nkk7/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkRPeRECZLmtpuldISE/migZ4heNwZd85kGLY7HEIBMuQW9kCF
	bu2ROJ0jBG/uGpiK94veH3rnqeB59aP6QiihqZ1zNIGOnwLgZW7o
X-Gm-Gg: ASbGnct8GEa6PvGwwdK9hwIeKPI6xTJl3N0S6zZjXTO9mq8WhRzW4yv8rGvsORJj2yW
	Fu39zsLMcfMtHpMf9u2LVTzqEC8rsQ5kXUyKzznBse0FLMiPq8hJLf8Aodo0ycz4UhJT9SjlJdU
	keMh3im5YsldUtKSvOiqVzkK7atrRJslPpTN4Y3LDsdn22I45o/XHSY7xNTDqsqo5LOFV9ATk2v
	LqZ5Hx2OW8lJpbg0osFjoSP5LmsEHcXTwKwiYj1tLdNMjQaNCg5YmF7xXvM4JWIQW0y5FvDW7UU
	dvaj3uxT2EP0ZVq5yCkG0R1g6LiKxjd1NxdG
X-Google-Smtp-Source: AGHT+IGyz/zligziCBIZGPAIYSunhjrZEsfeQWDDwQFUxaK6trbuF1cbcW10AYYBkjl3c6Py+Raniw==
X-Received: by 2002:a05:6512:39c7:b0:549:74a7:12de with SMTP id 2adb3069b0e04-549910da821mr844873e87.48.1741335083861;
        Fri, 07 Mar 2025 00:11:23 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd148sm409886e87.139.2025.03.07.00.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 00:11:23 -0800 (PST)
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
Subject: [PATCH v2 3/3] ARM: tegra124: complete HOST1X devices binding
Date: Fri,  7 Mar 2025 10:10:47 +0200
Message-ID: <20250307081047.13724-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307081047.13724-1-clamor95@gmail.com>
References: <20250307081047.13724-1-clamor95@gmail.com>
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

