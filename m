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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D02C07E9B
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B773613D1
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhGITcS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 15:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGITcS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 15:32:18 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7327C0613DD
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 12:29:34 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k4so7272086wrc.8
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 12:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nO2VGF0GrX8eq1kIPmNF9NDL8unf6/wwgmYeLn0z60A=;
        b=OTDWKUWGMl6zGndK9eFgIokkIOVkQtjxt4yGNj4M4Od9i5+nNyrhzGyizKj5jeBTB2
         8+V7ngN/unevaFcHVs73EPGa5RSfW+XZWlryVS/Kn6P4pQoUPLE0rMvSJ88d4ywqi12r
         zAcgWkgaK6mDWL36JqHrdoPvoZmqBJTRh19YGkk142Y90VFWB/P6P/ika13nbxNWsX68
         LAviBBmvafT74ur/doA7CjqRCSTZdWJsNhmjJDOoM8uK1PxNts11+W3N7SFwb7NkVlxB
         CI+uFsUhH9ivqUsSmGNd9yYVklIsic3L0w8CzpFNVCJiXZy/t8AIkKoTQD4qILsJ4/Oh
         9iWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nO2VGF0GrX8eq1kIPmNF9NDL8unf6/wwgmYeLn0z60A=;
        b=ME6+/SL7ITIkd9Y74NWCnhfHxyzu10fxc5o/Ka0p/xyn+3P562B2md9ysHKwcT+y3k
         NZjdzp1cQ5quN5QtvDrmOJJbgdwF037P+cgSiqMnlnfDL1MuuQUaTOLnNaG+ZOSbC8EA
         iyhCeEg/c+S4YDOwE7GLICcjrlpcuhxSIQdwPwjE28MfqTc6GylC8rgsWZ661+x5lZ0j
         Z8hyB3XntRbsc6enL8Fjg5aTNNIbJpBmU0pbNgaI2vs6H/4CbYgSdy1r+orXxrPfdPBE
         gMXJyzCkdlNIwqBGzC+tIMEaArAxJBa3maNP68sRGP2jPAT6MAKYEN2G+t+gF19HwoUf
         MLNA==
X-Gm-Message-State: AOAM530OsnqcVpCuba/+CqFEnSo+AulIZofhvj9Yq4zJSJWQ/J5yK0na
        9rLlfeX2kz1WqfBEPDHG6uQ=
X-Google-Smtp-Source: ABdhPJwexKMid8Y7ZFKxgXv6gNWN+bjD3QttXFUzwM+raTEJLtzfVRBbUUVNPsA8qfmKvt/mmduqaQ==
X-Received: by 2002:a05:6000:1867:: with SMTP id d7mr36571354wri.263.1625858973547;
        Fri, 09 Jul 2021 12:29:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t6sm6144348wru.75.2021.07.09.12.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 12:29:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v8 08/14] drm/tegra: Allocate per-engine channel in core code
Date:   Fri,  9 Jul 2021 21:31:40 +0200
Message-Id: <20210709193146.2859516-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

To avoid code duplication, allocate the per-engine shared channel in
the core code instead. This is the usual channel that all jobs are
submitted to when MLOCKing is not in use. Once MLOCKs are implemented
on Host1x side, we can also update this to avoid allocating a shared
channel when MLOCKs are enabled.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 11 +++++++++++
 drivers/gpu/drm/tegra/drm.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 87954e69ab6c..cddee6425461 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -870,6 +870,14 @@ static const struct drm_driver tegra_drm_driver = {
 int tegra_drm_register_client(struct tegra_drm *tegra,
 			      struct tegra_drm_client *client)
 {
+	/*
+	 * When MLOCKs are implemented, change to allocate a shared channel
+	 * only when MLOCKs are disabled.
+	 */
+	client->shared_channel = host1x_channel_request(&client->base);
+	if (!client->shared_channel)
+		return -EBUSY;
+
 	mutex_lock(&tegra->clients_lock);
 	list_add_tail(&client->list, &tegra->clients);
 	client->drm = tegra;
@@ -886,6 +894,9 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 	client->drm = NULL;
 	mutex_unlock(&tegra->clients_lock);
 
+	if (client->shared_channel)
+		host1x_channel_put(client->shared_channel);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 0cb868065348..536861017d24 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -91,7 +91,9 @@ struct tegra_drm_client {
 	struct host1x_client base;
 	struct list_head list;
 	struct tegra_drm *drm;
+	struct host1x_channel *shared_channel;
 
+	/* Set by driver */
 	unsigned int version;
 	const struct tegra_drm_client_ops *ops;
 };
-- 
2.32.0

