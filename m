Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24941C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:18:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EC6964ED7
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:18:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhCSNRp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 09:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhCSNRP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 09:17:15 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E442C06174A
        for <linux-tegra@vger.kernel.org>; Fri, 19 Mar 2021 06:17:15 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id p19so5452495wmq.1
        for <linux-tegra@vger.kernel.org>; Fri, 19 Mar 2021 06:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XizLt9y8QuBfn2G+PzFtXWPzUzKqS1ZiChsPNFkRApk=;
        b=YB8qKNA6B4cZmWQT/WAKLTHxYtmHqt634FbsdwDgpZyqri/cQY/UZiEtTe+CTnrgqz
         te/BzCXJ4TW3lVvuKSgVivT6uO/fKHWK3VzhCS2PNGusetGs9m9eXhDfTCFuSs9R6DDn
         IBZPYiH51alhl6BTqBRPWcgNepruiU6s8G/aOH+KSFwPhAAjmYbZTS1mDjCUmfa/0N0+
         xn6umPZTXeIhcKJ351TYxy944cjBAgiY+dviOqR8Qy4PtJwiBDnyVOs5/YX3vz7ER4Dz
         FbvTMtDkuoSWfiduRJRB+vn2TMVhuzNOe2wFujXj3R766+x6rhW3pmBfAJGMsj99LoyD
         qN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XizLt9y8QuBfn2G+PzFtXWPzUzKqS1ZiChsPNFkRApk=;
        b=W3lXAg39MMBZTnF8hi+AyssQlvT0aaO6MI89fSmjZ+6RHSw9BET0ieX2PoYFbHK2jm
         6ZZQpVdUe/q6m2za6epfo29e9/3rYkZX/VX3yU/zTTd2UjztFJV0Gg+eQoDhgk0NtC0O
         rNgZ+rOrdiC1qsojTih6vSWYwVVdNOqmRnNI+j7P8m3IIKQh8Nmwxnl6rrw740KH++IY
         ZRswFeGlhXTRXz1wpsfShOyyucrRfki6Ngvgj5/Z4h1gSrgEwI0gP0dUn3n1QviKpe8w
         dEvfd3SR3/hEOyj1drYzep2HvVJDVobWGLRVhjA8LsjXe9FLBA9ratHNMfCf0NKOoa75
         A3+w==
X-Gm-Message-State: AOAM533nmR6GJqbUdSEyY4WuMXnhxV6W6LQP0eIEOdGaSRaI1nHI5x8k
        ozlOrWLIIKxvuMyGylnQwWo=
X-Google-Smtp-Source: ABdhPJwBF7w8X7bdxys0Tqi+8wIl/IGC/1bwGuOFfayyc+m7sznQJqmPUnyRyNE7wEQei1ajbTLj5Q==
X-Received: by 2002:a1c:5416:: with SMTP id i22mr3715894wmb.146.1616159833941;
        Fri, 19 Mar 2021 06:17:13 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f4sm6627946wrz.4.2021.03.19.06.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 06:17:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] drm/tegra: sor: Grab runtime PM reference across reset
Date:   Fri, 19 Mar 2021 14:17:22 +0100
Message-Id: <20210319131722.1425804-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SOR resets are exclusively shared with the SOR power domain. This
means that exclusive access can only be granted temporarily and in order
for that to work, a rigorous sequence must be observed. To ensure that a
single consumer gets exclusive access to a reset, each consumer must
implement a rigorous protocol using the reset_control_acquire() and
reset_control_release() functions.

However, these functions alone don't provide any guarantees at the
system level. Drivers need to ensure that the only a single consumer has
access to the reset at the same time. In order for the SOR to be able to
exclusively access its reset, it must therefore ensure that the SOR
power domain is not powered off by holding on to a runtime PM reference
to that power domain across the reset assert/deassert operation.

This used to work fine by accident, but was revealed when recently more
devices started to rely on the SOR power domain.

Fixes: 11c632e1cfd3 ("drm/tegra: sor: Implement acquire/release for reset")
Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index f02a035dda45..7b88261f57bb 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3115,6 +3115,12 @@ static int tegra_sor_init(struct host1x_client *client)
 	 * kernel is possible.
 	 */
 	if (sor->rst) {
+		err = pm_runtime_resume_and_get(sor->dev);
+		if (err < 0) {
+			dev_err(sor->dev, "failed to get runtime PM: %d\n", err);
+			return err;
+		}
+
 		err = reset_control_acquire(sor->rst);
 		if (err < 0) {
 			dev_err(sor->dev, "failed to acquire SOR reset: %d\n",
@@ -3148,6 +3154,7 @@ static int tegra_sor_init(struct host1x_client *client)
 		}
 
 		reset_control_release(sor->rst);
+		pm_runtime_put(sor->dev);
 	}
 
 	err = clk_prepare_enable(sor->clk_safe);
-- 
2.30.2

