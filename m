Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96130C43600
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Apr 2021 10:14:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FC01611F2
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Apr 2021 10:14:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235505AbhD0KOm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Apr 2021 06:14:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:35146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235409AbhD0KOf (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6262661403;
        Tue, 27 Apr 2021 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518431;
        bh=WbRKhLLskO1RYUogcibQypEKrmLpBP5nHtIha3xX034=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V1M5s4+mTVC8LapJnRqHHVl6tIlFe8dMRzuurZ0JGjJF7/XQXAKwYv9WPelhIxukf
         FfQTTpJmb5Gi2RqPEN31aaE9dS3j/Xg09vEGHw3MTW2tqquJwbXmKKdbKamp4LZ4kz
         VxgWVyFtWEixuLf0en4L9G/x7quzDJek3hpTJ428+3yx7q/47OV9adcZvOrgxufyCx
         6eE0qgYaRJsPV2Bci5FmTyctDigp+TOPyaYjV7xQOsCFVP4LVv/heYncsjh9cjk1h3
         23EMTS9fk5hag+zh/BoJvN2kQaBMfLahY9rU53iOx5awmd4Bx2LuWlwk5TUQIDz25D
         0AJLd1PTqCvtQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiz-000j5q-9q; Tue, 27 Apr 2021 12:13:49 +0200
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
Subject: [PATCH v2 26/79] staging: media: csi: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:12:53 +0200
Message-Id: <bbeb44fefb291cefeaa248c4283dd083c6047a7f.1619518193.git.mchehab+huawei@kernel.org>
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
 drivers/staging/media/tegra-video/csi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 033a6935c26d..e938bf4c48b6 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -298,10 +298,9 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 	struct tegra_csi *csi = csi_chan->csi;
 	int ret, err;
 
-	ret = pm_runtime_get_sync(csi->dev);
+	ret = pm_runtime_resume_and_get(csi->dev);
 	if (ret < 0) {
 		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
-		pm_runtime_put_noidle(csi->dev);
 		return ret;
 	}
 
-- 
2.30.2

