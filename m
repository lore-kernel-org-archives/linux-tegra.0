Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB224C6FD1C
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Mar 2023 16:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjCNQbs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Mar 2023 12:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbjCNQbn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Mar 2023 12:31:43 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C070FF970
        for <linux-tegra@vger.kernel.org>; Tue, 14 Mar 2023 09:31:35 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y4so34954613edo.2
        for <linux-tegra@vger.kernel.org>; Tue, 14 Mar 2023 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678811494;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Z20n8EovjQK6WWHRBaG09kppsRVXiyp2olQcDL0XJ8=;
        b=JK44/SsDXBuPDZzc56hUjt+1W7VutqTow1gDp4b7GRufbuYANwBW3zJWk/Fdr5oy1V
         5NvGdMpCt9KdMMZ0wXSMshyMmavoyRhfXn4dByC3Ra59ZWEliXiB8mN8v7xyWYoY+EKx
         9NbExJxy4XW5gsNpzG0e2gSwtq/3tG8E45K4EBifKcy720nyV6KKjD8tKWWC0RxYMvI4
         CZgvENMmgS4n83pA7Klyg+owq9LWy3TuivG7ClIC6BZPRDK/whWULBNFJTPomgpe6M8U
         PpRFx1/qm8hUiI8BU9FhfgfI7bFQIDM024dDiYyf9bSQQj+BqJ/PDrxtzbJWxOGY3L03
         zCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678811494;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Z20n8EovjQK6WWHRBaG09kppsRVXiyp2olQcDL0XJ8=;
        b=Xxvv8TBOvjjZyHNJC6FmBIMzHo/umBVcD4BRHU5qfPDunvyjU0FAMbZbqTQusZVbV3
         2zkMWb0LyNSNMQlRQquBqojBzQxXfIbeOM4kCSbF1ZWsvIE9Vab0pF1N5M8S9Gd/QtU5
         aOcIKKPRJqUDBpBD35M3KEimtPnkL276/Vvvg4kNCNNeSQIuro8LGy2sY0kSPXOI01sx
         tZadgNQLAqWGkRE1Y3BItqe7uModjX1vK3LSy6j0MEaWpHALcHBSYAEVvkymE35O5npA
         qgtOzdNVmgsZbpBHuGazOzATySwsNnUxhUME9ENToK3rRCgykYrbOwzCXD2L0hLV4wit
         Fagg==
X-Gm-Message-State: AO0yUKVQvjgK3E+tKhMiaMk6TOa8Hv9XjSTx4bsyRWjYQ2tTwb+9EvM4
        qrQ+Q/Esm9t0IfjXZ8jUulx61g==
X-Google-Smtp-Source: AK7set/vSQlRu82Czuk12ElmMiD/0af+VwTO3KMyjJOjl9VfNhfnYkq0M4g5zeFFPauB5KWKj9oZYg==
X-Received: by 2002:a17:907:31c1:b0:92d:6078:3878 with SMTP id xf1-20020a17090731c100b0092d60783878mr2427954ejb.33.1678811493961;
        Tue, 14 Mar 2023 09:31:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id 18-20020a508e12000000b004fa380a14e7sm1281024edw.77.2023.03.14.09.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 09:31:33 -0700 (PDT)
Message-ID: <5092a0b0-6a31-f984-e28c-ca11bafef6bb@linaro.org>
Date:   Tue, 14 Mar 2023 17:31:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
 <4ee5e059-6e9f-0804-30ec-ff073f436780@xs4all.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4ee5e059-6e9f-0804-30ec-ff073f436780@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 13/03/2023 12:46, Hans Verkuil wrote:
> On 12/03/2023 14:12, Krzysztof Kozlowski wrote:
>> The driver can match only via the DT table so the table should be always
>> used and the of_match_ptr does not have any sense (this also allows ACPI
>> matching via PRP0001, even though it might not be relevant here).
>>
>>   drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> I assume you want to take this series, but if you prefer to have us do it, then
> just let me know.

I prefer if you to take it. Please grab it! :)

Best regards,
Krzysztof

