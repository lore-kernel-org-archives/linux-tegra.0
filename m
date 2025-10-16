Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB3D2FB084
	for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 07:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760600546; cv=none; b=HX7ptMVqQvv+bExTQQSkrXaaOrWJXW9PR+RfW2kCsXfHieceEoqrZhFpGAVIomdnq16v255c0NzhcD1YAcjU08LpAPTDsxucDPAlWfu36fx7S5NY2Ahyc9MkpSJ76G9s0oukm7uINDwkqQb8Aoig1gA3PtEriGdj0AWT8hFtdfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760600546; c=relaxed/simple;
	bh=1GMIgj9fa8qcijUI+RA/PiInAoio4qFaHVwg665u70Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETtKi/aBXh7MUd+H4ktGrToEiUVTf6oVI3nvI4jo1UNCpUbteonMBh0qN9dlRwvqhL04rBsYl5T+EgIn82dafQGVGzrVsObc1tvPKn7BBRWLXkCnypDno/TuE8RwNOvYMJOBye/DM5vdUPC0B1+EGQWwgMqZSTHpaFiexAxmUoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L53WD5cq; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L53WD5cq"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-376466f1280so3296831fa.0
        for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 00:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760600543; x=1761205343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ia5UihKP5vENKa1ZWsO4hQ9tEZ1zR6aQObC7qlN+yRs=;
        b=L53WD5cqZkf3Grf5Ny5ixH06yJZ6Zd6xcrPvucaISKp5w0no7oRZ1ndgWpoOBYsPje
         gR3LzzUvrHoDRJIj57OePmoYD7xYa0gQrZ0Zt70+ibX7DcrwLJDZ6mFAa0JqFWcwHnIZ
         5JswRRevK4L0LmiNuRzP3Wi6V8Tpqo2L69lQXsPJ808X3L33UzhD3FcNf3S2TgrrMp8C
         sDTi6eaTDRvU7EtzCu1hMK62RjquJ2HS1hrUMCAbzNCiHVWyVrolJE4wadKHkYuntqyk
         QguClvj3mRo1UpCodhYwsIWRx3J7SP8VtNQ+bjfIVsxd5RKJ4vajycvMsnW+aFpD0pA3
         qT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600543; x=1761205343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ia5UihKP5vENKa1ZWsO4hQ9tEZ1zR6aQObC7qlN+yRs=;
        b=PkrLfPL3VMbf+kfSNjyWn5QENyISmdOGffWnBgrN/5vel9OgEYt4yAfMp7Q8LxY8oi
         pzsqDNIH7JXf1R3wQD6CIekK5IhPezfubUN2imhyFe4nvLrCf6L/LF8Ya2fpSmDhrMIT
         z0irgnIglW0Or6WwuF+W03PWWz7ZSzwwWOBwpiZ1cd91+uqF2SGlm1NOyZFV8aI5V7J9
         O1GROoZ4mWyK+2lvcntWfkQ7jSzESjzNvnzFLYGnQRVNHhAkelX6sPHWqcowPMrPqm6P
         SmrRF/wPeORzJ7q23+ramM/yBKcKeRKxll+2Hts+tNR09HOUlG8NBP5i/dPX07sqNC/5
         +D3A==
X-Forwarded-Encrypted: i=1; AJvYcCWJuZHwptJopvRr9qG+t670pyxrdAB+eJmxMBunumGyKF1oef2YTewf8K6ZTlYeF900SO130Zm6i7C38g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7B4e3Ptv/8rBq6IGLK+vVZD6rWwnfZB1obUeymQHm/QNgXKhA
	+Omysa3VbI1ZDc7ERILy2KR2ZZStZWlsOQSqy2ithKqvCErVVDP5600N
X-Gm-Gg: ASbGncvQoawzkqOT0nc2hFApL8e41XY9CKHsxhzuzHM/tajMpBEjQwel4ywB2M0BJ3G
	+N1Vfk+s+1dLxnoEdKagZy2YXeDvdE63irSi0fnxOBNYwlVStu4gP2YrEpOQ01sfpHgizxqd/PR
	Y/1RNGUf56GiqdL7Tb0O3+kWryQDxJVYediskDAp7Ur2A0z/Xvja76ROEuGWF0OE0Nd8FHCGq7L
	yEu2SBQ1gxNUfYyR9g4m2A+5zvVzkofNko0eEbTSnY9qGjP21CSKBULkcLmp4kpn5IIBw/xlWKd
	C7AByFXVoGhZCCgq2r9ymzhnjedPG+DxTvl3tTBESek61yS+IVJo9hgbBFAJHLD25s0t1Av8G56
	R41tLVjgqI4zP+FUZXxvkZjfHUHFzDoOUv7v5TnS+r9AQ1XpqSQkPMH6fIE6FL5FSFrI=
X-Google-Smtp-Source: AGHT+IH30WPk5mTWKUGkgpDqPD9jcWCWyb5Rjdc/LS292IWzNiQQP2senhWiVMmYVrWHo213ylX7tA==
X-Received: by 2002:a2e:bd14:0:b0:372:9d94:8697 with SMTP id 38308e7fff4ca-37609f05411mr92467611fa.44.1760600542660;
        Thu, 16 Oct 2025 00:42:22 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea14d46sm53226121fa.34.2025.10.16.00.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 00:42:22 -0700 (PDT)
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
Subject: [PATCH v5 2/4 RESEND] ARM: tegra114: add missing HOST1X device nodes
Date: Thu, 16 Oct 2025 10:41:50 +0300
Message-ID: <20251016074152.8759-3-clamor95@gmail.com>
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

Add nodes for devices on the HOST1X bus: VI, EPP, ISP, MSENC and TSEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 64 ++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 4caf2073c556..8600a5c52be9 100644
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
@@ -149,6 +188,31 @@ dsib: dsi@54400000 {
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
+
+			iommus = <&mc TEGRA_SWGROUP_TSEC>;
+
+			status = "disabled";
+		};
 	};
 
 	gic: interrupt-controller@50041000 {
-- 
2.48.1

