Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED9EC432BE
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Aug 2021 20:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 291F560EAF
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Aug 2021 20:12:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233391AbhHNUNL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 14 Aug 2021 16:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233250AbhHNUND (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 14 Aug 2021 16:13:03 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6684C0613CF;
        Sat, 14 Aug 2021 13:12:33 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id a20so16267283plm.0;
        Sat, 14 Aug 2021 13:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r7fFFu/BvwqmhomKLq6d7HbwgBUteESf+Ymi2dOxs6A=;
        b=TWfjWcGJ171Q7ErtMyT3b7xDskqwjeOcH3Ctict/2YtewtMPFRd9MgWWLPBQWDSU1a
         iydcCHjbZ0YlC9ObYLKxUPxobJTPka9F8xviffsg8BTHZf6gfdKR+8VWxYegFYGtX7RU
         U24omsL8HeV7FxaP18a2OUiEz5LW/XoyaFsX72aJMisrEtDrNP/inrbWNrhwrZLRgtev
         j3pFF1o7N5Q9v3ELMXwcuM/vbDG+rPDGQP5LmVsP69HmCPwkI0caGyFMlU6NxyxSqhSl
         eQqsof2tshXmojeUXFGnBbrpdWMJ+BFwc31NJMUzwd1ZCgkmIfBnBUXwuWJKp0369v7r
         fusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r7fFFu/BvwqmhomKLq6d7HbwgBUteESf+Ymi2dOxs6A=;
        b=gX8HUwPLy0cT7O+pdcwhc1liEwb/jtBE9Bn0nWHZJT1MeqNyokeVNwJiBtAY+GusFM
         /znfIhS/UdMOWiKYYnZYtV7ehKWyIZU0Mwsx2fk8x954mXhEzHrYJHSppP0NIw3PBR4r
         g9CPGXNeNaViPro3kageauzrMCS0Q6ttUNck8Os3oIAMYhUHcsVluj9m792oORdZDmHc
         kAB8vbGRNc3TYC4iOCRMaFMMoER7HqPVpw/bH5tvHQLt3ZUPg0wqyDM0LnL8ZlFIejQN
         1CYpvPZZHz97WLvCsBgfmGg51U8j9o8Zz2udp+CZeIU5dlHh8/BsyCf1Aveq15sUTn7s
         GJCg==
X-Gm-Message-State: AOAM532lIKvrQyttdNjbq+XGpRpraeDZ9aCfXJPEsexOw13SOpGlVr0+
        m5CDPJny3XgagfOi0olw8Fg=
X-Google-Smtp-Source: ABdhPJz35Vbq7h6gBPRvLj5w3YPBueKBwz1qlYxtdKhgU93TBD+T428iIStizGGqrAHm1EsQUPxBTQ==
X-Received: by 2002:a17:90a:f186:: with SMTP id bv6mr8907473pjb.231.1628971953301;
        Sat, 14 Aug 2021 13:12:33 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id u6sm7309420pgr.3.2021.08.14.13.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 13:12:32 -0700 (PDT)
From:   Aakash Hemadri <aakashhemadri123@gmail.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Takashi Iwai <tiwai@suse.com>, Jawoslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bjorn@helgaas.com>
Subject: [PATCH 1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
Date:   Sun, 15 Aug 2021 01:42:18 +0530
Message-Id: <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628971397.git.aakashhemadri123@gmail.com>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Prefer `of_device_get_match_data` over `of_match_device`

Retrieve OF match data using `of_device_get_match_data`, this is cleaner
and better expresses intent.

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index b3e1df693381..0ac109b32329 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -518,7 +518,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
 
-	match = of_match_device(tegra30_ahub_of_match, &pdev->dev);
+	match = of_device_get_match_data(&pdev->dev);
 	if (!match)
 		return -EINVAL;
 	soc_data = match->data;
-- 
2.32.0

