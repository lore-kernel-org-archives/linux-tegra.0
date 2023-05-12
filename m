Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0974BC7EE26
	for <linux-tegra@archiver.kernel.org>; Fri, 12 May 2023 16:35:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbjELQf3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 May 2023 12:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235408AbjELQf1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 May 2023 12:35:27 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5936A5E8
        for <linux-tegra@vger.kernel.org>; Fri, 12 May 2023 09:35:17 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-965f7bdab6bso1714838266b.3
        for <linux-tegra@vger.kernel.org>; Fri, 12 May 2023 09:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683909316; x=1686501316;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oj3vBLYi0VGg7znZN4GARmcXM9pKwrBpVwIV9KkQbec=;
        b=cX9t50W3qWgc+/ZaeMekhrhK1HUSgn6pR9RA6For+1pKOyNl38tWsLSYOfttWTB89c
         Vr2S7zudABZH+b7KSDqiMNpgQAWPYU7rpl+r5I9fF147w2jcxg6cRplVOIq4PYhRJSuX
         1H2dQdesYD3RgRF+wtsb5y2D+cBLKlR/go2UbTI757Xu/FfM2oQTSbndCZzd6iGc2Wvh
         Wg+KeqlAtEUQbqigYT559PDPA5RPd2OVmYiP4zXf3PP3bsJ6e/ZtLEtAfaGvZO3NIjOc
         L4BCIFXPgs9MbOyq4n0ZUayjP7HhqQcTqVmuYAtJnYBi9943hkimGEBt6m7DAqjRCsuJ
         ZEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683909316; x=1686501316;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oj3vBLYi0VGg7znZN4GARmcXM9pKwrBpVwIV9KkQbec=;
        b=YCErNozYxg8KDxm3CEDruEBSwmRAx49QCIM+/ymq/AC/gldBPsHuZmy2uPhdoobjYo
         tq7V6e31n+ymsqZbOlXsQiO1Bo3LLQt6ZQMsQXpSSxsoH6X5Vtl59+mjy5mvhSbig+Xc
         +JNPgOG31YCaZIqudllwZhMe/MhtVZaYhSwhItrAjtjzkiZArpzId4P0V1q7YgmLNFs4
         TX7rGVg5nINEh4iGOb0P0P8B1D3e7Ob20DrzYS+IsTXbeg30p0ZJ1uVt5vWMctFKBIWE
         FwiTONGsp/oMukYNmz8mTg0Q9UKfrFxguH131zCI82pm/DUDCLI9bAtJzODZaghpA3bV
         osGQ==
X-Gm-Message-State: AC+VfDwXV8WeeFKUVd5hT8cdOG0V4bWvAPquzXBMUc3fjVlUywPbLNMK
        1+pInWQanCyD38hlv7sVFn078A==
X-Google-Smtp-Source: ACHHUZ4ot459mbkMzA1b+DbStmTsgAlYaGVvjjMaw+ecLAMB38L9UcblvQxLt2/wAAYALelHBjLbFA==
X-Received: by 2002:a17:907:3e9e:b0:96a:29c0:8515 with SMTP id hs30-20020a1709073e9e00b0096a29c08515mr8774854ejc.58.1683909315994;
        Fri, 12 May 2023 09:35:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id lt14-20020a170906fa8e00b0094efdfe60dcsm5490714ejb.206.2023.05.12.09.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 09:35:15 -0700 (PDT)
Message-ID: <98a77653-ec58-56c4-9893-3b424f67c87e@linaro.org>
Date:   Fri, 12 May 2023 18:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Content-Language: en-US
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
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
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
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12/03/2023 14:12, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
> 
>   drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Hans, Sakari,

Can you pick up the patchset? There was positive feedback:
https://patchwork.linuxtv.org/project/linux-media/patch/20230312131318.351173-1-krzysztof.kozlowski@linaro.org/

but it seems it was not applied.

Best regards,
Krzysztof

