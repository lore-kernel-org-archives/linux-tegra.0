Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0A2C74A5B
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Mar 2023 13:13:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjCLNNj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Mar 2023 09:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjCLNNh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Mar 2023 09:13:37 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4758A22CB2
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:13:35 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id o12so38493427edb.9
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msjur9BIXfohR7MjKiHFK0aZDyGMTPkmem6NEGtsCjU=;
        b=OjW7Ch3WzJANLx1nyByhnbnA+p4+Psja196A21bF0aDMZDj+CjUc/V3NpqZSVXJz7J
         Q4s69NqmOUkMcMhUM52lRFAx8K6Hn3pTbfhlcNGcvYtm9T/Xdmpa1eFwio1guKXpLMjx
         /GbbBdI/iGN+TR2BIZr+OCddK8GbN3qlNgAEbLoQvrd9hqX8CNUxQUr1whlLYlnttiCD
         2ppydo1QRfSLe7qEMLz239tuUQR12OAwkuyjl7KW/bFdhhaPMbQAkE3KxuO+3gWxoGJ9
         OsgpWpgMvsI/YzdsoXmnuGMMDhZQ/0cnC86nUpxdiwnlRbtFNGkMGuAkbk1zVOtaFonr
         m6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msjur9BIXfohR7MjKiHFK0aZDyGMTPkmem6NEGtsCjU=;
        b=FPnaobC8lke4j0OsTwG9zw1O/oyLwMhn5RQzSQvZ5Bv+s7AUlBcmjb8izjyH7/OVSE
         hi/b/zDUoXKdHAMmt4Um/ajvYb0Z5vMXjvblJeBVjdvbLFnszmAYKytuq6vUfN6C0j4Z
         HdFaRiuHqqPweSnzwhkS2ilIeNBhkuqfgqlRtjMsjgi+I7kvTc5N7BSC2ugrYjApoA5A
         QHq13gAvsKKYsoXFc+EwMKny9vhw+WThXn+F/qnJGp0DXiwI0sesiZ4CV+DMX+E2aeAJ
         cAZn+gNIfVzcIaQIhZIfytXYvskWTtncZzl5q6hHs+lCtSLjIc3nc0ORljcizv31n+wr
         8Z4A==
X-Gm-Message-State: AO0yUKUzEcjkoGeIHqWMPMaCiHl8zFZj9aH/inXLV5i1eMOBvNMF2Y7K
        rROU8pu++GQIlfEj9iXJvx6AXA==
X-Google-Smtp-Source: AK7set+x2TzZ8b+2TPoP/NPOIph3epGLp33Dj5+VNI5L1g2bCpHKzqAG9L+GEAXmbu6Kg//PKl57oQ==
X-Received: by 2002:a17:906:5206:b0:8b1:7fa:6588 with SMTP id g6-20020a170906520600b008b107fa6588mr30618440ejm.12.1678626813798;
        Sun, 12 Mar 2023 06:13:33 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:33 -0700 (PDT)
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
Subject: [PATCH 05/28] media: rc: gpio-ir-tx: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:12:55 +0100
Message-Id: <20230312131318.351173-5-krzysztof.kozlowski@linaro.org>
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

  drivers/media/rc/gpio-ir-tx.c:24:34: error: ‘gpio_ir_tx_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/rc/gpio-ir-tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/gpio-ir-tx.c b/drivers/media/rc/gpio-ir-tx.c
index 2b829c146db1..1a8fea357f14 100644
--- a/drivers/media/rc/gpio-ir-tx.c
+++ b/drivers/media/rc/gpio-ir-tx.c
@@ -199,7 +199,7 @@ static struct platform_driver gpio_ir_tx_driver = {
 	.probe	= gpio_ir_tx_probe,
 	.driver = {
 		.name	= DRIVER_NAME,
-		.of_match_table = of_match_ptr(gpio_ir_tx_of_match),
+		.of_match_table = gpio_ir_tx_of_match,
 	},
 };
 module_platform_driver(gpio_ir_tx_driver);
-- 
2.34.1

