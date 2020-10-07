Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EB0C4742E
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 17:17:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AA292177B
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 17:17:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="mMaO+bHP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgJGRR3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 13:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbgJGRR1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 13:17:27 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5BAC0613D8
        for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2020 10:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=muKo33B5pE07VydQS36WvuhHYxMAAUPaO8Pgeyvfy1Y=; b=mMaO+bHPpQoDuNI73ywGPN0wTU
        fuvqxiv+uYOtIr+yjtKtUUEVsWEFaP2CN8lB+y3PSZ8kLzczRR0CfefcqvC6P6r9NWRKj2E1F5Lte
        jzUcBsS2ilgfpQnT+AGtDcoCmdrsG+5c+tKW5ZC1Vk8PYVd5c/BfWnR5LhzClCi+xggUWc5JD2o7B
        Vh5BFlZfpPnu8c1ufkaOGQM/+KJYAtLUyFdCC8gOXTpMuv9SkOBO2a12soaKDhrpj3Llka3kFAvrz
        QmjstQMBbX6RJrNDSt4TbjqLiMoLVHC1jBbWznHszF7Jp4Qb0FelzOvzxqmYzAJaSjBMA8WywqS7o
        U85N55fg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kQD41-0006P9-2m; Wed, 07 Oct 2020 20:17:17 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 17/20] drm/tegra: Set resv fields when importing/exporting GEMs
Date:   Wed,  7 Oct 2020 20:12:35 +0300
Message-Id: <20201007171238.1795964-18-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007171238.1795964-1-mperttunen@nvidia.com>
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

To allow sharing of implicit fences when exporting/importing dma_buf
objects, set the 'resv' fields when importing or exporting GEM
objects.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 723df142a981..4a8acd4724bd 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -423,6 +423,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 	}
 
 	bo->gem.import_attach = attach;
+	bo->gem.resv = buf->resv;
 
 	return bo;
 
@@ -675,6 +676,7 @@ struct dma_buf *tegra_gem_prime_export(struct drm_gem_object *gem,
 	exp_info.size = gem->size;
 	exp_info.flags = flags;
 	exp_info.priv = gem;
+	exp_info.resv = gem->resv;
 
 	return drm_gem_dmabuf_export(gem->dev, &exp_info);
 }
-- 
2.28.0

