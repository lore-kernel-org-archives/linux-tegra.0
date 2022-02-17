Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF06C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Feb 2022 19:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236437AbiBQTTz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Feb 2022 14:19:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiBQTTy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:19:54 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5E0C3C37
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:19:39 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id k25so9591536ejp.5
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5hZQlt0WbdCrilOqg+d/+UwTJ/H5zCVtwf8pir/dbc=;
        b=SZWBZuOX6UxXQyVDx1E8DIv3hn/XZn6EY8xV+ZwBoczbR/sPn5ocErzmOQgCIaHFVR
         LajPAkhEceNE0JnMqHWyIbo07XuuuhJpJWQGw352nOLQHvBapOQ5kVUooNNZhz3h0m1v
         wVwRSzVLJBJ1Ud7stusr/FJldzE3sHLMHvDnIpaasJZpxUYqKA4+BX3HUiV+dloVSVuv
         XblnW1BDRQY5uyTrfq9rkQvey56/Y5k0kT5U5uM61HgShHJjEfz366nEtMd200agYXKy
         W5rTSDTYhuH540a8IhwhMlwLJvC+4DVbEe96hdpBrI3jvrQ13XLluu+4DG8WEDc9p+Fo
         Qp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5hZQlt0WbdCrilOqg+d/+UwTJ/H5zCVtwf8pir/dbc=;
        b=iD9j1zZIweDNe9jL72APU9N+45LsWGqBN8rN4b4e1cmITqy61DBoym5Kdmi56HwOv2
         qG0TyA1ZyGnFDf7RAgaaLMN21ruEf2IH3w5zecIYesAClKbnRKj1+Hw/jJ1QfnFkTtXk
         W8hdNf2D5V+jceB5GoAitkHAZH9/LWL1BfjAsxtaXvUGan2ji5m/Uugz0xZtA/tJ8rmC
         ywcvEVvnoqbiCMaB8ID7/4ohV65/jW+4jfd6ad8tfwGrubqVgOwDtOWaVq8TUq+HD8MY
         dptAwjbhe31B61XUgrcEhIvK0BZvHh2oPUuOosnU3aI2biqXtvO5nu5/ycUFM6fuN9uv
         q4rA==
X-Gm-Message-State: AOAM532zSKJBxXb5eyesQUPVnPlvle1Of+4kt83DIxn31n7X6LA6+u0k
        HuutmOBCwBMj8loLTiiL9ZA=
X-Google-Smtp-Source: ABdhPJyCdP/ISrBdT9oHnZ3QvzOIgAgL0oBHtLahvgntCnTK5fTn0p/b7kq5pboB49hjMKs4mXdZiA==
X-Received: by 2002:a17:906:c30f:b0:6a7:7de0:7e43 with SMTP id s15-20020a170906c30f00b006a77de07e43mr3341426ejz.475.1645125578079;
        Thu, 17 Feb 2022 11:19:38 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
        by smtp.gmail.com with ESMTPSA id e18sm3770799edj.85.2022.02.17.11.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:19:37 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 06/25] tegra: Add PRIME support helpers
Date:   Thu, 17 Feb 2022 20:19:12 +0100
Message-Id: <20220217191931.2534836-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

These helpers facilitate exporting and importing buffer objects to and
from PRIME file descriptors.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- add drm_public annotations
---
 tegra/tegra-symbols.txt |  2 ++
 tegra/tegra.c           | 61 +++++++++++++++++++++++++++++++++++++++++
 tegra/tegra.h           |  4 +++
 3 files changed, 67 insertions(+)

diff --git a/tegra/tegra-symbols.txt b/tegra/tegra-symbols.txt
index 630e075fa5d7..f8811bcd26f4 100644
--- a/tegra/tegra-symbols.txt
+++ b/tegra/tegra-symbols.txt
@@ -1,5 +1,7 @@
+drm_tegra_bo_export
 drm_tegra_bo_get_handle
 drm_tegra_bo_get_name
+drm_tegra_bo_import
 drm_tegra_bo_map
 drm_tegra_bo_new
 drm_tegra_bo_open
diff --git a/tegra/tegra.c b/tegra/tegra.c
index 3d645d87dd3d..cf091c1d758f 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -290,3 +290,64 @@ free:
     free(bo);
     return err;
 }
+
+drm_public int drm_tegra_bo_export(struct drm_tegra_bo *bo, uint32_t flags)
+{
+    int fd, err;
+
+    flags |= DRM_CLOEXEC;
+
+    err = drmPrimeHandleToFD(bo->drm->fd, bo->handle, flags, &fd);
+    if (err < 0)
+        return err;
+
+    return fd;
+}
+
+static ssize_t fd_get_size(int fd)
+{
+    ssize_t size, offset;
+    int err;
+
+    offset = lseek(fd, 0, SEEK_CUR);
+    if (offset < 0)
+        return -errno;
+
+    size = lseek(fd, 0, SEEK_END);
+    if (size < 0)
+        return -errno;
+
+    err = lseek(fd, offset, SEEK_SET);
+    if (err < 0)
+        return -errno;
+
+    return size;
+}
+
+drm_public int
+drm_tegra_bo_import(struct drm_tegra *drm, int fd, struct drm_tegra_bo **bop)
+{
+    struct drm_tegra_bo *bo;
+    ssize_t size;
+    int err;
+
+    size = fd_get_size(fd);
+    if (size < 0)
+        return size;
+
+    bo = drm_tegra_bo_alloc(drm, 0, 0, size);
+    if (!bo)
+        return -ENOMEM;
+
+    err = drmPrimeFDToHandle(drm->fd, fd, &bo->handle);
+    if (err < 0)
+        goto free;
+
+    *bop = bo;
+
+    return 0;
+
+free:
+    free(bo);
+    return err;
+}
diff --git a/tegra/tegra.h b/tegra/tegra.h
index 333690f23118..aaaf455fbc8e 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -48,4 +48,8 @@ int drm_tegra_bo_get_name(struct drm_tegra_bo *bo, uint32_t *name);
 int drm_tegra_bo_open(struct drm_tegra *drm, uint32_t name, uint32_t flags,
                       struct drm_tegra_bo **bop);
 
+int drm_tegra_bo_export(struct drm_tegra_bo *bo, uint32_t flags);
+int drm_tegra_bo_import(struct drm_tegra *drm, int fd,
+                        struct drm_tegra_bo **bop);
+
 #endif /* __DRM_TEGRA_H__ */
-- 
2.35.1

