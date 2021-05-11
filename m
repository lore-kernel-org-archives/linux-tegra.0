Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577FBC433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 16:00:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19E33617ED
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 16:00:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbhEKQBo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 12:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbhEKQBn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 12:01:43 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA520C061574;
        Tue, 11 May 2021 09:00:36 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id p20so1782304ljj.8;
        Tue, 11 May 2021 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AWqrTKMIPcNBCl3MksIMFmTbGs76+AqqH4j4wDV18mo=;
        b=HewY0gL6QX8Y7+yAM2vlr5EPUoTG9cQL+XMBpt7h2wxE4c8aKD6WhiSGO+WU3A6ZnE
         p8rTd6+tgq+AKQibgdQZgLFX4GHZhdJjnMx23HGcgMeqJlbaCZOCbSqf2JlkIogF9HrQ
         mv+Cv3gYRsd7AALBqHTO1HQeBGUC9dFzXSUDqEJskRmv/j4PHowAnGEItbozeNH7HTHD
         WdcwMMrabLn2rMQ7zXOMpS0PN/Rh753hbTOhJ4Rj84kBCsO9hOg2xMKGNal3JUQ5qUPN
         2/GI0nybiDz82sii8bfMl/xjEfCu/2tSRfXrqHOGjCY8mto9KXv1wOfGuNBnLAymxmwc
         2FKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AWqrTKMIPcNBCl3MksIMFmTbGs76+AqqH4j4wDV18mo=;
        b=ddeJFDvO957APd5j9iPolaeGaUWHJIs0CI0ZPHWtz32OuHDD2Q0g61lEr5/wd7YF+r
         NsmZ1wynWH54NTLz8/atERrSByncwdb6q4TBMLjcY1VhVa0rqHQMFzsU9sQ6zuQkkxTF
         VMwitmfA6WNhdZsRRbbgzZ7fI2TYi0fazalStx0C/WQG9Kw99uyftf1jQxR38hEqMgi9
         nb1wLx3bgevU7tnqNrQKwZLbmx/INpIWcJqTwicjDSpmpRGnwXC/D/LKNF1CTrVT1G4W
         wBPTvBa4YGbzi3wW2SdAxyrp0Pee+7tFdmELIy26rPyQ6lrdagRQQnlZVakXnxugMWwA
         Svhg==
X-Gm-Message-State: AOAM532FDYPrHULXIao6CVGZGHir2WbSd3YirYB/xQ1QGf03+qjbLcpw
        e/zQuvxOoeLX8hGxUiOiIRoxJzfLXkA=
X-Google-Smtp-Source: ABdhPJy/bCq4q07DGd7y2jIeoEBSastioov4RihtWi64suwNaNxdIkFiorVZ4opRwK1cBUsNCzZ1bQ==
X-Received: by 2002:a2e:5c7:: with SMTP id 190mr24393620ljf.174.1620748835287;
        Tue, 11 May 2021 09:00:35 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id n16sm2656522lfe.245.2021.05.11.09.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 09:00:35 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] memory: tegra: Enable compile testing for all
 drivers
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        kernel test robot <lkp@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210510213729.7095-3-digetx@gmail.com>
 <202105112125.VctfC6sX-lkp@intel.com>
 <dd0b550e-76a0-bfbc-9d6f-5d867812046d@gmail.com>
 <06addbf3-0090-b76f-65cf-e0c10d284c69@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3ab5d50b-4955-7144-5d1d-d44cb0892d65@gmail.com>
Date:   Tue, 11 May 2021 19:00:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <06addbf3-0090-b76f-65cf-e0c10d284c69@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.05.2021 18:31, Krzysztof Kozlowski пишет:
...
                                      ~~~~~~~~~~~~~~~~~~~~~^
>>>>> drivers/memory/tegra/tegra124-emc.c:802:26: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744071562067985 to 2147483665 [-Wconstant-conversion]
>>>                    emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV0, EMC_ZQ_CAL);
>>>                    ~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~~~~~~~~~
>>>    drivers/memory/tegra/tegra124-emc.c:154:36: note: expanded from macro 'EMC_ZQ_CAL_LONG_CMD_DEV0'
>>>            (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
>>>             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
>>>    13 warnings generated.
>>
>> This doesn't look like a useful warning from clang, it should see that
>> the constant value itself isn't truncated, hence it should be a problem
>> of clang. Do you think it's okay to ignore this nonsense?
> 
> I admit I also do not see the real issue here. The DRAM_DEV_SEL_0 fits
> in u32 and there is no other bitwise arithmetic than just OR, so why
> clang assumes it can have 32 most signifcant bits toggled on?
> 
> +Cc Nathan and Nick,
> Maybe you could shed some light here on this warning?
> 
> Dmitry,
> In general you should not ignore it because:
> 1. This breaks allyesconfig with clang on powerpc (or it is one of the
> stoppers),
> 2. We might want in some future to build it with clang.

I meant to ignore it from the perspective of the memory drivers, i.e. it
likely should be fixed in clang and not worked around in the code. Thank
you for pinging the right people.
