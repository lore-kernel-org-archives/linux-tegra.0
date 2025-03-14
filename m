Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5846F15350B;
	Fri, 14 Mar 2025 07:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741938407; cv=none; b=WHyW0FkHsGSNIbeWgeoFSPoRsDoIGgbCE7gczw6Jd+81fsMNo2uuR3wZrvk0eUzKqkabafS37YzydRGpRFsMJct7MwD7XNs48wvfHSRP2uD3uOhdqwJcbVO0ctr3uthH/hUvomO83XM8G3pYlAdiasW4nJQ+ozyHZ4mJ+20968M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741938407; c=relaxed/simple;
	bh=Iu+IoC/SaZp+TuEs7BCqIvSXg3WP8vKe+cvL8Ipo000=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHXDHYr/puQk5zcDu8bPaTihU1CDPXVLbS6uHxUzqS5ov25UyHR/MQ9lQIloDLauL9Ldcxo623i+Tf2uFwXTCam16kVtw8Xy7RwnfcBl9lvZVGN2QABH1Jt5KdxpgTNX7HZxwqO0JYfeaSy2PG3yVzeWbgs2FU8M7opMw9JmIz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCEkWHB+; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCEkWHB+"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so394224666b.1;
        Fri, 14 Mar 2025 00:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741938403; x=1742543203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCI51K8VaWEKXuABu/I9TMgoUc1pRk0SQFE9gjCcERU=;
        b=fCEkWHB+Kb8FhrO1wqlM/EOF9AjzOrxiXr6Pv1hUvvrco/fMijVifE8xFRHwhGIAu/
         Y0Kt439c+vvKmRJKo3rU/rrWE8lLZuof/x1Nep/fXeIan78xPfzgPObPeHAAFDJ18MTT
         iwT8olm/qf3DRkwyLYBSRM/HkwGMd364pwDwkNLKQIiHjj1wR8PtdQhZ7HWZ2ozVzUc1
         /cwA7mWlwQCwfjwtUZ27umuIMe9fM9O0BGv8K6MrNHQkQTgxBFPFXeqfEkjS4hdG40Pt
         LXunUbi6ruz5PUndDeGMogZytENelWICexAFl3sZKf+lgS0ZR0UlnXZecqwpf0n8r1Tv
         R56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741938403; x=1742543203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCI51K8VaWEKXuABu/I9TMgoUc1pRk0SQFE9gjCcERU=;
        b=Y3uIfiWOVaT9ljVkwS5AVV2VWE4Tzn1MYgX+qLwXLf1u5XUsLCUeT7TGTDq8QIwmI5
         L1PJirHRjazB2UlJ6AToEMy7OwKgGoU6xH/yC8efvIsgKXlLAlWzOCOT1OZpiK0VS7hU
         6eSgRnzXa5g8oe32rC0FEAtF5NIhNaNEtT9L0tuGdhqfBnVZw5/0+ZkIFgU3ZEBm+xYn
         NgFZCRx2UYGQ6TerWDKWn5D8iN8vomHGat48OyfEEXOztO57resUzRmijRgdxvCSVr6i
         v+wbO1dqw2G86Ot72I8/vklD3D+MfcFTx5uc6MWXrjxD4SRc+s9l6eyIDkgHIs28PvJ7
         +/8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9I2FL5KrlLrNdMxuyroCMcCGoUq+RMPNPu5sMunKcFIhlb6Le222SdjquCSEsN6QtH2DZteuD9+Vqks4=@vger.kernel.org, AJvYcCX66Ebs00lkiGjjHurHjIMPnSZlLH7/2v2ggtOqTxHH4UkAi6NzocxgkGVr7JWXJOSFGHs9DssSgq8xQJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5hxuJfiCT5Lk+vmb+AhSGpfuv+KapqH9yopiEOwCKVHsONR7g
	M32i4gdser3meaNDFUjzaTHALODlRJxiquoIaPlF0lCQZmOjSa6B
X-Gm-Gg: ASbGnct8sauMdErFB8MZOPp7w1poW7tibRsfaMHq/j7oUzCNk3P+qrsGtpI3kSE1I6p
	d5Uq05A4nvRY4vQzanVZzZcah8nEDaGI+Wf8GcQ+YkPJJaLx6NjQWPjMQ/b3zDEmMsmHQBQf/yG
	Remqtn3/qtp5TAeOu1pKvtX9WpB4qPDGJfQg0feyRhSbEYTORQf4EJsWgsx0KjkZqTe9NYQmMpt
	tpWDIn1N2puOzmbFsh7QzyId7Ia9xMGGCbeR3gZzPhurW/7PanTQgTcfMn2wgU/IJBhIs87vM7R
	20LmOAlHeJH8tGvza0+CUUn1BQ9rlAwhruLP
X-Google-Smtp-Source: AGHT+IEZUJSdBCZoTTsD/Ckw1PT3y38uoAFXydlwaS/oDrg/NDS/dzzELAxY6TYK6jEbLiNsxilVfw==
X-Received: by 2002:a17:906:c10e:b0:ac2:cdc7:fa61 with SMTP id a640c23a62f3a-ac33027c3f3mr134288566b.25.1741938403240;
        Fri, 14 Mar 2025 00:46:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a9bce7sm185498666b.164.2025.03.14.00.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 00:46:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] ARM: tegra114: complete HOST1X devices binding
Date: Fri, 14 Mar 2025 09:45:56 +0200
Message-ID: <20250314074557.16367-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314074557.16367-1-clamor95@gmail.com>
References: <20250314074557.16367-1-clamor95@gmail.com>
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
2.43.0

