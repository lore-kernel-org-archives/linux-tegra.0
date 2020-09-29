Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EECC4727C
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 11:31:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB0D723E51
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 11:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbgI2Lbt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 07:31:49 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:50914 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729432AbgI2L3s (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 07:29:48 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id DDAF11328EEB781063FD;
        Tue, 29 Sep 2020 19:29:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 29 Sep 2020 19:29:38 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        "Thierry Reding" <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: [PATCH -next] ASoC: tegra: tegra_rt5640: use devm_snd_soc_register_card()
Date:   Tue, 29 Sep 2020 19:29:36 +0800
Message-ID: <20200929112936.47441-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Using devm_snd_soc_register_card() can make the code
shorter and cleaner.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 sound/soc/tegra/tegra_rt5640.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index d66d86593..c73bd23b3 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -192,7 +192,7 @@ static int tegra_rt5640_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
@@ -202,15 +202,6 @@ static int tegra_rt5640_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_rt5640_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(card);
-
-	return 0;
-}
-
 static const struct of_device_id tegra_rt5640_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-rt5640", },
 	{},
@@ -223,7 +214,6 @@ static struct platform_driver tegra_rt5640_driver = {
 		.of_match_table = tegra_rt5640_of_match,
 	},
 	.probe = tegra_rt5640_probe,
-	.remove = tegra_rt5640_remove,
 };
 module_platform_driver(tegra_rt5640_driver);
 
-- 
2.23.0

