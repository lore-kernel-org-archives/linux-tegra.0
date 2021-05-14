Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4755C433ED
	for <linux-tegra@archiver.kernel.org>; Fri, 14 May 2021 22:13:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A939061453
	for <linux-tegra@archiver.kernel.org>; Fri, 14 May 2021 22:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbhENWOb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 May 2021 18:14:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37116 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230024AbhENWO3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 May 2021 18:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621030397;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2mg2n4gV17bGOVE68OZPsALQKP2f9toztfRI91bC8mM=;
        b=WV7IfmC8c8q4mTEmLinui9ClAdGr0dlVUKli6sKplTKQqK8sbb7WBL8jlWNXgERPSRmPbx
        +Rl/dL9QK2XjlEnDI9rNIC4IhOlgVbNgXjDqf/xnVjd8AL+1vNmO4089sJwCtHghDhbtzf
        kK8MLP8BpZ07YZaqR+A/TSuyigIsyQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-Ml9oYVQjOmqIWf6tu5Dykg-1; Fri, 14 May 2021 18:13:14 -0400
X-MC-Unique: Ml9oYVQjOmqIWf6tu5Dykg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53E53FC9C;
        Fri, 14 May 2021 22:13:13 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-140.rdu2.redhat.com [10.10.118.140])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 652D019D7D;
        Fri, 14 May 2021 22:13:12 +0000 (UTC)
From:   Lyude Paul <lyude@redhat.com>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/tegra: Get ref for DP AUX channel, not its ddc adapter
Date:   Fri, 14 May 2021 18:13:05 -0400
Message-Id: <20210514221305.1783892-1-lyude@redhat.com>
In-Reply-To: <20210423182146.185633-2-lyude@redhat.com>
References: <20210423182146.185633-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

v2:
* Avoid calling i2c_put_adapter() in tegra_output_remove() for eDP/DP cases

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 39c17ae60ea9 ("drm/tegra: Don't register DP AUX channels before connectors")
Cc: Lyude Paul <lyude@redhat.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/output.c | 5 ++++-
 drivers/gpu/drm/tegra/sor.c    | 6 +++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 47d26b5d9945..2dacce1ab6ee 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -180,10 +180,13 @@ int tegra_output_probe(struct tegra_output *output)
 
 void tegra_output_remove(struct tegra_output *output)
 {
+	int connector_type = output->connector.connector_type;
+
 	if (output->hpd_gpio)
 		free_irq(output->hpd_irq, output);
 
-	if (output->ddc)
+	if (connector_type != DRM_MODE_CONNECTOR_eDP &&
+	    connector_type != DRM_MODE_CONNECTOR_DisplayPort && output->ddc)
 		i2c_put_adapter(output->ddc);
 }
 
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
2.31.1

