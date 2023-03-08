Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18133C678D5
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Mar 2023 13:20:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbjCHNUa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Mar 2023 08:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbjCHNUD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Mar 2023 08:20:03 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A27526CCA
        for <linux-tegra@vger.kernel.org>; Wed,  8 Mar 2023 05:16:19 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id cy23so65427546edb.12
        for <linux-tegra@vger.kernel.org>; Wed, 08 Mar 2023 05:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678281377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKhRGeYiMtrIvPOSKbF8ADn+p/h16wF2cLPgk7JaFfs=;
        b=amiD6dJli4aYlZfKmeodUpS/kJhhulzhPrE5TbdTW6VWiHCIlKegOrwADf4mYJoSWF
         c7KYDD8GtZkrwdwyZAI427dxoYmTvTD1I4YVaSzuBtLImPhLyu1pzNy7Ki859i1xCQ/A
         SmwRKL1Yr2a5HJltg3uN1l7bMp0jCEJ1ZkWXLXC366B3yXgk6C/gGERp9xB/ywXfx4dL
         sahVZuJsdjtHhuTbv8pjZXWZkwuKdC3cXLTgq0k5yy3SAQOGxD842JGCvNHBHJJFqFhW
         /0l/zvgdbLLpxomHMXlNmAsckYUUOeGkiDIhZNH5OhfNlJ3ZS2ui0/Wlsg0e9j5HTDYe
         vyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678281377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKhRGeYiMtrIvPOSKbF8ADn+p/h16wF2cLPgk7JaFfs=;
        b=AnFxb3wssLKjogFwxmoOuQOyPeqnJWgBFMGGdIQWY7jFeJnCGMc57UuH9vUvJGoChT
         /GehNhxtRyC4rdSOAjpq4AqDx6sTZYNZjjFYDvlJzsluyoutO7F4XniDKFNaPmHxKTBC
         RGQCvnyOAdsIPkTP0HPbbAiL1+pfvsQxCVJNZ5pGovFHtV/7NlamhDRXxeSChGsAHhJ/
         RZUKSOHetq93mqkHvVECRwJlZENrEJjoyXZ55fKWJbO0LOkLUOgRyKX5YPr44F/nEte2
         MIyjFqSzpIzmad1ERsxYnvPe+AcPc8i+eGyria3Rk/FvHM2+bW77GSIatpQudlZ+ytld
         Lf4g==
X-Gm-Message-State: AO0yUKVOmtjgV+tKiKwN+NFDYXTOvwUB5w9yw477ugEq5neorx+uJyH3
        eVf9cbK30/paMIPOkNa+uqfYBA==
X-Google-Smtp-Source: AK7set/BUttjKBT8na2FT9FF3nX1prnTe9lS4QdGM6JI3QDa3XnMPbcI/tclVrs4UbqWYDdCogXtvw==
X-Received: by 2002:a17:907:c24:b0:8aa:bf48:aae1 with SMTP id ga36-20020a1709070c2400b008aabf48aae1mr24948653ejc.6.1678281377265;
        Wed, 08 Mar 2023 05:16:17 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id ca5-20020a170906a3c500b008bc2c2134c5sm7481072ejb.216.2023.03.08.05.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 05:16:16 -0800 (PST)
Message-ID: <4404869f-5e5f-e53b-f370-357d4055cb47@linaro.org>
Date:   Wed, 8 Mar 2023 14:16:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: tegra234
Content-Language: en-US
To:     Prathamesh Shete <pshete@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     smangipudi@nvidia.com
References: <20230308114432.27133-1-pshete@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308114432.27133-1-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 08/03/2023 12:44, Prathamesh Shete wrote:
> Add DT binding doc for Tegra234 pinmux driver.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  .../pinctrl/nvidia,tegra234-pinmux.yaml       | 232 ++++++++++++++++++
>  1 file changed, 232 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
> 

I don't see my concerns addressed. You replied to me today, I gave you
response and then (or shortly before) you sent v2.

That's not how it works.

Address the concerns.

Best regards,
Krzysztof

