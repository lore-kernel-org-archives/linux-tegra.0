Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB1919D8AC;
	Sat, 14 Jun 2025 17:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749923762; cv=none; b=p7SR8CAz+xCWYMoux+gKSl1zI+IIw93HH7lZZimuT28ts8no0UD54xJZ6JVLidzB2akpm2759MYnYqNOwx35ry6aN7J8Tz/wOgqmuhAvU2ZuFW+cxL6XHPPVpKvqAMNB5OX/aI6Pfg3JGl3pA2r/g0UpkuojnOLaBl7vqw26SCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749923762; c=relaxed/simple;
	bh=KLssthYyy0gQGRsg5KDTBL+DJ+SJuGnCZSiQVfHoUSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bm1mRtWqYWBHzZjTXflV9sQRP0OI3uyyVZY/ltWFsMc0hxVp3kbJF5HobZW7iuQMUAxdspXP2UkG+/9AV8oXwAjWunT19XTBNyeiZWM0CeavptkkTwjL28w0EKOKWMAqqwbyK42WiwyO/7reRUg88RfmpZZwAxmmq0JznTIHc4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN3RUGpg; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN3RUGpg"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b1396171fb1so2055548a12.2;
        Sat, 14 Jun 2025 10:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749923760; x=1750528560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE1lju9NZXE808RF8ca61BlstgL/enTS/ptbmHvcFRE=;
        b=gN3RUGpgCen6b28L/bKTodneohg2cHFfgIWDMe5zVWOAilp6KsikW9c9NTTZLBkDpS
         W/nztrOyNCx/wK+Z603HaFsVH3E2LzV5mOYwRzeowDpTqK15iT3dureJaPdsmblH/KVi
         ++uWsg05iIeAYjK3ZMnITlsYQY/CfTp4S26l/gqI+If+/Pibsn5mY+0KbpIHRoMrl3QB
         qutgQjlQu4rSyxWbt18bwe0wAWq5nJrnWyvyAMSBDlCnP8d8Y4hVno3xDb3pOHKpPCj2
         Bqdc4Xg2Q6/hl8MxZMlpBJA5dgidG+gh8geA/d+5htvmH7Lkon8qPAzyhTZMkPuRaU5G
         ylpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749923760; x=1750528560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jE1lju9NZXE808RF8ca61BlstgL/enTS/ptbmHvcFRE=;
        b=cXeDf9Xr8pnp/Kti2YX7UROflL44DnXKASn6LjBZ+zERCTno5JYQsKJlTJN4Yz+Usq
         kKLRA6au/uVCqvc3XLUU1TuFPNnsT1Q2jjwtw7BNu8Am8fPx1Sagr/5YUU2I9bjt/Gqt
         vsBLJzeMsPu4o0ZgqOBQerpy+daMa0dy/Bw2jjh07PP0/TBndDNsZjPwPH6FvsygbJwV
         NE74bEFRJyiC0DyshfQCzcYWq2v547H8ckwQZPpOpjqguX4VMVCUSsWznrYgtQPkE3Z+
         eXdTOJdn5ZVPJr7lolLz5r2c/ERqWL/FBA/hWWGL3Z/7tqI6gLOv1DpT/jz111jKkB/S
         cTqg==
X-Forwarded-Encrypted: i=1; AJvYcCUIBdGMWC2yU/GBzlG2fBBc/iGGLvyvM3UT2PGi+fBJTvCSf/9w5vjJZvtOZn8lGhbO8PYPatooPmsSzq8=@vger.kernel.org, AJvYcCW7Pcj9lsXh68scGf12+CK7woHwZ1X7AIQYp+oQsZ73kewe9me8axes2ihIWlmqY0izA2Q2Z5uyF4fZcQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLBnh8XcyMYG1DZW3iCljoyGfZFmlKi8BW6+T7bV2UYDWH8h+j
	i6k5+Ro8m8fZvgFib0t3ggwOoEFB1bK+9Tw6cUa1fPldEMqgYMwNbWw90abrLvqg
X-Gm-Gg: ASbGncuPj+DldWKam5t3xCEwwEoUMuu+XR+jEDrC4gSYpgDv8lKx5/AKanrSwnGnHNz
	8c0GiYLMWEshHooxubRZSayEL+AFnQ2wHH6J9+hPqKuSkfML5q0r6AfBWepvyqFObaybAmhurcr
	SysemLAHBW2HstkrvepXXU1X2jTJFI8vncOrWYJI0UCBilIMoHdwraWCtgHS+TbtppYlKRYlFSa
	9TxVNVm3sZ6cC+K6QGlpv02lKFfjvAgacQTMcfL5tvyGU1eNpZWj7UZGcyUOpcR0kD46+J+y+Ua
	f5T4iIVk2IK/0thwuWw/vp6pkX4KiTAo10hQrNQujX33s2aPTuS3lSWF02Vzp7oEqN94DudOMWE
	=
X-Google-Smtp-Source: AGHT+IEzJ7kHVAcgupaf7Yx7K9lIfNwza3FSKdtlaXGm3VkLH9Zct+muLkug0DXjzIj7PGQb1HDzeQ==
X-Received: by 2002:a05:6a21:7a90:b0:21a:d1fe:9e82 with SMTP id adf61e73a8af0-21fbd586182mr5902709637.30.1749923760046;
        Sat, 14 Jun 2025 10:56:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1642e0asm3717027a12.17.2025.06.14.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 10:55:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Pohsun Su <pohsuns@nvidia.com>,
	Robert Lin <robelin@nvidia.com>
Subject: [PATCH 2/2] clocksource/drivers/timer-tegra186: Simplify calculating timeleft
Date: Sat, 14 Jun 2025 10:55:56 -0700
Message-ID: <20250614175556.922159-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250614175556.922159-1-linux@roeck-us.net>
References: <20250614175556.922159-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is not necessary to use 64-bit operations to calculate the
remaining watchdog timeout. Simplify to use 32-bit operations,
and add comments explaining why there will be no overflow.

Cc: Pohsun Su <pohsuns@nvidia.com>
Cc: Robert Lin <robelin@nvidia.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/clocksource/timer-tegra186.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index 7b506de65438..6ed319bb4e06 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -231,7 +231,7 @@ static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
 {
 	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
 	u32 expiration, val;
-	u64 timeleft;
+	u32 timeleft;
 
 	if (!watchdog_active(&wdt->base)) {
 		/* return zero if the watchdog timer is not activated. */
@@ -266,21 +266,26 @@ static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
 	 * Calculate the time remaining by adding the time for the
 	 * counter value to the time of the counter expirations that
 	 * remain.
+	 * Note: Since wdt->base.timeout is bound to 255, the maximum
+	 * value added to timeleft is
+	 *   255 * (1,000,000 / 5) * 4
+	 * = 255 * 200,000 * 4
+	 * = 204,000,000
+	 * TMRSR_PCV is a 29-bit field.
+	 * Its maximum value is 0x1fffffff = 536,870,911.
+	 * 204,000,000 + 536,870,911 = 740,870,911 = 0x2C28CAFF.
+	 * timeleft can therefore not overflow, and 64-bit calculations
+	 * are not necessary.
 	 */
-	timeleft += ((u64)wdt->base.timeout * (USEC_PER_SEC / 5)) * (4 - expiration);
+	timeleft += (wdt->base.timeout * (USEC_PER_SEC / 5)) * (4 - expiration);
 
 	/*
 	 * Convert the current counter value to seconds,
-	 * rounding up to the nearest second. Cast u64 to
-	 * u32 under the assumption that no overflow happens
-	 * when coverting to seconds.
+	 * rounding to the nearest second.
 	 */
-	timeleft = DIV_ROUND_CLOSEST_ULL(timeleft, USEC_PER_SEC);
+	timeleft = DIV_ROUND_CLOSEST(timeleft, USEC_PER_SEC);
 
-	if (WARN_ON_ONCE(timeleft > U32_MAX))
-		return U32_MAX;
-
-	return lower_32_bits(timeleft);
+	return timeleft;
 }
 
 static const struct watchdog_ops tegra186_wdt_ops = {
-- 
2.45.2

