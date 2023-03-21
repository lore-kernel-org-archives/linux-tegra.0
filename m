Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411FCC7618D
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Mar 2023 08:21:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbjCUIVw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Mar 2023 04:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbjCUIVj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Mar 2023 04:21:39 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFE52E82D
        for <linux-tegra@vger.kernel.org>; Tue, 21 Mar 2023 01:21:26 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id eh3so56368372edb.11
        for <linux-tegra@vger.kernel.org>; Tue, 21 Mar 2023 01:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679386885;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4gU5Ul5Pqtj2Zu4ilRhyv356GMLxKXORyaaNIGSfEx4=;
        b=KCVpYwy5GslZcg2w/pnsd8XD8fl9oI4gTI7eu3h/7VXuqpW8TQdXNDAK+sPofcAMdl
         ycbY9Xr/ULZro8rx4v9I3OHqiWPEUuAMOvfc2ZyO39n8Zrbsiky3tXod+YDFqwsXWgC3
         S34BMx+RCcIQ9vdtol3bHFe6wb5qZ+7vjw052gIrZbJob9mArZMAiHiPax3LRCNw/xgS
         jZjPnQylzihCDnVoOw4tPskB7fZD8ZKLiWh6LEyly9tD9N3Qf1s8y+TqjFVXBP2AGm9q
         mL31sS6a0lGd7StHZXAe3czDWmrdc3pwltw6CGcsCP8GUZPrcJffasoCBbGwipL5+2/s
         U3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679386885;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gU5Ul5Pqtj2Zu4ilRhyv356GMLxKXORyaaNIGSfEx4=;
        b=oWDSG1XMlAdxmW2u2fvISGZ/Zg6K/hSHeCsHXE6NgQAUUOMKJDlojQfWrqrzbEvMSQ
         INwfBCj/3eWm9l9i281Y04yEOd4Qa+bXCIHJKTWAT0n08lQEgkSSkY6eGkv/7ndAaLkl
         FGviqOMOW/921JpcMsjH7Tug9WeceJKoCna87d/PdybMxQSbiYD5KCxPRI0KqDjJbOLx
         synovGqaACVdCzyAy1wZ3cUacSz1x9pOWWA7ekxc1O026lKv1EGb32iaqtEnbaDAEpLE
         YXObBNub2dsPRu2GG5H0hCQ2E7ATe1dJh1GYk0m8Ktj75O2ykQQmYGtFXi8bKIrB+VWM
         1Wpw==
X-Gm-Message-State: AO0yUKX2+YXZzyTCpVvlVUaXx8Hzz8vmsrTcCCVpDAs1J2KoTZGWHaJQ
        /F3eQbe0OgIajZhOEf6GdMgl8A==
X-Google-Smtp-Source: AK7set+6Sf7lskRnCtVXZF0F+OgifgUKEDMmWXjnbQFKwSnk5FABspDdYivaIjgEpa8Ajasi1pfhJA==
X-Received: by 2002:a05:6402:55a:b0:4fa:ada1:796d with SMTP id i26-20020a056402055a00b004faada1796dmr2339969edx.10.1679386885235;
        Tue, 21 Mar 2023 01:21:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id s29-20020a50d49d000000b004fc2a75c6b3sm5865294edi.23.2023.03.21.01.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 01:21:24 -0700 (PDT)
Message-ID: <8b7816b0-1daa-1c49-6f9d-40769d228a39@linaro.org>
Date:   Tue, 21 Mar 2023 09:21:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 20/28] media: platform: jpeg: always reference OF data
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>, Joe Tessler <jrt@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
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
        Prabhakar <prabhakar.csengg@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-rockchip@lists.infradead.org,
        oushixiong <oushixiong@kylinos.cn>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-20-krzysztof.kozlowski@linaro.org>
 <86431868-488b-4a72-944b-231b6d0382b0@app.fastmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <86431868-488b-4a72-944b-231b6d0382b0@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/03/2023 09:11, Arnd Bergmann wrote:
> On Sun, Mar 12, 2023, at 14:13, Krzysztof Kozlowski wrote:
>> The driver can match only via the DT table so the table should be always
>> used and the of_match_ptr does not have any sense (this also allows ACPI
>> matching via PRP0001, even though it might not be relevant here).  This
>> also fixes !CONFIG_OF error:
>>
>>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1890:38: error: 
>> ‘mtk8195_jpegdec_drvdata’ defined but not used 
>> [-Werror=unused-const-variable=]
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I see now that we both submitted the same patch, but now Hans

We as you and me? I cannot find your patch on lore:
https://lore.kernel.org/all/?q=f%3Aarnd%40arndb.de

> merged a worse fix [1] without a changelog text.
> 
>     Arnd
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=4ae47770d57bff01

Uh, I can rebase my patchset.

Best regards,
Krzysztof

