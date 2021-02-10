Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A97C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Feb 2021 13:51:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1719164E6F
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Feb 2021 13:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhBJNuv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Feb 2021 08:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhBJNus (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Feb 2021 08:50:48 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65621C06174A;
        Wed, 10 Feb 2021 05:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=n0TXYPvl6usxGJDUvJ/EhFnPFDVIWM+IKlNv0XqAUx0=; b=SlMGTMcBrXv/DPiwYSRQ5kP9z5
        x8mETRbREew9UBhnMbLCXUy6GEL8gVxdsCfsFRPTmY4zGAevL2qvz5zz3L5W+1+tU3/wZmuVo9lqe
        GS86mY6hwViemEUIqLis+g8a/HDjN4frELq63lLElIOBy77bePTHdCU0I41ZLTgKThGxWXZKi3kwK
        Cue0G1NS78E3/xB6OFyrzV+gjsYCWizIfzNbGnPN332Q6CxBRiCMwDgaNaXFr6O6jPtULM1ziA2RD
        Qj/G8QuevSM4tJJq1vyjPLCL1P0oaZ1mUCWHGF8vrfOPOOJ40q1+NChu99ek9N5MkhwFLEG23Kijh
        2cdFRpQA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1l9psU-0004xT-J4; Wed, 10 Feb 2021 15:49:58 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     jassisinghbrar@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] mailbox: tegra-hsp: Set lockdep class dynamically
Date:   Wed, 10 Feb 2021 15:49:45 +0200
Message-Id: <20210210134945.2699170-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tegra194, due to both BPMP and TCU using mailboxes, we get a
lockdep spew at boot. Both are using different instances of HSP,
so this is harmless. As such give each HSP instance a different
lockdep class.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/mailbox/tegra-hsp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index e07091d71986..acd0675da681 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -98,7 +98,9 @@ struct tegra_hsp {
 	unsigned int num_ss;
 	unsigned int num_db;
 	unsigned int num_si;
+
 	spinlock_t lock;
+	struct lock_class_key lock_key;
 
 	struct list_head doorbells;
 	struct tegra_hsp_mailbox *mailboxes;
@@ -775,6 +777,18 @@ static int tegra_hsp_probe(struct platform_device *pdev)
 			return err;
 	}
 
+	lockdep_register_key(&hsp->lock_key);
+	lockdep_set_class(&hsp->lock, &hsp->lock_key);
+
+	return 0;
+}
+
+static int tegra_hsp_remove(struct platform_device *pdev)
+{
+	struct tegra_hsp *hsp = platform_get_drvdata(pdev);
+
+	lockdep_unregister_key(&hsp->lock_key);
+
 	return 0;
 }
 
@@ -834,6 +848,7 @@ static struct platform_driver tegra_hsp_driver = {
 		.pm = &tegra_hsp_pm_ops,
 	},
 	.probe = tegra_hsp_probe,
+	.remove = tegra_hsp_remove,
 };
 
 static int __init tegra_hsp_init(void)
-- 
2.30.0

