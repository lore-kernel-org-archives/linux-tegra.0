Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B58BC47095
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 17:17:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D885721582
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 17:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="Q8kywjrG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgJGRR1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 13:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728105AbgJGRR1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 13:17:27 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B123C0613D5
        for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2020 10:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=xwLZB7eqrEhEdHl77aXkj5ZV3+GDTbMZgN/Lxq3t9E0=; b=Q8kywjrGMEGeX9CwUz/ZDKoz+Z
        giPW8eT6Rz6MWY0nVb27O0TW0OFnVpaNSoSwcpMjD2t4Nzc9We4km+fDgLmPeFikkXkaGZHERTxJY
        +XdptQjJ5U+25P6ydNvgTNRgrK9yZ0z5pz/egv/7JX5c9WIf9Aw6asTQUzqcVs4QB29rqViHITXVm
        ahHmEXwyjo5fjbQHHJrDy11LDz/ay/DytTPKtIjs0TaiWUZphXKHJQzDbJLmzFDIGnXpYUpiq/5nD
        rlHu2gIZN8l4EWZQfnQhUEQ/sQMe3TRXR9wjVh4GFSGWMpicMtHhfdPi3aUUxmU1LkRhwL2yQ/nyn
        FSQlWLdw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kQD41-0006P9-5D; Wed, 07 Oct 2020 20:17:17 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 18/20] drm/tegra: Allocate per-engine channel in core code
Date:   Wed,  7 Oct 2020 20:12:36 +0300
Message-Id: <20201007171238.1795964-19-mperttunen@nvidia.com>
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

To avoid duplication, allocate the per-engine shared channel in the
core code instead. Once MLOCKs are implemented on Host1x side, we
can also update this to avoid allocating a shared channel when
MLOCKs are enabled.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 11 +++++++++++
 drivers/gpu/drm/tegra/drm.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 7437c67924aa..7124b0b0154b 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -887,6 +887,14 @@ static struct drm_driver tegra_drm_driver = {
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
@@ -903,6 +911,9 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 	client->drm = NULL;
 	mutex_unlock(&tegra->clients_lock);
 
+	if (client->shared_channel)
+		host1x_channel_put(client->shared_channel);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index b25443255be6..3fc42fd97911 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -86,8 +86,12 @@ struct tegra_drm_client {
 	struct list_head list;
 	struct tegra_drm *drm;
 
+	/* Set by driver */
 	unsigned int version;
 	const struct tegra_drm_client_ops *ops;
+
+	/* Set by TegraDRM core */
+	struct host1x_channel *shared_channel;
 };
 
 static inline struct tegra_drm_client *
-- 
2.28.0

