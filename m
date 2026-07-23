Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A4B456DE2
	for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2026 16:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823543; cv=none; b=c5wUErTK/lY2Du/KsgBwZupWmdVxmP4IfsnE+taxCQnTzVne3B0F+OPYnsO0RpNF3X/UQlEE/jSOqFUHOLGdITh5V6Ia6fM23bqFixrOVnC8EtVcFAumPJRbmh9cXMjwXMGck9gsm2/ynQAfsUJpuaooE5OaVKy8HYTASW+EccA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823543; c=relaxed/simple;
	bh=NpnKO/51+etpeqJ25cg/EF74MiQwdswhazoXGAAjbFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X6yqiIkXaB+wudPWa7HA6/kVa63FF4Cw88yQmuLTjEIECk+6YnhSQ2W3n0EPerH3sb/IJZ91xnGdxE/MhtkhToI1ZuME06dcFkdMn5E2mBb9wFCMjXLLgHxHpoMcXQwsxa/SD5Gm2/mF7wNU3M8YAz+u/fiUhlucqU00oUY5Pns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSrNP6Cn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSrNP6Cn"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b021916bd3so842310e87.3
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2026 09:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784823527; x=1785428327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LqbiPvOO3ZvJwq5MwuKHTtbfwKr6s4CP7Qh/+Zyyw4w=;
        b=aSrNP6CnMAFqcbiFuUQLoEKKSFo8Z1kaegfeLEQwVCnj87stsRXJkkztSakRuL8Ftz
         0bsXDeWLIc0WqxKp+DEqo0OTHralFwudwv1OmrTXPuqVeF7k0bN/R5NqHCcFTeZtIC7Y
         6sO57bTtvhqzNiQ8j1IcbJwqud+9CQFNGYSqtWMipdxE15XPY+dmh+4y3RX68uT1sMlh
         cg/z/YsE4m2pHxQcGpZNMzXrXofylXzCTIrIkJSmV8ebXCsZYVsfeZPuI/CgYLs7XLoM
         8b3aNCL0yca+nteoaeRPleha8fdwVYW9dLOCnMMtOGSqceTflz+1hj34/xi6e8ZDp3go
         3afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823527; x=1785428327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqbiPvOO3ZvJwq5MwuKHTtbfwKr6s4CP7Qh/+Zyyw4w=;
        b=pyWQCDbuuov1A4Ti8Yz90ydl/+2E6/yV1PnVGDY2P9R1UTQBUNUWdcLCyeD/19+X5G
         MZBm2Lt4uK/pHD+E6aES2RHkwryx1athGqaoIuE26LyTNYzYLWf0erDLOOq6ZN7L/HfN
         VefVPb4Qf1kjFwC9Zj9qGf7e6vgIqCY0SPrU7Sx/1/6BVZspETmsVqQGFiIx0WxO+/w/
         L3wwP0D974GLrW7Fc23kjDPOKpQICr6DhnLe4vsihUtlc4YgaSAywvOoyY22i2BiRqW0
         y6OQN0CpoEdB6Jp2N0XvX7jP9h1nEbbtC6hzq/gSIKVT9cMC5GMjaKwB1igh0P2GBFII
         udxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1pjOcsLV6p+H0uEoSKJiPfWOVJILWLXKTi0KMKjiVcIzP1pvD8AHALOK5AcWlBEok1FKwJTfzdWizHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQdgePKIx104KIoy16G3zwbm4kUPeuYJvJ5E+ybRS4SHieIJYH
	pZAIwKed2f871lC6hFOgpweJ+yVJnG++ulLvw2GeR20Vpn2Nr67E4id/
X-Gm-Gg: AR+sD1154vS8jlnOTWTixL7aWp2XQ7cFSSXfLHIZylsenxSgkQH09BgDKiwoX+zEst/
	5kvNq14V692bzgM6axlZyMr4d+1UsvesEJ4PeFaRSnnySEJdpf3+EXRrs8DU+Q3fwAnAaGpQhDH
	m8MjucyrK9SJeeVe7ah5fuhgyuyIGaMMvHk23f+P3OjlYZ9PfrUt/ruBZy+HM9oVCzLZG18NUB7
	fLWoQjNEEyq8mmB7D9GvUJTcAtdRhELaaqV5YPAcRJ9vb7CAmTjLuqBAV1tIEPARKKEyVDNcxvY
	vRQhwFEWAlEOWxt9mUqcBz3brnWe0XwLwkAUHsH1PE6ToBrgwkwlsoWBeubbOaMmR8z5MPH7Nd6
	1TfdTTc/6IDotA/xDG+POSAYJPASf4RRRXPrNaq2/BqJzCPfcPQu1FmfnKtKW61R/7nxAuhlwZq
	L+7vetcNp/4OcOrUWW54P3xWZO8agjFiiDDKSabPGPDq0xzCuewSsVxv4+JLLmDV2kvgJIIaWSE
	Kamt+0lPKwzKw4=
X-Received: by 2002:a05:6512:acc:b0:5ae:b250:5fa9 with SMTP id 2adb3069b0e04-5b2b2f6a795mr904040e87.31.1784823527194;
        Thu, 23 Jul 2026 09:18:47 -0700 (PDT)
Received: from localhost.localdomain (46-138-176-102.dynamic.spd-mgts.ru. [46.138.176.102])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c0a9sm1125783e87.17.2026.07.23.09.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:18:46 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	marvin24@gmx.de,
	linux-tegra@vger.kernel.org
Subject: [PATCH RESEND] staging: nvec: use strcmp() instead of strncmp() with magic length
Date: Thu, 23 Jul 2026 19:18:23 +0300
Message-ID: <20260723161823.23921-1-iprintercanon@gmail.com>
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
index 2faab9fdedef7..89dd997aaf36b 100644
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

