Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54807C43460
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 18:22:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27663613C8
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 18:22:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbhDWSWo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Apr 2021 14:22:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25050 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232211AbhDWSWn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Apr 2021 14:22:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619202126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5hFClZUo+ZUrVv6GNReQdb27crFUBCckSOkdFq2klEc=;
        b=aKaSZ2bs2suhg9pojgZc4r/lwi9KzkZ2RQuxApIwf1qvFsdLAMB5KQ7i01QvQWhxo6Kovt
        8Hcvt1W5qyzZH2MwNbF3sY6JGGdJPtCgA/w/8oaKmOW74rNpJIE4wATqwdiy893YdPGiXm
        4pqRL/e7Zg84U40OVUynRz9FivrSN14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-0TDybKMoMemyOfKuO8aJdQ-1; Fri, 23 Apr 2021 14:22:04 -0400
X-MC-Unique: 0TDybKMoMemyOfKuO8aJdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1F9D81746C;
        Fri, 23 Apr 2021 18:22:02 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-114-74.rdu2.redhat.com [10.10.114.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A371960613;
        Fri, 23 Apr 2021 18:22:01 +0000 (UTC)
From:   Lyude Paul <lyude@redhat.com>
To:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Thierry Reding <treding@nvidia.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/tegra: Get ref for DP AUX channel, not its ddc adapter
Date:   Fri, 23 Apr 2021 14:21:45 -0400
Message-Id: <20210423182146.185633-2-lyude@redhat.com>
In-Reply-To: <20210423182146.185633-1-lyude@redhat.com>
References: <20210423182146.185633-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

While we're taking a reference of the DDC adapter for a DP AUX channel in
tegra_sor_probe() because we're going to be using that adapter with the
SOR, now that we've moved where AUX registration happens the actual device
structure for the DDC adapter isn't initialized yet. Which means that we
can't really take a reference from it to try to keep it around anymore.

This should be fine though, because we can just take a reference of its
parent instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 39c17ae60ea9 ("drm/tegra: Don't register DP AUX channels before connectors")
Cc: Lyude Paul <lyude@redhat.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/sor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 7b88261f57bb..4e0e3a63e586 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3739,11 +3739,11 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		if (!sor->aux)
 			return -EPROBE_DEFER;
 
-		if (get_device(&sor->aux->ddc.dev)) {
-			if (try_module_get(sor->aux->ddc.owner))
+		if (get_device(sor->aux->dev)) {
+			if (try_module_get(sor->aux->dev->driver->owner))
 				sor->output.ddc = &sor->aux->ddc;
 			else
-				put_device(&sor->aux->ddc.dev);
+				put_device(sor->aux->dev);
 		}
 	}
 
-- 
2.30.2

