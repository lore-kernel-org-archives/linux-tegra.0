Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BBF2CCDE;
	Sat, 14 Jun 2025 17:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749923761; cv=none; b=hwjwQV41auN7C0dBcwnQRSNIjTCM3Pzja7D2ERvPTptN74QJg1mwRGPJkgyYEM9z/4OcWHl45vAsQ1IDiCrehe37QhirKnEiwySlV5smoeEgUanh2qNzP6hAOiGTIpWH7p2IIVGHo321EKGmElPYM5VoKrXvMPVaIheHkPDu7SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749923761; c=relaxed/simple;
	bh=w5lnhwsdZzG3aBXPmwCK+ZyNCrHVJ57W7QXrHcaVxVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lde+vuDAHnGRTlzI1nfA32hI5GwWJ3Mjj0PS2XY5Q1OK+SeVOcMphNHR16M44iEqjToZjpJpk+g+0edMZ0P7wP1+R7Dg66lNaIL82Y0x3JxOUEyEwXqC3EO5QfoTnTcCOfU+2OnnU8+/dBqVoXFOMqQBNPa2dwvS1IXhme/cM24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hm8SVrtf; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hm8SVrtf"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c035f2afso2209600b3a.2;
        Sat, 14 Jun 2025 10:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749923759; x=1750528559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PtIWI4D3lzzVpfTgHWK38Qft9XCXilyDclrM6B0iUyA=;
        b=Hm8SVrtfwjmbVx5ztn4Hfz8uenKRsuFQmkyg//Wwo87YHJoHb0vOhYqqYrkRWsrc9W
         IjlcPfjdy+ADA5uYF7i89u2TMdAQP1WMsz+QfqFgmr8SFkH0IjwOJd0XFCYuNo3es7fO
         Y3lZOjZhlbmaztme6mZayDn15DIZdVYDV7GPKXpgTyGsCXnN6dZXNWIjvrthlUo9JlS3
         XjDmNoTLZjB/CglZ1lc/nQ5cPW4QR6qdYuC1PQgA2cpk95QQjm3LXFnx/xE9gwTI4dq/
         yHxqdmL/+NCmxLg6HLCBqcR6M6mQHhsLzXvvzkCSHrvZKvKkt8jlYlP5xrbq3U4Pniig
         3HKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749923759; x=1750528559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtIWI4D3lzzVpfTgHWK38Qft9XCXilyDclrM6B0iUyA=;
        b=K4lWVLp0qcqsqDqQ3rBEQT/mQflfawjIC9bMkVc1Z57i5kILOPcjhRvQXhMZCmK8F0
         ri6flae7aBcilgvbskwozF45mVyqtPxDvXx4hzBAyWcZ0rp3zKNnecGl5+HiMiYMoSFR
         laIvsMKQPnPtRmBnnUj8F+xpi8Kf1sQVA7zYRYNDDLXA6WcYJ3cWtv1cEGMboRHeZHPg
         U4lX0RlTvd31Ekrbcqps0to4zDUVMTIXBDBWjo+YtQJVDtnnzTT3NjEY0O7qwUOomVd/
         Lh81ruwF9bUwVkJlVITPBnfz1nWQq3WJzm7O+c1o1CRpKKdqO+AjJBEdSmD0Z3Hs62TK
         yBNA==
X-Forwarded-Encrypted: i=1; AJvYcCUjGTwYyAliDXZmkDdV57OGI1/zJPbhewQiSV7RkKddJ8emF5btZ0Mcc+0QlZ3EZTkv5+IXYQ1oVszUtT4=@vger.kernel.org, AJvYcCV7e0/x4gOiDZtH+qE1Po5y+c31dcjn32hKVvFsqXcVsXtARrxq0LBLFmSYLjvhfQu5s7OvnMKHNtW2IjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHDeFuf0vF7oxOFlHD+A4JEVAFtHancTTivhLQ3VdRkmVXpjJp
	CT9tK1lKs37Qz4HnCDvm6MwmD9oMTLCE2RFWxriH27iHxkUoRppxi1LT
X-Gm-Gg: ASbGncso1gilt6Klfxt/kAew6LeosaPdFNS3CgpLQQScFDQ+KQoRQzFBb1qSzNl9guY
	Xs1wc2JRrBPgDsb7cni3jOpUbdqlg4xdWR6PZe37SK/S5Z4SDD+wTgVq2/+hBfmEr3XOas9i341
	W+lzGD3bhOAnRQerT0fGEy1GFOjckt7ohWisAfGawGUihuOMptnP8IB/W4Xx8714DXtDT/B84Zf
	iexpCqWzySJ28uCodrIeL8fJjbQeRxK1kpG6fDEkxOl1Pzb0xqfIzzRIXpVan4xbau/TvTe7kEX
	8QOIwRdViVjITvTpoDtOa9F5nxsVJ04BD1F4QihVYsjoOnAp1QytenuCUzjYgOAUa9OIlynseNE
	=
X-Google-Smtp-Source: AGHT+IEaftk25D7dWuS/n5/hxs+A0TNnZV+SwE9vWXB+uukLVoX7dK9M276RTcZSuuUCu5g2aJN8QQ==
X-Received: by 2002:a05:6a00:ad6:b0:740:a85b:7554 with SMTP id d2e1a72fcca58-7489cdebe1emr4687685b3a.2.1749923758783;
        Sat, 14 Jun 2025 10:55:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900840a7sm3749685b3a.91.2025.06.14.10.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 10:55:58 -0700 (PDT)
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
Subject: [PATCH 1/2] clocksource/drivers/timer-tegra186: Avoid 64-bit divide operation
Date: Sat, 14 Jun 2025 10:55:55 -0700
Message-ID: <20250614175556.922159-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building the driver on xtensa fails with

tensa-linux-ld: drivers/clocksource/timer-tegra186.o:
	in function `tegra186_timer_remove':
timer-tegra186.c:(.text+0x350):
	undefined reference to `__udivdi3'

Avoid the problem by rearranging the offending code to avoid the 64-bit
divide operation.

Fixes: 28c842c8b0f5 ("clocksource/drivers/timer-tegra186: Add WDIOC_GETTIMELEFT support")
Cc: Pohsun Su <pohsuns@nvidia.com>
Cc: Robert Lin <robelin@nvidia.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/clocksource/timer-tegra186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index e5394f98a02e..7b506de65438 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -267,7 +267,7 @@ static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
 	 * counter value to the time of the counter expirations that
 	 * remain.
 	 */
-	timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
+	timeleft += ((u64)wdt->base.timeout * (USEC_PER_SEC / 5)) * (4 - expiration);
 
 	/*
 	 * Convert the current counter value to seconds,
-- 
2.45.2

