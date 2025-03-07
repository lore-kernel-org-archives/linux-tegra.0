Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050E81B86EF;
	Fri,  7 Mar 2025 08:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741335085; cv=none; b=R0Sf+0v4uTanMiJQNH5Wzz3hSE+HuOJCeWIzgsondwOEJzwhFpZXQBn8d9wFWfM1OMjNG6suwYPN5cSAqos4UVL0C2vhJvpwiRC+DgV9oGp2/LOHhJw1A+ag93n10QHkyf69WHdOH0pU9Vf3b9MJLixsYT3W/GwUXz64E0VeRMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741335085; c=relaxed/simple;
	bh=sf8p0KttEUVQE3lBgnFDwj2gLoAYZzQQyiG9an5MtkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hzRHY2PEhLf9gH+7dvVc9rkl87HdCWdt4SwG0kReUXctuIrOnLxL2HeVEaFC+OMRE4JNkeUMDcz3L8e0Gb1XVUMM2nbxvr+1sn+In5xCcKaiiyCJ4ONqTwWBBtzsFPoSvQvfL6ePnegWx7F7LUtxpfIr3R8NsI2DFTmzLdorbik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+PuFeUI; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+PuFeUI"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54963160818so2092207e87.2;
        Fri, 07 Mar 2025 00:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741335082; x=1741939882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atUUcGitO5zcMfRkhNNcB/8FO7siRaEtkDBQfLngqWc=;
        b=c+PuFeUITgalCXsvxQtys5vdXVL4Z9FW7CLBPQj8WdWxTtqvpuAKRIs+AbH8HtIJHq
         UvILYDSZoaG0AAMwbKVZfaMLRkG21Z5cx2WDLe59fEed4E0fuTduJnNJIe5TpkG6Pv5+
         LltLUQXsZBG0deHLNqiL9ENE9AzTSVEjJtCQumrPRJlvVuNxA+8wcMoFS1OTzfq+aCo+
         z9Jaf+EXXXBq2+HCeY5u3Gdxfr/DSX0pxi4aZ8IdgNr3jb2iknBtIFFen0m7aLRBg0+m
         e86rFOyhRZKwmdum2zXf2wMRSaa45rswIxEfZmllqvovtPsEYJZaYGsX3IzaAuEfCjJG
         xsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741335082; x=1741939882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atUUcGitO5zcMfRkhNNcB/8FO7siRaEtkDBQfLngqWc=;
        b=eGdDh/Kw42KyDNFqkhlQRafd5MlKTJQzEk5VT36J1VUHkL8YlDaVeMf0PPyS/5/U8H
         juRnVbHkBYTF5xWXNOw+4HdAcDscJRg46AVz4iExUx1WSrny6/0K7/P74ESU8GUCMNRA
         +NZhgqYBGT5Gl0cCJom4qkz9tNug/3L1UPRHH9uhgtakoTDm9e0o9ofC2ntgy1QIlRFW
         Q8xhb+J4tBXuHNoKff8FEVkyr1dW01zqaCt+WDWVQSHdrQ9fKixRztAoQQYHmc74TB65
         GQ/gI6RAUwBKhO+RTKw+3rY2+MlFSh2aUBmPpxbIq1rxsVXr7WKzRalRMimQc0KOMqEx
         NkYA==
X-Forwarded-Encrypted: i=1; AJvYcCUajzDBZzDR16pLaP0AYE4s748qlLKpMMP4z99qP2ZZo/rLPx2c5RToTN3K8a5jijzNlcIGoWUcQkcduG4=@vger.kernel.org, AJvYcCXrnJxLTYG5leEzRKfGZfIJLySV/vLRz+M/dmCWEpdvlGzhQRQs3XZHGPXsyxFzbZv7EMzIPB0g5+JEOAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxByCbiVeberh9ze9qNHifihTS9j2Zul1SQswmo0Bcoy4E0VEG
	wCtbel6Bx/orj9h5WA0KSVW0uuuwVRo1UGc6cHDnbnI/Ig9mEltc
X-Gm-Gg: ASbGncsByTct33ukq376nrBB1xI9CDMza9QDCe3TY7w6C5ogCAYbxD/xPm3Sa598how
	sIXGCdy5Dp1e3hJHg01VZQuflJfWxMsOLNU38kmSwSJrHKXub41wBRZ71O+PYCTLVSWkw7tE0Zh
	nBdpk4VE1Iyww/hQP3uH0VOcEzuB84zQea97DKV317nXgz2fjNtHH/PVHUUAIIF2UdWUPFRco8j
	fEksnHtu4C6XIR1s9TwsmLi9jWVnh0J7dNb3zn2oAhy/oP7bfnDj2QcXIWUJnu9xTaDXl/gsBzT
	q/J4tjWhBpJ0j/7kiNA7QNeKQh3KWbFsj4q3
X-Google-Smtp-Source: AGHT+IFd49NtWI0b9yr8RZaxMEcYtF2OIKNlvtdykvzB3eMTfKzC7yvDRj+ljGFd9MbNJlQ3MK0uWg==
X-Received: by 2002:a05:6512:1255:b0:549:893a:1eff with SMTP id 2adb3069b0e04-54990e672c0mr954798e87.24.1741335081921;
        Fri, 07 Mar 2025 00:11:21 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd148sm409886e87.139.2025.03.07.00.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 00:11:21 -0800 (PST)
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
Subject: [PATCH v2 2/3] ARM: tegra114: complete HOST1X devices binding
Date: Fri,  7 Mar 2025 10:10:46 +0200
Message-ID: <20250307081047.13724-3-clamor95@gmail.com>
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

Add nodes for devices on the HOST1X bus: VI, EPP, ISP, MSENC and TSEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 65 ++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 4caf2073c556..e2623a0629d2 100644
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
+			reset-names = "msenc";
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
2.43.0

