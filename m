Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DAC21364
	for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708700621; cv=none; b=lW/f2KFIU3S59ygaBAkgI3RB/jf+OYEZtl2nGqLdBy1/WGPLipSZ4Rv/CKl04EdGlBcIEpVU+/hLAuqI2s1iMxsmZLt4j4CIdZmG9sVXNtoDGitsUNb+A8URk3qZRBDYxl4JEkgF6h1b5sw0EcLC8eh1G3ykvhJvwXbelo6c7c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708700621; c=relaxed/simple;
	bh=U8+ifTus9CkMKeig94nuZGPHrRHjCHA5f0fFa1pnYzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mOlyFxAmeRsT2CcwIWnfWONnygn5jcKHV3jiqQJzV/slCzdXnNmTDqvh3X+DodwKtNsvagkl2xS/Y4JyhTIM58uoZuQIjCMIKmeYIYP/4Y/zGivVVLDE1tqmixwaE6lZ6+Jm9HrtFo+ubjOiqkjfDq7BIZ5xxaE+H4468qpndnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrpNgvGv; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrpNgvGv"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso14764791fa.2
        for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 07:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708700618; x=1709305418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bsmjM6WwTBzUeQ523EB+ChNwuteUkHGzR+sENItSXHQ=;
        b=UrpNgvGvx1/zH5y5Y1Zea7Pbxm1Q4HHw+syIMZ1BF0XofKAJCMSwQSu3xMET2loBOi
         +eQOaz3mAPQUpIgI2aw01RR4MZNKwDMiagjCdQRdmcs5tfHBDTtPwcpujs8+N29oIfBg
         LlD8A9SykOTXH/cq8hVmebF8M/Kk5eoMOPAz3zOT2kRe9n615FlUGJQ9WGi6b7vsoyuC
         H3ibJ9YelitCUA1/zS7r88rnUQZhT0SE6I6U1PapHrwOxYZ69Tb1zBXXTnxq+Ar6ncAH
         2hpw4s39ghtQT5WtEmrin97khVMDZZC4Mw/DM+Ry6mD39cAHAI0x4nP2PdjX5SC7K4Sg
         Otrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708700618; x=1709305418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsmjM6WwTBzUeQ523EB+ChNwuteUkHGzR+sENItSXHQ=;
        b=QN0KyJJiGgl5FFoIf9C06dIU1eC8nvJJjxez+RP64YXx/9e7eKa8NqZjl+xCUNrApL
         cf8J1DLtjC/ldZXT06DdTyN34tWCXmaQ/Y3MVd4ZdTxQO7bAOWxr0cx1owNLTwuTg+0N
         hUO6pzew0w64K6Yw5YLMyw9DEnvrmh2QGQyXdITt2maKmEiA+7z4BHSx1UL++zCAuiaK
         X51hBF8btpGSseJ5XW1O6fRD0YhvjKwmphtvzo7AvnD5jAJlSgFxteiX05cjOfWeIw/1
         JLpdhBShhA0DfCAjBR/Pe4iCYIjJ83hwvbSlKKA3uLZTKRtc8fnGxb6QJ0GivEqoI817
         1JIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwEnzr46QlL98f72cdmSg4jL7ahynLdYuNqCVqUlFrVWDbcS2Cr621DvcZB/kO0adRaqFwMWicaWeiTcs44ASOt32Jn6yHboxR78U=
X-Gm-Message-State: AOJu0Yx7nI1zHvWlbg1ijP9kikVIKddUyhbR4u5gIxW2jXrCGPSnQ2XB
	DHLrXDgZDpXxS83NiQYYEO8rxYnQ4wT8soVroZqvPM3aewTcTYW3
X-Google-Smtp-Source: AGHT+IExcV0O/a9N0xbqYE77VwYcfiEtYc4dhxRdq89w4QTviBrOCekRLjxlKjQUx5n0OgF07p6nPg==
X-Received: by 2002:a2e:a543:0:b0:2d2:31a8:cb12 with SMTP id e3-20020a2ea543000000b002d231a8cb12mr56930ljn.49.1708700617383;
        Fri, 23 Feb 2024 07:03:37 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d9-20020a05600c3ac900b00410cfc34260sm2705535wms.2.2024.02.23.07.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 07:03:37 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2] drm/tegra: Remove existing framebuffer only if we support display
Date: Fri, 23 Feb 2024 16:03:33 +0100
Message-ID: <20240223150333.1401582-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Tegra DRM doesn't support display on Tegra234 and later, so make sure
not to remove any existing framebuffers in that case.

v2: - add comments explaining how this situation can come about
    - clear DRIVER_MODESET and DRIVER_ATOMIC feature bits

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index b1e1a78e30c6..2e1cfe6f6d74 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1220,9 +1220,26 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	drm_mode_config_reset(drm);
 
-	err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
-	if (err < 0)
-		goto hub;
+	/*
+	 * Only take over from a potential firmware framebuffer if any CRTCs
+	 * have been registered. This must not be a fatal error because there
+	 * are other accelerators that are exposed via this driver.
+	 *
+	 * Another case where this happens is on Tegra234 where the display
+	 * hardware is no longer part of the host1x complex, so this driver
+	 * will not expose any modesetting features.
+	 */
+	if (drm->mode_config.num_crtc > 0) {
+		err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
+		if (err < 0)
+			goto hub;
+	} else {
+		/*
+		 * Indicate to userspace that this doesn't expose any display
+		 * capabilities.
+		 */
+		drm->driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
+	}
 
 	err = drm_dev_register(drm, 0);
 	if (err < 0)
-- 
2.43.2

