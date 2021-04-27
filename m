Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC40C43470
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Apr 2021 10:14:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14865613C3
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Apr 2021 10:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235535AbhD0KOp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Apr 2021 06:14:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235422AbhD0KOg (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9420F61423;
        Tue, 27 Apr 2021 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518431;
        bh=ilbYi39Wp/s1IHEjQb8NZRh7PLiRnT42XXdFX8lFSpw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GorLOEPEa0VFrfl3YhH/WhQp4j220WG8k2/2qXdiwsjyK+NYdV71gFScz4HuFxP7L
         4Na+7Nutkvgb3hBA2yaNc2cM4fRONhA879qJHYnxIfzyW2DhSlBV5DQkCyfcPtcmKM
         FeJDG7o2RRtZ0Pzlp1p6JzUoCwAYeCH4Y1o97xJ2U/BtZga08PwqblS/gQ1c5hLmKt
         twcIYayqQqSXZQsHZHUp4ULYIXYfNTAczL00WmQGavX3MkW2FE2JEaG9vOyhQC0xhL
         4JS+a/NZqne/xU62rrTHDOCN62QbD4Yb5cDEAbhOBT0/jbkZzwIJxN0t/iw0LN5rBH
         03ZPMkL2vVFTw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiz-000j5t-Bl; Tue, 27 Apr 2021 12:13:49 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 27/79] staging: media: vi: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:12:54 +0200
Message-Id: <ba6864a388747d7da7c4a4fdf8e3b3b9205fb953.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/tegra-video/vi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7a09061cda57..1298740a9c6c 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -297,10 +297,9 @@ static int tegra_channel_start_streaming(struct vb2_queue *vq, u32 count)
 	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
 	int ret;
 
-	ret = pm_runtime_get_sync(chan->vi->dev);
+	ret = pm_runtime_resume_and_get(chan->vi->dev);
 	if (ret < 0) {
 		dev_err(chan->vi->dev, "failed to get runtime PM: %d\n", ret);
-		pm_runtime_put_noidle(chan->vi->dev);
 		return ret;
 	}
 
-- 
2.30.2

