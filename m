Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D92C6FA99
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Mar 2023 13:14:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjCLNO5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Mar 2023 09:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjCLNOI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Mar 2023 09:14:08 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A8848E1B
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:13:47 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id s11so38492985edy.8
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSjnY2UnQpgl55C0x0EbScbpZu8mF5QaFScRi5nrBhc=;
        b=Dc26ZIuGptSW54drxYTvMfBZdnM7T2sqH0Ibrn8Isnx72gXt6vIiQrkYJ/ZXRTKeJu
         wXhScqvsjvycZ/sKKYPGCAOgFQPC157JwyaE2cQ5Co/gRVglSKhEm/qSXfGf8d6yTlWu
         NQEJdDvJriyTDULJvI7FxJ1RcMzG6pc3xa2jz7zclJQIsfcQW/69r3MrW5frrZZEiMUs
         8GlhS8zDtnKywTPP15jmvqXI2iI0UA8V27Mp8bX/cYx8afzVMoEJ++NwRakEsYUy8UnR
         X9/AcWhpkrweQyKVI5gMG7fObgCTsIyIHVoFEj8R4G5wb79/ddG9Kmwm4kVDZBQihQMt
         3fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSjnY2UnQpgl55C0x0EbScbpZu8mF5QaFScRi5nrBhc=;
        b=RVh/lkRBSjHawxYJrG0U9hpH/nOrzeBq53Uw+7LFM80/5wRcuBfMwCTf6p4DQ5S3F2
         VbocoCLVsvYfuCLBRehU8/Ar/I6ry9ZLks6EP9OTMuADgrwpFo8jG1ClT3WUgw9Mq8FE
         Q12Cw7n6o7G1EyEqen7bUzR4k8HE0109bU5hKs+Fp0tXVR+jnsCzz+arsKTkEngQXFmx
         48zVigGNlLuFMx22O9zo2p+A6vHVJOF+7feRzx/n/S2+Lmg7dI3pXXlbjnMfY4UX425s
         hcXhrE7GauvDGeylls+ttyEtg3HFdj2/dlArNcxFCdm5ZmdTTMWkhg4jVSM0j/Qx7TkL
         +fGA==
X-Gm-Message-State: AO0yUKVLLogMgv1v/4unxqX4n5zC86uM5u1sIXqGa8v5cxUUmHYFpstW
        mDifpUf/W/xbFIh52eYrrBbwAQ==
X-Google-Smtp-Source: AK7set/fcAtAWgh3+TRqI/ZkpAQaBtS1MV/NpNDoPVgH7rYzBAYx5gtRCk/B6oCX3nWaWawSfNsODg==
X-Received: by 2002:a17:906:db05:b0:889:5686:486a with SMTP id xj5-20020a170906db0500b008895686486amr37991558ejb.30.1678626827320;
        Sun, 12 Mar 2023 06:13:47 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:47 -0700 (PDT)
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
Subject: [PATCH 12/28] media: platform: verisilicon: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:13:02 +0100
Message-Id: <20230312131318.351173-12-krzysztof.kozlowski@linaro.org>
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

  drivers/media/platform/verisilicon/hantro_drv.c:622:34: error: ‘of_hantro_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index b0aeedae7b65..4041b5b38c4b 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1135,7 +1135,7 @@ static struct platform_driver hantro_driver = {
 	.remove = hantro_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
-		   .of_match_table = of_match_ptr(of_hantro_match),
+		   .of_match_table = of_hantro_match,
 		   .pm = &hantro_pm_ops,
 	},
 };
-- 
2.34.1

