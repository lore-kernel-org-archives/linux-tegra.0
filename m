Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2BB2F1FCD
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759912125; cv=none; b=Yaac44SiTermt6OjeCpls92uzbAw77WFajMehHhCwQJVYl8atF2sJ+XVyZC4Hc3cL0h2iVNs/GUv/AEQnp3WbKrxL6w9NTDP+to2eMTzLRzwj4YguWn+YsShAk/ysPn1zhhSl8CuO4QKz7xWZe+Akqhgc2wLRqExXfi+wi3E6ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759912125; c=relaxed/simple;
	bh=o0ADLZP20Gf+RaCUCo73PsEebUZu5lyI6twUNiTxrps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DV8+9U21lJUCrf29x66ew6oyhewnqXDRrHwdF3OkKH832yZo8lo5flACnZTG8/284JmuqmbCTc3xB74XbNV2aCEVqP01kd4rLSVAOGeiQnWr5YSaxcsIujZ5aILrSX3WT4Go5LY/xTR6K0KDgxxK+zXXWCbsBC1MUFO0nvIyoNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAbTbYXx; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAbTbYXx"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso7845897e87.2
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 01:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759912121; x=1760516921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
        b=QAbTbYXx+KiIYB/ZvMixKYuuPKCqRdXmyyxStMPglMMLGcAkd0bZH7y+9Yr4XLlQFU
         WD0B44OiADsmxjVX+W+2mDSqe162BmEJNDC6bMUXPuqhlKVaWLEfVQ2eM2o/LA8OexMS
         j5VtyYdoevLrXfDq+HMH2jEfOSKOosgo7+Xlqhc2+XHOLRDyq5etoPASKFEuiNYyudnN
         pXkSZUxXFVVP35PT6aePS7JkZW+g4+1+OkTJ6Q6Jr64NmqJ/WyE0qR8H4SebCdZdpkvi
         cFaMS/uc253ayCxN/gSfqkvXMEoInv3LFIGbg0m7jlyGOutbDdmcIaYcd3VbmyT0LpZG
         w2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759912121; x=1760516921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
        b=tpd4yChtW+oxLsBAvqrizaKE9ZPZPKPlt4LBgyIuhP3QsjLtuAvi0gxcjV0UGjwneX
         RUUwqqK91WaIianzR8m2GEFzAqwnD4N/3DBTDbMuYtPHIsJC332835Wfp4bqa+Zs9LrT
         V9WcEBFRx+SjFKBrGRMowfM4kUTttDisdUrpBALnG7uQbagc7WwotZyRLn5kwvuP76D/
         xSq1ktNPpDxe53H0WnvqbBGU3oMXiNhWUiG+VMjESlyskJSUedva2T5iJdIgF7fNKnDz
         DolaWJz+HZCf2eq1BhNkIaw42TiiQC4napAE/A0eWNekxO+GuZcyjCZEA8WiLSu1zsP0
         2r3g==
X-Forwarded-Encrypted: i=1; AJvYcCWyWhRiqX6vQUGEm1eJTmWqLVdTARgS2vB+K3c9PZ1FMQ54u2g//vOw7VfviZUMLUTZwIxTzucbpwOIKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnUiQ9cD9uRlcYASraWr/l73Tyj0j5DEYm0cH3m3WEyqCAXyeB
	5BloHmOQXk6mkG+BHbPKtKRSH5XuUQvTNhgRKpurbPx4AO2fz3fdTqxF
X-Gm-Gg: ASbGncsU4f+IRDHI5Wfx9rsQH1ksAJTuwBHuL0dqLt+XnPwePGCwnRd1c22A+lZFl0Y
	clLOf1idpfnEQGG04YQCnQKpysYM4TKqej3kGrbOG8yPFwarDMpnIaBvK1iuRUs6ujKR5S2I3CA
	vh51ztIKKa0ecRO4uK3CVqVhhzi/m5BJv447S5MfIfWaOXlzQmLzK/9PvJLaSmbxPOPIKN2cMZF
	APi7wC1yZ5+qh+QN87/gGvgp5jDMpResHAchl+sYSdX2/ZZcx+9MtmFgcqv99JQjrC83//YS9BO
	Q1zyAjmX2cEqdlrMJNA123ao8W6icxir+HvObN6gXlnfVwGTXI5JuQ9nJyevYhtXAA81d5wl4Iw
	LWFbdu3AbKXC92/oR2cKJ9RnTXLnAFQjTAHmw/A==
X-Google-Smtp-Source: AGHT+IFV9hCDPQx6NSx5ECD7DNlbhKuCcj5wIMJQj0wyuQZ2L9bgoGkjVG4izGN54TiKv8m27OKE3A==
X-Received: by 2002:a05:6512:3b26:b0:58b:a:d043 with SMTP id 2adb3069b0e04-5906d88b312mr813137e87.17.1759912120855;
        Wed, 08 Oct 2025 01:28:40 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124649sm6968733e87.15.2025.10.08.01.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:28:40 -0700 (PDT)
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
Subject: [PATCH v2 3/7] ARM: tn7: adjust panel node
Date: Wed,  8 Oct 2025 11:27:55 +0300
Message-ID: <20251008082800.67718-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008082800.67718-1-clamor95@gmail.com>
References: <20251008082800.67718-1-clamor95@gmail.com>
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

