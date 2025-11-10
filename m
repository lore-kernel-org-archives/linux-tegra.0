Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5195A2FF65B
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 09:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762766131; cv=none; b=nR1U2C45sawwUlPFuKMa8thpqEbXcOlRt81v/zvz7bzVrKAXUQX2wV+lpa5FT+4jiF435Tw3JRhe5zn7lBSFibaUtOe6cruBQS056hHtJv68c0VTacXYswHnzOcRnHCnjzbFq5dDyVpgCskmMatQ3KuZNSikFNch9XwTwAXOC1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762766131; c=relaxed/simple;
	bh=o0ADLZP20Gf+RaCUCo73PsEebUZu5lyI6twUNiTxrps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zo8dXta9exOfZdZmEYdB4vwYeKAVfAZsD1nRvO2bnYgmf6OqYHMGqH0Zsm3kwa3OY5Z9yre0M+NhGswAl/sW1pIYF8QLDiGeB8E09Oa23gw0fnQWl8FHBWzyce8SE1gSzGvQNwmFcg/vR0fQE9IyLrj78JX+MupLzXg7MnWb2Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxKDIytR; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxKDIytR"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-592f7e50da2so3348351e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 01:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762766127; x=1763370927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
        b=jxKDIytRPDugAQZqX2/1YEkQKz5ndm64a9UOrKEytDeoZ0cO58XY92GMvropUaVmJk
         hGcTavO0IY/glgNYnryp4PhF/70sch3zZqSdcgvfJUHHyFwuLWuxYCWsypQxeXCxhaB7
         kn85IfIjScyI7g8ftSjh8pf0PMKuSFF2P4SpUxNniKickmhn7VXbI2G7aTC0bbywb6W7
         /UAzcIr3Ai2WMMn2sCXHvilRHGKGj+vmsR4KZL8CWNTh/WwV+x4DjXtMqQC2nZSTv2HP
         al5qifP3PjUQUS6/I9zApAQqbnlmvFtxj+FoP84Y3s4wc83s86U31626s6/sHY2P9BJM
         A3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766127; x=1763370927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
        b=IzXW7e4MgIdF5os+mBaj1z63aB9Gmz9b8N72VxLbVVHbOLNeTxZfjZfwDCa6tbRkdh
         aZMsPzaBOmkmMwJhxBfN3uh7wbKEOqJAnbywS9Xr4CKuXxoFB69tH7gD7/JavhAQsjEQ
         dQbWEi2r2vMk+JFArzO54kYyPnfCZPW8ygPTHhNcXqtBt+hzxOviLwzkIXF613R0O0q0
         G9YwvozuC61sk19gewprylk2YgLLKVTfi/MNoFsfdfc3UcFhYQWSG1F0msSTTbc5aplW
         XrGJUGN5i9lSJnFEWR5AUaGZBrv8qThWwx2MIV/TLDhNu0qLP+5awHRLCmbelifljG3c
         K7/g==
X-Forwarded-Encrypted: i=1; AJvYcCV/DnO9OZCGAs5YF+QsZeYioVRfOPA993O9tE1X1f5OiWk1TqaYan8Rd/Q8Zp4MJpKNlT8scw1lRNG12w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoRzu/qTSuzQVKuDLGzvafRTCKTtTUV0GpPHb5fvvKvPWE4FaD
	XOezgvcyCmBoxNzaepXhy87WoTc4lNkgKpQVFiaFX6rjkrmFEJMsIVRo
X-Gm-Gg: ASbGncuOH+EUSsMvCwkwb4UVD4PONYWZFkuzA2cxqSagB+4KSe4C6O1O1Euu8Rroy0o
	2Ft5vmZ2ut3C+fqgK0V0BYjJe2cCylkGuMUZj74oviSLAl6q2IGFhkQiiJvFrFTRxQQZNLMGrxD
	qs9DYBG5s/e8I79XH/IoPCKcQG7UNYLUVZr1BghvrP95nwdTv3wVgafAWfLTAcdS8FIsmbOPeVu
	Tl7QKDsSr7n3Clc6X8dywlPfTEchH1R/djyGkSvTZ6HcjNWQ3zlIJr/1UtUBlylTavRAWwr3TAZ
	pjaY0SWscQOveuccKGS41zj3PoNQRxMWNke7QQPm0VeyS2EDUrmlKlCmfjIsKzc3BkQGzNRVYKD
	Pb+u4v8AaxSdVC0g4oX0NNuxzg/xU1ijAutTW4jWxBvZ7jnYYfyH/ZRFTxJosKVRD
X-Google-Smtp-Source: AGHT+IGg01NCiIGQo9N2wxV8aW1VWsEBMMCQPFsF2STXbWMO8Vd4nbT/5Lwb6SNxAC57s9F/DHJ/cQ==
X-Received: by 2002:a05:6512:224d:b0:594:511f:f1f1 with SMTP id 2adb3069b0e04-594599999d3mr3496080e87.11.1762766127093;
        Mon, 10 Nov 2025 01:15:27 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:15:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
Subject: [PATCH v3 3/7 RESEND] ARM: tn7: adjust panel node
Date: Mon, 10 Nov 2025 11:14:33 +0200
Message-ID: <20251110091440.5251-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
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

