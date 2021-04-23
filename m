Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AFEC43611
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 18:22:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A64B061462
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 18:22:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243600AbhDWSWr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Apr 2021 14:22:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24295 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243582AbhDWSWq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Apr 2021 14:22:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619202129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wnwUXuktq3XktOISO/1NK97hBW8acao1j5wHNN1fMSg=;
        b=gHyFVq8o5xH6hlKRdJI1RjhBwCUbuY3enALQF9GDm2Qv+eYHcZKPkRMCPOXqI369p6W8Bj
        nMJrkkqZOz9i95qoGviw1C8/KmVLNzPd3keNZRAqp+pV3oOtZD0oLVdRHXaeD3EdMQ9q+h
        8EgLTIKYrDRsW7foOHZjHmX0akYCgeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-qFHRcptSMyq-AEa6BhKJLQ-1; Fri, 23 Apr 2021 14:22:05 -0400
X-MC-Unique: qFHRcptSMyq-AEa6BhKJLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49537343A3;
        Fri, 23 Apr 2021 18:22:04 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-114-74.rdu2.redhat.com [10.10.114.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 17B69608BA;
        Fri, 23 Apr 2021 18:22:03 +0000 (UTC)
From:   Lyude Paul <lyude@redhat.com>
To:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Thierry Reding <treding@nvidia.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/tegra: Fix DP AUX channel reference leaks
Date:   Fri, 23 Apr 2021 14:21:46 -0400
Message-Id: <20210423182146.185633-3-lyude@redhat.com>
In-Reply-To: <20210423182146.185633-1-lyude@redhat.com>
References: <20210423182146.185633-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Noticed while fixing the regression I introduced in Tegra that Tegra seems
to actually never release the device or module references it's grabbing for
the DP AUX channel. So, let's fix that by dropping them when appropriate.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/tegra/sor.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 4e0e3a63e586..474586e18d06 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3772,12 +3772,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
 
 	err = tegra_sor_parse_dt(sor);
 	if (err < 0)
-		return err;
+		goto put_aux;
 
 	err = tegra_output_probe(&sor->output);
-	if (err < 0)
-		return dev_err_probe(&pdev->dev, err,
-				     "failed to probe output\n");
+	if (err < 0) {
+		err = dev_err_probe(&pdev->dev, err, "failed to probe output\n");
+		goto put_aux;
+	}
 
 	if (sor->ops && sor->ops->probe) {
 		err = sor->ops->probe(sor);
@@ -3966,6 +3967,11 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 remove:
 	tegra_output_remove(&sor->output);
+put_aux:
+	if (sor->aux && sor->output.ddc) {
+		module_put(sor->aux->dev->driver->owner);
+		put_device(sor->aux->dev);
+	}
 	return err;
 }
 
@@ -3985,6 +3991,11 @@ static int tegra_sor_remove(struct platform_device *pdev)
 
 	tegra_output_remove(&sor->output);
 
+	if (sor->aux && sor->output.ddc) {
+		module_put(sor->aux->dev->driver->owner);
+		put_device(sor->aux->dev);
+	}
+
 	return 0;
 }
 
-- 
2.30.2

