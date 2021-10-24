Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48FDC433FE
	for <linux-tegra@archiver.kernel.org>; Sun, 24 Oct 2021 19:30:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4AC36101D
	for <linux-tegra@archiver.kernel.org>; Sun, 24 Oct 2021 19:30:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbhJXTcT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 24 Oct 2021 15:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbhJXTcS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 Oct 2021 15:32:18 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CD7C061745;
        Sun, 24 Oct 2021 12:29:56 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id p16so7536578lfa.2;
        Sun, 24 Oct 2021 12:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fssUPo649zl7hYXCezg8n0RZeu85Xq1Alf+1ngKVAWs=;
        b=JkkG3uRp6UIRQc8S3URH/qL5Y36IGMonoPcLuVzDUz5yFLlplSZr6YivUkaXR8eg1m
         Y6zMydyKTnWaGc1yz25mGzthi2KJ8K+KSsLomf22u1bYyRL3lELbk4/h9/ARaPJROpL6
         fzmHp65yEc6iexeIFLQk3HW82i/GZ91Gjg6YIU/9ZHuWTnp/AacuklVfVeJbppQE3rd3
         MbpYtzMW6PlkMma9FY+ZgrAMj6bInidDUMKizhXfyYXW/MQb8CnoF2Ru0nJMA7tD5EYN
         OfMSIQhFZeab9HzwwbyORdboAWnIUC3FwpNqkFEh8yK0wqdP4dR1ekdyGOm5ppE4CJXO
         iZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fssUPo649zl7hYXCezg8n0RZeu85Xq1Alf+1ngKVAWs=;
        b=i4WKObeFNrZ55E3tx10b+nDrsk1d4NdKeTYyddRwsMzQm33HHSlDMPqamIlpxEKCYr
         9Sgqq9a2OkSdtLYMYNny74y11uBvDqrKdTeeBMnt9SQWCsjaF3Qwhii1oLHxqL3G3Tqe
         kwCUV3AJ8iIqUjWJsKjA5fOr8tN+hCbnJrxOMYSAxPzdxHR3HuWyY1vOk4ngdZtrXVau
         wvzoLQYwF0f258aXYTPyehs4Ajy9jZpr2yMYQV2kOWXVK5UOHJv6Ef00cQ6Bko1rOUjl
         MFl5hnmSi8CnG/GDP54HjnYXG5r3jbXzFV98/QzDurVsJPv8fT7+FeN9KceDDrKYtyx7
         ySQQ==
X-Gm-Message-State: AOAM530qVYjIXLl4bgPeEt38OdlgeK3NxX1OakB7MufD+RDxIedsLTX/
        wNYfWuyAhMSjWQ0AH/dTCRo=
X-Google-Smtp-Source: ABdhPJzZw1oH1wNEEPnqrJKVnnGPyxkUNeSSGCfgs8uqukJkiYf3SfVa5/DG7hsouGPhzLpngVGoqQ==
X-Received: by 2002:ac2:5328:: with SMTP id f8mr3258220lfh.233.1635103795071;
        Sun, 24 Oct 2021 12:29:55 -0700 (PDT)
Received: from localhost.localdomain (46-138-50-159.dynamic.spd-mgts.ru. [46.138.50.159])
        by smtp.gmail.com with ESMTPSA id t20sm1616902lft.240.2021.10.24.12.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 12:29:54 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ASoC: tegra: Set default card name for Trimslice
Date:   Sun, 24 Oct 2021 22:28:53 +0300
Message-Id: <20211024192853.21957-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211024192853.21957-1-digetx@gmail.com>
References: <20211024192853.21957-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The default card name for Trimslice device should be "tegra-trimslice".
It got lost by accident during unification of machine sound drivers,
fix it.

Cc: <stable@vger.kernel.org>
Fixes: cc8f70f56039 ("ASoC: tegra: Unify ASoC machine drivers")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index d92fabff08bc..b95438c3dbf7 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -725,6 +725,7 @@ static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_trimslice = {
+	.name = "tegra-trimslice",
 	.components = "codec:tlv320aic23",
 	.dai_link = &tegra_tlv320aic23_dai,
 	.num_links = 1,
-- 
2.33.1

