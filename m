Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE19C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 00:15:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC03764F8F
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 00:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCQAPK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Mar 2021 20:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhCQAOr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Mar 2021 20:14:47 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 526B7C06174A;
        Tue, 16 Mar 2021 17:14:36 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t18so301795lfl.3;
        Tue, 16 Mar 2021 17:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Se+k86qVq28AGxozo9NP0RKLSb8RZQ9UE/ENvuehTHc=;
        b=vDmUXEiObHe8Wx7S8hXtFQWsdgrM/9R86oeFX7Plt+/BgzRV0XauNamnyTQ4TKDz96
         jyiFcujN6A8rkonhxtHg9vSU8iRCj/2HoyOvDV0Vm6C8HyVg8F9aM49F8heixdGaExzT
         beTUCApIheUADYHq0pUjfzbkVT/GeZ/uxgiY7zRX3/YxhJRXzu/WQvOoTE/sxcdvnjyi
         va/7D/j15v01tEbVERXAMKPI0TZv8gRW3IfS9D+NoeFX64RLh73GZOxHEQ6BWMFxoR8P
         1FjsSS9d1jKt6itBUN1p6ideDNbbP3h8snht+k/MpW4XAkZ27IPJuX0C67Oilj4tkkVW
         9/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Se+k86qVq28AGxozo9NP0RKLSb8RZQ9UE/ENvuehTHc=;
        b=S1Cm5k6BpG5Kre5e3FvjQfdDrmBk2FJO3pm6tZqj+C1Jd5vamQniKVFlMGmDn5OskU
         KtLh47L79N7yBDVed906CqZp1U9hk+Q7oquKr+fEq54BBM9vzCsoxBY+OsIr5hEeNKcd
         +oVVCL5jl9rODSPknJ4sDi1oXiIJ+f7TNOBsPmytmO6p6Ru3TUSUDlFvAyeTRqeRMKOA
         3LVyyFkk8IJIDayYq/Hf+ZQ7D4d++Uc8NwI0vceNdj/EaSrPFEAeTEoKI9ah/JapHR0A
         tsrub5FdqFTQoJKRydfEAONSAN0ZN1HxQCONXvzPtiEQCbVEAY7DC10E+7uBa4pWPbHn
         oZRw==
X-Gm-Message-State: AOAM532jo4kF3zIdMEctLFT/8b9FbIkqh6kv5eQmy2HLtlU3pmAcnMn8
        1pis+gLI3jS9jdgOdfv4uHY=
X-Google-Smtp-Source: ABdhPJwX67dIPjJqXDGkeuX8J2ZBS9z/STB8L5aJgJXsuz2EfaJ5A6ssXVAI7JfM6DGDpqvKlBsP6g==
X-Received: by 2002:a05:6512:1051:: with SMTP id c17mr711959lfb.418.1615940074789;
        Tue, 16 Mar 2021 17:14:34 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id x4sm3325644ljj.91.2021.03.16.17.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 17:14:34 -0700 (PDT)
Subject: Re: [PATCH] MIPS: ralink: define stubs for clk_set_parent to fix
 compile testing
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, balbi@kernel.org,
        linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
 <20210316215820.GA18064@alpha.franken.de>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9448ab97-44de-b19f-1a3b-f6c38113f415@gmail.com>
Date:   Wed, 17 Mar 2021 03:14:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316215820.GA18064@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.03.2021 00:58, Thomas Bogendoerfer пишет:
> On Tue, Mar 16, 2021 at 06:57:25PM +0100, Krzysztof Kozlowski wrote:
>> The Ralink MIPS platform does not use Common Clock Framework and does
>> not define certain clock operations leading to compile test failures:
>>
>>     /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
>>     phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
> 
> hmm, why not make it use common clock framework ? And shouldn't 
> include/linux/clk.h provide what you need, if CONFIG_HAVE_CLK is not set ?

That should increase kernel size by a couple kbytes. If size isn't
important, then somebody should dedicate time and energy on creating the
patches.
