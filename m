Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566403019BE
	for <linux-tegra@vger.kernel.org>; Wed, 10 Dec 2025 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355518; cv=none; b=PCej5RqLOAWLqEiLNo0/XzeCeHg4kSkQGTzNgR9Zn55poOQvwoZqCKnXrEPYWna55zQBcBwuneT9NXYrbYO1Ugst7yYPIj0I/k3CiwuMF+dzDxJpGH+DsMvjhp+NwIshDLMEHYqRccIx9uq533gxzCvqS4Ugo8pSr97QsZ2B0+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355518; c=relaxed/simple;
	bh=LrLdovRzSzdNxTBUY5bVyUTgTkSb9V8DwRHPPe0GO8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GsP2KymmnjpFNOLSFiq67mn18Fx1ffJ7EEunwGOupteDbJEZd9/WaUxDWIpuaX4klPuyIK9H+5IwJvrQn2gU7XLn5WSZ4+KyoCkN67KJFRVF7fi86gIxB7/0OG/kTOaJSOe+3rxy7MkZFYcPOPzZvH/TKgLnvQpgM7yfnOZjiGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=o7dt1r9s; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="o7dt1r9s"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so11266029a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 10 Dec 2025 00:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765355511; x=1765960311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSlXOGUPyH2wmzlmXTP6V9Rk2E/YQBY/7/JUKnpIt0k=;
        b=o7dt1r9sZBHpQ7xP2PEScnWRDP/FPWGQ7XIa9QIppo/K7Dkl1fGw7QydGHGsRbCjvx
         kbRwrdGW2uiAa3SJUrOHFz3y/oGiHcKewabSCW/nmo/RYn+JRaI/D6P5Pt5glowPwr00
         Su2UVe4Aw5wJYLQZfboi59s1EaVkYZo+SBODgvULY6Jb1epa91W/y9Vwqhx8K5NPHev8
         bqoX1ViROgSPf/PwOaQ3/+SYjrSi9ef8+PNq8gA3mPJSxpHzsHp0ZaCo+gRQk0NZynD3
         e7lnMMvqSw3g02Q3GSqsVgMv6IHR0mL5Rk1A0/74xFxoZq8wbNE31pWZKNRh8CFxXcKH
         9UEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765355511; x=1765960311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WSlXOGUPyH2wmzlmXTP6V9Rk2E/YQBY/7/JUKnpIt0k=;
        b=XcxfkxJFZXNP/if2L8UHxcTNOyLFHziEl/dgNjUp9P6XdT07VL0icWg9AnT6QdVgAa
         gYxGeWwuX3hb5+mehzgDeQeQWDhmPdh812y+ThfP/5VZSoh+Df4oemUAbc/1g0cBOdrx
         8tIbOFC2ptmqwtReqtcEVU/bnTALhbNYfl9gHqt1utTILrtSrG7a/vgOxZUSxKDynbrr
         9a4Bjq62zA3k2GpcYILaM2p3J56HapxWePU1OCXVafTYQMrj8vzsvEMopPMgRo1nC5+j
         Hyunf5QeVPQFvjDEfvv21yGJYv9QoS926XUIdVWL7nm67LcOzV+ZW645zzQzBgDO4HxS
         9uxA==
X-Forwarded-Encrypted: i=1; AJvYcCU0bbt9TeROkSKBoY5jqjSwGNraMV06hORLvUozpLCmX+ufGDYQdV/cFABG9P1+b+JzfoVBK+aSrSBgqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOG5BsMUk92gha9l6Q67hgr9x+Sz8F4TBaxgJam2KsiME+5rnq
	jhlSJG++NUO5MgX7CPVFkdXKSGkAx5grEcKbNAkh/NGmHktavF+6a/PSMiXb7ha3i70=
X-Gm-Gg: AY/fxX7wEtBG/HlG3VuKRJ34B6kpArNikz0TsyTy6RRflB0Gc10rZ0FP/tyxX+/aClm
	1H+IxI4ol9tuK+40yB6g9JqJxBsaM7ZOC6Id+Ejbyu/Tmxq42rDnAsze5y8JI8WjVvHIWXFMCFb
	pXnyc3xI/jejPHnHSraxGgdFGaFYMd8M+rx0q50UEa+vaq3GL7bS4q6eFvvfdl5xjIcTZ0F4V1c
	6XIMxaNpIeBNMR/KKhyQFK2yw7MTkgbYMB+hC+ZBCmQG89b+8RDXXYJnLzyIhRzTAImE8uM05Qt
	m6A6xG01o4qk3D4Db5IwoOcveXi3t9/pSsF36EBT67g43j6yGkVx/kSdNmSPOCkD/X5n5vgxf0F
	Rh9CiaD4XtTnlQDYjSOcrcF4hmty7fwkLTeR96yotjL/4W5Gt9Jc+6NItuD1svLylsEkV6fJtgY
	Q/kHLE2qeYHC2xs1VQ
X-Google-Smtp-Source: AGHT+IFDU3NgK94e2I43lGVaae/zTSx8SJWvAB4zEAII7VlEYPowkYq2MDr2f3QvhM1SFljKSS7JEQ==
X-Received: by 2002:a17:907:86a6:b0:b7a:21d5:15eb with SMTP id a640c23a62f3a-b7ce844ed2cmr161725666b.52.1765355511508;
        Wed, 10 Dec 2025 00:31:51 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-647b4121f07sm16450153a12.28.2025.12.10.00.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:31:51 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhil R <akhilrajeev@nvidia.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/2] host1x: Make remove callback return void
Date: Wed, 10 Dec 2025 09:31:37 +0100
Message-ID:  <d364fd4ec043d36ee12e46eaef98c57658884f63.1765355236.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
References: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3660; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=LrLdovRzSzdNxTBUY5bVyUTgTkSb9V8DwRHPPe0GO8o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOS/sRGieJNY6eEBd+rKCwW3UfWy+0G4cTvst6 vX4NaiKjOaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTkv7AAKCRCPgPtYfRL+ ToEUCACCotR1zED66IhienYTk2oEwO+g1mqbvB0PBHiZ7kpG+Kt+FBF7T1RKGnWK6WehDqyRHzM LmmgMZ0GhkSc/r8NFSihIQ7xR9UHh0VtcZmTCGjd/V+1XQJ//+axPc6/9xNaWlRikHwzmJCpk0s Zn3UGsasK2k7ECE8T6ylyGqtRmxW3d0glZQHu1Nr48U662jtsLpWZTEqu0fSg6jfVexpG95q63a KmF1OmNjtm+iHmWbYbtWuMwvE/va59+K8qESdRpTmtGEhbPfoSDzB9Z5AKF0leNgBVwwbtrYrSm 9Gn4FQA7UH5CuZuJt9nktkL/UscIvvFIeQ5hP0bslc+tW4tc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The return value of struct device_driver::remove is ignored by the core
(see device_remove() in drivers/base/dd.c). So it doesn't make sense to
let the host1x remove callback return an int just to ignore it later.

So make the callback return void. All current implementors return 0, so
they are easily converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/crypto/tegra/tegra-se-main.c      | 4 +---
 drivers/gpu/drm/tegra/drm.c               | 4 +---
 drivers/gpu/host1x/bus.c                  | 2 +-
 drivers/staging/media/tegra-video/video.c | 4 +---
 include/linux/host1x.h                    | 2 +-
 5 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/tegra/tegra-se-main.c b/drivers/crypto/tegra/tegra-se-main.c
index 7237f14eaf5a..4e7115b247e7 100644
--- a/drivers/crypto/tegra/tegra-se-main.c
+++ b/drivers/crypto/tegra/tegra-se-main.c
@@ -401,11 +401,9 @@ static int tegra_se_host1x_probe(struct host1x_device *dev)
 	return host1x_device_init(dev);
 }
 
-static int tegra_se_host1x_remove(struct host1x_device *dev)
+static void tegra_se_host1x_remove(struct host1x_device *dev)
 {
 	host1x_device_exit(dev);
-
-	return 0;
 }
 
 static struct host1x_driver tegra_se_host1x_driver = {
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 4596073fe28f..bd0646eae555 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1300,7 +1300,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	return err;
 }
 
-static int host1x_drm_remove(struct host1x_device *dev)
+static void host1x_drm_remove(struct host1x_device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(&dev->dev);
 	struct tegra_drm *tegra = drm->dev_private;
@@ -1329,8 +1329,6 @@ static int host1x_drm_remove(struct host1x_device *dev)
 
 	kfree(tegra);
 	drm_dev_put(drm);
-
-	return 0;
 }
 
 static void host1x_drm_shutdown(struct host1x_device *dev)
diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 344cc9e741c1..fd89512d4488 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -628,7 +628,7 @@ static int host1x_device_remove(struct device *dev)
 	struct host1x_device *device = to_host1x_device(dev);
 
 	if (driver->remove)
-		return driver->remove(device);
+		driver->remove(device);
 
 	return 0;
 }
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index 074ad0dc56ca..68783d5ffeb1 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -107,7 +107,7 @@ static int host1x_video_probe(struct host1x_device *dev)
 	return ret;
 }
 
-static int host1x_video_remove(struct host1x_device *dev)
+static void host1x_video_remove(struct host1x_device *dev)
 {
 	struct tegra_video_device *vid = dev_get_drvdata(&dev->dev);
 
@@ -118,8 +118,6 @@ static int host1x_video_remove(struct host1x_device *dev)
 
 	/* This calls v4l2_dev release callback on last reference */
 	v4l2_device_put(&vid->v4l2_dev);
-
-	return 0;
 }
 
 static const struct of_device_id host1x_video_subdevs[] = {
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9fa9c30a34e6..5e7a63143a4a 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -380,7 +380,7 @@ struct host1x_driver {
 	struct list_head list;
 
 	int (*probe)(struct host1x_device *device);
-	int (*remove)(struct host1x_device *device);
+	void (*remove)(struct host1x_device *device);
 	void (*shutdown)(struct host1x_device *device);
 };
 
-- 
2.47.3

