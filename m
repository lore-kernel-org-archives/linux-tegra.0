Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FC9C4338F
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 21:15:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97A1260F41
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 21:15:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233376AbhHPVPj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 17:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbhHPVPj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 17:15:39 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E4F2C061764;
        Mon, 16 Aug 2021 14:15:07 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d17so22079114plr.12;
        Mon, 16 Aug 2021 14:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ti5ieSHy8bgHsKT/p42fBihkAPuECC+Byn0rag7Ilqg=;
        b=QbhLCH3SR6H9ufXcqkC6oI4jMlMlgavieMvQovzBxvt35SoUs0p9AyJBI57DfhwNQV
         7qqPZ2WQtvg5jJpTprurs1f10RSBwq81MkFYnAKAqQLQleN0qHoeqmKStPUp+7ChDXNj
         5bqoHWxMOS7nLsrssLZPgtUFlmo4kfXoPxLCepuj2FpdUoBMs88InvmK4bMbXKtOa57Q
         yJ5z50M1+WTsidQku2NEYeLed8/OzclW21ekSoCtjIVLBe+OQiSwNpnhf0e+evumT9d8
         W9J1ArxmXszhvXIva2i1U7iGzIz85x2zUqY0bkuqo06tY9KGVkiLJOUQxtMH7cmy1jxe
         hf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ti5ieSHy8bgHsKT/p42fBihkAPuECC+Byn0rag7Ilqg=;
        b=qtWKL3mJz3F7LCn00iNIEYY5RJSxk1T3obQWl0qqesKLxu/pk/+YzJkD9yEi29gzKw
         0CwyL6mLRMbnJ295Zi+oMloPvrMHSZOxG428oLWvuiqdVsLdRGXA+SRJ4y6flCOKiLsn
         2pzdj9Oueoa/rML8ErsbeObY2kzxxU0DcuUTQsPHEeyGd4gg2n7bOJJNfR9duxyhgfJi
         ULNLNFwP6ZnUmsliYt4Z1SOATXyrczLgOZG8qWd8wmHUi66VZnY1V2seUsaqy8UP4PVl
         AOyHJ5wnUnz0b91ikR71nXmWxZiFNDexTsiTdzBhX63ZBe+oKxRFAI4sGVgUEGh53jTu
         gjDg==
X-Gm-Message-State: AOAM531tCPpiJUFFKBSjlsVUZnhIa0S0cgYDdFJedRqmXjpu5fcJPGD8
        GI4rhmxzBM76V9DsRvp0JSA=
X-Google-Smtp-Source: ABdhPJwJZoEwj9uB4CQ5pwLcFobvwe7gSikogI6OOkXKzyMURtFG6MN6/a7qLfHoIesuQsL1YdH47w==
X-Received: by 2002:a17:90a:ba16:: with SMTP id s22mr639486pjr.28.1629148507053;
        Mon, 16 Aug 2021 14:15:07 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id b12sm103154pff.63.2021.08.16.14.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 14:15:06 -0700 (PDT)
From:   Aakash Hemadri <aakashhemadri123@gmail.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bjorn@helgaas.com>
Subject: [PATCH 1/2] ASoC: tegra30: ahub: Fix incorrect usage of of_device_get_match_data
Date:   Tue, 17 Aug 2021 02:44:51 +0530
Message-Id: <bb61c41f2ee0cf0d85fecdfea05f23a7205992e6.1629148177.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629148177.git.aakashhemadri123@gmail.com>
References: <cover.1629148177.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

const struct of_device_id incorrectly assigned "match->data" using
of_device_get_match_data()

Instead assign `const struct tegra30_ahub_soc_data *soc_data` with
const void *of_device_get_match_data(...)

Fixes: 80165bb80433 ("ASoC: tegra30: ahub: Use of_device_get_match_data")

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 0ac109b32329..ef011a488ceb 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -512,16 +512,14 @@ static const struct of_device_id tegra30_ahub_of_match[] = {
 
 static int tegra30_ahub_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	const struct tegra30_ahub_soc_data *soc_data;
 	struct resource *res0;
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
 
-	match = of_device_get_match_data(&pdev->dev);
-	if (!match)
+	soc_data = of_device_get_match_data(&pdev->dev);
+	if (!soc_data)
 		return -EINVAL;
-	soc_data = match->data;
 
 	ahub = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
 			    GFP_KERNEL);
-- 
2.32.0

