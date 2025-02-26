Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA5226FDB3;
	Wed, 26 Feb 2025 10:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740567403; cv=none; b=PmpmZ87MtuS0IjGlUlWIG+RqFx7GQQxhK9pM5bSQ9KdaM5Uqcyhxdmh97oHjxBhq9TCsNm3knZzVwm0v5zzuVZ1aI20kniH09nTe31ctVgY5GKCWbE5eoG4+5W5kkBkysdiRcwMEjBV6UX36B8hbM6su9gvFnty9H+x6LaRBW38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740567403; c=relaxed/simple;
	bh=viyfHVb/E1Ba0s0NsHkwr5VyzwzGLFcqXSq04vMdIk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=huZD3cMf3/OFfw4YwYov3RT7uyvewTiNTNSrA+mVDhvlG7uz/9uQvNLn+mW6UKw9Y4coN+9ZI9izyPLvkc4BiYzL5txmuQQD75Mbdpa+g25ezbI8rvuwMItpVgUrHkD1cveNCyHaWWLkA0c4n174eZADgJpsfuH74wUI8dGgQL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LX5+g0pT; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LX5+g0pT"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e0373c7f55so10191370a12.0;
        Wed, 26 Feb 2025 02:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740567399; x=1741172199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNiTRJJda2XpvUJjZ3lOz286TxZ353z8vRRkfKglTz4=;
        b=LX5+g0pTLAcudwXfli45wJVgRyYkdrc5/GSMHEzeRZSJw/9nsSv+R2WIU3ZnV+tMn6
         h/wjExN3Bwh9cilxFz0BlFVzypPZ/A1qkL1mjGqN/pr0Sj3hHZ49wHCVQSJhKjvcUhob
         JsDFkT0HUVnKDfBNd/beP6Hmz6GZSHVYdsGt+fvGKpJdfDykxH+oOnEaJdOIMDtNAZ7l
         XuiRbP2x3q8SAc7Z3DskPzH37EzEF/eEdY0/Qez89/QHPN+LNPMwZZXC039M59ruS+zc
         p672VnIbenS3drAlED0IDjzk4NqKnKBQGfCC0ciKvAUqBB76z58RHC2guI/jVfBdgluR
         3SpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740567399; x=1741172199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNiTRJJda2XpvUJjZ3lOz286TxZ353z8vRRkfKglTz4=;
        b=D5AGaMr0D+aDiRCKyKdS5ZVXHHFFAPrU8wqKrX3SgbT+pNKPFeKpAm8Tn76k5Ql+xt
         lDqb8UQZWdOY+JhadpoTpOn8OYuU1wjvaPRXBGIuFDOVyYgM1GH/PYrtW1OWRNsJalDe
         wxlSdztu5//EoJILrWTmN0aR7FgpBzCBR7D/YA3j8BCFR/UeC3Rug53ji74gqh5TIG0o
         JysiJs+L0FX8e25dP3qsdsbjQRTBpaVSEYXvlVctRo0YfzbEqiyfJ3SJzB9JyVM9WLqD
         wLRuQOS3VyirFijCcHotIHbvRG5icsBGN1VFwIaNSvdzDIdEA16IfHEFS2SkTGtMQ+C1
         iPTg==
X-Forwarded-Encrypted: i=1; AJvYcCWrz9GbDBgxBzxDGwxLM8+G8TbISRSPfarq++ECKPm8P4MtIyWRtfeEXxkjGNjymCSleEGhN3I0mpKdiYc=@vger.kernel.org, AJvYcCWu6YsNzU8ROE7/8NK8rEkulF0lvOEaicJyWeyfIhZOQRDLupByTkNh2d8AuE4oq+p9YflcMqSSw2WoAIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaRSD31bifmX78nIEs234H2NeA7h5W0NIm0g8hBrGTXf47hhpI
	ycJi3yD1IjqAYOCWGj64s0R89u5XK43TMA6GM69PGzCp/Lg+rMGo
X-Gm-Gg: ASbGnct8qvp93d0ZTkbhEzlkyvsN49EJJiddCAt1u6tGLQkowCIL25lB8he0GtOsOVT
	6NgpgNdF2PsOG8jgmq0VB/pKFMQHljMu77O9MzJP20WnSMpajgugyN1vawEzHyk7s9CXpj0AD4w
	EqM2Gxeook6ECHfbhumVIifEqssM31cUk76KrJJAOH3J+jPd+m55wxFZjgp2pFbHJY67O0lIV3u
	uiaoGH177Vp69Ge1Ihi/2rfd4TJzidpCjwC1rlhvHClsQYaIDF9VEMrgUNMG5ITqPd74pUPMfsQ
	UiTd0+ho+baT50Gy8Q==
X-Google-Smtp-Source: AGHT+IGuj34Va1RVaeqI6nZ2rqnBBXrOvlpnzoCYUhEEXlqZH+L95a1XbSa69/1jxtXVliOPEDmL7g==
X-Received: by 2002:a17:907:7706:b0:ab7:ee47:993f with SMTP id a640c23a62f3a-abeeefc4d28mr299721166b.47.1740567399304;
        Wed, 26 Feb 2025 02:56:39 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205e53fsm299771266b.159.2025.02.26.02.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:56:39 -0800 (PST)
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
Subject: [PATCH v1 5/6] ARM: tegra124: Add DSI-A and DSI-B nodes
Date: Wed, 26 Feb 2025 12:56:14 +0200
Message-ID: <20250226105615.61087-6-clamor95@gmail.com>
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

Bind DSI devices and MIPI calibration.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra124.dtsi | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra124.dtsi b/arch/arm/boot/dts/nvidia/tegra124.dtsi
index 8f1fff373461..ec4f0e346b2b 100644
--- a/arch/arm/boot/dts/nvidia/tegra124.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124.dtsi
@@ -165,6 +165,22 @@ hdmi: hdmi@54280000 {
 			status = "disabled";
 		};
 
+		dsia: dsi@54300000 {
+			compatible = "nvidia,tegra124-dsi";
+			reg = <0x0 0x54300000 0x0 0x00040000>;
+			clocks = <&tegra_car TEGRA124_CLK_DSIA>,
+				 <&tegra_car TEGRA124_CLK_DSIALP>,
+				 <&tegra_car TEGRA124_CLK_PLL_D_OUT0>;
+			clock-names = "dsi", "lp", "parent";
+			resets = <&tegra_car 48>;
+			reset-names = "dsi";
+			nvidia,mipi-calibrate = <&mipi 0x060>; /* DSIA & DSIB pads */
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		vic@54340000 {
 			compatible = "nvidia,tegra124-vic";
 			reg = <0x0 0x54340000 0x0 0x00040000>;
@@ -177,6 +193,22 @@ vic@54340000 {
 			iommus = <&mc TEGRA_SWGROUP_VIC>;
 		};
 
+		dsib: dsi@54400000 {
+			compatible = "nvidia,tegra124-dsi";
+			reg = <0x0 0x54400000 0x0 0x00040000>;
+			clocks = <&tegra_car TEGRA124_CLK_DSIB>,
+				 <&tegra_car TEGRA124_CLK_DSIBLP>,
+				 <&tegra_car TEGRA124_CLK_PLL_D_OUT0>;
+			clock-names = "dsi", "lp", "parent";
+			resets = <&tegra_car 82>;
+			reset-names = "dsi";
+			nvidia,mipi-calibrate = <&mipi 0x180>; /* DSIC & DSID pads */
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		sor@54540000 {
 			compatible = "nvidia,tegra124-sor";
 			reg = <0x0 0x54540000 0x0 0x00040000>;
@@ -938,6 +970,14 @@ throttle_heavy: heavy {
 		};
 	};
 
+	mipi: mipi@700e3000 {
+		compatible = "nvidia,tegra124-mipi";
+		reg = <0x0 0x700e3000 0x0 0x100>;
+		clocks = <&tegra_car TEGRA124_CLK_MIPI_CAL>;
+		clock-names = "mipi-cal";
+		#nvidia,mipi-calibrate-cells = <1>;
+	};
+
 	dfll: clock@70110000 {
 		compatible = "nvidia,tegra124-dfll";
 		reg = <0 0x70110000 0 0x100>, /* DFLL control */
-- 
2.43.0

