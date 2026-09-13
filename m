Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1685352017
	for <linux-tegra@vger.kernel.org>; Sun, 13 Sep 2026 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789300961; cv=none; b=ZZhCtJDXlvpUwPRs9XKGVeg2A1yU/R51t8qPwiw6qqRrU/8cqZJaYxqiAGy7C5XOrcjfq1f3lujO5/ejTjMW72oKPamQ2TFprIKMZGLlEQdj9xBgghmUjHDi8SF+VnZLF//qfVYYSQs0UMx8FtzQ4e4XooxdJP9IuLxiSUny1e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789300961; c=relaxed/simple;
	bh=mL9fNglYsSBvG//gsuivigf3fT0Ig+s5Ce4nrXosrxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1BD5Pe0hLilbZ9KlZb10qZAP9lcbuV8iOiEaUGsX1KRHDvh7x4danhcNjgdUwm/S0BGBSsQAT3fUeOJDSg6WAyed7OGpAc8Xi9uTyqrScWTQhSjX6ZXsJUwfPbNU3xiVwyzeuGesTX+nNp/uViceugJpB2n101z1CpInHO0PdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pps6kOBX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pps6kOBX"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so707355a91.0
        for <linux-tegra@vger.kernel.org>; Sun, 13 Sep 2026 05:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789300959; x=1789905759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZ5JOsCZ04J11iAGe8msFZoGQpgRKm5XQ0vjKi0ufM8=;
        b=pps6kOBXgjgktfbjeWsZsfWvMadI2JM+QKzeJ+3lUrSVVGa14nXhHEQiM7bk3WS6wa
         fGRG03vq/OQs+61qJ0BlWyNsIb6ZN29hYz9yk3qaa6EItYFdm/0uD2LloyCbgGS6HUxH
         UDky9gnfRCgMHxACrEx+l2J+W8Xr2lAWz+NO7N049cHY5EhW+YGGw4mv96jr9Bvz89d1
         hqSTIuCn6x02p1SZ6txABP49QJQLqSBIHbw6x9A98v2ZkhE7InDOkJ5UbM7F2TDe/A0m
         heYamyWLigRyFqoMF6LaCc5dIt66I/vTF+GFxBUJUHSYglgz34xe2l5zECaHyfcgBzxs
         mdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789300959; x=1789905759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZ5JOsCZ04J11iAGe8msFZoGQpgRKm5XQ0vjKi0ufM8=;
        b=o1DLF6UJGjZFJmDfIGpXDkmDZe/JUlXQiKtvQwjIA8PsOOsurAWwqM4lC6lgC/w3Xn
         xEVoQN1ppbJpqK6e9Ysr5zyC0MMychv6Ll1zVLvrbjF7JeP7mKCLD8t0I85dE9FHxiEy
         MjArzlE2Kt8eQ2EJPa9gccNGLGUMwOVReIyRIRFCYQ3dI0YqzfV4gmv+CbC0XUS6aEUN
         d1zAEjzuJcc6xEa/6srwVLE9QXGpqng+csNgz+0ZU3Bts/07O7uRYke0j04y4qz8L4Wg
         SFLLL345/HC8a9cXoHIpDwT7e+o5rgyWXzyvEUUQauHt7McfWK95uxCY4uRvKIj1gxiF
         9lRA==
X-Forwarded-Encrypted: i=1; AKwUvByOlAfei3jRCU7MSQ8nVjHfpyn9Ze4GTz/pMTJS64rSHXzVKvnsh7/8bYTySLYKv94qNJeXg5+ClKrpKA==@vger.kernel.org
X-Gm-Message-State: AFuF++kM3TYcHwjurMURiWjVa8G+YMGO0AQE/4jmjmNwfl7vhWasOni4
	TigxzX01OEJXzRGpHepy1gHw6isvF4ZyS4YAu0vMZYd1gXwaP89IFeU0
X-Gm-Gg: AYBFou2wpiUuBPOuMB0YtCRwMSkDn35w+Xe8Q6TZT4nqGDKuPmSPbnuVSR2g9AFChp2
	6scKFf6xwZz0yjTqzGeYqhSRLi/r//MKGvPe2SymZf2U3gZdgVgAEhNIjR1aau0HhkFNu8jFD0n
	Mrf0TUI1R96VwlD8/VRxO5IOF5lC1wHHraOFObayg+6YkxpxW0nldCbPY1IyOR5k1pNdhdJVG2n
	Z5rNQ4V0DEjKYxSwB9zCjpCDL/YByXOBFez/YwwUVagJu5/YZtZWPBrrxV85EA46XTWpVMHnrIi
	QM9dUSoafZikmAyyP03u5OCpaE1Ub0yRbggiXYi1nzti9FnpNQ48Axhm0RFpAHTuD5mWe8olJHP
	MZwXYrb+XLK52BaX5kgzvCMeAfq5KHEvy1C8QvNgk7Wmc2ryJtq78jU8YWVCop/4wBe/+zTDc8A
	oB75wTuo/0wcvMUpjOYJUW8yuH7YRuGY/uMiSp3wR9cuWo4negYsuJEsI=
X-Received: by 2002:a17:90b:52cd:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39dbc6ef551mr12049002a91.22.1789300959024;
        Sun, 13 Sep 2026 05:02:39 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd3e2dabc4sm27365725ad.19.2026.09.13.05.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:02:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Osipenko <digetx@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpu: host1x: fix runtime PM reference leak on remove
Date: Sun, 13 Sep 2026 20:02:27 +0800
Message-ID: <20260913120227.1559129-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

host1x_probe() calls pm_runtime_resume_and_get() and intentionally keeps
the runtime PM usage reference for the lifetime of the driver because
host1x is not yet ready for dynamic runtime PM.

The probe error path drops this reference with
pm_runtime_put_sync_suspend(), but the remove path only calls
pm_runtime_force_suspend().

pm_runtime_force_suspend() disables runtime PM and invokes the runtime
suspend callback when necessary, but it does not decrement the runtime
PM usage counter. As a result, the reference acquired by
pm_runtime_resume_and_get() remains held after the driver is unbound.
Repeated bind and unbind cycles can therefore leave the runtime PM
usage counter increasingly unbalanced.

Drop the usage reference with pm_runtime_put_sync_suspend() before
forcing the device into suspend during removal.

This issue was found by manual code inspection.

Fixes: 6b6776e2ab8a ("gpu: host1x: Add initial runtime PM and OPP support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/host1x/dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index d2c64728f804..bb6a1647e4db 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -729,6 +729,7 @@ static void host1x_remove(struct platform_device *pdev)
 	host1x_unregister(host);
 	host1x_debug_deinit(host);
 
+	pm_runtime_put_sync_suspend(&pdev->dev);
 	pm_runtime_force_suspend(&pdev->dev);
 
 	host1x_intr_deinit(host);
-- 
2.43.0

