Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CA62FB967
	for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760600547; cv=none; b=K5fhCXiQUXRbGJedlS6VwG4lLkXaserUxc31/Q5PFV84+WiK0HW5akEFJGsh+1GOPCaonDwx0Fu8lPJHwImjzIM5Q2OemGjWzEW97CLCK7qGbatthcUE5J6FeOaVK/Bp6h434DkxfYoTykiFU4G9ysAXLBLuaNYYhMKM0w4WhH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760600547; c=relaxed/simple;
	bh=xB0LZwMzhZT5j2b0jjsQ2KFZrgTIo41/jiusVXvcdes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MS0h3MxxCrpItF8U565TCgRzTFo1ifPF2iwfLsr3tisxfYFFG93nfmXB0gnLAuXnTV/a+Qcf2OSbfXnIYQzPelD5RYM53ZQRpU95MJGWFFjJC6e6nKpWVZrv8aohZyU6aZ9iDnAHLuzBc4JZI90K1vFR8GLFErjbNqicXhfENYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLCFyX/C; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLCFyX/C"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-36d77de259bso2863951fa.3
        for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 00:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760600544; x=1761205344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtovmNeUjM/Ta3qpNFjKfyT/fym1ZwzATHtxvDM0Z+Q=;
        b=mLCFyX/CvWF7iJbpNR6LtsGMSmXNsBXtOP0rToZOH0SXChJFoAfLVxME6t6GbaCEVl
         gDwBk80VKRnF1UgPc9jBqYviHWL1Mo/F7gkNphuszXUklAjhv5+O32vBvg/WpXjHJiXa
         fo+R27mRzUlGOXOxitFMz5nQ2y4WvWwk60ticGe1+CbVzmyb95XszSJBsji06/NX1MwL
         J18+Eo7vK7Me4y6vZacJiM8Q/c5hHwSxFVSVKZ0K1TPy6vy0VPek/mdB7FwEluU3FnjR
         wf2EybZfjYg/0gvJuw35NPO88E032vUZ32GyVIYX6Ca1HVSyjmnp5mH+x8i+ce4CIigS
         U16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600544; x=1761205344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtovmNeUjM/Ta3qpNFjKfyT/fym1ZwzATHtxvDM0Z+Q=;
        b=TlXHPGhdaMQVVRHzNVVZkNSKYcHiDG5FKSYXmCmpSX5PhJr2REmg3xAwYr3CItsVLW
         tLe6micOEgHFesMWYi1zckBeESRDFZEqtFYsIHwmdfUb+HhYDAJ/47I3o5NJO9a6uso1
         y/8xKfO5A7UC6hmA9yf1EFVhzwNGojRWtWawbPpwHOpODpiZAXtlXZ5ParoDujsxv4VJ
         PFVOGTeTbIl2VaKkXlkJSn0e8lIBJQ2ybXfccSHUp6+/lfhAW42vMqhTIRZygNwIwBxE
         Q84b2XCZp4JcHgPd0WCLFd4Dt6febLfR77CfHTIUdhn09SsjMNcEg3OZeWOu+osHcDQU
         I/Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWQrXAF1C3VFIWww90G81JLef/mcQ6sPLcGZxJHy7AdExBDOLt4MikLneJ2o+Kh7AOnkf6yfZ2OGrcSiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7//i05N+98d1R/9WAGMYOvwNlxSu5BvhW/Qki1WcrJNv0M32I
	zpkcS9bipxLfjsyPCefrjGSbB6EaXIOLhZf4PjloaWEEv/qMQTZXD/fdwrl09A==
X-Gm-Gg: ASbGncvlHMIWbZO3AY5myXVwKikzHK+cFIEa1wdAAGFNtot0KwmVg1T2jtC5kOqDzZs
	c7N7szYb5DJZMucrDyNATzqKIamoI5DZI7QkHLBQSmeD4NGgerC9mrF62FS+qGPJmTtGUpjvvzE
	+gA8sM56l5CMV4Svgdo3YNVeH5J4KyIPAzswoXHPClFTCJC2bIkHepLVvpPDsij6Lp6hLsQxaEz
	qKcC09tMTmtjBa/QqveYHGXHEdLtVLoFr6DQQhzkFV8+QL2krSvrJ9VUSsnvkFL7YFQyHikaBd2
	JdP0rtqhKXLIG1ZISk6nsGm8xrW5ZxxshwmHJ60EWxv5seF8er8G+lTVzYptsu/LgA0hHWAGng1
	dbdKZ/dPweakKqLW8qvfvvDwc0rdgypUKpv+vyQ85syIz2Hmfi7JE1NHxmkyuwyKbO20=
X-Google-Smtp-Source: AGHT+IFbllf5hFrxaT2o/OaVZ8Ngh/7DhF2hoeMDKN0lK28m8mzh79yF6GtziaC1JfPDf0mmnNoccg==
X-Received: by 2002:a05:651c:35cc:b0:36a:a8bb:9b81 with SMTP id 38308e7fff4ca-37609cea827mr90279441fa.5.1760600543533;
        Thu, 16 Oct 2025 00:42:23 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea14d46sm53226121fa.34.2025.10.16.00.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 00:42:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4 RESEND] ARM: tegra124: add missing HOST1X device nodes
Date: Thu, 16 Oct 2025 10:41:51 +0300
Message-ID: <20251016074152.8759-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251016074152.8759-1-clamor95@gmail.com>
References: <20251016074152.8759-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for devices on the HOST1X bus: VI, ISP, ISPB, MSENC and TSEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra124.dtsi | 64 ++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra124.dtsi b/arch/arm/boot/dts/nvidia/tegra124.dtsi
index ec4f0e346b2b..ce4efa1de509 100644
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
+			reset-names = "isp";
+
+			iommus = <&mc TEGRA_SWGROUP_ISP2B>;
+
+			status = "disabled";
+		};
+
 		dc@54200000 {
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54200000 0x0 0x00040000>;
@@ -209,6 +248,31 @@ dsib: dsi@54400000 {
 			#size-cells = <0>;
 		};
 
+		msenc@544c0000 {
+			compatible = "nvidia,tegra124-msenc";
+			reg = <0x0 0x544c0000 0x0 0x00040000>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_MSENC>;
+			resets = <&tegra_car TEGRA124_CLK_MSENC>;
+			reset-names = "mpe";
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
2.48.1

