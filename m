Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028AA2DECAE
	for <linux-tegra@vger.kernel.org>; Fri, 13 Jun 2025 12:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749817733; cv=none; b=uZAki6IoF2RdKUfjUrQQyB0QgTJwzAFregEtaQywP1ORWuwRV7hJv8p60RHiUzqr6s8O3Hg1IjUAaZUCNASNQvjWVL4+1VmpXyHXGCwoeri+C7wZsn/OlFLnCBmhi8COhMIRGMB2gHHiL6hwD830tpDnKE7PaRmNEiBS4x/uMd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749817733; c=relaxed/simple;
	bh=B3d/54kUt5PbY30XYh7UucGZrzO5LeADz04Nw7fCcJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L+kOT996GZ38ExsloPSGyKiwIQujeBstAOYR/RnbgubI1HZ2XeNV1EfQtYgiLAYNmp9uVT5UPaO1UuJQ4HWRUvhIF66rY7MrSptGiWtLWeO07FefSZ1oovPBHRS9RTgNMu9lMEenVUrFuKDGnEOmIntxztr62fOM1p7yCcz29cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9JTocyZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9JTocyZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so24360225e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Jun 2025 05:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749817730; x=1750422530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3SdZ/GxfWV/W/p+CZLyOj0V8DqNHminUrDVPHxaO0zY=;
        b=B9JTocyZ0aQuF7GmRDxjU26KfHsKstNCJJVG4iWF5pVuGSzCi3Z6rMD8ZdhET1hmAD
         rhvHvcZvCO9uEiPJrbwEpM+2LVgKHxEsbrfK4x+X0YQ125rm9gwE+cyf6U0u5fNWTRAi
         wKhb9IFzNZ57rhk3fjh7rCBtFskSXifbsDsg4ZHWLmHkcPH3H3k/BObMiOUH8gcz5BGC
         OGMCpPeXB48+A0fn2nOw01pDIFLv8Ejojsx50GCFs/4aPRI7wNBC9jCIznp/0H0EbMEg
         9KGBG4NpPA0e31YvI7StUPvcG9W4OvSZICYmukO1VhWXlFNARE1qQcsqOGl+Z7fF8upq
         KDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749817730; x=1750422530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SdZ/GxfWV/W/p+CZLyOj0V8DqNHminUrDVPHxaO0zY=;
        b=V0BAYy+m6BxjZ6dcur2ec8QGHzT4ITVq4INpiLJrAVd+zFU/pHzqH7qXFeqLsAfSQp
         BMm6tHC1KgcQoyVErXj9Lqd3YhVlDjgnLiGciVrAnQ7FLY4Zz/U6qi7L+GvNlTOEFumS
         IqmShFart0J/O2G8rFkxE4vcl2oMEPhZvCA8MvBuOGsUYuvCWOxvzFZtEuWLvrndirZr
         QwjSQ5WZeRlW+nvu1Uvw3TbBT+WoRkHZchItAJjfsuUxAKlPd21r+4s68/15EjYPlJ9q
         uaqfNMxrb6u4DomCdPYKchhVnszB+mHQK91KvVcNonHCDzcW+18dLgCW9etZJCFfMJIb
         jPAw==
X-Forwarded-Encrypted: i=1; AJvYcCUnTbahWA5/9Wa88msnPsnRUsEeOYTHRUSRceKdDnURka5SNTJZ9iMWqmgdbC+VpNggJX2zNOOE4hn7Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrs05eN8VIX4VzedNeX41Ja7Sl7bk+6GDaYxT1SOg5pDmZ6+qd
	khLCFr8mmuSLurrMCRfFqjy9rjBMRzCHpqX5ih7+2i7jSGCbBxeCmany
X-Gm-Gg: ASbGncti9dsn/5t/jeIhVSVRpY9WSzKqNZhP1AY/MWG98a8+oiMCTUKaPFoa7neYIuJ
	2AMBHnPIppUZbKW3sQUJfyl47bJe7ATa67ddZ5OTampWvJ9ZFw7lSdHa7TwAfYY8fjSTDigf/G0
	4L/LStcbNS3Rhptc5DbF5oPxhSA/BmVUJyHn8LJB1TXQLALNgJVwD2UXJWBZNqJFLoR0rLWOG0T
	Sn8IeaKByUYhiCIFuvpoJzHCrWOhrrjoSyw7iD2cgz1M5vjSJxNOQDWpNH9aUtOTDkBPRa4vgSB
	sz7f446ym1WMDbgaTGJc9PqvQkm1cF5sjpZ4t03gXZbbRSwUmVzml+wq1+S+FoqnkJP/cHf5q+6
	1i93hrZ3LI2o0BlwvC7rCF0UftR6ZYCJvayoBHBgO75SKQUR1Id44YA==
X-Google-Smtp-Source: AGHT+IEFHENr5ISYnvmEiH8MxR7Wx9/fODHzGABFsPhDA+iTx85P13NmyGBvASmtgR9S5z/x1X2KCg==
X-Received: by 2002:a05:6000:2889:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3a56869cdfemr2520299f8f.3.1749817729957;
        Fri, 13 Jun 2025 05:28:49 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532e232e0asm49941605e9.14.2025.06.13.05.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 05:28:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2] drm/fbdev-client: Skip DRM clients if modesetting is absent
Date: Fri, 13 Jun 2025 14:28:38 +0200
Message-ID: <20250613122838.2082334-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Recent generations of Tegra have moved the display components outside of
host1x, leading to a device that has no CRTCs attached and hence doesn't
support any of the modesetting functionality. When this is detected, the
driver clears the DRIVER_MODESET and DRIVER_ATOMIC flags for the device.

Unfortunately, this causes the following errors during boot:

    [      15.418958] ERR KERN drm drm: [drm] *ERROR* Failed to register client: -95
    [      15.425311] WARNING KERN drm drm: [drm] Failed to set up DRM client; error -95

These originate from the fbdev client checking for the presence of the
DRIVER_MODESET flag and returning -EOPNOTSUPP. However, if a driver does
not support DRIVER_MODESET this is entirely expected and the error isn't
helpful.

Prevent this misleading error message by setting up the DRM clients only
if modesetting is enabled.

Changes in v2:
- use DRIVER_MODESET check to avoid registering any clients

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/clients/drm_client_setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/clients/drm_client_setup.c b/drivers/gpu/drm/clients/drm_client_setup.c
index e17265039ca8..e460ad354de2 100644
--- a/drivers/gpu/drm/clients/drm_client_setup.c
+++ b/drivers/gpu/drm/clients/drm_client_setup.c
@@ -2,6 +2,7 @@
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_print.h>
 
@@ -31,6 +32,10 @@ MODULE_PARM_DESC(active,
  */
 void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format)
 {
+	if (!drm_core_check_feature(dev, DRIVER_MODESET)) {
+		drm_dbg(dev, "driver does not support mode-setting, skipping DRM clients\n");
+		return;
+	}
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 	if (!strcmp(drm_client_default, "fbdev")) {
-- 
2.49.0

