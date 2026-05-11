Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A8E3AB286
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485789; cv=none; b=T3G/EGqdZcmbrzqWYxhXcfiBi5kpkp527XAj7+7cagxH/VbinIezg50W7plZxGiRdXz4HPyLOlCBy0nAIdZLjgIDYhKx+k582YNCXl2ZYqG83En3vetQXiNy5Mdz2hDWns9v+/7HEkFKjHlJj/7IphYavX/S2IdTfxY8RGNEQpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485789; c=relaxed/simple;
	bh=9AkI0Nz1ZzMhKBtxhwDRab9jEHmljwJvezZnjRbkhVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LKWoSW7ztWBTWfqIt40flPVBsQpWAOO9FYbjYc/ViPDZapZmcRxjmX0DrYcYUn0m9fKRox28xLKarp8dC2bFk7sB2MibwV0384sweisKagWUTcherNkI6PKJa2zRT0mtFy+gEoW7ro5UHPrE3AmAS1o6iR+zCiTA1Lr2uQ52nis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPBeqN2e; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPBeqN2e"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a87edf88b3so2978922e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485767; x=1779090567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nwdcazcd5nv+n45NTFsXMrutWV/muXgCl4fYEEYQm0=;
        b=lPBeqN2e9ErSrMh8A3cTXPcgf9iBSBAzKCT9Vr2arQCC273vZyXvYZ4nJTa1l7uQxv
         ECJDKtr/SKtHINTJWECgcCdfcqp19T8yLe/WxFGsskO3rH1dDIj2uU9OV7a2NjufsQ9h
         gHSwHOTDisI2FIm/MfbyKP56DWHKvFmWl2eLIgrkDiZdnE90d3FAfnESZs2wClLhJfUE
         X5u5+0UaYIPKKVO6esJ22moSM4XH7fOAEQ+4eZuj+rDqT8osENwGCYrGKcgcESvCpUWM
         N906inbSvoelUmlNeImo0TGdQ7sUBCpupLw4uUD6eGpF1hHH6o5V4TsrKUwzI1TeFvVJ
         T+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485767; x=1779090567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9nwdcazcd5nv+n45NTFsXMrutWV/muXgCl4fYEEYQm0=;
        b=pr729Tw1eWtn870NGOhDzfTzqLKtQXACUTfKmAr7T17t4X2MoKU9xLQtK7ePMlqMh8
         fcovI9F3uzjgKEccRcyqKvdVjArnKBUMk+CiDKGO+1nKbbpgtojb0CciuzztN2Fzq8Sa
         fj6dCpZR0v/fGvUXYQDkGzfV2tjnOyhpntTLMb0cvuMXhEGo2z9hQET1dkwsYRhFgAeS
         qfEA1hrmw66mZk0Ryx6G7az3+GQHwPxYD1gpT1eBldXfpUuvDl1VDmIWbp2JX6RSuYG/
         Lhw5LFcxFjvGG8RzVhZGeszgj/Pyk30FVujfxNYFXLvNcgycHgPjHl2oa9Esv1quVWUO
         Xxmw==
X-Forwarded-Encrypted: i=1; AFNElJ8W4nW8Wk2sMct4RrZhFuyqJN6kmh9UWE0g+iivUQ/dOVcSp3MA3wCjDqlM+F/UM8+5xoGKcZ1USHipkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YziYWW9SEImnatdUmAPwvlJu2NpcvVF/SN6s+lvY0yV7m4aBQ6C
	943zb358ijY70HAMyGNJsUVdIY1tFME7RfWbhHkBluWccv7jG/YaHWohKJIk5w==
X-Gm-Gg: Acq92OE3QBswPAWteVaKTUQnOiDztGSOfVJCB+A0GR9siZHWGrm5I9VP3zXY3ciAcje
	MPuTl5ZbuMTeMQEXmsXYYGdeCYQeeDrY5vnMIRAgTQOomQa66M8HDCMJ3y6wlbzR+sCi1HDq3gj
	IDHcMeFiSe8KXbdhd0TCxVDw/XIFDarkxMvbEj/ckslsFgstBHgqbyUgimu1e2qEr3olbsILqDW
	aFHAIoXtvWWbEfbJ1fe6Sfu9OUYYQuGpqOy7mkapsWCQrmH/SdzR6HDiW5eiO8UUSZIlJ4zoPqa
	Yekzk3TRwwSGjhS2fuMhvfS2V5ta0Q5uKpLfbI6HaA/ynfG4pHaPEwUGxVOdwYogBb4TegLMckw
	tHn4iGEDGQl8BWh2r3Jmsc04cfBs80ZRxDIN84oKvJA7ZaDbd/wmWW3Id8V6YnxkwH7OVP8wCsL
	baSTz3VVfv1HDWV74WM/nTJJc=
X-Received: by 2002:a05:6512:2350:b0:5a8:9672:e297 with SMTP id 2adb3069b0e04-5a8b70926d4mr2899659e87.26.1778485766903;
        Mon, 11 May 2026 00:49:26 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 8/9 RESEND] ARM: tegra: tf600t: Drop backlight regulator
Date: Mon, 11 May 2026 10:48:58 +0300
Message-ID: <20260511074859.24930-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop dedicated backlight regulator since the GPIO used in it is actually
SFIO controlling backlight and setting it as GPIO causes backlight to
freeze at maximum level.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
index 8b68bfef8dee..0bebea0cb8c4 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
@@ -2192,7 +2192,7 @@ backlight: backlight {
 		compatible = "pwm-backlight";
 
 		enable-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
-		power-supply = <&vdd_5v0_bl>;
+		power-supply = <&vdd_5v0_sys>;
 		pwms = <&pwm 0 71428>;
 
 		brightness-levels = <1 255>;
@@ -2422,17 +2422,6 @@ vdd_3v3_als: regulator-als {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_5v0_bl: regulator-bl {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_5v0_bl";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vdd_5v0_bat>;
-	};
-
 	vdd_panel: regulator-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_panel";
-- 
2.51.0

