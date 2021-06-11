Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513B0C48BE0
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 14:18:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AE7E6141C
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 14:18:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhFKOUv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 10:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhFKOUu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 10:20:50 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E39C0617AF
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=4XHeMHYpflYk86WCecrWDHGMAHWxZI12QAqDiuwkn4M=; b=YwSohPcEeU2K8H1ymGyMvFyfWA
        VH0lqsZ6If2skIjMScrj7tFztpVZK6fpWQ0+e9y0kk0kcf6KYfDDvPlfJJs6FrFyKRVKpBDfSh/EK
        3/wydZDluKn02g3wQyt8kQeimCyWNLJsUikJyZjET4JVlWKOgAjcryhGappxIjE0WfEak5G6oan5m
        8658ENap2C3MVzsYtWBDTIrm4J7ukrkkkKwRgL0IMbA9aj/Ng9zhBoom6+49vz7R3ifGH/lvCEHzY
        YcymNrBva/PnSfFlYQftIygFMIJbq0+xHCiD5SZkfXKmXweui2Ukwahfw+SXukoNFpnmJr+JZc3hr
        yyQWoX8Q==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lrhzf-0006vt-RK; Fri, 11 Jun 2021 17:18:43 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     bskeggs@redhat.com
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] drm/nouveau/gk20a: fix NULL dereference on allocation failure
Date:   Fri, 11 Jun 2021 17:18:05 +0300
Message-Id: <20210611141805.4084202-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If memory allocation fails, `node->base.imem` does not get populated,
causing a NULL pointer dereference on instobj destruction. Fix this
by dereferencing it only if the allocation was successful.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 648ecf5a8fbc..66d60d8bec60 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -296,12 +296,12 @@ gk20a_instobj_dtor_dma(struct nvkm_memory *memory)
 {
 	struct gk20a_instobj_dma *node = gk20a_instobj_dma(memory);
 	struct gk20a_instmem *imem = node->base.imem;
-	struct device *dev = imem->base.subdev.device->dev;
 
 	if (unlikely(!node->base.vaddr))
 		goto out;
 
-	dma_free_attrs(dev, (u64)node->base.mn->length << PAGE_SHIFT,
+	dma_free_attrs(imem->base.subdev.device->dev,
+		       (u64)node->base.mn->length << PAGE_SHIFT,
 		       node->base.vaddr, node->handle, imem->attrs);
 
 out:
-- 
2.30.1

