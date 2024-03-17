Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAD51CF80
	for <linux-tegra@vger.kernel.org>; Sun, 17 Mar 2024 18:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710699197; cv=none; b=qOJ614WhRWIDkBBy4mCfgw1PwswkBSRBc1rEpahcqe9dsBzGMkebkV/5CjlBgQpdEgkE33X/cnl0zHEP040/zMChYa2dlUJ8wTWblp7txwaGweNx0lk+eLWv4Zg1oaU0WwbB9cfjBzhq8Pxlms+QpAAIZNiKgdRZMejXHwuV4iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710699197; c=relaxed/simple;
	bh=A5k9HKZLDIVbVRS4LsFDHYe7oPgi6GnFw/uSmD+g00M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6CiZMUBcrFiuG4WJHyKYLGVdzbW9dSsX4eW6ZetnPUrz7X8eyHm5we5hAjvX5w6KOJ4mbFM+HWzzIeV+bFonwE12U4KKCMDU0xtcoxE70f7xTRhBLpShlB85kHDCs4ipaMHa0HbQLGNdd7p5KWaqFONfHbwn0OPpWV3IwYW0R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dD4wCZfp; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dD4wCZfp"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d228a132acso52548271fa.0
        for <linux-tegra@vger.kernel.org>; Sun, 17 Mar 2024 11:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710699194; x=1711303994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLIvWfQxZs3QTY3A1QUq5O384ZLcnnVHBqmih9QBi4c=;
        b=dD4wCZfpfzie9vjUuquVElSmKREnkzUsEPd/T5JTaBW9THZ60q34ngJyTHs3OBQtK3
         sTn9zf6cjDuOsbZlvxh1WEsY4JF05jjC8XUYNOQoa4vlLuXU59+zOK+joFzbrQ3ZG+5V
         NdZ4ECp6CDsHVOmL8K8qyUi2ziFpinyklwSDqpuubcriaZv115nNB4lOETtd6dNhAnL7
         8clHMc70FO17ccvcee3Ubd6apXjxFJaxRE7IVhtQOuacOUY5yDt5JKPJDYViHYszNA6O
         zSkGTPh4ghtiXFyR5nMslhtDU6jiNlqlZmsVdsT7M5RWBkeEOpn/WbVDr/4WzBE4wLyu
         owdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710699194; x=1711303994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLIvWfQxZs3QTY3A1QUq5O384ZLcnnVHBqmih9QBi4c=;
        b=sT+8PlqLRocJAWSC1kV5Yebki/xNf7uzkw58owQaYHhH/Z+dQLJm/36gtuCs2Xsw9V
         LyHGaU9T4tfGrbhw3iqqgKcsDiPIVZM9vknHavsdjDx/UZinZdrfExPEwFcmphX/Iy61
         a/fp6+V4j0Drc8lTVtZkXIuvk6yAFsy4Ljb7M5tCJoZ0RBnQn5ydm1bIPKKo4yR0bTwo
         vL3DFkz2wcM0Y55yW5/qvEDuYyE+pBU48bAJsHgx1OLlBGgPHLMqb1Zt876r3bt66PQG
         GkTlUJ/fYLrmQhpdomev6mJx4sNLPPH57h8yIqvlul0CKuRT+jjI8vr97wxoXtPAGdCY
         J6sg==
X-Forwarded-Encrypted: i=1; AJvYcCUVhwAHHobpYBRF01w84skCUfgZo6W7DmYwZMV5PWkaiZJ08TuCZpf3CIcvEzSsD9nMpKdonWFKi/UL7c5OtW5yfLg2ShPYUo5yJ8Q=
X-Gm-Message-State: AOJu0Yw43A73X/GPxj35sa8syCOy5ce3SvTeCBJDgZCU5d4v2DdOSlJk
	leH0SlY9zJtKcoAWXV2aeIQ/2DK+EUB0CpFO4vmREP6odKHyvODa
X-Google-Smtp-Source: AGHT+IEbGQkw1XDjMbeU/1kBANGQY/J9bKqomI2iZbYnfeHipSKJP+571GQ+9wHVnWaPWyR4ah59XQ==
X-Received: by 2002:a19:8c47:0:b0:513:ca96:dbdf with SMTP id i7-20020a198c47000000b00513ca96dbdfmr6486551lfj.12.1710699194183;
        Sun, 17 Mar 2024 11:13:14 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com. [213.67.237.183])
        by smtp.gmail.com with ESMTPSA id g12-20020a19e04c000000b005131cefefd8sm1351431lfj.240.2024.03.17.11.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 11:13:13 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
	by betty.fdsoft.se with esmtp (Exim 4.97.1)
	(envelope-from <frej.drejhammar@gmail.com>)
	id 1rluq6-000000005e0-375u;
	Sun, 17 Mar 2024 19:02:30 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-tegra@vger.kernel.org
Subject: [PATCH 10/11] drm/tegra: Use drm_driver_legacy_fb_format() for fbdev
Date: Sun, 17 Mar 2024 19:01:35 +0100
Message-ID: <a40857fd77807f00b5c62c0fbe3f951e8bcb1099.1710698387.git.frej.drejhammar@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710698386.git.frej.drejhammar@gmail.com>
References: <cover.1710698386.git.frej.drejhammar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to using drm_driver_legacy_fb_format() instead of
drm_mode_legacy_fb_format() to use the same logic as for the
DRM_IOCTL_MODE_ADDFB ioctl when selecting a framebuffer format.

Signed-off-by: Frej Drejhammar <frej.drejhammar@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org

---

This is an evolved version of the changes proposed in "drm: Don't
return unsupported formats in drm_mode_legacy_fb_format" [1] following
the suggestions of Thomas Zimmermann.

[1] https://lore.kernel.org/all/20240310152803.3315-1-frej.drejhammar@gmail.com/
---
 drivers/gpu/drm/tegra/fbdev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index db6eaac3d30e..700ab02235f5 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -87,8 +87,9 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 	cmd.pitches[0] = round_up(sizes->surface_width * bytes_per_pixel,
 				  tegra->pitch_align);
 
-	cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-						     sizes->surface_depth);
+	cmd.pixel_format = drm_driver_legacy_fb_format(drm,
+						       sizes->surface_bpp,
+						       sizes->surface_depth);
 
 	size = cmd.pitches[0] * cmd.height;
 
-- 
2.44.0

