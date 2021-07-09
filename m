Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D99C07E9C
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CB0D613C3
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhGITcZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 15:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhGITcZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 15:32:25 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F6EC0613DD
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 12:29:40 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id a5-20020a7bc1c50000b02901e3bbe0939bso6979150wmj.0
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 12:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AdLcTRIWBNsI6B28xgdufoW2tJ7+hChXLZ6LrUe2WGw=;
        b=cyPTUDOINofC9gk2QIHwy4LVVdGvEaXD8Qdygp0jgNILRlWaANqbKToIOMWfkkSASs
         6DvyaYpvZPAa1B21oa9zeasMrixPKK/EmrfiN0YA32xJC9FVrJEgOEGK/QKOX691WCBz
         xA6rz387EFwPquer+pRl67YWpsi3YnprcjbNTQLCEsfzarnZ+aRvbOuBCvsOvn3vpE04
         It/whpV46PX/ksxUG0Uk5PUPphOctGEANZQxibRgRlgra5qL4PomSrIvUjy3v+5Atpk1
         7KCo7yQd78J2wXBR5OQBgheXn87mnnpgGBoqEZWybp+Vq3mwBrjARhKEDBFsSJ5+If0i
         2ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AdLcTRIWBNsI6B28xgdufoW2tJ7+hChXLZ6LrUe2WGw=;
        b=fTfBRzlKaErOrMYBIWAxD9YLmyQgt5QgaAaVCmuO11OZ/Xqk6A/WtqERJUA+kQvjnz
         4+ngmsRp2cv2L+H5CSfIpFIGRXHlBmcY8uabg/FxrPQm7qtrtN7xU+R74bQWJBNRFv56
         glFNjddZtm/sNMXxIlPlm1ghjFe3+OcLTA968+6q6FiT8B8CcX8R6N9jxA1QJTmotIfi
         7dTHzOD2NzHXtmujid+aFJ+T01Y7VJoBFOJp1gpVUvAhfUjNufK0c2rOYN31khxk0M6w
         c16Qm2HtlPcV5C0DCwvQjZiNxYUu85OkexTxbPXQANExp7ZHcEwiSFAsZc9v8nEiNYF7
         y6EA==
X-Gm-Message-State: AOAM531l1MB+2X5QiKm/Gk7oASsLXyiDbyPguwFhZv57GiWhobaEqibB
        W9/NvIbqr3TSIEUrjncWF4Q=
X-Google-Smtp-Source: ABdhPJz3OWweGn3OR8zd7DEwqR9tFVenHuC7VNywboQIBKxV8uSe7j9G8yOGGb3BgQh1TBRwWh7xeQ==
X-Received: by 2002:a7b:ca50:: with SMTP id m16mr536046wml.140.1625858979234;
        Fri, 09 Jul 2021 12:29:39 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id s24sm6426081wra.33.2021.07.09.12.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 12:29:38 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v8 11/14] drm/tegra: Implement syncpoint wait UAPI
Date:   Fri,  9 Jul 2021 21:31:43 +0200
Message-Id: <20210709193146.2859516-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Implement new syncpoint wait UAPI. This is different from the
legacy one in taking an absolute timestamp in line with modern
DRM conventions.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v8:
- rebase on top of latest UABI changes

 drivers/gpu/drm/tegra/drm.c  |  2 ++
 drivers/gpu/drm/tegra/uapi.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi.h |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 18aee825a1ff..082d520bdffc 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -732,6 +732,8 @@ static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_FREE, tegra_drm_ioctl_syncpoint_free,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_WAIT, tegra_drm_ioctl_syncpoint_wait,
+			  DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap, DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index e91394e7264e..0ba57697706b 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_utils.h>
 
 #include "drm.h"
 #include "uapi.h"
@@ -363,3 +364,24 @@ int tegra_drm_ioctl_syncpoint_free(struct drm_device *drm, void *data,
 
 	return 0;
 }
+
+int tegra_drm_ioctl_syncpoint_wait(struct drm_device *drm, void *data,
+				   struct drm_file *file)
+{
+	struct host1x *host1x = tegra_drm_to_host1x(drm->dev_private);
+	struct drm_tegra_syncpoint_wait *args = data;
+	signed long timeout_jiffies;
+	struct host1x_syncpt *sp;
+
+	if (args->padding != 0)
+		return -EINVAL;
+
+	sp = host1x_syncpt_get_by_id_noref(host1x, args->id);
+	if (!sp)
+		return -EINVAL;
+
+	timeout_jiffies = drm_timeout_abs_to_jiffies(args->timeout_ns);
+
+	return host1x_syncpt_wait(sp, args->threshold, timeout_jiffies,
+				  &args->value);
+}
diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
index e4e498facf61..12adad770ad3 100644
--- a/drivers/gpu/drm/tegra/uapi.h
+++ b/drivers/gpu/drm/tegra/uapi.h
@@ -49,6 +49,8 @@ int tegra_drm_ioctl_syncpoint_allocate(struct drm_device *drm, void *data,
 				       struct drm_file *file);
 int tegra_drm_ioctl_syncpoint_free(struct drm_device *drm, void *data,
 				   struct drm_file *file);
+int tegra_drm_ioctl_syncpoint_wait(struct drm_device *drm, void *data,
+				   struct drm_file *file);
 
 void tegra_drm_uapi_close_file(struct tegra_drm_file *file);
 void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping);
-- 
2.32.0

