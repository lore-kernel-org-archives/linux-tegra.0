Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F81F28EA56
	for <linux-tegra@vger.kernel.org>; Sun, 15 Feb 2026 12:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771158582; cv=none; b=tYml58ZBtF1GJvuQLeO+hrdqLNQyKGBDyDUlNjWZvTMUrcFGPZ747hY56oAl5OCTZhA+xkC99Sz7ASqgH0yDjRuqJzK/aj5XqjQ7gVVkO6rf/M6AuP+BlF7WQAakyTKcJXGsqqc7bs9r8Iu60nuSx7UL7nU/kBQVH7vuKwe6pbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771158582; c=relaxed/simple;
	bh=H9Eag/J8nZ4Fk38+jWaDcZUlZju5JzX5GpaFoz3CMM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e5vrZnmkiE4YF6Zwh/VoheEXmn/x4jWoj8xT5fHqrS1+qUcBfqN4GgtLzh4bBhcSaQaVdfpiG7IgmjvtoWRbGAGRDBnjoFdd1dYseTLHpbopr3EquBG+yld9Bs0B3yHqfWedu1pmn3mcqhFnS5vcEMlm67gDDbcZxqSf+Kwa+Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgjKHjci; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgjKHjci"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ad32708177so30465ad.1
        for <linux-tegra@vger.kernel.org>; Sun, 15 Feb 2026 04:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771158580; x=1771763380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GBpQTjMbL7rVa4GkhcvMwmD9kfre3V9nPWW/pKMHQS8=;
        b=JgjKHjci1XPAWmMtERg9B/6JkLAHJofMYkM/xn//epl1YwCJ0K1py3vw/Uh4VbLqPN
         E2F9UFUXPIJ7YvRT3+reNog4QwgQx+n0G0Uj8whTvLMFgL953N2085pwMownyrkK+bcf
         mOD6iLdvGYTJUDt3zHCNWrbGFM7HaEn4SNMhR67eq9R+sZB5oMGdC+3Kwy5tTW2DNEMY
         36uwU7Ao4PgRekt4sTIlQ5sdHu2pPyHYk+GjDxjFG7BcQaaqsg/j59at4lKe2wC4i8/U
         6/kUNV57uF8pZ815asl2WHTLIsfQMhN2tmzcQ1jAH5CXYZbI4b1k5KgYz96nFByZmoQt
         aQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771158580; x=1771763380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBpQTjMbL7rVa4GkhcvMwmD9kfre3V9nPWW/pKMHQS8=;
        b=ViD6PqqmRaw5+SjzpWNBTgdxqKZpD/74srkiu80ZVeFw3koI8SzW5KlXLOa+dX/+gW
         osJEqG2Ea7NUBsDVvNVpWMyVJ+WkwY1OagmG1jUisxI6tBrblYbPOBKM7R79ZiAnGS9v
         Ne6s0B6E4y62EfTXJn7MzSQEo+xR/TrXKWa9U0Dp96S71uomxef9eRJDaWtwsdNBPWla
         mOdOVnO+BYIM7V8azpJZEWgfOpRRIqqxi4GWxaG09EjxnghNvdd3UOTIBXQEmytmKjyq
         IjlzWdISjJ3MapMrF+nFi11H8rQ4SnpLp8EI5dRD0ILNn/w+T7AspIOKbPwaanU2Akgh
         uVnw==
X-Forwarded-Encrypted: i=1; AJvYcCVeRWCwmmn+MIfjCuITDAXIZbWP0Vu7EQv6ZGTn/1Er46ctJQyFNjB0ytie5ppEvt+9izIfUCdsg1Q5cA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIabJgOYunaYDj1oMZrJpIMe66sIkrwp4MZzgajBBTsXfRoCJo
	CFurhv1kbWTQ+NyjSPluZV+z7riQRYN5EKqkg6bwll4owDSF1z7SZ31AWkFvxA==
X-Gm-Gg: AZuq6aLs4Eyug3ncOg2SqZkzrYbJ6m460u/oef9p4mOLrfPCFlmh4gU09sHz6lfvD1+
	PtDjK5f+dzGfqWPvXH5UD+fS0rSBxf0XgyaMHi29SHD1it7HUmBNicBfEUrybLedQgnt9b+mImf
	pvHWkHo1VT/JrKLNi7aeSvIh+FxEyGaeyzUxUITXA8PdYwfEM5eSCLtq8dYBreaHz8rTyiizLD7
	9fu8tJhFJ/JS4xH0elBopkdsPj08oJrt9DOcu5QNzzBIBjWxEDTwXKqH7VRnWHKnbC2e3sfl1tn
	KVx/TDBGBlJXXoqRhhoYRDDWhm3NqpYD6jkvxFGlWT1jK73Ljzi+WAzv19B5CTsfjFUAGsELQRY
	NBRB2h8tyrgaaW7GQ1LB7/Wab5kkZQo6XMPUylACwcSmBhOKl/XA6RKvgzKbdPKH1qOAHMRj8LJ
	65JFzIt4gQNCH1RlVpAhVDdnF1lbOk0K90eYBgLq3l5HQBRBgbeQ==
X-Received: by 2002:a17:902:ccc2:b0:2a7:682b:50af with SMTP id d9443c01a7336-2ab505ca8c6mr89910665ad.40.1771158579679;
        Sun, 15 Feb 2026 04:29:39 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8817:dac0:96bb:43ff:fec0:e782])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567e9da8a2sm12868736a91.5.2026.02.15.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 04:29:38 -0800 (PST)
From: Samyak <samyak.bambole07@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Samyak Bambole <samyak.bambole07@gmail.com>
Subject: [PATCH] staging: nvec: Use kzalloc_obj instead of kzalloc
Date: Sun, 15 Feb 2026 17:59:13 +0530
Message-ID: <20260215122913.104064-1-samyak.bambole07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samyak Bambole <samyak.bambole07@gmail.com>

Replace kzalloc(sizeof(*ptr), GFP_KERNEL) with kzalloc_obj(*ptr,
GFP_KERNEL)

This addresses the following scripts/checkpatch.ph warning:
  WARNING: Prefer kzalloc_obj over kzalloc with sizeof

Signed-off-by: Samyak Bambole <samyak.bambole07@gmail.com>
---
 drivers/staging/nvec/nvec_ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 2db57795ea2f..3422a5213803 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -102,7 +102,7 @@ static int nvec_mouse_probe(struct platform_device *pdev)
 	struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
 	struct serio *ser_dev;
 
-	ser_dev = kzalloc(sizeof(*ser_dev), GFP_KERNEL);
+	ser_dev = kzalloc_obj(*ser_dev, GFP_KERNEL);
 	if (!ser_dev)
 		return -ENOMEM;
 
-- 
2.53.0

