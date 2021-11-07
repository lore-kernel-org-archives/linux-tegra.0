Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26109C433F5
	for <linux-tegra@archiver.kernel.org>; Sun,  7 Nov 2021 23:08:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09CB6613B3
	for <linux-tegra@archiver.kernel.org>; Sun,  7 Nov 2021 23:08:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235404AbhKGXLN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 7 Nov 2021 18:11:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235374AbhKGXLM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 7 Nov 2021 18:11:12 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09EB2C061570;
        Sun,  7 Nov 2021 15:08:27 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id e11so6674020ljo.13;
        Sun, 07 Nov 2021 15:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qGOrZCQywxePXMyyV3xpg2iW/dZ+roDb4z6xkvFvUoY=;
        b=EiM+IbH8j98z1wguhWYYd5JqExuh5ON5QCwPhIaCpBDMipg6z3/DN7JGi6HZ2z63AG
         +KkfdvQnTdnxf6VJKNmOWUvW416Ac/fbaY66RK6EYDFpRQCjZG7tBFqzFh2dTXYuutDn
         cLO6EZsguyj2Wm4WNvGzFZZyJLaIfbPjjRAwgQiJo/aenoKE2MR2PzSMlYvMkxQfDGZ7
         DgKR74EqhS2qf5RXElMXxlakWenQ/fhSZVIMKc5WvIkc3hvJoWhcciglOoJEO6LgiuAe
         7Rw77SIJuoQf1ydHtdQYUUgxK5HU4CXjVbmWbc4jwhc8qOicAGOsiGJIWVTzGpI20K6X
         VjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qGOrZCQywxePXMyyV3xpg2iW/dZ+roDb4z6xkvFvUoY=;
        b=gSDH3x/pIXYCRpRDpKpc26OU3iV4ia3hW95YrYMeczKhZPW47341tAaOL9VyuzM1wR
         PgSY6wvaCtOxNrVWYACcGIQ9ahPv/5UMCoUPHTivXFyabwM97cKvNq6uSth8bUIo+1eL
         ZdCcY0Cem4v2r32dbPufYF6alEKTFSWDrBdvRGaJAFCcveu0nkx2+ie9EPpLTAU/M0aQ
         wI/9y66WzQiKgCIw2beyxCeCdAB2WgvAv45luJI0aKbpSnisL58J6dnHdtbi03+QTG62
         vUOnV7Bh5k/6FuVbfAS9EXPLjtNfMurrxq8c7edU5Gl1KV5LzKSbRLwOl+pp17wSTR/b
         JrUQ==
X-Gm-Message-State: AOAM531aVKtu9rvAGPrttAXwaR3Id73eTdXxKuFjXlD2BIvqjYnWNrwO
        +Yy3e/V5iDGehj3vOJr1XE0=
X-Google-Smtp-Source: ABdhPJy4/Df640Vef4HLnif11/7zqgy/ojOfe0tndbPkjgXzZT7lqwhgDvrv4V3a8S1TzAhivylyHQ==
X-Received: by 2002:a2e:b5b7:: with SMTP id f23mr51742411ljn.458.1636326505752;
        Sun, 07 Nov 2021 15:08:25 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru. [79.139.188.96])
        by smtp.gmail.com with ESMTPSA id l13sm1785694lfh.270.2021.11.07.15.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 15:08:25 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Graichen <thomas.graichen@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] drm/dp: Add drm_dp_aux_register_ddc/chardev() helpers
Date:   Mon,  8 Nov 2021 02:08:20 +0300
Message-Id: <20211107230821.13511-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add drm_dp_aux_register_ddc/chardev() helpers that allow DP drivers
to register I2C DDC adapter and character device separately.

Cc: <stable@vger.kernel.org> # 5.13+
Reported-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
Tested-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 112 +++++++++++++++++++++++++++-----
 include/drm/drm_dp_helper.h     |   4 ++
 2 files changed, 99 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 4d0d1e8e51fa..56e3e57e6dc7 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1775,7 +1775,7 @@ EXPORT_SYMBOL(drm_dp_remote_aux_init);
  * drm_dp_aux_init() - minimally initialise an aux channel
  * @aux: DisplayPort AUX channel
  *
- * If you need to use the drm_dp_aux's i2c adapter prior to registering it with
+ * If you need to use the drm_dp_aux handle prior to registering it with
  * the outside world, call drm_dp_aux_init() first. For drivers which are
  * grandparents to their AUX adapters (e.g. the AUX adapter is parented by a
  * &drm_connector), you must still call drm_dp_aux_register() once the connector
@@ -1790,6 +1790,9 @@ EXPORT_SYMBOL(drm_dp_remote_aux_init);
  */
 void drm_dp_aux_init(struct drm_dp_aux *aux)
 {
+	if (aux->ddc.algo)
+		return;
+
 	mutex_init(&aux->hw_mutex);
 	mutex_init(&aux->cec.lock);
 	INIT_WORK(&aux->crc_work, drm_dp_aux_crc_work);
@@ -1827,31 +1830,23 @@ EXPORT_SYMBOL(drm_dp_aux_init);
  * mentioned above need to call drm_dp_aux_init() in order to use the AUX
  * channel before registration.
  *
+ * Don't mix drm_dp_aux_register() with drm_dp_aux_register_chardev/ddc().
+ *
  * Returns 0 on success or a negative error code on failure.
  */
 int drm_dp_aux_register(struct drm_dp_aux *aux)
 {
 	int ret;
 
-	WARN_ON_ONCE(!aux->drm_dev);
-
-	if (!aux->ddc.algo)
-		drm_dp_aux_init(aux);
-
-	aux->ddc.class = I2C_CLASS_DDC;
-	aux->ddc.owner = THIS_MODULE;
-	aux->ddc.dev.parent = aux->dev;
+	drm_dp_aux_init(aux);
 
-	strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
-		sizeof(aux->ddc.name));
-
-	ret = drm_dp_aux_register_devnode(aux);
+	ret = drm_dp_aux_register_ddc(aux);
 	if (ret)
 		return ret;
 
-	ret = i2c_add_adapter(&aux->ddc);
+	ret = drm_dp_aux_register_chardev(aux);
 	if (ret) {
-		drm_dp_aux_unregister_devnode(aux);
+		drm_dp_aux_unregister_ddc(aux);
 		return ret;
 	}
 
@@ -1865,11 +1860,94 @@ EXPORT_SYMBOL(drm_dp_aux_register);
  */
 void drm_dp_aux_unregister(struct drm_dp_aux *aux)
 {
-	drm_dp_aux_unregister_devnode(aux);
-	i2c_del_adapter(&aux->ddc);
+	drm_dp_aux_unregister_chardev(aux);
+	drm_dp_aux_unregister_ddc(aux);
 }
 EXPORT_SYMBOL(drm_dp_aux_unregister);
 
+/**
+ * drm_dp_aux_register_ddc() -  initialise and register I2C DDC part of AUX channel
+ * @aux: DisplayPort AUX channel
+ *
+ * Automatically calls drm_dp_aux_init() if this hasn't been done yet.
+ * If you need to use the drm_dp_aux's I2C adapter prior to registering it with
+ * the outside world, call drm_dp_aux_register_ddc() first. For drivers which
+ * are grandparents to their AUX adapters (e.g. the AUX adapter is parented by a
+ * &drm_connector), you must still call drm_dp_aux_register_chardev() once the
+ * connector has been registered to allow userspace access to the auxiliary DP
+ * channel.
+ *
+ * For devices which use a separate platform device for their AUX adapters, this
+ * may be called as early as required by the driver.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_aux_register_ddc(struct drm_dp_aux *aux)
+{
+	drm_dp_aux_init(aux);
+
+	if (WARN_ON(aux->ddc.class == I2C_CLASS_DDC))
+		return -EBUSY;
+
+	aux->ddc.class = I2C_CLASS_DDC;
+	aux->ddc.owner = THIS_MODULE;
+	aux->ddc.dev.parent = aux->dev;
+
+	strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
+		sizeof(aux->ddc.name));
+
+	return i2c_add_adapter(&aux->ddc);
+}
+EXPORT_SYMBOL(drm_dp_aux_register_ddc);
+
+/**
+ * drm_dp_aux_unregister_ddc() - unregister I2C DDC part of AUX channel
+ * @aux: DisplayPort AUX channel
+ */
+void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux)
+{
+	i2c_del_adapter(&aux->ddc);
+
+	aux->ddc.class = 0;
+}
+EXPORT_SYMBOL(drm_dp_aux_unregister_ddc);
+
+/**
+ * drm_dp_aux_register_chardev() - initialise and register userspace part of AUX channel
+ * @aux: DisplayPort AUX channel
+ *
+ * Automatically calls drm_dp_aux_init() if this hasn't been done yet. This
+ * should only be called once the parent of @aux, &drm_dp_aux.dev, is
+ * initialized. For devices which are grandparents of their AUX channels,
+ * &drm_dp_aux.dev will typically be the &drm_connector &device which
+ * corresponds to @aux. For these devices, it's advised to call
+ * drm_dp_aux_register_chardev() in &drm_connector_funcs.late_register, and
+ * likewise to call drm_dp_aux_unregister_chardev() in
+ * &drm_connector_funcs.early_unregister. Functions which don't follow this
+ * will likely Oops when %CONFIG_DRM_DP_AUX_CHARDEV is enabled.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_aux_register_chardev(struct drm_dp_aux *aux)
+{
+	WARN_ON_ONCE(!aux->drm_dev);
+
+	drm_dp_aux_init(aux);
+
+	return drm_dp_aux_register_devnode(aux);
+}
+EXPORT_SYMBOL(drm_dp_aux_register_chardev);
+
+/**
+ * drm_dp_aux_unregister() - unregister userspace part of AUX channel
+ * @aux: DisplayPort AUX channel
+ */
+void drm_dp_aux_unregister_chardev(struct drm_dp_aux *aux)
+{
+	drm_dp_aux_unregister_devnode(aux);
+}
+EXPORT_SYMBOL(drm_dp_aux_unregister_chardev);
+
 #define PSR_SETUP_TIME(x) [DP_PSR_SETUP_TIME_ ## x >> DP_PSR_SETUP_TIME_SHIFT] = (x)
 
 /**
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index b52df4db3e8f..80130458188d 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -2130,6 +2130,10 @@ void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
 void drm_dp_aux_init(struct drm_dp_aux *aux);
 int drm_dp_aux_register(struct drm_dp_aux *aux);
 void drm_dp_aux_unregister(struct drm_dp_aux *aux);
+int drm_dp_aux_register_ddc(struct drm_dp_aux *aux);
+void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux);
+int drm_dp_aux_register_chardev(struct drm_dp_aux *aux);
+void drm_dp_aux_unregister_chardev(struct drm_dp_aux *aux);
 
 int drm_dp_start_crc(struct drm_dp_aux *aux, struct drm_crtc *crtc);
 int drm_dp_stop_crc(struct drm_dp_aux *aux);
-- 
2.33.1

