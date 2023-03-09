Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16317C64EC4
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Mar 2023 06:19:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjCIGTr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Mar 2023 01:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjCIGTo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Mar 2023 01:19:44 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFEF62FDE
        for <linux-tegra@vger.kernel.org>; Wed,  8 Mar 2023 22:19:40 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id i34so2790017eda.7
        for <linux-tegra@vger.kernel.org>; Wed, 08 Mar 2023 22:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678342779;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sTSUJLkYwADUhDqJdsPSx+O0Bg0vs7LmomPrh+7nD5M=;
        b=zUNWW2NpATq4qfxVXdMtQ4RhOhtbz2rtTWM3WDoeIFhGvSz62hQRPHUnnJ7Wgrnj99
         qjNQOUEIl1w2hXHsW6OPjvMraUrfSJA5Edyi3BkPUmLdSiNE1HR9CgKRLPCHS3VJ56ur
         SFrW+XGBYJoP9rtmDjNP3VLPpKuEpwVhiEihXKSwz75GivwZns5wFsUqsc/ui9VYsrzx
         G7L8Vg2SHpzCyYiscOC43r4BdcZKhf1w7e6nfdDrXUBijv4aql6ZHCkKZLd8CJLWf1E1
         +68ybzcx2TAXMd4FSZf+pDcbL6EUnQ1ydrQ2Ou6pncjVKDdVaqO1TRvTnkSiCIQJ9Wcu
         cGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678342779;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTSUJLkYwADUhDqJdsPSx+O0Bg0vs7LmomPrh+7nD5M=;
        b=1Wo39O59b0G+OCeYG4+epphZlz44o0CiMcdw8l+JBYiK38+z0J+od0z4ID7mm2vVsK
         vDww9+Dgc2Noy0PgX1jw9/R5drV/lV81Jj+fyH7uv6TR3ThNBGOEz9j0BPmo5siB1n4k
         VGMx3wDPAJlsoQMgxo3Af5egATBGU1nkqThP3M7o7PCt4WsdyKLNiRtNVjbSv+oUtt1G
         zK5YKgf8QDPUaw0nfvkszvjUhqApo2L2Mwm/5T+5UszeFI0B5MNHpdQvwyusNI/A3hP3
         hHyqANHwOyrhCxsrS1zgDRXhycJ1t6CpfrNPPbtWzzI+TBqGHmFJRTq012J4AA2PCAUo
         nTYQ==
X-Gm-Message-State: AO0yUKX+yCMS5CWAcYDdzIUezsDIiJNIIbL9XRfDot+81ElPYWfHthMv
        IrKbjmRQp/Ha+5W+Umlc/LE1Fw==
X-Google-Smtp-Source: AK7set//dU0C0Fr1BBWmciFTYcPyUq6KoCEt2AQ2CfkYl1mZSM1YZTKYvB+dYe4GO320HryqYflVQA==
X-Received: by 2002:a05:6402:1208:b0:4ac:c81d:149e with SMTP id c8-20020a056402120800b004acc81d149emr17928538edw.40.1678342778974;
        Wed, 08 Mar 2023 22:19:38 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id w21-20020a50d795000000b004d8287c775fsm7097764edi.8.2023.03.08.22.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 22:19:38 -0800 (PST)
Message-ID: <b4e07fa9-16c3-917f-5820-8a0f2f215ea3@linaro.org>
Date:   Thu, 9 Mar 2023 07:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] memory: tegra: remove MODULE_LICENSE in non-modules
Content-Language: en-US
To:     Nick Alcock <nick.alcock@oracle.com>, lee@kernel.org
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20230308202117.426808-1-nick.alcock@oracle.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308202117.426808-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 08/03/2023 21:21, Nick Alcock wrote:
> Since commit 8b41fc4454e3 ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
> 
> So remove it in the files in this commit, none of which can be built as
> modules.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/memory/tegra/mc.c           | 1 -
>  drivers/memory/tegra/tegra186-emc.c | 1 -
>  2 files changed, 2 deletions(-)
> 
> checkpatch-clean and fused together now.

This is v2, not v1. Version the patches, always.


Best regards,
Krzysztof

