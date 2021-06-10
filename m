Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298C6C47094
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 06:42:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF5D5613D9
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 06:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhFJGoG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Jun 2021 02:44:06 -0400
Received: from m12-16.163.com ([220.181.12.16]:44166 "EHLO m12-16.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhFJGoF (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 02:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=y+e2b
        PmexqtbrmKw2MH4HI+pB5lEaw8BySK7BAtauXA=; b=E/drF/s30r49VUTPCp8i4
        4dpIEzzv6Rege3jBXcY0yKs1giE/kICHaEUoUvap/7QO1KQZS4TAn3JsTGrJ0fhL
        Qz9hhgzsew5UpjSYD2S0UI7vWjtBnAtQplZWjxYosURp/ijkr2XpNIMOkKgfydlK
        NImjFjMI+fqIfItFYGw0hQ=
Received: from localhost.localdomain (unknown [218.17.89.92])
        by smtp12 (Coremail) with SMTP id EMCowACXs0_Hs8FgENRawQ--.34426S2;
        Thu, 10 Jun 2021 14:40:08 +0800 (CST)
From:   =?UTF-8?q?=C2=A0Zhongjun=20Tan?= <hbut_tan@163.com>
To:     thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        jonathanh@nvidia.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tan Zhongjun <tanzhongjun@yulong.com>
Subject: [PATCH] drm/tegra:Remove superfluous error messages around platform_get_irq()
Date:   Thu, 10 Jun 2021 14:39:55 +0800
Message-Id: <20210610063955.1064-1-hbut_tan@163.com>
X-Mailer: git-send-email 2.30.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowACXs0_Hs8FgENRawQ--.34426S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrykKFy7tryDZw1furWDtwb_yoWfuFX_Ca
        4UZrn7Wr4S9r1qvFyDZry3Za42yFn09r48Z3ZrKa4Sy343J3WUG3yUWF18ur4UXw1UGas7
        X3W8Wr4avrsxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeC1vDUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: xkex3sxwdqqiywtou0bp/xtbBqBetxl75dLHjvgAAsr
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Tan Zhongjun <tanzhongjun@yulong.com>

The platform_get_irq() prints error message telling that interrupt is
missing,hence there is no need to duplicated that message in the
drivers.

Signed-off-by: Tan Zhongjun <tanzhongjun@yulong.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 7d7cc90b6fc9..1f96e416fa08 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -467,10 +467,8 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 		return PTR_ERR(dpaux->regs);
 
 	dpaux->irq = platform_get_irq(pdev, 0);
-	if (dpaux->irq < 0) {
-		dev_err(&pdev->dev, "failed to get IRQ\n");
+	if (dpaux->irq < 0)
 		return -ENXIO;
-	}
 
 	if (!pdev->dev.pm_domain) {
 		dpaux->rst = devm_reset_control_get(&pdev->dev, "dpaux");
-- 
2.17.1


