Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3585F2ECE87
	for <linux-tegra@vger.kernel.org>; Mon, 15 Sep 2025 08:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757923358; cv=none; b=POO+aM2pjc3laHbROaHwCn2g2q0uscyAqa6onegj3b0Vp0/EJj33h1lcqr0S7owgb+MB6ZuOOHawwRWYkobxCAk6imtR4rasNMh2VT+vpBCU0ehFDumYw/x0JLHhM9m5heWf0hCDlZeUGgbpEVan341A0iKL2v9T3z+DSs6O5sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757923358; c=relaxed/simple;
	bh=ZP8BJdLxVhqepTeoAprsQQoaHGTUWulf0MMPVFLawG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2jEWRlWicNkYIT6sf/HtnNQtPeZ+qNaB8IiYhYjKjnDsMebZ9luBeix9J3X1Lw78tBR9kxRTVBG+I6dzeuXX61yOjoC5ncHDYieKnbM4rR9++WBwVZj9e/qfsuiXZ1HL01OUyppeuHQlT1nZiUKhKviU+UbCmu+9AAQ1010HAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+fuKF7w; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+fuKF7w"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f72452a8eso4513225e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 15 Sep 2025 01:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757923354; x=1758528154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q6qzvg9zj4AYnHkCVKkeQvxjf2xeDhmuMq00LQsCh0=;
        b=c+fuKF7wx+JJzb6++e9BxCG9/jzPP4EM0AjgBnzHrrJRbzLoI8iLp3tPeqOIOkbb+s
         kTxvpg9VrJ9xxdG1QjKGO/7Fx02F6cUD1Nbv43OtAM6pan3MzQ8J79G/QnzAGDZXSRK6
         4iOV8pfFmFF9CiYmZzfmgKIH76hFrmmj71cQq71kbzjhWLaOM1Yq2+GHCZxoqRwZOckz
         cIWJLDxCKnPx/3ymuIq309nW17SmKX6smQSCphfpmvqFeOvewHfQT6pl2VJR4p8roFE0
         ByWmcmwzmG5dDs82qVPS6Y1b8l7hdZerHCkjh4hC/0KxRYoJudeaknz0Td2JmkW4vAOh
         dCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757923354; x=1758528154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q6qzvg9zj4AYnHkCVKkeQvxjf2xeDhmuMq00LQsCh0=;
        b=rHFAtIL/gIxjAZR/EHJJjlLQH7N2GTivenEzI1Wn/ZQDMPhoaJN0qjAiKDSKbrtFei
         OE6NUBaMV/aD0ZLOW+lgzT8gANO+rUBAg1Kpg5oiV/03O1UHjeX/iZIFtrC22hxWbR9y
         cCrbG+N7dI3X9zu487Ct88WKwAXqA8ueAOLes/T6D28PmuZ0R787MTTOpaH10m8cR68/
         oaZGlVeSnCNj4UQgUhnuZz4aS3X2DrtZj6nFBS9uguw6zuA0a88HxxZ9+TvngsBVZh68
         XFxHqFH7pueH3xCj0WPWWZHdEU/Zz9TasaeXD11bwrvKhEunI241mroBxFgOH9Nh+v+D
         fEmg==
X-Forwarded-Encrypted: i=1; AJvYcCVU5neJCQSIBfbw4VZFWxQNNyiHI+eZfgb1qubJZHF9hYFYOA4rDCpeeAPnWklkVlai/lM5JvcwtEvJrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIbIbb4eJk3QVKial++H32S1fsO6MI6wPh2Hgcl7+P1kwewAUA
	Ul+kXHAj/NTFonCFxs0yRENbbJ8PCXVv1KfFHeobpdS8KuHhGX3w703h
X-Gm-Gg: ASbGncvaRtM3v16Wj3wStA0CSAWP619TJS8kEd6JpP17+i9kZVdi2Q3PPFhVc7kkmbR
	pDFmlR347F1eFNuZoDTHwjUZ6J98D/lrJpEJYnir6W7nqiZuy7BKJ7bFoRF0xG86LJBZhT9MQet
	CzLAP44s1YYj6dlH73SOAt+j/IJUNfURpF5CvKHSybLiM/uvC3OkT9IiNO9z7F/qu6wCe8/55eF
	Jag3R0N0hkTIVgxfbRDYwbPkaaL7yYZHhuZq3VcNo+EZyRwGNS0NjkdfzyFtQuAqPGgiT1lqQ8v
	BpTKHjl2ERhtNHoIRilUJWdNyRQCiapiR0CBWL9Z21QkKGgh4ghN4AQkGBcV/DmqBNi2ONMJm56
	tnCgCDa1nDS2iSR9/4r8MgEMn
X-Google-Smtp-Source: AGHT+IFZHs9D3Q3V6b7uZxWsk/CxcN0Yj5+tr/3CYQ3DU6NoLaQn7oKgyUGIpmZVSIsX3gAHlFow2w==
X-Received: by 2002:a05:6512:79a:b0:55f:536f:e89b with SMTP id 2adb3069b0e04-5704fd772d9mr2486863e87.53.1757923353985;
        Mon, 15 Sep 2025 01:02:33 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460dec4sm3392381e87.103.2025.09.15.01.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:02:33 -0700 (PDT)
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
Subject: [PATCH v3 09/11] ARM: tegra: Add External Memory Controller node on Tegra114
Date: Mon, 15 Sep 2025 11:01:55 +0300
Message-ID: <20250915080157.28195-10-clamor95@gmail.com>
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

Add External Memory Controller node to the device-tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 08f81a3d11de..e386425c3fdf 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -195,6 +195,8 @@ tegra_car: clock@60006000 {
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+
+		nvidia,external-memory-controller = <&emc>;
 	};
 
 	flow-controller@60007000 {
@@ -591,6 +593,16 @@ mc: memory-controller@70019000 {
 		#iommu-cells = <1>;
 	};
 
+	emc: external-memory-controller@7001b000 {
+		compatible = "nvidia,tegra114-emc";
+		reg = <0x7001b000 0x1000>;
+		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA114_CLK_EMC>;
+		clock-names = "emc";
+
+		nvidia,memory-controller = <&mc>;
+	};
+
 	hda@70030000 {
 		compatible = "nvidia,tegra114-hda", "nvidia,tegra30-hda";
 		reg = <0x70030000 0x10000>;
-- 
2.48.1

