Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D4BC7618A
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Mar 2023 13:14:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbjCLNO6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Mar 2023 09:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjCLNON (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Mar 2023 09:14:13 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04809474E9
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id o12so38495133edb.9
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FklNTrfw75FQnVJC7no5/FQCPZiirAS85g1dWyaYnQ0=;
        b=YAxPlJhF1+DE9jUIWYyITWyk7/AONuibeqeBOgc+dWF5fRBbLmZqbk1IYqYlHABI85
         gz1wXPUZjU5FC3mPpXfAfbwnto9A2C8UR5j79ptmQvXc8NIm93NUj7vnZscY32eF5vOQ
         MNqXBlnv4ABmODy3pYii1yEyd13GeBgb4NroSTWOAXhnpEoT/yi4gqdHK3skNRal/Ae+
         3cMpgvlN2t9T17SYFpZKlQ7VLMYX986I32TaxVNtQfKWUgod+jAHKsvNHdpkbRKt4aYk
         B2uanB4ZtOcer65Igqf0RJ3h8hJb/2Xmwgp0Xi2cgPElJofc8L4SdOxvKNLQznQt+/k0
         yqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FklNTrfw75FQnVJC7no5/FQCPZiirAS85g1dWyaYnQ0=;
        b=yViqWzbRGKFWRjkfdntHeXzmA5xx4191w7HAU3h8f8oRyJeGvU8d82/qaJ7KE9ZcQq
         GDweCJ22rIx17HKmXqEXss4c4pNR66qxrF07C+FdLdDJ2Rnf9RWJf6sVOAfw9NPccahN
         FJnHo9Sr6JZ4e57L0ihrBshQmDkYwzmMhOTpIbr7M5YJSFRI7pWnJ1eU59HTk2fo0Az7
         Y/6BZH7RmifQuynDaLcTOeMX42lw7wQMOTmXtmi3m1kLgEf5gQGrb0og9VRUMzJZ3BjP
         O8aMQxS0KiK8vk/L9OOXnW03eAGnp8ZiWOMkFzRnIhjGRL6aRwfsckV1eqlCjxAKXaYG
         7z9w==
X-Gm-Message-State: AO0yUKWb/2JSDa9OTzqLqt09WBDbzdzRiYXdnPyw4tcJgTnaCasITcc9
        AIfvzs9IGFvBvBi6nYQWQzq+wA==
X-Google-Smtp-Source: AK7set+1VMb4vP5AkQiutwwyqAr2RuSDyquikjNxXi+uMI4iRdw2RCO1AJJ8nzH1kwmE3q0OOnHeOw==
X-Received: by 2002:aa7:dbc8:0:b0:4f9:deb4:b97f with SMTP id v8-20020aa7dbc8000000b004f9deb4b97fmr5865130edt.13.1678626829419;
        Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
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
Subject: [PATCH 13/28] media: platform: marvell: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:13:03 +0100
Message-Id: <20230312131318.351173-13-krzysztof.kozlowski@linaro.org>
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

  drivers/media/platform/marvell/mmp-driver.c:364:34: error: ‘mmpcam_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/marvell/mmp-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/media/platform/marvell/mmp-driver.c
index ef22bf8f276c..b7747c7bae45 100644
--- a/drivers/media/platform/marvell/mmp-driver.c
+++ b/drivers/media/platform/marvell/mmp-driver.c
@@ -372,7 +372,7 @@ static struct platform_driver mmpcam_driver = {
 	.remove		= mmpcam_platform_remove,
 	.driver = {
 		.name	= "mmp-camera",
-		.of_match_table = of_match_ptr(mmpcam_of_match),
+		.of_match_table = mmpcam_of_match,
 		.pm = &mmpcam_pm_ops,
 	}
 };
-- 
2.34.1

