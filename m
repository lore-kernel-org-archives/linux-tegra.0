Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4ED0C4161F
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB95B64E27
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377305AbhCCDaw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:30:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344060AbhCBLXe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 06:23:34 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F69C06178A;
        Tue,  2 Mar 2021 03:22:06 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 2so18912138ljr.5;
        Tue, 02 Mar 2021 03:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xg6BAG0aRzJfW3NL7J2fV5y7N6SqjvW9ZuXns5YdGNw=;
        b=ij6zyyk2aNlnnd0XbYbXxR36/zxdJcr9oByFXbsLlM07fBQJN/XPW5dS0umXVs3XrX
         dKb1YQ8a0gVCNKjADTd1RstNMz9rp+XjqXRIUUctar5a9uwwyr+8SKiM/O0yBBhcnGom
         4st8pL5dZxsqRTFfsRm37Hqwsiu2fzBbjPhoJzY+o4MqR9HMilYX6zzPxgy5eAEsoe+F
         ijahXaj6u45ZWQ4YMnguCdwtluvUK8YMzenP0OmgdLwwkqPxsDPuXhnCMxYZuwR364Ok
         QIAwqM0Rjfe52bABrP21DXJol2fqr51UgLU5KHILSvm2ERP8ZQV8b17+8kOD6BoClieG
         A8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xg6BAG0aRzJfW3NL7J2fV5y7N6SqjvW9ZuXns5YdGNw=;
        b=gnRg4oDTN1ZXBNGGl1lzjB9ypEEYUvdRhHuAVR8jRADkGO8on31UmG7W65pQoE699r
         XTJiYX58M5f4dKuvumM7PESGusgfzRHSGKnx/C1Nm0QqnPWnx02u2UuYmrJsWVBaS/gr
         yXkeCvlZ/WGGrk0bM+LKzeBy4EhGW7C5O1aKgGRuzxxwIi+1t98h6sCRqhDCcNN0UMDC
         lSpRVbgzwuPh9ZedwGPJbT4sB36nj2HU9vIgM25nP+DjYpbTIki7ABuK2YJGBlYhlJH3
         C86Kdqc5XWsWZ3P2arUyk5sjIlmuVIsSQta+RSInwpBlRbYciy5ZbDe1VimvVsSeVNxf
         5Rcw==
X-Gm-Message-State: AOAM533FaYC2emDM6LExR6tIlT58zpKzcdOjBSmW+ox6N3JdBquG89iC
        z1p66MvAP3SGF0Ygf71r5xg=
X-Google-Smtp-Source: ABdhPJztqfJKjybeaUExw8rEhx/7K9lWQwQ4Fio3EyS4lLaojOGOfgeTNngjfqdTuKrt1x7E4as3tg==
X-Received: by 2002:a2e:9908:: with SMTP id v8mr8601266lji.460.1614684125149;
        Tue, 02 Mar 2021 03:22:05 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id w7sm2691078lft.0.2021.03.02.03.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 03:22:04 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] reset: Allow devm_reset_control_array_get() to get resets in a released state
Date:   Tue,  2 Mar 2021 14:21:19 +0300
Message-Id: <20210302112123.24161-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302112123.24161-1-digetx@gmail.com>
References: <20210302112123.24161-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Allow devm_reset_control_array_get() to get resets in a released state
in order to make it possible to extend reset-API with resource-managed
variants of retrieving resets array in a released state. In particular
this is needed by NVIDIA Tegra drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/reset/core.c  |  8 ++++++--
 include/linux/reset.h | 14 ++++++++------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index dbf881b586d9..f36de3d3849b 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -985,6 +985,8 @@ EXPORT_SYMBOL_GPL(of_reset_control_array_get);
  * @dev: device that requests the list of reset controls
  * @shared: whether reset controls are shared or not
  * @optional: whether it is optional to get the reset controls
+ * @acquired: only one reset control may be acquired for a given controller
+ *            and ID
  *
  * The reset control array APIs are intended for a list of resets
  * that just have to be asserted or deasserted, without any
@@ -993,7 +995,8 @@ EXPORT_SYMBOL_GPL(of_reset_control_array_get);
  * Returns pointer to allocated reset_control on success or error on failure
  */
 struct reset_control *
-devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
+devm_reset_control_array_get(struct device *dev, bool shared, bool optional,
+			     bool acquired)
 {
 	struct reset_control **ptr, *rstc;
 
@@ -1002,7 +1005,8 @@ devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	rstc = of_reset_control_array_get(dev->of_node, shared, optional, true);
+	rstc = of_reset_control_array_get(dev->of_node, shared, optional,
+					  acquired);
 	if (IS_ERR_OR_NULL(rstc)) {
 		devres_free(ptr);
 		return rstc;
diff --git a/include/linux/reset.h b/include/linux/reset.h
index b9109efa2a5c..3bee086f1f06 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -33,7 +33,8 @@ struct reset_control *__devm_reset_control_get(struct device *dev,
 				     bool optional, bool acquired);
 
 struct reset_control *devm_reset_control_array_get(struct device *dev,
-						   bool shared, bool optional);
+						   bool shared, bool optional,
+						   bool acquired);
 struct reset_control *of_reset_control_array_get(struct device_node *np,
 						 bool shared, bool optional,
 						 bool acquired);
@@ -105,7 +106,8 @@ static inline struct reset_control *__devm_reset_control_get(
 }
 
 static inline struct reset_control *
-devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
+devm_reset_control_array_get(struct device *dev, bool shared, bool optional,
+			     bool acquired)
 {
 	return optional ? NULL : ERR_PTR(-ENOTSUPP);
 }
@@ -511,25 +513,25 @@ static inline struct reset_control *devm_reset_control_get_by_index(
 static inline struct reset_control *
 devm_reset_control_array_get_exclusive(struct device *dev)
 {
-	return devm_reset_control_array_get(dev, false, false);
+	return devm_reset_control_array_get(dev, false, false, true);
 }
 
 static inline struct reset_control *
 devm_reset_control_array_get_shared(struct device *dev)
 {
-	return devm_reset_control_array_get(dev, true, false);
+	return devm_reset_control_array_get(dev, true, false, true);
 }
 
 static inline struct reset_control *
 devm_reset_control_array_get_optional_exclusive(struct device *dev)
 {
-	return devm_reset_control_array_get(dev, false, true);
+	return devm_reset_control_array_get(dev, false, true, true);
 }
 
 static inline struct reset_control *
 devm_reset_control_array_get_optional_shared(struct device *dev)
 {
-	return devm_reset_control_array_get(dev, true, true);
+	return devm_reset_control_array_get(dev, true, true, true);
 }
 
 static inline struct reset_control *
-- 
2.29.2

