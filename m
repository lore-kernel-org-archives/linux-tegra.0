Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C67C6FD1D
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Apr 2023 08:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbjDGIxE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Apr 2023 04:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239663AbjDGIxC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Apr 2023 04:53:02 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE562688
        for <linux-tegra@vger.kernel.org>; Fri,  7 Apr 2023 01:53:01 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id 18so7015712ejo.13
        for <linux-tegra@vger.kernel.org>; Fri, 07 Apr 2023 01:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680857579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlHWtlABj8qjvp5ESnXWBoVofX8daVWy+IDWAsL03bY=;
        b=ia0bi7tbGYmCoZN1df9IYpjDKCeq8SPvEQyKE/xUtm+yOWJS+V1pb0SOji5K3cBcaj
         8cuakjt68IModKox6lDFqyHJst/92x7iV2ZjVXsqATmlmQmqW7Voy+jkwmSHrimk1IfI
         xUdwWN8nnSFXiU3ALSpo31fYtdlDx32tqzX+KrtKtgMpBysQD6vDlkTxz9NHG5mtWHu/
         xuI5fjDy3xwdn46qSzFcrK5BkkRob5ciKQBxIEHV1LUaSFqQ93hQRMjo0eZPCyVAheUk
         CidUQpFX7v2QN52KuI67K+HJjkXhpeb/kOgitgfCX4pwj0dX/QCWhE0r+zXZnZNHbMJ5
         m5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680857579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlHWtlABj8qjvp5ESnXWBoVofX8daVWy+IDWAsL03bY=;
        b=ZI0iLsz8XdWjTb6hA5VNi6tLKXdNeFrC4hIbT6iwxCRMXgypuK79htHqwFXU4SXxxv
         Sgnmn3bkeHFzYBkMi7ZSnTeg8hfokhbBqWlslrpis/tO4SuDeeaHlzfq94kbhQTpkBQt
         oV5ua/OJVukCuLgLKK0FpqhjlwVAKFa19BEenW8EQI+YFEGoi4UNysOWGZj6X+OONQfG
         fIgVh+dpR/uqMfqTN4LbqkqhxWX3KzZYLdVr3ik3Hp9LZxi+pgGhnNi/8lGMr/wc/8PI
         caOZYzbNtgKqBiuzkXZunnOuXC2wNlCorU8enLJlukEEFc+6ejVg7UlDwrlLUSiVD2fJ
         LwwA==
X-Gm-Message-State: AAQBX9eurmS6DwKi/L3AlRcGo/tGOHVYlIvoteGFT84WEHF1Ff0iddDK
        xQtFKWU6EYAC2jWOTufvhoyFders2ei8KwZvD14=
X-Google-Smtp-Source: AKy350bAQnGAWfdFGFapIr547rM6c0h1WffL1ip7X2v6HtQLEMwThzXIQlEhVE4EIZq84rRuMGzhww==
X-Received: by 2002:a17:906:4a92:b0:8b1:2bde:5c70 with SMTP id x18-20020a1709064a9200b008b12bde5c70mr1595023eju.2.1680857579641;
        Fri, 07 Apr 2023 01:52:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:14a3:366:3172:3c37? ([2a02:810d:15c0:828:14a3:366:3172:3c37])
        by smtp.gmail.com with ESMTPSA id wg11-20020a17090705cb00b0093a0e5977e2sm1811378ejb.225.2023.04.07.01.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 01:52:59 -0700 (PDT)
Message-ID: <4129f3d5-1df8-a767-6783-1d7123b2e9d4@linaro.org>
Date:   Fri, 7 Apr 2023 10:52:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/4] dt-bindings: Document additional Jetson Orin NX SKUs
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230331163159.17145-1-thierry.reding@gmail.com>
 <3a8724bc-fb44-0080-fd24-c04e3841385e@linaro.org> <ZCwAnBbeYVVUMti8@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZCwAnBbeYVVUMti8@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 04/04/2023 12:49, Thierry Reding wrote:
> On Fri, Mar 31, 2023 at 10:19:00PM +0200, Krzysztof Kozlowski wrote:
>> On 31/03/2023 18:31, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Beyond the original 16 GiB SKU (0), additional SKUs exist, such as the 8
>>> GiB SKU (1) and an internal-only SKU (2) that comes with an equipeed SD
>>
>> typo: equipped
>>
>>> card slot.
>>
>> Is there a point in documenting all of them if there is no DTS? Also,
>> size of storage (eMMC?) pretty often is runtime-detectable, so you do no
>> need a new DTS and new compatible.
> 
> This is for the sake of completeness since these compatible strings
> correspond to the part numbers that will show up on stickers on these
> modules. In practice, yes, most of the differences will be runtime-
> detected and the DT updated to reflect the SKU differences by UEFI.

Just because there is some sticker, it does not mean we need a
compatible. We actually omit dozen of versions per device - all PMICs,
I2C IIO and others have some packaging bins and revision numbers.

Although here if I understand correctly, UEFI firmware will add these
compatibles?

> 
> As far as I know, UEFI doesn't actually do anything with the compatible
> strings themselves, but that's potentially something that could happen
> at some point. The SKU numbers also show up in EEPROMs, so I think
> having one place where these are documented might be helpful to people.

Just like bins, revision numbers etc, the DT would be overwhelmed if we
decided to document all this just because it exists somewhere.

> 
> The 16 GiB in this case is actually DRAM, but it's also detected at
> runtime. 

Which in many cases is filled by bootloader (/memory node) and we do not
create any new compatibles.

> We don't actually plan on upstreaming DTS files for all of
> these, since we don't expect all SKUs to be widely used (the internal
> one, for example) so we should be able to cover pretty much all variants
> with just two DTS files.

That's one  more argument of not having these compatibles at all.

Best regards,
Krzysztof

