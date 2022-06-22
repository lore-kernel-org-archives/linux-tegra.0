Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7313C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Jun 2022 08:41:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353035AbiFVIle (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Jun 2022 04:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355353AbiFVIlc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Jun 2022 04:41:32 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0396738BE2
        for <linux-tegra@vger.kernel.org>; Wed, 22 Jun 2022 01:41:31 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id q9so22324531wrd.8
        for <linux-tegra@vger.kernel.org>; Wed, 22 Jun 2022 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sz6VlNHiVjHixKsssl+TJXLUZqbxz+oP9ZVl9b0X04Q=;
        b=zI2iX2goiGZ0Gj7PoNgF/dAyAFJPQV7L/o29pytA7SjhrmeMSqjizHh9LM7RA3nLpL
         phtstWK4Oide9ApB3GfvIL1BjbjBb5QFYOe003kH4eGPP3ey8gmLgO64/tp4OhFnuEbF
         yHWLYcwWDFgNg3VWdRH0e7MMFQzrjGNaGHS4lZt754GjBg7TK7Y6JgjsQ6YfZ61G08KB
         gyrveMFT9VKbbqvhzlr3LuqmUqvUuQ76g0HidfhCn5r4nz5BGR6iQO4lUQ7lwDXQlh+B
         bAo7bi8LH9Bbin0bi6s4MMtMeykr+R3L245W1VXlBDdHzR2C/Igp0ZApE+VdhHXUHWKt
         /9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sz6VlNHiVjHixKsssl+TJXLUZqbxz+oP9ZVl9b0X04Q=;
        b=NlJ5RQ4HCM1AiZljxbU5LWsp7UlR1TkRdoN3OHLTsWgfWoFeq4th0n+64U/KRRC5bA
         MuTKy5l19VRY1gA8JjaHoCC9N7tT04Mu/TqI0osi8qxfFdlf/Q/L7HSvsMfdNLJenKAk
         Xdtv8d90/iHZJ4WIjBNvpTafCmN3YYn/OTve1ma2Sjv03Uof2el1rvTcWTgrf3DNoHhV
         SdlcMhiWfF5LeyPBMY/NfuF0h9a9iN0CypjrcPKu0sRdTQq+TnYKpuq3rzfQ6AA2ly8/
         6rc2aFi6vxR4P8uwQjBy2WYYyZt17TSw8Y6BezInH5zDaQDwu3QKDXDmbj7TiPSvMzRC
         iwUA==
X-Gm-Message-State: AJIora8onJD9H6ushhZ5Pwfn8KLWQaxT2TbrT3Ikl9xplYNOkHmLq/DC
        jiu6BdYi/Y0vIzDigWamJ/eLjg==
X-Google-Smtp-Source: AGRyM1vN/2Yn5VoH1r/7PIIbeU5gLOIa16fFrvWUQSeTlBzbJrJqfD1H73MWRPrmSyRCWvuLBq1gaQ==
X-Received: by 2002:a5d:5231:0:b0:21b:838e:65ba with SMTP id i17-20020a5d5231000000b0021b838e65bamr2099102wra.412.1655887289619;
        Wed, 22 Jun 2022 01:41:29 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a17-20020adffad1000000b0021b8749728dsm12525434wrs.73.2022.06.22.01.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 01:41:29 -0700 (PDT)
Message-ID: <2f3e843e-b72b-ee71-7465-b2b6c8d51b0d@linaro.org>
Date:   Wed, 22 Jun 2022 10:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] memory/tegra: Add missing of_node_get() in
 tegra_emc_find_node_by_ram_code
Content-Language: en-US
To:     Liang He <windhl@126.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20220622042824.4094625-1-windhl@126.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622042824.4094625-1-windhl@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22/06/2022 06:28, Liang He wrote:
> of_find_node_by_name() will decrease the refcount of its first arg and
> we need to add a of_node_put() to keep refcount balance.
> 
> Besides, during the 'for' loop execution, the refcount of 'np' will be
> automatically increased and decreased. There is no need to call
> of_node_put() again.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

The patch was not even compiled... I consider it harmful approach. NAK.
See: https://lwn.net/Articles/854645/

Best regards,
Krzysztof
