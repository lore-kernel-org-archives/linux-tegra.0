Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB50C6FD1C
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Mar 2023 16:33:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbjCNQdT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Mar 2023 12:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjCNQdE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Mar 2023 12:33:04 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10F8A2F0D
        for <linux-tegra@vger.kernel.org>; Tue, 14 Mar 2023 09:32:48 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id x13so17099212edd.1
        for <linux-tegra@vger.kernel.org>; Tue, 14 Mar 2023 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678811567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZMmUYtKJ8wmH3Y0b7DE4LXgBhnyqMdRf+GRKEQEn4c=;
        b=HOMoHJbvrS91PZJdsSoMVF4wEKhsJzukL0cbjFvfv9908EoWA62ipm8dzNSPoyH2Ha
         7OrEZpotzbre+nBpyPdyCuM1aR627eF/GX/nRY34d9dg7fNOraC8g8rZ62ciV9E0hR8V
         3Y+INXEIbwCT8XLueIXSFY2B6uLFjwOHG7cb+vpszvgBJ8GHEy/28Ic8maoK3PKBHVM9
         fRqEFDoV4KXJPzGJVeUJWwCV2m6Ea2UK+eEQksGSdmaedxi7sxEBkXLx9uGM7ZPzKnWY
         G09Xgt268QjmkKJ8+FXqyp0Z7H5o5pmGIIV/JtvItiyFAVHe5RytDR3FtLM7nk8CmKeL
         5/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678811567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZMmUYtKJ8wmH3Y0b7DE4LXgBhnyqMdRf+GRKEQEn4c=;
        b=2Z75QVoX/QoYzHJZjER+UlCcDgbhHSiyHDxW6Sg8x3iUiSi02n75TSBxXLWub8cJIw
         TfIrHSQBDwxTovl2BRwcTVpIEAU3AK/YjlNm+x6684/FugZibd5oE8bd8JXe80g/juYK
         MaqdrffD8cLICzhpWhIBaHLmRdhezgzzmXf8HcjgcWvKtZwZwVIywt6y534OiUyBp5vn
         k9sUZg7HUag62e7h/WehZY6y91Zk8NJlz3kXmeKLuWjANa+yTcy97ipyuQiycm7YWGQu
         rRhOt6egdVhTObQywdkhNR+vEfVp84PCuSl3bks6xS4572+Yeg7AsXx+6WaUPrFd5CF9
         IqPA==
X-Gm-Message-State: AO0yUKXPknoo3qN2uP8vrahGEAAYRJ+kKqwaz02yXqHBh+/kwbu+2ME6
        3tKihNUKqUguwOobdlDcDdec9w==
X-Google-Smtp-Source: AK7set+myyCkcdJ6jQlFEHkzUZ2F1WAxX5BcejY0gf0Rd4/49aK9Lc6ALEebeykXKuMeNvyqb5FwSA==
X-Received: by 2002:a05:6402:74e:b0:4fd:23c9:11ed with SMTP id p14-20020a056402074e00b004fd23c911edmr5057745edy.17.1678811567132;
        Tue, 14 Mar 2023 09:32:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id cd3-20020a170906b34300b00921357fb28csm1341977ejb.123.2023.03.14.09.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 09:32:46 -0700 (PDT)
Message-ID: <bafa692c-f3a3-d317-278d-2dd3b5ff8af3@linaro.org>
Date:   Tue, 14 Mar 2023 17:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Joe Tessler <jrt@google.com>,
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
 <b83d6b81-c4ec-4fb8-b626-84af80d1c4a3@roeck-us.net>
 <74ae8afe-c537-1714-77ec-8a80d8ddad69@xs4all.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <74ae8afe-c537-1714-77ec-8a80d8ddad69@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 14/03/2023 09:34, Hans Verkuil wrote:
> On 13/03/2023 23:01, Guenter Roeck wrote:
>> On Sun, Mar 12, 2023 at 02:12:51PM +0100, Krzysztof Kozlowski wrote:
>>> The driver can match only via the DT table so the table should be always
>>> used and the of_match_ptr does not have any sense (this also allows ACPI
>>> matching via PRP0001, even though it might not be relevant here).
>>>
>>>   drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> FWIW: There is also
>> https://patches.linaro.org/project/linux-media/patch/20230215214724.3798917-1-linux@roeck-us.net/
> 
> I superseded that patch in patchwork in favor of this patch since this is part of
> a larger series.

I am personally fan of FIFO, so Guenter's patch should go in.

> 
> Krzysztof, please let me know if you will take this series yourself or want me to
> make a PR for it.

I prefer if you take entire patchset.


Best regards,
Krzysztof

