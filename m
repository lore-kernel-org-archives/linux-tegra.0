Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D206C6FA99
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Mar 2023 13:16:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjCLNQC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Mar 2023 09:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbjCLNPE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Mar 2023 09:15:04 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18015521F1
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:14:20 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id cy23so38398988edb.12
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNgYfofTMT0DwU3/gnE/zf49ZhjV1abWtqYCyvkVzBQ=;
        b=EgkbAPHTPzo9cfWlbLRM6KLB9a2CDiyTPjgvZIkiQB2D3eAiH7zCEO3VPovDUd+GB4
         KX5pcpWniraKhokFUITVAYNqggo8wmVnv51oebW8T+jTWoS8EYz5RuidnQho16MtLB5Y
         6HnazuF5aS+d0nJV3e7wA/9S90PNSqDWAroW/WjB+cwKhBYuD2AiqFCxO/6DSf+Lzzh5
         s1erEPkcKXTBdvZZEH+znboKjx0L7miHhUyOS7X5sprDW30hvRNz7iLwKLf6cCe9e+VE
         4sxLBtwFF/inQe5VeT2sEqF81F41KzmIGM4nDHT9s2mV60jv2F0INyTIWn4VM/cwT76j
         nAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNgYfofTMT0DwU3/gnE/zf49ZhjV1abWtqYCyvkVzBQ=;
        b=t2RE+6/Op9615DopSlTINB3okgRRGCh9UJEDo1hJjhtm3GZ/mx0J0TjGkkzswIsMAo
         K+JSNoLrWK/ddee6bdgmXhrZi/OXxbLLMTHcZrLqHY5NhRGY5/G8//cf5hpmNE4ngXMI
         pqaX8dTPg+RAO7QFzS6c5hMQWJBP+sWbSQqUR5uPflX0XyLnwdOWwhFULVhwgZvHLzE9
         r6I7ERYUKvbw0Kjm1XuK71m8ao5QvlTPWkCcpn/mHaWaZiZtHLOmH//ptoWNQKAoLP/P
         G4dEJeHKPkXc5EfAwfy6d5vFdpdldTjLKG3FwaOATrPhDpdYgb3FmSJuXtcZ4Ny1D5NH
         uW0g==
X-Gm-Message-State: AO0yUKWUM/v2KSJQsrRWNQhxjZw1+0HrAbUigotjl6aySK9YzHoI+5sq
        IafHA6ZUKvlN9EKbMJezol38EA==
X-Google-Smtp-Source: AK7set/vg3wcNxuj5n3r+oFsWS7o7VFQ0ZolSjtjcry30Pr24as5+4q+gdgTFv63DmbvH/wtTzc+Fw==
X-Received: by 2002:a17:906:4f94:b0:8ed:e8d6:42c4 with SMTP id o20-20020a1709064f9400b008ede8d642c4mr31116353eju.12.1678626845092;
        Sun, 12 Mar 2023 06:14:05 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:04 -0700 (PDT)
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
Subject: [PATCH 21/28] media: i2c: isl7998x: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:13:11 +0100
Message-Id: <20230312131318.351173-21-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The driver will match mostly by DT table (even thought there is regular
ID table) so there is little benefit in of_match_ptr (this also allows
ACPI matching via PRP0001, even though it might not be relevant here).
This also fixes !CONFIG_OF error:

  drivers/media/i2c/isl7998x.c:1557:34: error: ‘isl7998x_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/i2c/isl7998x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index ae7af2cc94f5..b2b351816b82 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1611,7 +1611,7 @@ static const struct dev_pm_ops isl7998x_pm_ops = {
 static struct i2c_driver isl7998x_i2c_driver = {
 	.driver = {
 		.name = "isl7998x",
-		.of_match_table = of_match_ptr(isl7998x_of_match),
+		.of_match_table = isl7998x_of_match,
 		.pm = &isl7998x_pm_ops,
 	},
 	.probe_new	= isl7998x_probe,
-- 
2.34.1

