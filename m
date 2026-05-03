Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4DB38836F
	for <linux-tegra@vger.kernel.org>; Sun,  3 May 2026 16:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826339; cv=none; b=cIT2p/haIjE2MS/ImYVxCa+2ryr8uK+xDnQmEqtqBRDhykRoKgA8LxnCKzD19x/TNFUdFfHOLFgdz+0SlYURxww+01f711MIYXZdrTTl6lOAl3gkP8PGI8N6DD8MaCDMn6UhCquNT5hgG2imVtNybC/be1nYLEw1dn4/AAcysOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826339; c=relaxed/simple;
	bh=GNFLUKea2pfoaGws5lCBhr59rJ4IuX/tvjFzGlQ6oZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iAKK1OMS/fQ8fhu9MZwpVJQ+NWDVM1Pg7ysmArEpy1Y2impuGgaU1KxXlZzIGHnNQeuGDQn2uohQIkE+Yrkmq/pobRrnw3TqlL58thnf2PUKB6kA6uHRVNrz8DUTnNxoj8KljSfpwaL1+rpZzW1LUrxppciiC47kDrWwcLkhsQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8+cRx3o; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8+cRx3o"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9358bc9c50so501495466b.1
        for <linux-tegra@vger.kernel.org>; Sun, 03 May 2026 09:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826336; x=1778431136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx1E17McT3yMJ8F2BtpMdFWZT7NS0EuMQsItPFsAxhA=;
        b=M8+cRx3oAWyuWj86FN9aHePZP1BaRGhy/lgCRcipaI4CwjFkdlMNrMtowovEblZhuh
         RE3o7jnqfoN2o1PnncAx9Yhr2i6XhvhlfJduz+EY/bu/ggxROS6PBouinPj4LpgqXsyj
         FhzhVCG/eZ+O50fBBBOOQ8o8Qy3eQ4Lj4csOspS0deo5qYfL7sOoKsCbKNLZ6b78+2zN
         QuXFbeTuztJEIF+iMOGlPkXEdk1+giPlYu9ToWrk1WgHrnTHaRFX5zS1jqSv91YhZ7d4
         gq/YOmfQhuFUAMdn+nrSU+60rLT4ylIi40Lt6o12mKS8B6zuQaPaZgq2nzFzgZHRhwB6
         VeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826336; x=1778431136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dx1E17McT3yMJ8F2BtpMdFWZT7NS0EuMQsItPFsAxhA=;
        b=A6ytHrBbFluAIrdHZ3e+Pone6B0L57vKf2Hs3SuKTPTgJR57v8LXZs2AXEGWGMhJW3
         5vHklhw0E6wHr69Euepmxuz2D/QtB9WMo2pOTFbO5Dx33D8cYouUQRVYoa+0KK3GIkDj
         lsj4xbablmasnp3iYB3GEh8V5q7xtHbWmETd8BwLOTqkOvCN17ojdDpSyPELvfBoaJS/
         T9ceaF8fuJS72lDkNOXBPAXTkZUR2zknVz2j/uVJ2o7OOPiMDnvWDCiBI3S7d4PWdim9
         U8oHtNHXuDTEWR78D7DpubcWAyE8mS/hlwVrOxwtFRlv/yIkDuU2SW1d03CheLly8DV2
         rNsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/j1lqajFmcZJHEVZFJzeWhunG5c24lupeicBSadfYYNThtwePCAIgsTGwRjThLlPszBn/7RVcwn57RuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygm0Q1hPHQfpTG+WCwyrvh21mEcqclp8kSO9cry0tyRN0WsniT
	IwiSq/h/XAsu9IPt2AP9obs8eQMNxqSjVeVDzgHBQ/C2MyJFQGO+3Cfs
X-Gm-Gg: AeBDieuBPrNwTmUKzv/XipBUD7YDIXMgp2zapZx+aEJqIBlFWREGDCQaufuqrjc7YhK
	0JGUE2H6rVnZzFACTPflbp/IO9vmBSToewG3Slb7qCIL/T3/40TbQd0NO2VZrSHTUYrwjhLv/Vz
	XuccYRE8FlpA3FGNJbxJLe2ZSLlV4cBUjnHi6spYkH66B1jnGDBvwiSX2vwEUt80ZQqugALL+cd
	wAFfGSQYsEggS1CTbEsxu/dZpc7i9ARchGdiK19TyYixpQBfrVMvCYZzwegdm4ghkutN+ugvUxb
	5zV14iCCC/SasXum9upxFNbZTte8EBJNNrb0+2yw3ZpDv8cUjWIDXPVv8YXFumduwkSAfgo5/dX
	yz9/LDpJ5GQyUhNHpqQ9OvVM/r7T50yMwU5wK384F0eSGVSPJzvjJFy6y68YuEM3jyFwHN0nr5G
	3shFVhLwuT09qf0fs+NPc5vWc=
X-Received: by 2002:a17:907:1c9a:b0:ba7:fbfb:4caf with SMTP id a640c23a62f3a-bbffbf853f4mr320445466b.43.1777826335947;
        Sun, 03 May 2026 09:38:55 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1ffd6f8e9sm44126066b.13.2026.05.03.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:38:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ion Agorria <ion@agorria.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/tegra: gr2d/gr3d: Initialize address register map before HOST1X client is registered
Date: Sun,  3 May 2026 19:38:41 +0300
Message-ID: <20260503163842.213489-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503163842.213489-1-clamor95@gmail.com>
References: <20260503163842.213489-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The host1x_client_register() function is called just prior to register map
initialization loop, making the device available to userspace. This may
result in userspace attempting to submits a job before the register map is
initialized. Address this by moving register initialization before host1x
client registration.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 8 ++++----
 drivers/gpu/drm/tegra/gr3d.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 21f4dd0fa6af..e4148b034af7 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -276,16 +276,16 @@ static int gr2d_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	/* initialize address register map */
+	for (i = 0; i < ARRAY_SIZE(gr2d_addr_regs); i++)
+		set_bit(gr2d_addr_regs[i], gr2d->addr_regs);
+
 	err = host1x_client_register(&gr2d->client.base);
 	if (err < 0) {
 		dev_err(dev, "failed to register host1x client: %d\n", err);
 		return err;
 	}
 
-	/* initialize address register map */
-	for (i = 0; i < ARRAY_SIZE(gr2d_addr_regs); i++)
-		set_bit(gr2d_addr_regs[i], gr2d->addr_regs);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 42e9656ab80c..47b0c6c56bfd 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -506,6 +506,10 @@ static int gr3d_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	/* initialize address register map */
+	for (i = 0; i < ARRAY_SIZE(gr3d_addr_regs); i++)
+		set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
+
 	err = host1x_client_register(&gr3d->client.base);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
@@ -513,10 +517,6 @@ static int gr3d_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	/* initialize address register map */
-	for (i = 0; i < ARRAY_SIZE(gr3d_addr_regs); i++)
-		set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
-
 	return 0;
 }
 
-- 
2.51.0

