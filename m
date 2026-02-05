Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439F22C3255
	for <linux-tegra@vger.kernel.org>; Thu,  5 Feb 2026 23:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770335195; cv=none; b=lnqMMlu7Q2qCh1j2ueYokcSoq0SlaF68cTkGlxpBb4q6S3etXsrLPyPIHa5/5N92ss7Xa2wd35obTeWO8gtoZ0lpbt+XVxUw43CUqSHwvCqxnDqKogj1e9iAL1QfQKyA2IcSZ6Ttq0wooaVlxj1UVqmswX8oRQ7hnT3+Jr4YR44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770335195; c=relaxed/simple;
	bh=W/y78jy7X4nuj5V5IpcGtOqeSqAcFoKR80crW8YdxtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k7S4y+YEKe8M3CsgUXPzHMt7J1POUnnNuWs2vO24Imn+srtx0e1ZzqxwTP8kLannDFjVMgpU8+ptXILkSEVHCkGmzDX7Q+SzlUm+PilqLxK8vI3TtYtzcNgt2Xjpr1EjMs5wrSUV+F/7FPak7h0RFGGg4m3YnXTVrmYM3cBHilk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4aWbS2u; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4aWbS2u"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6581327d6baso2546118a12.3
        for <linux-tegra@vger.kernel.org>; Thu, 05 Feb 2026 15:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770335193; x=1770939993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fEt2B8uF3Xgw1RKagrHwaEXS6gyn2vlWTudLc2umps=;
        b=l4aWbS2ufvqa4SSYfu6si8Ch3+IFzB2c9buAY3w0GkkGkbuThFOYDv79m7V88Z/QKz
         monwgkT43Bxb7dQUOn8MCt7nJqi0tsRolvhut+4Jkl7YVQwNXmlfFrgBtW9FsMLPtxGt
         KG/aHFjQDBqERRX5PBQ12gNjnhm4ZgYg+J8hl5kxfZYwO8oO6NwgW6CutVF3zEngXwFM
         1J43t7KZqnuQ1THeCRO387VbuTNo6t13xlf/bctw7fgG5DF7gbmNFoh1+SLX/E32qlyq
         Uwbv5EHClwLBgqfSCesBwr2/wxXjlKmp8m//AVUdsS4ZVNlyogFsxl+SCs+tTUG7pEX2
         X5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770335193; x=1770939993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fEt2B8uF3Xgw1RKagrHwaEXS6gyn2vlWTudLc2umps=;
        b=showbNlVWxDuyGmbUPM5VJiKoouq800HWVx3U6W630uFn6wTnonht0L1z2HG0bnSB3
         KRpeyd43p6rXXETiEf4E70h1UIDey6AapTwHv34u8Ip9XAbYfnq0uoAvSsYIJmVm9G+s
         DZHOMzb1WzaXvCL4FZNDk9PC1SMJWCyRDgAU2aBC2B4Re1/fX1YXV/SOR4gEQRzKU8yS
         AQsApdTh6bYnK+g9pNT3jFKfQExaSfsKBQJLbo7G+2K50IngApqukMMQSdAyjp+7F/WP
         AE9uJOx+e+k3YUKcL4nMB5/AKdQWsRCeb4m5xfCGoegF6xsqyUKFBf7qIKpHko8M0Wp4
         uphA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ6QgwT/p4jCX1yQSW+Z8gCa4mQTYd23DT6D398toJbJAl6+x/8m7ondquH2bZnnHi3V9yTnwQ/ui6TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTXqlWc6Jpb/mHU5wc/jMAJeMCiRe5XmETu3Pxen0AJLq3y/lL
	3qeaQ5pqwWUbi8tPpJUbpwezhLc+KpurFMffiFQ1E+nmkuviNLWg+WbIHeNb110jjj9DvT5p
X-Gm-Gg: AZuq6aIpms8QAFkBD8UyDoR19gWHWG+rEbOGW1I9YO8SOt50AOC35YBJdUYWHLTk6Tm
	lRvDW0Dv6YdeFjEDGec/FHSYf/BhSI6d69TBiRToA6YpbsBqzVDUVtCStEWDdTtdQHPUc9OSN9l
	M04EI9jHENxwNQqzQ8RSLcInhaTsAzzj4pA9lLyzZg/MLOe1YJ0AEVv6NWrboyY15DazuKrjIGA
	bIPSAkaTCKOZz0wpzMBYqBVn0h9DXjBuPFf7k1ARRnvpaLxTSwLlgq3WmFUdLs5V3O/Obtfuky1
	xtJ26LmntqYYOvk7GpmCzrfLDaTNmhh1Y0/CS1bX4N5mwPck4NtJmC3pu2xaNbyE9Spo/cHSNqp
	b8PBFEoTNoBtVPnYch1xmb/F0l4nkd8mWeH2HGshiAUykEmRnXI3pzO8qY/8Yuv2jUAZdMXEOiF
	ImdR8CVYq6cfqlt0TaVfRh4HW0HKFb9hM39i1Tgpyg4tIt+FEKBnlaj69uODd7WHcFiUha5SKeM
	RsJC06XeGahBhjsZHBeYymgayHcz0hZ8Pvrw66hCQpVP5PJ+Ejs4DZvSlEpVA==
X-Received: by 2002:a17:907:d8d:b0:b8a:8537:e399 with SMTP id a640c23a62f3a-b8edf3c0f26mr44373766b.48.1770335193396;
        Thu, 05 Feb 2026 15:46:33 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (212.28.147.34.bc.googleusercontent.com. [34.147.28.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a3004sm29501766b.15.2026.02.05.15.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 15:46:32 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH] staging: nvec: use strcmp() instead of strncmp() with magic length
Date: Thu,  5 Feb 2026 23:46:32 +0000
Message-ID: <20260205234632.1964-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strncmp() with a hardcoded length of 30 with strcmp().
The bat_type string is already null-terminated (set two lines above),
so strncmp() with an arbitrary length is misleading and functionally
equivalent to strcmp().

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/nvec/nvec_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 2faab9fde..89dd997aa 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -207,7 +207,7 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 		 * This differs a little from the spec fill in more if you find
 		 * some.
 		 */
-		if (!strncmp(power->bat_type, "Li", 30))
+		if (!strcmp(power->bat_type, "Li"))
 			power->bat_type_enum = POWER_SUPPLY_TECHNOLOGY_LION;
 		else
 			power->bat_type_enum = POWER_SUPPLY_TECHNOLOGY_UNKNOWN;
-- 
2.43.0

