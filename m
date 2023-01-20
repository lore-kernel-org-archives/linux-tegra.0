Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9EFC25B4E
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 11:01:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjATLBr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 06:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjATLBq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 06:01:46 -0500
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3708198F
        for <linux-tegra@vger.kernel.org>; Fri, 20 Jan 2023 03:01:43 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 73BD16005417;
        Fri, 20 Jan 2023 11:01:41 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id ICeXlJh9ODVn; Fri, 20 Jan 2023 11:01:39 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id E0FC86008828;
        Fri, 20 Jan 2023 11:01:38 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1674212498;
        bh=1i7ZM7JBIch0EFpyRdS3vKkrg3F2HsqVRYNLeQhAoHM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=EF1DwECEhs76V+dCllEtG1KJ3G6I4xlM/xgNk+0ZerSURaE+dZqSRRz23NKpvTMCe
         Jx99/OQijubPvq8NBgGHbxjaAK3bhc+qwZZd9XL5y5Up0sk0yF14dtWxxowJy5G8zn
         eb//GwChlJdvflEBObUTu54/K1bR69mfeHvm0pGM=
Received: from wslaptop.lan (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id BE797360092;
        Fri, 20 Jan 2023 11:01:38 +0000 (WET)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     diogo.ivo@tecnico.ulisboa.pt, thierry.reding@gmail.com,
        airlied@redhat.com, daniel@ffwll.ch, jonathanh@nvidia.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] drm/tegra: add sector layout to SET/GET_TILING IOCTLs
Date:   Fri, 20 Jan 2023 10:58:57 +0000
Message-Id: <20230120105858.214440-2-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120105858.214440-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230120105858.214440-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 7b6f846785f4 ("drm/tegra: Support sector layout on Tegra194")
updated struct tegra_bo_tiling with a new field conveying information
about the sector layout of the buffer object. Update the
SET/GET_TILING IOCTLs with this field so that userspace can set it
appropriately.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/gpu/drm/tegra/drm.c  | 29 +++++++++++++++++++++++++++++
 include/uapi/drm/tegra_drm.h | 16 ++++++++++------
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6748ec1e0005..27afb7fa6259 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -612,6 +612,7 @@ static int tegra_gem_set_tiling(struct drm_device *drm, void *data,
 	enum tegra_bo_tiling_mode mode;
 	struct drm_gem_object *gem;
 	unsigned long value = 0;
+	enum tegra_bo_sector_layout layout;
 	struct tegra_bo *bo;
 
 	switch (args->mode) {
@@ -644,6 +645,19 @@ static int tegra_gem_set_tiling(struct drm_device *drm, void *data,
 		return -EINVAL;
 	}
 
+	switch (args->sector_layout) {
+	case DRM_TEGRA_GEM_SECTOR_LAYOUT_TEGRA:
+		layout = TEGRA_BO_SECTOR_LAYOUT_TEGRA;
+		break;
+
+	case DRM_TEGRA_GEM_SECTOR_LAYOUT_GPU:
+		layout = TEGRA_BO_SECTOR_LAYOUT_GPU;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
 	gem = drm_gem_object_lookup(file, args->handle);
 	if (!gem)
 		return -ENOENT;
@@ -652,6 +666,7 @@ static int tegra_gem_set_tiling(struct drm_device *drm, void *data,
 
 	bo->tiling.mode = mode;
 	bo->tiling.value = value;
+	bo->tiling.sector_layout = layout;
 
 	drm_gem_object_put(gem);
 
@@ -693,6 +708,20 @@ static int tegra_gem_get_tiling(struct drm_device *drm, void *data,
 		break;
 	}
 
+	switch (bo->tiling.sector_layout) {
+	case TEGRA_BO_SECTOR_LAYOUT_TEGRA:
+		args->sector_layout = DRM_TEGRA_GEM_SECTOR_LAYOUT_TEGRA;
+		break;
+
+	case TEGRA_BO_SECTOR_LAYOUT_GPU:
+		args->sector_layout = DRM_TEGRA_GEM_SECTOR_LAYOUT_GPU;
+		break;
+
+	default:
+		err = -EINVAL;
+		break;
+	}
+
 	drm_gem_object_put(gem);
 
 	return err;
diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
index 94cfc306d50a..811e21b1a60e 100644
--- a/include/uapi/drm/tegra_drm.h
+++ b/include/uapi/drm/tegra_drm.h
@@ -508,6 +508,9 @@ struct drm_tegra_submit {
 #define DRM_TEGRA_GEM_TILING_MODE_TILED 1
 #define DRM_TEGRA_GEM_TILING_MODE_BLOCK 2
 
+#define DRM_TEGRA_GEM_SECTOR_LAYOUT_TEGRA 0
+#define DRM_TEGRA_GEM_SECTOR_LAYOUT_GPU 1
+
 /**
  * struct drm_tegra_gem_set_tiling - parameters for the set tiling IOCTL
  */
@@ -543,11 +546,11 @@ struct drm_tegra_gem_set_tiling {
 	__u32 value;
 
 	/**
-	 * @pad:
+	 * @sector_layout:
 	 *
-	 * Structure padding that may be used in the future. Must be 0.
+	 * Specify low-level sector layout.
 	 */
-	__u32 pad;
+	__u32 sector_layout;
 };
 
 /**
@@ -578,11 +581,12 @@ struct drm_tegra_gem_get_tiling {
 	__u32 value;
 
 	/**
-	 * @pad:
+	 * @sector_layout:
 	 *
-	 * Structure padding that may be used in the future. Must be 0.
+	 * The sector layout parameter currently associated with the GEM object.
+	 * Set by the kernel upon successful completion of the IOCTL.
 	 */
-	__u32 pad;
+	__u32 sector_layout;
 };
 
 #define DRM_TEGRA_GEM_BOTTOM_UP		(1 << 0)
-- 
2.39.1

