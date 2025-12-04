Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC52F305957
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764828418; cv=none; b=RUbJGu2GvR3q71cvZbvDRmRKNPVrhIdg1VpBPudIf0nDoYU80sM7NV6f0COs8QVhKWK5NqzSxZZXeWaRrXkCionX1Rm/+s+LsiTum63rQR/9v5hJPCzhptqg7uhxWsEz46S3014FOce4+KnEBCMnT+0mKUfYilOE3eIzP75nTc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764828418; c=relaxed/simple;
	bh=o0ADLZP20Gf+RaCUCo73PsEebUZu5lyI6twUNiTxrps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7RdSFWErSaJE/sYeLp6K4Rew4YSgYirswZXjf+JXtKgpCdw5gyRgoMHYl6/RsrZBki/ihAGjWUVNM+UcE6fe8b2tJVCVr6zHBkshZsDXaoHXcyWLS+/Nl26m6yH73Vwx8n+S4AqYivPPr5hbBHxQm2Cs7zVtDeLHG8YyfzoY7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laHnsnE9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laHnsnE9"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-644f90587e5so772270a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764828415; x=1765433215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
        b=laHnsnE9MGGR08+KhpGcfuJjPiw2z8PX2yQLpY7HQtXtsWAVD3MNOvMcI18KApqnUD
         uTTD5Fs7m8pNYSYaG3UjcSMfyX+SuQddr/jhEej/m/NvtwqMoHN5ybVTP/mTCRbf9UpH
         BbqU8imI3EI0f2aoytzX+IXXC3WQIAzMbK0saKY5b1wRdUdPJuJqsfuyjADpK5FQgCSD
         Q82g7sznr0IjSiRuiXb0sBwXBQF+FJ+0KtncY6yko01uoAktAqHRVfSGZLRKzdCEn9rf
         oZPCc4NWxEsTeFr9wGlNk+Jrss0xoO1su7bI/3HhfQ/OR84wkGoMJRtooJSeHCPxXxOh
         prlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764828415; x=1765433215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
        b=P6Gx9aU0EMd0ku7PkbKMOL/nxcr8D8TxGYT6NaURf+l7qGtDDmxal4uJlFPNUa+wVp
         MsWLCCdTVMnIdHglQTwGGmkyOerhMOynqf0G5/xN+wNis+l4t+wOiwUIhwQWx73PvdzB
         7lLIpPh+PI31lS/aa1nZpnhuhk53cx7NhluFA4vdSM2yOl0h4PJjvEMHHvtKqosEAGb/
         8DLEjY8vvFgmuHT9UeZw+pqdGbiGduYgdwH835Q6rEZosntOGPaXQWgvNjQpQoITHRaF
         ypeCJuhBxgqEI8FJUdF2vJhg3xlr876KUkuFZzc4+z59lLpbzzCXBx2MSuIFgYIZ/QYX
         08Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUlqXJHTnHp8agFENYtNSHcW3zRslI54Gr9zapotGYxolkyYiV8oFECqCJdV94KI3aiBOjiAXc+hfhr2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ALq3IF7ds/i0WUubAJh8VVfsNcPZX6DPWB3xSRUpolHRn5Sa
	GBehBaVTvNpDDAT0t86iyOdmaXutKziqgcc3UDcw10lZ19A9npnE6FdO
X-Gm-Gg: ASbGncuwfR6rJsHuCPIyIunrxsKt4P2u6Toa0lkJGS+wx2lK76pOVWCu50M/rPPIEEF
	QUA/Pk9/TYzulrWugwxl60FgGM7mgfAa4QUya2+6HayshCjem3WyZ6jAVrW/gTkrpqCt/AYo8UN
	wjt92qi7R61l8FDzIAKbOsmDEGfYfaqX6wtNtGq1PGdoLzjEpQbOVbyovoKJ4l0hXbBQW0SCotZ
	7rGjrX0D7Rb+SSOC0XZBvCk0+sJgRof2N/QGjaUjv2OpwTUf11yN064dEKpSfEtgkNbowwqP9FH
	dK+Bn2EswsPmGbs6uOXerYjF0UDcLxYNnLPzKQPwoi2cOU0WJWPe1SL7eFIjOydSHM0g+higIMm
	gfRN4hDL3nJ3Y+VJNuWbz7omwNNhb1aJKHEcdsikvS1K+PeOuNlDZSEqd+2PiAXCIhlOHtFMrkb
	E=
X-Google-Smtp-Source: AGHT+IE+Fr6H1WVOFv89mmmcteyvoUreGk+YgPA8+X76Lo5K3YtT982xGzt2fTbBOqBAgi8GNeopNA==
X-Received: by 2002:a05:6402:274b:b0:640:b3c4:c22 with SMTP id 4fb4d7f45d1cf-647abdd3177mr1426616a12.18.1764828414907;
        Wed, 03 Dec 2025 22:06:54 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:06:54 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 3/7 RESEND] ARM: tn7: adjust panel node
Date: Thu,  4 Dec 2025 08:06:19 +0200
Message-ID: <20251204060627.4727-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204060627.4727-1-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
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

