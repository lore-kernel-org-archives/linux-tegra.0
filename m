Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71ADBC5519F
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 11:26:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A24DA22253
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 11:26:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="nH1K/Evr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbgKTL0r (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Nov 2020 06:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbgKTL0r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Nov 2020 06:26:47 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9EBAC0617A7
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2020 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=O3hj3BCdAYlTpve5LZhOzRjCcep0BRuZm2roFfTmKTY=; b=nH1K/Evrb1toP5acgZVA5CGzs9
        k07sK0Y706oJwS/SDJ+V14hdIkVLb2Xgngxm7zeIFmTDZ9EocDl8y2iH+O6yINIg+Sr1sOQ+R2Tp3
        mXJG/UTovXolOKlqEG+F3FKd5sVFe5aO1EucaoUcu8RuPgj1Kd1m/cV98D8Cp6MRTZPDjgQ/OjZET
        kDGwbPaprObag1ryR1YAVCgksRrTPCpFT7+SFuAao3PjXlpuBBq4bN+cc9LASRBgkRlkNixoW3u0V
        WIrxQXMSfKlOFXb8lDFO+i2rd+MwIAPZi8jNSkXdIuZrBJPJoVO2ThdkFY/1AihvyODx29T9Q+iXE
        tRZcthaA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kg4Yr-0003lG-Q4; Fri, 20 Nov 2020 13:26:41 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v4 17/21] drm/tegra: Set resv fields when importing/exporting GEMs
Date:   Fri, 20 Nov 2020 13:25:56 +0200
Message-Id: <20201120112600.935082-18-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120112600.935082-1-mperttunen@nvidia.com>
References: <20201120112600.935082-1-mperttunen@nvidia.com>
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
2.29.2

