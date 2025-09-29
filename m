Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFE330B509
	for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759155926; cv=none; b=e/VRq3vSLGWCHEMGP7CWvtbfep3wufB5PIcQCRWmFvVuwpR3ZXMi0z745X1cuxvY8rlxK0I6z/zOlBP6C0iUnewa3Tpnn3Kg/nmjyzgr9rC5ApvTnl/XDZAv27rPUDqh843IlpPjOl50JZ7cUqxJehMalUj7khDg76E9lPEAqnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759155926; c=relaxed/simple;
	bh=o0ADLZP20Gf+RaCUCo73PsEebUZu5lyI6twUNiTxrps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDi/sQrEU21XM2Bbrkvz0dfG+Nr4cvowP2K+3P9a9KFJZRkk//snv8lu4nlGwyoGMeMTHntCWYXwBFFwsIO7OGcEB9c8ffU0686v9ekN/Sx1wS0qtuFZ6k6XEOeXqjmYsPB7+O4tJ+t1ZruDQX0+PLWL65izmRrxxU/r1O7ZIMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gR9pNt1I; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gR9pNt1I"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-371e4858f74so31442431fa.1
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 07:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759155922; x=1759760722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
        b=gR9pNt1ITyuqcnuBEy4UEjylBMgO6E68nyT55bh1pySUD5Vvb2J4Eh6t/p9qxmierF
         wHIZmBsicgXcqsTl8XjsVXvfalhLMQZhEhnVfvoc8Cx+J1R1MEkb3PP5V9BbpVQhJe8Z
         PG2XPTsLQPZ4MQoUdXFAxp2t/HMHoYfVs0DTTwjDNpoMhHQp232oSWUjZY5PGnerwZQQ
         AQDxECOUWLAeTAzHQn8Q0dCZn27y7UsWcy13hhxkB6KIoGKVtI5MeIQUNF32JA9r0EyD
         aH+t7GaeKWOA/8oOCvyEoQTGV4xGp1GJkCEWr6CTVwxnkLJo37n3cxWRwPXLM/xK6uvT
         UfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759155922; x=1759760722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
        b=QD95IyJ83ym0xAZW1Xu0w3fAvTQJvEvytu4G25aaZeP/lVImGunAXaV+N1zgnIsRTs
         /4xOzeIIIHRWS0+1NHJlr1ZPBajbLThUI7oME0ndvPbYiKxz8xci/tsRafJ+zkFJkyzA
         YBhXHz2P7I+rUjvT67pqAQJGvsL6DMtbKciXaJw4XZYwy8RULEzk+ervrJ6TRzJ52S2Q
         VRMn8TM3fWsrDJ2t8KlaahAKtvuCibOpGS4luM56hM5+xhWpVfmWxzCnHdFIYtv7X3gb
         7PUivhTWSoX0V6QCJ5h2OLh/vp/bJTvJzYuNWSRNNnimhpi07VmcAINR9+5Gs8rbiBze
         LiKg==
X-Forwarded-Encrypted: i=1; AJvYcCXiEP+wgIS38l9sbTl27A4ZBj3Q9zcEFxt4RpX+wC3sEfJQ5mM0yF3zyE/B2YN2Jmv6iNqFCWYoEoAsvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Ceu3Xm07IH/Yk7QsBc9vRBgBWne5muKVHBYac23dJNWHwgXC
	P1pfnzkhVxjyTpJjBO82E21+kchedETi12QqXldNYBgR/Ef8wCY51U3i
X-Gm-Gg: ASbGncvgEHQDLC5Lohm2p/oxS19ijv2nupULACdvPzKcnG/g+PdjM5cGyqXF5Hj0DZ0
	wwlDcieTVp00SbaZWYD+kPx9n7c0UiOQgvSlXpo8EhHuuIH4BIqNSG+YOrEFZeaZSh4HAvxryuW
	OIX6uygxNuLRDsu6+hURZcoQE2IPxMOMig8zcGC+suPNRadLsChbWf4iRSEgAwF0vAM/3gKq1AI
	78FtKsdz2NxI7M0+MoOlBdWL8TZS8qDv17yGbbQlM6LJ0pZvaFxNfrgiJpoFAGEkh2tPUDzX5TQ
	J87URFU8XSgR7L+e/tnD7q7pZ8cEl08ETk3oy2x9fuBIpYWNvP3gxIsnNBzxdn6bpmeaWhTMDlA
	7ol48Vj/pzeD7KIbF/nhoPLF4
X-Google-Smtp-Source: AGHT+IFG+Ih0xaj7zpJFsK+/+exH1aoBAWLVyYSD//n2Y4fEfbx51EUFKSvnwF0GU5y7LWmXyxKWTg==
X-Received: by 2002:a05:651c:1581:b0:372:91d2:f659 with SMTP id 38308e7fff4ca-372fa23164bmr2454131fa.3.1759155922087;
        Mon, 29 Sep 2025 07:25:22 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:25:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/8] ARM: tn7: adjust panel node
Date: Mon, 29 Sep 2025 17:24:49 +0300
Message-ID: <20250929142455.24883-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250929142455.24883-1-clamor95@gmail.com>
References: <20250929142455.24883-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust panel node in Tegra Note 7 according to the updated schema.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
index bfbdb345575a..75fbafb4a872 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
@@ -43,7 +43,9 @@ panel@0 {
 				compatible = "lg,ld070wx3-sl01";
 				reg = <0>;
 
-				power-supply = <&vdd_lcd>;
+				vdd-supply = <&avdd_lcd>;
+				vcc-supply = <&dvdd_lcd>;
+
 				backlight = <&backlight>;
 			};
 		};
@@ -101,11 +103,10 @@ smps45 {
 						regulator-boot-on;
 					};
 
-					smps6 {
+					avdd_lcd: smps6 {
 						regulator-name = "va-lcd-hv";
-						regulator-min-microvolt = <3000000>;
-						regulator-max-microvolt = <3000000>;
-						regulator-always-on;
+						regulator-min-microvolt = <3160000>;
+						regulator-max-microvolt = <3160000>;
 						regulator-boot-on;
 					};
 
@@ -325,7 +326,7 @@ lcd_bl_en: regulator-lcden {
 		regulator-boot-on;
 	};
 
-	vdd_lcd: regulator-lcd {
+	dvdd_lcd: regulator-lcd {
 		compatible = "regulator-fixed";
 		regulator-name = "VD_LCD_1V8";
 		regulator-min-microvolt = <1800000>;
-- 
2.48.1

