Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09D1C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 22:21:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE87E61040
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 22:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231548AbhJ2WYB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Oct 2021 18:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbhJ2WYA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Oct 2021 18:24:00 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF5BC061714;
        Fri, 29 Oct 2021 15:21:31 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id s19so19020896ljj.11;
        Fri, 29 Oct 2021 15:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uQgBzdPtZlD65xEMJPhkHFz4xZIPHi/s/m5WtMLbyfU=;
        b=aH8pQOk1+Ewwd9Hkdx0eJ+2vnTMAV4RF3M9ppvDlOj+RiviyoZw9B6pRJFrywzpmeb
         WfE9b2gerdGHgTF5uPgX/UhjpKElJeFR0RYO0t/5WApZDdDNGCFKEVoZgJIWOyTjSwqi
         FtXcbHWEtKE8rLzdpin0lJgvim337Uacxx9VFp3SvKaVRePvJb3JDqJaK+plFDAjqVXt
         +xJyb20eRNDnram8a1cuoghjE8jE4Suh8URE/EFmpDjVE2bRTLQDUu8/wTEhJ6QjMNBR
         7cNbetSkz1+JzoyCIm+cVHqm+591QkolyzenxEgHjq7XXiguUn+hRYtpK+lrVRf0QMzm
         +b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uQgBzdPtZlD65xEMJPhkHFz4xZIPHi/s/m5WtMLbyfU=;
        b=wOEzLleTvJlAa6T5ivDCmeRicjdkcbzes0VqmDVd/Rqzcd+ZwWFZ6l7K9sNlHe6Ntm
         igtVjlgunZ6j7o87/ROJkgFXkQ6hZfTTEQ2YakuXjyMw4W7wYTXxbZ3tidOEld255PfO
         7EQy6qa/e9LIoqSpSeHihU/IHyZwLdU+C4oGApeTeO+xm/ITY2rB0+wmPPWAELmx0ugv
         hxUrdoFcLt0JTwYMfONfdZyUlxyzaxy4n9srZa8fvdTMpJh7ajHQnMLo0NYdSEg81/Gc
         RZAF23jJEM5uHx6P5iDvOSud9v/FO1ks22KgcBOA1V6j5u4XMzKektRo2Bx/DQlcHbv3
         NVyA==
X-Gm-Message-State: AOAM532pCpAwR31mAdNojzbOH2nm5YlBdpPnwExLUSfpJ7fQXEkA68Us
        2LIZfMMvfyCZexc+BaDzvDJJLgO2e/Q=
X-Google-Smtp-Source: ABdhPJyBm5cKbJpkIXnYlsZmpwEiRY8RUI+OZH1muxEkvbQ9UT6AFzByclkh04smgq3OZ9DXbF7Q0Q==
X-Received: by 2002:a2e:96d5:: with SMTP id d21mr14723971ljj.302.1635546089689;
        Fri, 29 Oct 2021 15:21:29 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru. [46.138.44.18])
        by smtp.googlemail.com with ESMTPSA id k21sm809677ljn.126.2021.10.29.15.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 15:21:29 -0700 (PDT)
Subject: Re: [PATCH] soc/tegra: fix unmet dependency on DMADEVICES for
 TEGRA20_APB_DMA
To:     Arnd Bergmann <arnd@arndb.de>, Julian Braha <julianbraha@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        fazilyildiran@gmail.com
References: <20211029205945.11363-1-julianbraha@gmail.com>
 <CAK8P3a2Q65mw+sXm977sxk6XWfAnhe9HQyVC62n8Hd-PERr_TA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <27e1ba98-80ef-aa89-1527-b50a9ea33436@gmail.com>
Date:   Sat, 30 Oct 2021 01:21:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2Q65mw+sXm977sxk6XWfAnhe9HQyVC62n8Hd-PERr_TA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.10.2021 01:07, Arnd Bergmann пишет:
> On Fri, Oct 29, 2021 at 10:59 PM Julian Braha <julianbraha@gmail.com> wrote:
>>
>>  drivers/soc/tegra/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
>> index 8b53ed1cc67e..ee7f631933c2 100644
>> --- a/drivers/soc/tegra/Kconfig
>> +++ b/drivers/soc/tegra/Kconfig
>> @@ -136,7 +136,7 @@ config SOC_TEGRA_FUSE
>>         def_bool y
>>         depends on ARCH_TEGRA
>>         select SOC_BUS
>> -       select TEGRA20_APB_DMA if ARCH_TEGRA_2x_SOC
>> +       select TEGRA20_APB_DMA if DMADEVICES && ARCH_TEGRA_2x_SOC
>>
> 
> Is this actually a compile-time dependency? If the fuse driver merely
> uses DMA and assumes that the TEGRA20_APB_DMA driver is the one
> providing this functionality, the 'select' should be removed here.

There was a patch that did it already [1], not sure what happened to it.

[1] https://lore.kernel.org/all/20200923003421.4561-1-digetx@gmail.com/
