Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BDDC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 23 Dec 2021 14:47:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232571AbhLWOrb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 23 Dec 2021 09:47:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231679AbhLWOra (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Dec 2021 09:47:30 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B990C061401
        for <linux-tegra@vger.kernel.org>; Thu, 23 Dec 2021 06:47:30 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bu9so12888330lfb.7
        for <linux-tegra@vger.kernel.org>; Thu, 23 Dec 2021 06:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l5Rb/hT3SrbLZnGb7li8TRVv/aVTqOFXEylanDETmuo=;
        b=fXNE4NdesUSnSyGHezZQP8c3PVJKbNreopf07xWE4oqvWnLi0VOewdRK8sprBEo00j
         Y9HIGCNKErJ5HMK8lEt6ITNvVQxHxfzaZAnkpLeTi0MVRX4ob7e6DoV89TjMM3BIojOK
         Kn5xN2nS1+M+xXDIPJ6y3fKFoX3rYz4xw/wOU5etkuLKH7lM2MPgwtoFGml/OE6lJpKO
         NRSF+x7Z4P+uMTl9xE+4B7INPLR2OKHbsyB0cmpWiSx40zvx6tWcEyo3sZGvRw0cdpo6
         mbKCS+WVS/CMXZ18KN4PAIFNh+mY5DMR7MqkQNrKS4ChYcaxlIoYKAf8QIZnx2vhqHt8
         TIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l5Rb/hT3SrbLZnGb7li8TRVv/aVTqOFXEylanDETmuo=;
        b=dt59S5YHsw57atA+DIqSOGN2WddG8URjarxYPkvyLS+GMAM/DprKEgTTEa5Bm0+dhP
         a11w78Tg08g8LIodfTe6SMPtm6DFPQqaGQicDAH+RlPGeLYcCK3qvko9yrnWKiZHH9fc
         00h4HhHg14J2o36XLAXrWo8CGx36EfJbaJpp2fRNn4IxFU4j7GWKUEPtiKL26cPhLlfa
         jnGc9zrMejzh3kbgFzJ4VbhR/HSLMv7Vg0uxlER+ZzDiFYZTNgg5++UyndnErb1qz+uF
         NA/SPG2pSd01wpRTwd5HqvGbOe9Gji3+dfq+nqyIdX0PKjf7DTjEL4xhkme838DOMx2p
         H5Ag==
X-Gm-Message-State: AOAM530dLbBbQr1p8zVDIZ3fH6eUg4n7xEKkkIGO0G915SHJXpPaKN5h
        lcf2X2PEzKWdBvD7uic0Zw0xvfY9rCA=
X-Google-Smtp-Source: ABdhPJxNpJ0LrokNB7VeT64Z2wxM+gHQfbv7LAy0y4RRelmN/uXO/zPhy1aQhU6IQl6t/P3+IUh1Ow==
X-Received: by 2002:a05:6512:374a:: with SMTP id a10mr1984598lfs.103.1640270848609;
        Thu, 23 Dec 2021 06:47:28 -0800 (PST)
Received: from localhost.localdomain (46-138-43-24.dynamic.spd-mgts.ru. [46.138.43.24])
        by smtp.gmail.com with ESMTPSA id l5sm521326lfk.167.2021.12.23.06.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 06:47:28 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] gpu: host1x: Fix hang on Tegra186+
Date:   Thu, 23 Dec 2021 17:46:50 +0300
Message-Id: <20211223144650.10335-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra186+ hangs if host1x hardware is disabled at a kernel boot time
because we touch hardware before runtime PM is resumed. Move sync point
assignment initialization to the RPM-resume callback. Older SoCs were
unaffected because they skip that sync point initialization.

Tested-by: Jon Hunter <jonathanh@nvidia.com> # T186
Reported-by: Jon Hunter <jonathanh@nvidia.com> # T186
Fixes: 6b6776e2ab8a ("gpu: host1x: Add initial runtime PM and OPP support")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/syncpt.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index e08e331e46ae..83a16e46146b 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -137,8 +137,15 @@ void host1x_syncpt_restore(struct host1x *host)
 	struct host1x_syncpt *sp_base = host->syncpt;
 	unsigned int i;
 
-	for (i = 0; i < host1x_syncpt_nb_pts(host); i++)
+	for (i = 0; i < host1x_syncpt_nb_pts(host); i++) {
+		/*
+		 * Unassign syncpt from channels for purposes of Tegra186
+		 * syncpoint protection. This prevents any channel from
+		 * accessing it until it is reassigned.
+		 */
+		host1x_hw_syncpt_assign_to_channel(host, sp_base + i, NULL);
 		host1x_hw_syncpt_restore(host, sp_base + i);
+	}
 
 	for (i = 0; i < host1x_syncpt_nb_bases(host); i++)
 		host1x_hw_syncpt_restore_wait_base(host, sp_base + i);
@@ -352,13 +359,6 @@ int host1x_syncpt_init(struct host1x *host)
 	for (i = 0; i < host->info->nb_pts; i++) {
 		syncpt[i].id = i;
 		syncpt[i].host = host;
-
-		/*
-		 * Unassign syncpt from channels for purposes of Tegra186
-		 * syncpoint protection. This prevents any channel from
-		 * accessing it until it is reassigned.
-		 */
-		host1x_hw_syncpt_assign_to_channel(host, &syncpt[i], NULL);
 	}
 
 	for (i = 0; i < host->info->nb_bases; i++)
-- 
2.33.1

