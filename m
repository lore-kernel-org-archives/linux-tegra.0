Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1349C61DA4
	for <linux-tegra@archiver.kernel.org>; Mon,  6 Mar 2023 15:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbjCFPqM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 6 Mar 2023 10:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbjCFPqK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Mar 2023 10:46:10 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A79E367DF
        for <linux-tegra@vger.kernel.org>; Mon,  6 Mar 2023 07:45:36 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id cw28so40454823edb.5
        for <linux-tegra@vger.kernel.org>; Mon, 06 Mar 2023 07:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678117533;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WrfA7cGIcNNdeqNajhEP8dKzmgloaq6OtPDo7wgZVaI=;
        b=bW7x/xPS+G9jqqhtHpGcDCEkI/ezYVZZm3Vkgo7nYCAh+tBhalRJHADE5pCN3lRtLv
         BsTZpwR4qppxxTrZ8n/IsoK4iuP9bflkbr0eP5oLlA6WWVjgps535dlgXwwPufIF8zaw
         JIDcImVuDCBYwazn/gn84Yw9D8cNbxuJKeP1szawzvweKd7Xoh3y91YWylII7sta+D9/
         H5nnjbGi9JpjBTmRyZxngm1t47kTw+ys3/XR5XHkWfuLdJZrOIZMZ0Fn5VR+lS24mp7v
         WZBi3OgLea9GKlznbXAoy+E4QskDT4Pto2OFmvU26YHDIhgQKWalGlsCqHq+7C5UIQtH
         QgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678117533;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WrfA7cGIcNNdeqNajhEP8dKzmgloaq6OtPDo7wgZVaI=;
        b=mUgvTnA2XI9Tr+trhz+IwjMjj2ToVwgKMmXd3M6DTyjo6f8BYg17fY3C++FQTK+0IL
         mw/q7Hx3uYsg9Ip7+yw0JTvxH1P/jdgnDkfNY5b5u/eGSm69oKi64QiicMzhmdibJ+Zm
         pJOYO3YATAOUSM9Gb9NuT8Q/X7ON57jJpqBDqtVAKxMhcPbzC+jw2H73kpVbF3gRd8Xw
         vjGn/295fhL4JWp/Cl1tlXAybggQt4y8/deuCzvkj+KJIXIwcBXnKXi9+yBExcKqz4oF
         NnAnRhtmPUgrYeF9iLmcnUsM6p+QosN7xhizBTnDJ23+T/MEalZO/cXJi0tfSuXY7RNO
         SMvA==
X-Gm-Message-State: AO0yUKW1Hi2OzLkscK3epptzRFUD2aLp/8iF5KiqpuM998NWcfXYEN4M
        60hB+4J4CiSD5vli0/Q2NefFng==
X-Google-Smtp-Source: AK7set/a2B5e0ljGelJHCwhPgnWdbKU/pwrgWd0NMnsDxrI2L46OW4FT8atm+KqG87eYloJI78knXA==
X-Received: by 2002:a17:906:4783:b0:8b1:fc:d737 with SMTP id cw3-20020a170906478300b008b100fcd737mr16748722ejc.19.1678117533148;
        Mon, 06 Mar 2023 07:45:33 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:c1e7:5006:98ac:f57? ([2a02:810d:15c0:828:c1e7:5006:98ac:f57])
        by smtp.gmail.com with ESMTPSA id p14-20020a170906a00e00b008b1b644c9fbsm4719705ejy.103.2023.03.06.07.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 07:45:32 -0800 (PST)
Message-ID: <acc27e8f-73ce-39ee-3666-461f5c72d39d@linaro.org>
Date:   Mon, 6 Mar 2023 16:45:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/27] memory: tegra: remove MODULE_LICENSE in non-modules
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Nick Alcock <nick.alcock@oracle.com>, mcgrof@kernel.org
Cc:     linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20230224150811.80316-1-nick.alcock@oracle.com>
 <20230224150811.80316-16-nick.alcock@oracle.com>
 <c6f39365-e840-d782-8ec0-e34ec3681b98@linaro.org>
In-Reply-To: <c6f39365-e840-d782-8ec0-e34ec3681b98@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 06/03/2023 15:30, Krzysztof Kozlowski wrote:
> On 24/02/2023 16:07, Nick Alcock wrote:
>> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
>> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
>> are used to identify modules. As a consequence, uses of the macro
>> in non-modules will cause modprobe to misidentify their containing
>> object file as a module when it is not (false positives), and modprobe
>> might succeed rather than failing with a suitable error message.
>>
>> So remove it in the files in this commit, none of which can be built as
>> modules.
>>
> 
> Applied as well. Squashed with next one. Same subject messes with b4, so
> prefix should be corrected if these were to stay as separate patches.
>

And all dropped. Run checkpatch before sending patches.

Best regards,
Krzysztof

