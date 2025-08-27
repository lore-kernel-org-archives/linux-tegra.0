Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C082F83B6;
	Wed, 27 Aug 2025 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756294678; cv=none; b=QA8WZf9jeRqO3unfVPT5AsfiIncZH0UNTnKCbwrfH2191bBYpZNER+A19n4gH7zMbL61D4tpUkGdnWcHaQXXjh2aGmvjtl4FzQXfOYf2TyYgQzom72WqoUmdS5dQaX+AZjywokzJk65bk0nVaUyBXhCdQTYWrqJvpHWxG6vzKtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756294678; c=relaxed/simple;
	bh=0BM6a5tVlpXoySO6CDufYhvNfGNWGGmMuRt/vs7BMnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dhlWMnlirdWupxun4zPe0hysabrTUyqZ6CAI2o9el2pggaxh40Bfx012xF6Op/yMsvkcaNZz5UDOU0geE6zfZwIJKLZggbi593tuj0WyznHYH2B1Pb6qs0IV87ahIbrlqEdqH3mcUX+J6xyzMEQRJhxQ43iBz6BZ44Vmz9NJeXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QnVLKcHV; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QnVLKcHV"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afec5651966so101001166b.2;
        Wed, 27 Aug 2025 04:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756294675; x=1756899475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzgSUTlrSxfIZ4UAmt/mbLdMHIlLyVqpzaUHi8+MHpE=;
        b=QnVLKcHVIAOTeHQ9rUubOBsejRTXzz9crwRZOTrksjh/8tlqwvQ5SLimr9qVZn5FG9
         YOPQAVQWqIJ09F4O1tKWeqxb5q0hl8Dj5Fs4wTsbfS8GjsEFMcTuX/WYHzz6AqkRZaWS
         Zm1APMslxeVMJ+CO8xh/N3FEncALeyPgAQA2pdgNt/f2NbPgq7cj6xowqdx+XbGP+DNN
         pSFqlkY9rJtbiqODtbhdziSZ1dGyyqybLK06ImKPmhtdoez+ztphWEYZLlP8C7GclKtL
         sWjGePleJoO0nKK9blRtXe/6je1PPjlPiIpDViivcxRteEZFaXkK9fM0F7qpoMISwbFC
         H24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756294675; x=1756899475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzgSUTlrSxfIZ4UAmt/mbLdMHIlLyVqpzaUHi8+MHpE=;
        b=HpIUIahUefs3yLvtxSW6Muiyz8JjhLzqA9/wIDmuHMhfb+AGf9Q8JaBPLckWO1HarW
         ODjJdQO4Qcyv57Qf8dmDZI7G5ZY/NhydXugQY1ZIDTot6hNFg4h1r+EJCIpiE1BDsK4/
         pAZbXiRhgiQnScciAgYK2kPxllvYXKTWsK9cW5djoqeM+HX0IryebMRGndOIvSkDzStq
         ZPxrXiVsiDtLXFyjX5N6HXvtaeHIB05aN0p8fK84zbxYuK3Hea7oQy8mhKjA4zcYD0CU
         OGxs706qn3Q+jWT3pbXL/yqO6zuVWs1ivDECsiVKdLKii+7pOhTTOTED1tdmkyLpt8hg
         DXgw==
X-Forwarded-Encrypted: i=1; AJvYcCVx1RwqPpW6bGertp2T1rAHTAcwHgqF/OP+JiM/3tb2pxLmM+qQxRpNz9cBpQOTnVGhsEzQVj1EiU9lQl4=@vger.kernel.org, AJvYcCW2j1D3oC6W3enPhwMthiu6VsoICS5YYunx0p755l705Ujkp6vVd+Y1IpmyaOTKqu/Chda3e/o+QoM65No=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoHdg0Kd9wMBmPGm0eNv/NNPLmd1k/Y7shlpVCYs+ijo2od/ku
	kD4izJe4Kk8Vjt67953/BubPlHMay63pwjt6Ly9B1TiydUSDI2y6q+Cb
X-Gm-Gg: ASbGncsJ8WPsALTkorcHo1asnK6fVokp/hGqVBWVRxdUr0cbjesnNEkgIBSUVCeIh9h
	dNM1dgkwXq+ihgxTc1RCzzg/Xiv3IGHUmQZFBisMWKylkS4a/xG1oIMcIjUvkKWnNxOryhEUNbM
	te3XSeSEKPyGG+LEy/mIe2JKEQ6+5XovcMafMVq+8fhHo1x6l+Ow25G76YBe1YRoMP/O/2TQ6mY
	R6r4WaDmIw9nzPb0dWdf9x6gNhoAg/nc9HpFunjZVUgU5hfEnSlXAukmzuhZdNbpVk24G7jvUZ/
	0BwNCaItxOG3uXpdQ3PpD//UaiECaaGv2G0J+E55L3M/zUP+abPHxaEUGfqlB8TbtMSou/aMteW
	2fyoPh15/Y4ZJaCwxuzRY9Ezp
X-Google-Smtp-Source: AGHT+IHmV/b/l7DbQEZ0YLnIU8lezagjPNFBUYqRSXiwdIw1+zjOxJsHeZJANLyLGeqyAvNjOOkckg==
X-Received: by 2002:a17:906:dc8e:b0:afe:cf70:322c with SMTP id a640c23a62f3a-afecf703807mr57326266b.4.1756294674869;
        Wed, 27 Aug 2025 04:37:54 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7aad5d61sm675607866b.105.2025.08.27.04.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:37:54 -0700 (PDT)
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
Subject: [PATCH v5 3/4] ARM: tegra124: add missing HOST1X device nodes
Date: Wed, 27 Aug 2025 14:37:33 +0300
Message-ID: <20250827113734.52162-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250827113734.52162-1-clamor95@gmail.com>
References: <20250827113734.52162-1-clamor95@gmail.com>
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

