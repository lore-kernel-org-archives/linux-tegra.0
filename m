Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3FFC0015E
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 08:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233290AbjGZIb1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 04:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbjGZIbC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 04:31:02 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2AA1FFC
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jul 2023 01:21:01 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99342a599e9so1096716266b.3
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jul 2023 01:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690359660; x=1690964460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JiHG1lqfKtIgSn5nDbZ/v9AonJn+0BEDVLcqcbo9VMw=;
        b=eM07wKpFCUyvyGxNYzYTzgCpEijzkJf7hJHDQc+i/xA/jNEnvHA977kYSn0v/43e+H
         175ADqTKdLFh5yltdkjKiAQquGfKNC7khbSd6pR+Xsx4eMx2/MN2VZeQmwXbsE+avszl
         GhG4wA39gGhGrK9uymQluTkRgUAZDzHXgwPVmxCwfmXs210k8gYsiols3HHWcv9aT4Ds
         B5Z2BDhHLmBoPo9mYXDsSY6eOvwzWjtb7mPc02HjZIqeRrsVSMGcDpKgRM69mg01yyna
         m4onL4BptrTSDHkWGcFMJzCDBAurZ4qUl1eo6zPwT4oPh7wG6VIDUrbWXF86GIUFk+gH
         ct3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690359660; x=1690964460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JiHG1lqfKtIgSn5nDbZ/v9AonJn+0BEDVLcqcbo9VMw=;
        b=EOzNOwejYNagFWpYERwj07ow0qmrsw5/n3h0O45dOIc8ovNNLSzOP1faig/h2Sarl7
         cCikJL8SbjajdS+tng9TuB/7YcckWdfbKAqPKksEPIZhZKsWvsTuW+jDLWVPKtFRKIWz
         9Q9+MnXwUXqCg16SBOh19BXs0XIAtCQ+IcfAqzER6u7NHmISiMVaWX9f4JsMvrkWZm/d
         28MbzDpW48Dqia9TIYlyj6kBdDpKbczhvJqNoGTfg+WfIbJoFdU7qn/9Z5/4t0SDFq7K
         jkxLytMVLRbfi9mFduODIlozigYDG6HYkjqODHNB7ZDO08Yv8XV3Cc4i6AhXDW7MhQxK
         kVQQ==
X-Gm-Message-State: ABy/qLY63+rGutlzyg2pYzkSK1vkWfQh6S6E+XqUXoM0Fo3wa7dLgCWG
        0SxbJuEVNqBRHEVQ2XTwG1Hq0g==
X-Google-Smtp-Source: APBJJlFSv4sPrPVpORIAoXVWqnWYXffFs8Rj+rBO6g/J3M8WgKWJdW/mDG62LCvhpl6DqK28klacEQ==
X-Received: by 2002:a17:907:7851:b0:982:21a1:c4e0 with SMTP id lb17-20020a170907785100b0098221a1c4e0mr1067754ejc.56.1690359660018;
        Wed, 26 Jul 2023 01:21:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906804a00b009893b06e9e3sm9301463ejw.225.2023.07.26.01.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 01:20:59 -0700 (PDT)
Message-ID: <f24f29e9-ff06-5d96-df44-7632a933e4c5@linaro.org>
Date:   Wed, 26 Jul 2023 10:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Joe Tessler <jrt@google.com>,
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
 <98a77653-ec58-56c4-9893-3b424f67c87e@linaro.org>
 <5afcec8b-b8f6-35b0-278a-5de185e4a7a2@xs4all.nl>
 <ZG9XJCD98VWjGjTN@valkosipuli.retiisi.eu>
 <ZG9ger4WE2VWoVEF@valkosipuli.retiisi.eu>
 <158425ec-86e8-ca3e-eed8-e14b37c42730@linaro.org>
 <ce217ae6-6dd5-26ea-2ce7-95d97ef791c4@linaro.org>
 <ZL+pNUYymeXv5EoU@valkosipuli.retiisi.eu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZL+pNUYymeXv5EoU@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25/07/2023 12:51, Sakari Ailus wrote:
>>
>> I don't think this was merged in v6.5-rc1. It's not in linux-next,
>> either. Another month passed...
> 
> These are now in the media-stage tree
> <URL:https://git.linuxtv.org/media_stage.git/log/>. Assuming nothing goes
> wrong, these should end up in Linus's tree for 6.6.

Great, thank you!

Best regards,
Krzysztof

