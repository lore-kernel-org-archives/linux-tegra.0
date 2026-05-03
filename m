Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F193CCFDC
	for <linux-tegra@vger.kernel.org>; Sun,  3 May 2026 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826340; cv=none; b=Q4CPjbWeqypLOgXUC5heRn85j0fQgpA7mb0xIEBALcey7ZJRMbLc8v+1wbw4aFjC/smjuteF8pvNk3/mKo/MIuINmzbuQOhjwAvkWN6BMiZ0/20fLjy83mDSkUes2JwqyM69uChdIYpBIwq/ZsoqVrI/a4qOUUg5mFcKBHpQjTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826340; c=relaxed/simple;
	bh=AyWMMyopNlz3aLBzj+mvuEqAZeArX1R9CyGPe7VtR3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rM7GpydDBZMLa7WZ3UTUh0BHBEItpoGnsdOaDtLykJXN9PQoeG2Ob4mLmAZdZbsnuBoLRNTPSta/tIRX0ISTjCE0+WivBeTG9IM8pwZW6YLgfQFmzyZHaqeCGMR2Mit82b7UBfsmPQcYJjox4M027aZogFROdjTAwa1oY5mNaLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXKe65j3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXKe65j3"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so5096783a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 03 May 2026 09:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826337; x=1778431137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zyB3mnhxYbuCPwW5Ny1cCWwB0U69BU8Ai2teNpQO6Y=;
        b=SXKe65j3rYeMQh+vogq0kCwKtpBTtYCy1d1T85Ddirt0jf715Kd+r5om2fcmkX8xum
         F708ZSx2i2/mDhuaj+V/VDWMu9Ar96kY8Y5959Qvlq5Pfuwx4rDN670eDkmQKxwHho38
         xVBTXZNkDYClmvT+7X2KKh0JEINdqvT/fpiB+tlU79ypkhb/mVpxMuuGsk7h14v2V4sc
         FZ9Nx7cRhbVQgVgwj6lm8gzEDY7XUdAcXHjYi1MfKN+5ErDDNJT4gf8UTDmI1HJLjhlU
         2QcRFDAjuSHFMsF2uB+//2O3m/h2xithJs88sTOb0KEPjDRjW3Rxj2Ub2r5sRRvwOY1H
         Y2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826337; x=1778431137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8zyB3mnhxYbuCPwW5Ny1cCWwB0U69BU8Ai2teNpQO6Y=;
        b=lwXvP6R9qQf3iPLdNUjv4z8Y/0YBh94qvQgttRT0rsShnqfjscXSF9oVpORZlEdUjU
         vPOIxBRgQBqgt141SSuUhmkXCpH+rgZC/RffCOujsxf+SekKhlqB06A0LkVxrEygMGVm
         eM79Yd/gaeeebDGs0G6c4daRiULH4gkcWi0CCwqhBjnuD5qyl2nHStlwR7XgzF4CGyS9
         KcJtqY6ajLuV8+svh/euyMNJUTLrN4mC9lImnXeOZ8ubKae4McES+yNU3+/YhzmRyrL9
         FMxNv/TiSD+J9aZ5eMx0jrTn/Wyzhp1CD0tWm6aGZ6FrDyh92bXfsWQhwuBBxHbQuIwC
         gj/g==
X-Forwarded-Encrypted: i=1; AFNElJ+KL7kJin5BpddeTJpahzI8HSbfPody8DtLvv4GzWUjrIsf4tlbugLrhCJFOb/Y2VQAwEkaLGUhVqCPpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjlFGgY+Gl2VS/wxzvnG1Sk2kibtEJv8y/knaQl6rvX2ZyTB54
	8oLb5gV2/0akjjB8WuOyRxT4kuaIeWK3puhLPBqgYklbreQSkFbJvkoa
X-Gm-Gg: AeBDievwk5kWi9yWeRkZJkZ5P4WEhFKTjE/lRIWisZ4walz1gTu0S9JvJ8Gvs0LwVH7
	d9u4C10Tr5wdqeaEu9m+rAxlTEP1MiMbyDHzqKuTMAIiTtzixjEnJgdiUhPdO3lBaeFzQUzowze
	ZxWupcjesRdrM/uXrvrQcHXbPTL5cYlEccZOKOA7v3XyeslzsvMTmLtD+oVDx5RtfHxnAABTOv0
	qu8KcTGyqYa3LU2qo2c9u38V9hXDdVl5n0BGdqs+sqCzW+dumEruAjEc7P3krdXdh+qDiCgOula
	rGi2xxk7LFP5uS16Yvv9bU4WYkDsdFFoRAciFnI93zB8NeOrYycYlcRPLbNqDiyJP8MCpgqp6+r
	JiujpV3842OSSua4RuH7//yX46f4fLOxxpEYoNneockeTpD1O/F4QCZmgkzy2rpuAveiTS6d5jz
	+H8Ys9O6TO/BPB8XIhcMmNpfY=
X-Received: by 2002:a17:907:1ca1:b0:bc1:baa8:1857 with SMTP id a640c23a62f3a-bc1bab76a36mr109324266b.36.1777826337001;
        Sun, 03 May 2026 09:38:57 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1ffd6f8e9sm44126066b.13.2026.05.03.09.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:38:56 -0700 (PDT)
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
Subject: [PATCH v2 2/2] drm/tegra: gr2d/gr3d: Contain PM in the gr*d_probe/gr*d_remove
Date: Sun,  3 May 2026 19:38:42 +0300
Message-ID: <20260503163842.213489-3-clamor95@gmail.com>
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

From: Ion Agorria <ion@agorria.com>

The current power management configuration causes GR2G/GR3D to malfunction
after resume. Reconfigure all PM actions to be handled within the GR*D
probe and remove operations to address this.

Fixes: 62fa0a985e2c ("drm/tegra: Enable runtime PM during probe")
Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 11 ++++-------
 drivers/gpu/drm/tegra/gr3d.c | 11 ++++-------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index e4148b034af7..ffcd076b5831 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -100,9 +100,6 @@ static int gr2d_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
-	pm_runtime_dont_use_autosuspend(client->dev);
-	pm_runtime_force_suspend(client->dev);
-
 	host1x_client_iommu_detach(client);
 	host1x_syncpt_put(client->syncpts[0]);
 	host1x_channel_put(gr2d->channel);
@@ -286,6 +283,10 @@ static int gr2d_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	pm_runtime_enable(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+
 	return 0;
 }
 
@@ -367,10 +368,6 @@ static int __maybe_unused gr2d_runtime_resume(struct device *dev)
 		goto disable_clk;
 	}
 
-	pm_runtime_enable(dev);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_autosuspend_delay(dev, 500);
-
 	return 0;
 
 disable_clk:
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 47b0c6c56bfd..cd5554e2117f 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -109,9 +109,6 @@ static int gr3d_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
-	pm_runtime_dont_use_autosuspend(client->dev);
-	pm_runtime_force_suspend(client->dev);
-
 	host1x_client_iommu_detach(client);
 	host1x_syncpt_put(client->syncpts[0]);
 	host1x_channel_put(gr3d->channel);
@@ -517,6 +514,10 @@ static int gr3d_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
+
 	return 0;
 }
 
@@ -578,10 +579,6 @@ static int __maybe_unused gr3d_runtime_resume(struct device *dev)
 		goto disable_clk;
 	}
 
-	pm_runtime_enable(dev);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_autosuspend_delay(dev, 500);
-
 	return 0;
 
 disable_clk:
-- 
2.51.0

