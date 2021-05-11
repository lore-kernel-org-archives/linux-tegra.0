Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06427C433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 18:36:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACDBA6186A
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 18:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbhEKShV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 14:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhEKShV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 14:37:21 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966F3C061574;
        Tue, 11 May 2021 11:36:12 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id t11so29992399lfl.11;
        Tue, 11 May 2021 11:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gwp5GrMLJNGrq/8G5vfZaiCADpEon9ModgzTBM7EDWE=;
        b=RDXSEPORa0gq10UUn+Jdp12ZwcR7RsAjS+87bbZ1NXeRcfg8KA/AhVU4VwOiq6EVIL
         O5y5Lo/tm2tOlF3S6kXvQgEHx3ck8M3Qt3Z4DYhv8+xB32ysZ/4IHXvvQXZqK/XFllU2
         q3ttqtHvpIn7DrESpU6CsVMMkjDN58nQNRon9dQENtWMHe7WsFYZOzgK1xy8GCWq/Zy5
         84jIepghxdmD2eYrrEAoJwVi1W3NXnP/jMgyGfkHCtMdLiysfnPxmDiSKWEALnDbcuWY
         CjpjdFW0NdasH0qyjQVo0+j3mS1rl+oRvlRTgSJJKkksH49TQysmaaVq4IdnvZP/k7kp
         H0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gwp5GrMLJNGrq/8G5vfZaiCADpEon9ModgzTBM7EDWE=;
        b=f6Jz44K5U01MbgrRcwSf0LP+1jZ9ermsCW2TA6EzkJjQctwES0rNHpbySiJ3AmmOKW
         t1hQ6CD7hVtrY7GVuc+VwxHjYUbQMqpx4JxqF2NdKxyztIFeP8RFuupQNPqef9J9Tjah
         wHLsCeZon7dosSMKK9pwra7yIl1P7uYu0m5Y9SdHFVSfxt+lqUc/16241sSZANIDRGE7
         4rK61OrIMAKrtzU6XKLSshrSjhPSQk9OBjnTBvdfal5ARRQNQlo0/08qcf1gS2142V01
         AOzF6eHHEpELjCRAe026FwLRiPL5Gu0IKiGTteluLxJ98kG8RWy5qO/13/2elGJexebs
         ASLg==
X-Gm-Message-State: AOAM5325pi8K/j4q6IU7G5DFOFkezMLifTft3Ro6UL/AEh3eqxKq+Wye
        z2ky0S4irzVoQQHjgDOD7+0OD0JlI7A=
X-Google-Smtp-Source: ABdhPJwQcmNpbCm2w8w4L7kkGSor24M29XEE5wWRsxakI/+6+fy5q5erqbGBfL4430iGiUcuWY3aPQ==
X-Received: by 2002:ac2:4ed9:: with SMTP id p25mr21336596lfr.576.1620758170970;
        Tue, 11 May 2021 11:36:10 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id v12sm3800834ljn.92.2021.05.11.11.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 11:36:10 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] memory: tegra: Enable compile testing for all
 drivers
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        kernel test robot <lkp@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210510213729.7095-3-digetx@gmail.com>
 <202105112125.VctfC6sX-lkp@intel.com>
 <dd0b550e-76a0-bfbc-9d6f-5d867812046d@gmail.com>
 <06addbf3-0090-b76f-65cf-e0c10d284c69@canonical.com>
 <3ab5d50b-4955-7144-5d1d-d44cb0892d65@gmail.com>
 <YJrARxhVD7QM/GPv@archlinux-ax161>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ca2be6d1-5bb4-b44d-f306-cdf1dd369a39@gmail.com>
Date:   Tue, 11 May 2021 21:36:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJrARxhVD7QM/GPv@archlinux-ax161>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.05.2021 20:35, Nathan Chancellor пишет:
> On Tue, May 11, 2021 at 07:00:34PM +0300, Dmitry Osipenko wrote:
>> 11.05.2021 18:31, Krzysztof Kozlowski пишет:
>> ...
>>                                       ~~~~~~~~~~~~~~~~~~~~~^
>>>>>>> drivers/memory/tegra/tegra124-emc.c:802:26: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744071562067985 to 2147483665 [-Wconstant-conversion]
>>>>>                    emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV0, EMC_ZQ_CAL);
>>>>>                    ~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~~~~~~~~~
>>>>>    drivers/memory/tegra/tegra124-emc.c:154:36: note: expanded from macro 'EMC_ZQ_CAL_LONG_CMD_DEV0'
>>>>>            (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
>>>>>             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
>>>>>    13 warnings generated.
>>>>
>>>> This doesn't look like a useful warning from clang, it should see that
>>>> the constant value itself isn't truncated, hence it should be a problem
>>>> of clang. Do you think it's okay to ignore this nonsense?
>>>
>>> I admit I also do not see the real issue here. The DRAM_DEV_SEL_0 fits
>>> in u32 and there is no other bitwise arithmetic than just OR, so why
>>> clang assumes it can have 32 most signifcant bits toggled on?
>>>
>>> +Cc Nathan and Nick,
>>> Maybe you could shed some light here on this warning?
>>>
>>> Dmitry,
>>> In general you should not ignore it because:
>>> 1. This breaks allyesconfig with clang on powerpc (or it is one of the
>>> stoppers),
>>> 2. We might want in some future to build it with clang.
>>
>> I meant to ignore it from the perspective of the memory drivers, i.e. it
>> likely should be fixed in clang and not worked around in the code. Thank
>> you for pinging the right people.
> 
> I do not think this is a bug in clang, gcc warns the same (just not here
> in this case): https://godbolt.org/z/e9GWobMnd
> 
> DRAM_DEV_SEL_0 and DRAM_DEV_SEL_1 are implicitly signed integers because
> there is no suffix on the literal 1. DRAM_DEV_SEL_0 is 2 << 30, which
> can be turned into 1 << 31. That is equal to INT_MAX + 1, which then
> overflows and becomes INT_MIN (undefined behavior). INT_MIN is then
> promoted to unsigned long because EMC_ZQ_CAL_LONG and EMC_ZQ_CAL_CMD are
> unsigned long due to the BIT macro, resulting in the gigantic number
> that clang reports above.
> 
> I assume that this driver only runs on hardware where unsigned int is
> the same size as unsigned long, meaning this problem is merely
> theoretical?

Yes and no. The driver is built only for ARM32 today, but it's also
usable on ARM64, we just never got around to enable it for the 64bit
Tegra132 SoC.

> Regardless, defining DRAM_DEV_SEL_{0,1} with the BIT macro fixes the
> warning for me and should make everything work as expected.
> 
> diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
> index 5699d909abc2..a21ca8e0841a 100644
> --- a/drivers/memory/tegra/tegra124-emc.c
> +++ b/drivers/memory/tegra/tegra124-emc.c
> @@ -272,8 +272,8 @@
>  #define EMC_PUTERM_ADJ				0x574
>  
>  #define DRAM_DEV_SEL_ALL			0
> -#define DRAM_DEV_SEL_0				(2 << 30)
> -#define DRAM_DEV_SEL_1				(1 << 30)
> +#define DRAM_DEV_SEL_0				BIT(31)
> +#define DRAM_DEV_SEL_1				BIT(30)
>  
>  #define EMC_CFG_POWER_FEATURES_MASK		\
>  	(EMC_CFG_DYN_SREF | EMC_CFG_DRAM_ACPD | EMC_CFG_DRAM_CLKSTOP_SR | \
> 

Thank you for the clarification. So it's actually the code which needs
to be fixed.

The DRAM_DEV_SEL is a enum, hence I'll add patch in v2 that will make
the values unsigned.
