Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8046EC6FD1F
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Mar 2023 13:14:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjCLNOB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Mar 2023 09:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjCLNN5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Mar 2023 09:13:57 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4C825B80
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:13:38 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id er25so10368595edb.5
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr1jUKnL41ZyOFBU50NsUPyS/zukAR1uIPxn6pkxwwo=;
        b=d/Be+KE/rae1AooRcRo7NJaoA4jh14ihaoslOYJLSEXJQusR7E+0E7WGgKwVRvJoU4
         7cdi5lsie8od8sSeQOijQ+CU4K2wFTybbFVmGoqHZm94v3n/12QgP7a8B5fLk8P3oQWA
         Oi+Wf1t4BtkYlyqaXjU8X/nXEzUjjdeyZmjOvBGcEe/zF3N/ZANNaRkblY9p/FtqC7p/
         QCvhTboN2UXxOhL+7/WonTj8O2ca0sj3nz65riaVKnjdeP2wrgFMxLx26N7hQlzLO47j
         ME0hrCDR4+HnZG+PoqQA8nwhxmvt0zQP33761Ra+sweUSgGDS99wyFfsfyWun3OK5zxy
         bVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pr1jUKnL41ZyOFBU50NsUPyS/zukAR1uIPxn6pkxwwo=;
        b=6EV6utrOhXEJTzzVFR9gdeLQHjSNQCGjaTMDxsjTTS4AcTjMSOtpkVFdo4TNkcfI4g
         /g70KuC3gJvAcXWRX0SBWEDiHETsQ+rn6tJ7F0dUnmhD9bSAqR1rHjsOo3v95Lii6hf9
         XGlA1v/c2y28y/TXHj19czqFJBvYfDTi5jSvBojdfYNUXlfMzivYJLxIMndVeujnZBr3
         aF+Qms+bDsIU5tk6Srnji2uAZQIvBo0h2ZKDNY/c6QlXphtF12M8+8RGmSxcjSy0T6c5
         Wh3XWD4Rgox3BlGWsm/o+qj83ykKOmIEtVRlPMdie8lUHs9Uotg3HC+9TjZORkSqGvHt
         wY3g==
X-Gm-Message-State: AO0yUKUIu4UIdtniG2+nPcV5WzcQCaoNPcY6kQ2eoNFvHJZ/f10SotyL
        0HwN+ozDGCYlTOEyIBxtBfjMOw==
X-Google-Smtp-Source: AK7set/eBPmURAU386Ic8efAZKpGibHAFxF6646hcUlmwtY5zSg8zn253Ru88JXsM5LrkN6l2cpu5w==
X-Received: by 2002:a17:906:6988:b0:923:c55d:efd2 with SMTP id i8-20020a170906698800b00923c55defd2mr3351678ejr.68.1678626817635;
        Sun, 12 Mar 2023 06:13:37 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:37 -0700 (PDT)
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
Subject: [PATCH 07/28] media: platform: allegro-dvt: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:12:57 +0100
Message-Id: <20230312131318.351173-7-krzysztof.kozlowski@linaro.org>
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

  drivers/media/platform/allegro-dvt/allegro-core.c:3995:34: error: ‘allegro_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 2423714afcb9..7fc197a02cc2 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -4009,7 +4009,7 @@ static struct platform_driver allegro_driver = {
 	.remove = allegro_remove,
 	.driver = {
 		.name = "allegro",
-		.of_match_table = of_match_ptr(allegro_dt_ids),
+		.of_match_table = allegro_dt_ids,
 		.pm = &allegro_pm_ops,
 	},
 };
-- 
2.34.1

