Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC07FC6FD1F
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Mar 2023 13:15:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbjCLNO7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Mar 2023 09:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbjCLNOP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Mar 2023 09:14:15 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B871951C96
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:13:51 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id fd5so4618838edb.7
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edZ1YtzomlUy1mG3JQnBn+Oq8n+Y+JzAFR8/ksaDlN8=;
        b=PFvlssf4Ggo0VoXlZc2FhUxjUKnB4Eup5x4BhErQZhbBiuiId0oUqCSzyj5+L3ad5w
         wI6FchuGLNBvM91ieUlnkVcU9KFSUcm1EYtijCQcFspt1bzrGvNG3iiXrxY9C+HS3gRS
         /smd1MABeeT4TSBkfeVji+cC8O5AJhgJ0VBS9Fj1bApq6GqFyhw7Gg4+As9zXzm9zak+
         4Z9i2yE5eWKFiHsmntL/Z2XwLUp0qabiZsukjMk3Funkyqc2+A2dYmkPOl4sN3Zuyret
         KZU4GzhA0p7hXpeWwwx7HKQoJEhz0ogqMrGyJOyUMbMpY2OBBaAqZ4bzRXcVEjvfMogv
         4z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edZ1YtzomlUy1mG3JQnBn+Oq8n+Y+JzAFR8/ksaDlN8=;
        b=zxh5KbncOpH1n+436F/JN7Q90X/uzj7YCT8SULTCjUyWKtZF3/rEriecfr7b3WKldr
         N+bgpnhZ00AIzqvC8N164NR06vKfMrc5ZhW+jTnoc0TfDLOsRBtSS3ZaoCoCFGobtFne
         7j+1JvCZbqOr29OWuoYnrLcMyXzYeFGlIDdWisg9vdtkCwVSvfO0y4hlmIwVjxZp3WcT
         c9lGcJjE/6BBrmpTDwJqy+SxWPvlj46jUPUuv1dRZ19nN+7r2YL8jDu6QB1/EG41UjBD
         bSeOIB+Eoseq4WF50okwyxzu9OXju9w5aNJADuVuyhxGeoZXKv8vKXKXkFFxQB8RYL21
         9bsA==
X-Gm-Message-State: AO0yUKV9uWFQ5LBu9VQ12npw7GUccCPub3OPM3d23HFswuoDnuWIvbNt
        mPAE6iytVFn/8WFbQJLzd/Uw7g==
X-Google-Smtp-Source: AK7set9l4BYDUv8WJ9/1tWNIf7xlyiVfxch/+G9YhPZ8oRq9zxCXa6FbFzm0mSfKGHbdS3OEGsdE/A==
X-Received: by 2002:aa7:d952:0:b0:4c6:f2cd:9d72 with SMTP id l18-20020aa7d952000000b004c6f2cd9d72mr30110485eds.5.1678626831365;
        Sun, 12 Mar 2023 06:13:51 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Joe Tessler <jrt@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-rockchip@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 14/28] media: platform: mdp3: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:13:04 +0100
Message-Id: <20230312131318.351173-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

  drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:49:34: error: ‘mdp_of_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 97edcd9d1c81..45a407e63c59 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -349,7 +349,7 @@ static struct platform_driver mdp_driver = {
 	.driver = {
 		.name	= MDP_MODULE_NAME,
 		.pm	= &mdp_pm_ops,
-		.of_match_table = of_match_ptr(mdp_of_ids),
+		.of_match_table = mdp_of_ids,
 	},
 };
 
-- 
2.34.1

