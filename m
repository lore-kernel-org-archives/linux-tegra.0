Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D628D829
	for <linux-tegra@vger.kernel.org>; Thu, 10 Apr 2025 16:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302830; cv=none; b=bVKERo1vp3N7uGLxLwGrBH3ICyJ3R8f3zxNymOKkLvTw+qW/rlgub4oxvBWBcvl2DPIayoTjpQcH3Wqn36gLC0h73/CwvG/CaUZ/e4GIP82zY8uFbUzMdd1Gy1Ipgu4rZc3b4hxWYn1qnFkDQtn+4zd57HiEOcizmBWPldh26AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302830; c=relaxed/simple;
	bh=4ZaeMbqK0sE3UONDWrrJ8vFnPm4VLfIAOPYhXNNVoAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nXl+TEK416Zy80nWRXstAbCSxSXjNVXmE3GwyYzUqlv6BMJLiV2lqt9uxThpYkGqPiIfpC4Hmi3DC88Po43/CSK7j2GMEKTHmngyaDdn4tIgMEzyKExN+OwhpQ3TjBPNsEmJP3JgqAdpQGGsfHNy/me9yfrY1NHz3qVqtpMzsAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAatwzFg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAatwzFg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744302829; x=1775838829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4ZaeMbqK0sE3UONDWrrJ8vFnPm4VLfIAOPYhXNNVoAI=;
  b=OAatwzFgPJE2jkbfrnCLOWRbJ5FJYr/MxdGe8Kfy2xdIGyK/3H7F5rdl
   GsuNbAuGyttn5SRCod/lTsURYcBfFbGA8xRL1voom8sIU1pNVKywGHdh7
   yaXKUm/qRZRlZiqL1Ky87Z6dHApxAh/uGLHkgvD+pk1GcuOvymQFxXw/j
   DRgnDtb/rgbCQhNde6minjYAM5tzHvB+hG/phrv17SF26jWzQ4SSe4WZf
   ibbjMbJpV8NMU96Tc20IPX9HlNJIw/vSLQ869y4DNzIk7chXg3MNvh8le
   1U1PDP3wpGibyCZyYL+Z6FNGHg1ITS9OKjcEAuPfBn4yBZcFzvTT4P7fk
   A==;
X-CSE-ConnectionGUID: zZbasvszQ9Cjkuoc4cL1CA==
X-CSE-MsgGUID: czJsXQBXTdOkbaE40qdOJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57220133"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="57220133"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 09:33:48 -0700
X-CSE-ConnectionGUID: vu5lqsslS1edU0gDIGqzCw==
X-CSE-MsgGUID: a8YcnJREQuSFX7pxyBuAEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134129393"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:33:46 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 10 Apr 2025 19:33:45 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH 16/19] drm/tegra: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Thu, 10 Apr 2025 19:32:15 +0300
Message-ID: <20250410163218.15130-17-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Plumb the format info from .fb_create() all the way to
drm_helper_mode_fill_fb_struct() to avoid the redundant
lookup.

For the fbdev case a manual drm_get_format_info() lookup
is needed.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/tegra/drm.h   | 1 +
 drivers/gpu/drm/tegra/fb.c    | 5 +++--
 drivers/gpu/drm/tegra/fbdev.c | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 77e520c43f72..1dd3670f37db 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -185,6 +185,7 @@ bool tegra_fb_is_bottom_up(struct drm_framebuffer *framebuffer);
 int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 			struct tegra_bo_tiling *tiling);
 struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
+				       const struct drm_format_info *info,
 				       const struct drm_mode_fb_cmd2 *mode_cmd,
 				       struct tegra_bo **planes,
 				       unsigned int num_planes);
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index d359683f5ce6..dd041089f797 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -102,6 +102,7 @@ static const struct drm_framebuffer_funcs tegra_fb_funcs = {
 };
 
 struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
+				       const struct drm_format_info *info,
 				       const struct drm_mode_fb_cmd2 *mode_cmd,
 				       struct tegra_bo **planes,
 				       unsigned int num_planes)
@@ -114,7 +115,7 @@ struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
 	if (!fb)
 		return ERR_PTR(-ENOMEM);
 
-	drm_helper_mode_fill_fb_struct(drm, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(drm, fb, info, mode_cmd);
 
 	for (i = 0; i < fb->format->num_planes; i++)
 		fb->obj[i] = &planes[i]->gem;
@@ -166,7 +167,7 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 		planes[i] = to_tegra_bo(gem);
 	}
 
-	fb = tegra_fb_alloc(drm, cmd, planes, i);
+	fb = tegra_fb_alloc(drm, info, cmd, planes, i);
 	if (IS_ERR(fb)) {
 		err = PTR_ERR(fb);
 		goto unreference;
diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index cd9d798f8870..1b70f5e164af 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -106,7 +106,9 @@ int tegra_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 		return PTR_ERR(info);
 	}
 
-	fb = tegra_fb_alloc(drm, &cmd, &bo, 1);
+	fb = tegra_fb_alloc(drm,
+			    drm_get_format_info(drm, cmd.pixel_format, cmd.modifier[0]),
+			    &cmd, &bo, 1);
 	if (IS_ERR(fb)) {
 		err = PTR_ERR(fb);
 		dev_err(drm->dev, "failed to allocate DRM framebuffer: %d\n",
-- 
2.49.0

