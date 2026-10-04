Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CAB3BFACE
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128739; cv=none; b=Sb0Bd1Uj4Zus40x7ajTTT7S2SA3B+GOeGKxRuBc3BfPrvFv/MdrKEVxi3R8sV8b8/A2Z92at/MIrGm9WZVskuFotWGi3P3nYzwf7U8LneZhwtj8tDSq2qrAKc20kE0t8SdjUf+eT20M+Qye6lVMVfuPXUsqdFeJHciOiONzC37Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128739; c=relaxed/simple;
	bh=qmTEYa5y2X3+a9MjlGMmJzQReb8UU2q6dn0mmgoCa10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNFmebAGmcqu3wFTRxM4FMQc2hfs+PW72oj8NQfHoDk1fxheYK3dHdpezCZGuaYgnfofXdGNdgtziQ6KxIt4ZJgtAD8ixQMPLcbY3n6LyApSmyI/glqSC0LKFIsqOSEpJQWEo1iTUoovPPAiV8f0s2q8a8pGgmfK3s3CafNfR8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qd9AzdDf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qd9AzdDf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so5733865e9.0
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 08:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128734; x=1791733534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwhnaXbSFDvMNkUsi1olAMp+iADX8Y1MVVoz5Bte/90=;
        b=Qd9AzdDfztJvxLg15rb07D0VGTiBAG2+cPW+fOHehaEFDypqXR2Xf0nWjYkRKLSaca
         oYQEzGkOdryh+iMuJY2hsafQMYODaHk7vW9caKQVczTcsDXKf/QQ+NYsmym+WxblwneI
         2mTYADXW+VRwl8Y2uDIX1FvuqEbs48SungmzT23SMQ+wgqH4AAaDZ9Y+f7lhqq0bJJFH
         wcmSQGcOlyxgln3NQkPh3PGJ4MGGJTrMGhODJKqDuPZJe60VFRtUgt6njBTjid9ui+lL
         hIvUuFAAwrcIWXUXm2iM3uIFCsxV4dN3FtnvZvA8lDH4ZNOeGwgdMy6W4fXyrWD2eGg5
         PohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128734; x=1791733534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dwhnaXbSFDvMNkUsi1olAMp+iADX8Y1MVVoz5Bte/90=;
        b=ZRk76gOAR23R6MWoOzvfn8A3QJH3oAWVqKc7ufFKZL3Zir4LhffL7B5sc0kdT2sUGR
         WFPNTpbteKDj8b4dMchuCzbM5aO4i5Ya7zcFYmGw8lYVIuHrGsM+EMzDohsRIoI6g3G7
         r0ZYU4xGTcdBykXVd4NHpINRzlAry1A79qQ3mr1xoTR84EB9kOSVt5qr2aPfUsO5vNq5
         JTMBo2E1nF/APuE+a6uZhoWO8L/SWkppOekXFBGDbPvHLYh2sLwvmRNrUczmzFqAafWS
         S2nBG+rpfzPqYLruaQ/UaLaQLrO3eXdoRYTtKZ5l9Q71Zg4AJn6iOwmjWUv6wO7Ix/CM
         hvYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGqJlGSqJt861vDbBt+lxcadpelDQ+iI9NbOaLwpp9xHE4/syrGXKCaX7h/8BBvFhxLeZ9WFSOoKAmQQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nck6/vJ7Wgnf5p/mNZcUSLYu67ZfKSXZWTtp4mYHHh9036sNQW
	wVTyDxRI6TuIJmY0cgf6N8iTzvGt86MXDEUvyg8NObYSC82NPIv6LjU1
X-Gm-Gg: AYBFou1Ip+tEIAvoR6zN3P/hDSxQpAUnvqGwSOk4jOIf4qeZPSxfZFvTtTtpEvhuSO6
	AUvxUMl+sY21oQ0J9we2nt/UzdDvskNjuQWEIJrlLEI7JRB5pQtmLiJNmHDVgHDrJN4/sT4wHe5
	LrRZ71Ko7a9r83LBfsmRuRGDJ+mEPDCY5UFNuCjMHkAgOHei19ByiV6SLieAQLzaMqv50yJOeRU
	OVCeWmyNo7nE+eW5sLRo4MW12sK6rVO3SdV0oZRi+rWt5fAUa1fcFgKhUarS/3oAnoxoPC5etFG
	518fy7DYrGFMbGvbPgA8e1mq6gaHn+9U7+K3HmmCIsEhlgXln1IJ2QqdU4aRY+Ur6c9Ref88DiY
	dqX/DgRxORbR8HibF1wfGdW48wDaGbAbgD1+z2CAXzVWrAGKIcLOTld3oFNhUahpjQIB2krDB8L
	v7NeK32z+gFsOHAn7DeAr7ZoLV3gnnn5/oYnLJcWC4ONqb+ilFddlknSqdanfhBRO6smgCkacub
	I3jjJG2z/7w1ueYQqw=
X-Received: by 2002:a05:600c:c116:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a0eae0b82fmr110002475e9.22.1791128733806;
        Sun, 04 Oct 2026 08:45:33 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] ARM: tegra: lg-x3: Adjust WiFi node
Date: Sun,  4 Oct 2026 18:44:48 +0300
Message-ID: <20261004154456.145362-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing BCM4330 compatible along with keeping fallback according to
current schema. Add missing lpo clock used by the module.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 60e8a19aa70ec..7010d8c01abcb 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1669,9 +1669,12 @@ sdmmc1: mmc@78000000 {
 
 		/* BCM4330B1 37.4 MHz Class 1.5 ExtLNA */
 		wifi@1 {
-			compatible = "brcm,bcm4329-fmac";
+			compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
 			reg = <1>;
 
+			clocks = <&ext_lpo_in>;
+			clock-names = "lpo";
+
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "host-wake";
@@ -1714,6 +1717,14 @@ clk32k_in: clock-32k {
 		clock-output-names = "pmic-oscillator";
 	};
 
+	/* PMIC's 32KHz oscillator for WiFi/GPS LPO input */
+	ext_lpo_in: clock-elpo-32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "ext-lpo-32k-in";
+		#clock-cells = <0>;
+	};
+
 	gps_refclk: clock-gps {
 		compatible = "fixed-clock";
 		clock-frequency = <26000000>;
-- 
2.53.0

