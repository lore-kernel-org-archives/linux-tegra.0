Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C5233F6
	for <linux-tegra@vger.kernel.org>; Sat, 12 Apr 2025 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744441259; cv=none; b=qUqOb31m60N75WKcf0QspsnliuBvkq4kNpj18ODWRzJhpIVRNKsvz55AEssPgxA2e13p+NaRSzxy5OEk562PW/qnx7vrYS0qcbykOESdW4oUvHHthgJwGEuOLJixoF8G8LZjCKEbv3/uslVl6rYaLidgHetCJriRRq81mGxKMVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744441259; c=relaxed/simple;
	bh=bYlEK+ZrCx1PQLyeDSym1XsSvn526gaNT+fK7d3xUWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hgBdkX9NZfz/Ewjue5ZVDfrnb1vhjGGJVvn9qVcsXUGA0WDxr/Pj8d0WMBwet4GoaKb1sjGZ8xClJqh2UJaAZ5ZUmXztTbbD3KqU11I+B/SuCAdOfZREyiSZ10+50wQOnoWOIrRoyRvA9HvUNMn2RVgjYWgK5y/2FX3PMnRe9pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAnQRu8b; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAnQRu8b"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edb40f357so22760695e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 12 Apr 2025 00:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744441255; x=1745046055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QUhRGZgWSR7a5HDQ/6iMHlL/ln4asDDzoYvwsKfR2to=;
        b=WAnQRu8bZpjjw9Fr57QnO7xyZz3VI/OVdmTxXvgtR69PBoqYNpzgW0rz/WYx5hgct4
         xXLsTElT3H4SBOv/S8D4hsP9q0T8Qe1Y9B3mFjIVVjFeX9ZOaxxudUY8uXq+kvIiG7XQ
         KyYO7KdOEwp56yT7sYaJPXlW5Ddib9mxVh3qQ8WIq8MN1yo1whG9JwzqjBi4vsm8dIxg
         KmS45NIUAcZ5p8ITLrngWqq8VHUKUQcVbQjs+0c457QUpVHk7n1LFpkR3lkodIqdVNMO
         yh+PLdCo0rXH6GX+J358jexUtM81C/NyCbh5ZixXqZO51vA6BEIcfJIMPrxRiCUg/uF/
         W8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744441255; x=1745046055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUhRGZgWSR7a5HDQ/6iMHlL/ln4asDDzoYvwsKfR2to=;
        b=pnk8aYlD/Mw3EMFvozdl5BSnBmE9NWa43xXJnapPITnQlnKINmxyNvUUFzeWDPfVLi
         +KdBi0zR10d8LR50cX5p6cBahbGyOM87twP2bu6y9hNAG/DssTrwpyl4x4oqHZ9zZH+q
         rjt6dfetB/W02U1QLN9TwEedOpUeiZ72cocc/1naw6kUUGmPgvpx3LOMdVGOMS7l0Fei
         drcHA4OlWFNQtbuwCG16kv4smcOtlnWjscJNWJNPmKOWDnBqB4U09jGz+LfZHBEDn0zf
         vx3m8bY5QfWp2Zf57qoGwxKNZNgI2LUrDTVUSJUP5n13da6RbAUj0xG2TpXorP4eeITU
         LOSA==
X-Forwarded-Encrypted: i=1; AJvYcCU+6IPH9HzUzk58ArtcecoBvglwILFV13MvLO1kIk70HOF3tCGMjmqAcMzWY9UOnlNNxkAqu/T2ivK4kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoOLMh8a8cCQrBrhMu1bSirAoutV9itugOjVumohuVjmCknZLL
	m8Ets55WJLf0qQc8H9JPZ9R7eGyTlz5alWcxjK4YfDU3twY502Hg
X-Gm-Gg: ASbGncvS2xn+P6uvY4rfbFD3hixm8Fp1pMwHa9FU29m1sOk+RrFF6GpZTfqjjcVDQLl
	zEjyX5YzuLJRgv24dRZ9iFSuMYA0u+WiKLgmn+bMU0ghLO1vMYy7WIK9yvYLuN6aDCp+V84JtUN
	/PVn74O8Uf2eMZ3V240Vg/CvQucl1T8/f93P3BXdVCvTOpDVd+LYfJwido/nY5Ale65FR05cdH+
	c28qI6vZDPvX0uEP345JLGOS2R1AhBsiH0F+PWlrChYVXnVjyAXr5jZHkfBZJyiZTA42MHhmXnS
	VJMQ6dIPVfXD6WFBs6zZRJNyDd2bvKGpQjlcukL7+JXm8EM1vVB5hGlzFEVXeF/0h4BTBhmrS8w
	q+aCI1QHNDXN0/ow4i1XI0ap+q/ddOy6VDblsKih5/mY=
X-Google-Smtp-Source: AGHT+IErTOfdmVU3EKuPUo3Ppbpde7QYvJavdfbvObKt8eiHhHZBg2K6Hm/AdPV1iYx6YJippo3mBw==
X-Received: by 2002:a5d:584a:0:b0:39c:30d8:a80 with SMTP id ffacd0b85a97d-39ea51f52fbmr4245757f8f.19.1744441255310;
        Sat, 12 Apr 2025 00:00:55 -0700 (PDT)
Received: from localhost (p200300e41f1b5e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:5e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae96c02esm4170184f8f.23.2025.04.12.00.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 00:00:53 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] drm/fbdev-client: Ignore EOPNOTSUPP errors
Date: Sat, 12 Apr 2025 09:00:47 +0200
Message-ID: <20250412070047.6725-1-thierry.reding@gmail.com>
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

One solution would have been to conditionally call drm_client_setup()
only if modesetting is supported. This seems a bit redundant, however,
and could further complicate things if ever any DRM clients are added
that do not rely on modesetting.

Instead, simply add an extra check to ignore this expected error and
skip the fbdev client registration.

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/clients/drm_fbdev_client.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
index f894ba52bdb5..8c8552ed912e 100644
--- a/drivers/gpu/drm/clients/drm_fbdev_client.c
+++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
@@ -152,7 +152,11 @@ int drm_fbdev_client_setup(struct drm_device *dev, const struct drm_format_info
 
 	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
 	if (ret) {
-		drm_err(dev, "Failed to register client: %d\n", ret);
+		if (ret != -EOPNOTSUPP)
+			drm_err(dev, "Failed to register client: %d\n", ret);
+		else
+			ret = 0;
+
 		goto err_drm_client_init;
 	}
 
-- 
2.49.0

