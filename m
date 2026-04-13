Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C0B3D8125
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089622; cv=none; b=kS2uFSN11J+JOk8rcKyId02S3o7as1mJ3iS6IKfqo3UIPFQ3Yr2QjebRolBNFsi5oAxnLJ+YOVbWBV4Say4F7Ivt/xMy1RG/OejzjJqjeFqrBdODr+8LxwJ7hidSZp+VWOlBvGK+oZGJvXVwfOcE4DJZdKcyKuS6gjb2mTz6NIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089622; c=relaxed/simple;
	bh=5S3YAVKId+04a0qvuN0YFuWomUi+TppqBBWCt03upfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=chagq4c4xEQJ4CUpI+ibY0+TvyoXruw8TotloQAI9j8BB2F4vlj5ywLZZeCN3mHkWPf4KcBdTqfw4UOvirBr1IURh2TOq2ggaHu0qPgcFd99mQppDC6c5xexQst+b9M5ol6oux2nve9EFdMOH2hNXIpNanwNFunVe/MzfRseaRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBN90tUb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBN90tUb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ad21f437eeso25855805ad.0
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776089621; x=1776694421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+qqSEWuusa4ngNGb7Rrw9FBrzRc6uTBdINaFH/HdeE=;
        b=GBN90tUbaSJDVDCerN87/RzUxkuYqEzHz5DWs2XPwWhyMX1QPasgpng/hxAeyFCpey
         ngimKXmf/VkhzBu0j3SgtUr6PopDfksyUcIsSpyaD3Mw/jQ+1zCp6PBUS/yFsB4OHqwX
         Dvf3lnSRahlVJGHIQ11rQRVAJ1KzPKhBFQB76EmP6iU3r3hG08DIvy/pALCXW+0jYFp9
         xacD/ZsA34uVvaCi4p32JifjuoNeBvBaK1mZM1vjCv72zsUrPkUiyFuA3lTVhZ3d65Ar
         hnn9M9TbL5SmTNtL4zg2dDSY1T1hq/F3rIDZ/Dv9pAPNZeq1ndXHoIUXF45P4HwC3OZf
         pYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089621; x=1776694421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+qqSEWuusa4ngNGb7Rrw9FBrzRc6uTBdINaFH/HdeE=;
        b=A76s2j4MNUlYv4f2YJRNkK8g2uVsyrdCKg9qoQSc+3M8Y4mp70MfWDhgqw6SbKN/gN
         9C70qmJ35LB2K4OOush42u4/p3sd8/lhCgQQAtvzJBlE3p9lg/+R2Pb4DkLYeIVLv+Pf
         Gi2AGalrWgWmNO2sDql/yld8u20Pz4S4pye/y1VwJDY8rfvCPKnMb0ZINz3IOkgTzBz1
         ykDuFnf60wQySfBl15X5rct7xaBV0xS1snSlTEkMSrIf1jzxDsgwMSl1xHJDtceOqFuv
         OZ+8VYdgtIj47NyQKp2gs7U9QvlP3AxdCe2DUlWUyKnSaqBuBo2vA7UTcGyH2UGVlB7a
         zUSg==
X-Forwarded-Encrypted: i=1; AFNElJ+xg3N5FhCoygLG+bFm9cv7kR90utpGzzBsgE4apuH1G+3+8KYHwlUXpo+v0FmzGFfBCMPyPDsoU2E5vA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5u7mvBs96eKMdu/Azi9niw4n8j7ITaeBh9qZ5ssGbRIMjoTSe
	ITfj95k3617gBHA2f/2IaRtDvbaNhRGicqBY/8kCFoIFc+3Q/rZZULaJ
X-Gm-Gg: AeBDietovuYw9YczInJLrBTSDr9lIsw78TzauRy5957H3zvUPZ13+il7HUgB3lJiDTG
	+BHg41vmfOs2uwBBXK4QuZOVQLmOOrl+1GO9BWu33ZgKPpXWYbvL0j+rxKxSpnPvWfKb5CrUdgo
	+o4VjO1wS7mTdegN7ds6mgix45xmeMaD1sardoC6vInfDerw3zB7MqWMId5RasU3QcEwqHr5OOF
	Pzcjv9pbYHqfth1+h9yv177lFeiyFnFVCOVfa7qVxZB9vsxPeFKhpashGpX62gcUoFu1Ct65t3/
	E18Blxjgfn8vGsmfLlh5e6Yla1jvha0hgO8VfkPuqlamToMCyMVIdcDikkpZRA20h2vCy0SVkfO
	kxX2P9DVAqlpwX6lxGyMNhtcx1lMckkm/xmbXCciZMSFCS6tF3appW7QnBGL3X5mG6S0Allx1+q
	VsyDVC0Rl7eA+sY4ShIrDYmYpGzNr6v4+5IMQsww+j7w==
X-Received: by 2002:a17:902:e78e:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2b2d5d0e8b6mr126999785ad.14.1776089620819;
        Mon, 13 Apr 2026 07:13:40 -0700 (PDT)
Received: from lgs.. ([2409:893d:1188:142d:6c67:74e8:5200:1f39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dd5cfasm144226695ad.18.2026.04.13.07.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:13:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Vamsee Vardhan Thummala <vthummala@nvidia.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] gpu: host1x: Fix device reference leak in device_add() error path
Date: Mon, 13 Apr 2026 22:13:28 +0800
Message-ID: <20260413141328.2954939-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After device_initialize(), the embedded struct device in struct
host1x_device should be released through the device core with
put_device().

In host1x_device_add(), the empty-subdevice path calls
device_add(&device->dev), but if that fails it only logs the error and
continues without dropping the device reference. That leaks the
reference held on the embedded struct device.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fix this by removing the device from host1x->devices and calling
put_device() when device_add() fails.

Fixes: fab823d82ee50 ("gpu: host1x: Allow loading tegra-drm without enabled engines")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - note that the issue was identified by my static analysis tool
  - and confirmed by manual review

 drivers/firmware/edd.c   | 2 +-
 drivers/gpu/host1x/bus.c | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/edd.c b/drivers/firmware/edd.c
index 55dec4eb2c00..82b326ce83ce 100644
--- a/drivers/firmware/edd.c
+++ b/drivers/firmware/edd.c
@@ -748,7 +748,7 @@ edd_init(void)
 
 		rc = edd_device_register(edev, i);
 		if (rc) {
-			kfree(edev);
+			kobject_put(&edev->kobj);
 			goto out;
 		}
 		edd_devices[i] = edev;
diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 723a80895cd4..63fe037c3b65 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -477,8 +477,12 @@ static int host1x_device_add(struct host1x *host1x,
 	 */
 	if (list_empty(&device->subdevs)) {
 		err = device_add(&device->dev);
-		if (err < 0)
+		if (err < 0) {
 			dev_err(&device->dev, "failed to add device: %d\n", err);
+			list_del(&device->list);
+			put_device(&device->dev);
+			return err;
+		}
 		else
 			device->registered = true;
 	}
-- 
2.43.0

