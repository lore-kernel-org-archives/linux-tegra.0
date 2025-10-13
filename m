Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98D42DFA24
	for <linux-tegra@vger.kernel.org>; Mon, 13 Oct 2025 05:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760334979; cv=none; b=WWBHI8V/2TeHwzoYPpO2q5krDJma0F3R/85DjNRteVyCEIE7OFNcuZJ+QaobCE2piewqsDoPDdYKwA9QlCu51GAEgxqf/Etarhh2lDFAcN9gQEKREpMI3DW75JXpUR9uyWigHUMK9VSu1u0OmFRgv8o+zKLC04mkS3/wFvILxlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760334979; c=relaxed/simple;
	bh=o0ADLZP20Gf+RaCUCo73PsEebUZu5lyI6twUNiTxrps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5HOgSfSiiK9uEeSyj18o+4YCamU790JO/8Z7nsINsAx6SqoJxWXt65LN3iKWYhKcfCw1PgvUrenqEKDsXhR9Rxw/sloAPEpqhYc85kAsMZ5p3QPxJmpueFGw9cLqzABJ0LMrq54nJVBxr/aTQOu5Sts9akTeUkMMz2Pnn05Gpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBsroXvx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBsroXvx"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6394938e0ecso6171864a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 12 Oct 2025 22:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760334976; x=1760939776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
        b=kBsroXvxeCmdzntD7FOSdYUKwLtc0m2wex3t9tnGX+nGl/4FZiIRlN452Npm+g/cWk
         kUDny9ndTQvlFBO662h7W1gjtjEO3XMDB7XqilQ/tyen/6Z6RldJE6W4A5sjNjYb0hOY
         tJivoGLYGStUT0k1asjE1dWa5KjlorPkvNDd2eoIytgSW6e4R6qAekPKeJHZWrlwCv9F
         b4I+8k/5un1iUYwp0xSxR2DWhKIyVj/u2BYCpqZYI1wvwUDwLFfEY/0Vs6Lhq92idySA
         QzT6JDqNDYadawa7Iru4l077Mwz6m4cHPtRyN8x3Stm6zgUIcKGkOPVDWCTQB4yu4CUG
         gCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334976; x=1760939776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
        b=h9wJ1A3ApblXMCgDFBol+HPZvG/KCqlKujp54gwHDcuiIashxNpVWnUkY1VjlgVjUE
         cKSGtHXngdITB94zGYrbyhmGK9VCOFIu7fyKyHKqkP7DWqXgyKfhrcE/O4Scxkefilxw
         NbbBjQ27noeC2ljIm9to2Q3VCUFt5U53lHXN8FaynUNGQjayXrZAB2MXJQM3QSvpZ/QO
         v01WN6nzrsG8alPg69r/If+iZbXzK+QPMnPZe6sE0jySdJ5ub3hyo9yQ0gq/Lg3rnCI/
         xPhOwn5U8YDjzcXfBU0Gpce+9/e2yst0ZSUMvvDp4iMdqGqvdsx3seGIdT1hU5Ng0wM1
         3Zmw==
X-Forwarded-Encrypted: i=1; AJvYcCWESFtwayvWUTBrJcICLX8BsWC+scPXOrdczuaPhzWoxu5XZe1PRHCMsdaGdESSmJUnyM/5e1O5MMPNOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq517d2GF0i2oqwQerNjLW+BmSR5RDVvW/MYnqEVjcU+gzd4dL
	OGpvMaAppGeooqcWSRRhtjkenIwURZemoGUq3oTjvFZ6jLn8+Yn5dYKi
X-Gm-Gg: ASbGncupAmIHdIyDF9zSlx758i8XVbldpESTE83G8xGFWyYe2hf66/MCsoEU51KynVF
	AQ4d9ZYeANFHu/QzTF2c4nH+r0+xKSUHi1fU9paG7LiKsg5hd50wMDlrThX70zFXDsytddWzEPa
	XT3ZFUjfirBYPA2g534C2d+jptDJ4aiuCNt5eBd9B1E1U+4+WztbjeFDbYnl+rv04PaVFUMB1yh
	PxMsCJEeQ2GcU4cQMzbGVyOhBKzLKOqyId/r16DKnh5h+O6bqSlXTeoiUPJK6rmeb3HClsIa5wM
	qRdRNgywl2B9m0azZlfTx+NFpe57R5SqbMPFMojggWWSznFpc6nIgqnzevDNhj4WRYphYbyZwpJ
	Vhk2lptSB/4EEzfgWcuilPrETsmLSda985MLhkbeyClo=
X-Google-Smtp-Source: AGHT+IFXa8F9X+NAFTriZ5+fmvjgs8tTGl0KStDHQpx5xiYIKYYvA73do/5d5TYquynvGTa1Mbv2pg==
X-Received: by 2002:a17:906:7313:b0:b40:8deb:9cbe with SMTP id a640c23a62f3a-b50aa793004mr2095378166b.2.1760334976145;
        Sun, 12 Oct 2025 22:56:16 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d63c9a3csm860912566b.23.2025.10.12.22.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:56:15 -0700 (PDT)
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
Subject: [PATCH v3 3/7] ARM: tn7: adjust panel node
Date: Mon, 13 Oct 2025 08:55:38 +0300
Message-ID: <20251013055543.43185-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013055543.43185-1-clamor95@gmail.com>
References: <20251013055543.43185-1-clamor95@gmail.com>
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

