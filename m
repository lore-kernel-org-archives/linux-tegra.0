Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28624C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 16:15:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB76C65104
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 16:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238522AbhCPQPA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Mar 2021 12:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238519AbhCPQOs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Mar 2021 12:14:48 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E787C06174A;
        Tue, 16 Mar 2021 09:14:48 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id z25so21224752lja.3;
        Tue, 16 Mar 2021 09:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ffXjTSgljOU0Rufckg2oTsu/vt6+DTnxV1QJabnSz6E=;
        b=k6ZCXH7AzmAKBm+DwMg1r67rkNqjojJnPC/SYDXV6se0bi8R7AA0ctoEE0Lal+EJrB
         i94vGkudzqEQQ/01pPVj20dnf0fnWKJvEU5aRn9RD2ikj7xDBqF9v5hAtoI6FRkCcinE
         FHX3kzwsSMVg9jqkQGP58f55VnnsvCqmKOdw20vlPp9eHlnftW4a6hP+alOzFwpNOAnR
         OJVQX87K5BqY6WJjrsHd6uT5J2WKNAuZh4QJGNBClooH7RRVdeRhckT5o6U3zFRAdk91
         HUWYHJzeAKQZjJd4ZwEOjozyx7vqWl6KXexqyXWzvVwDqk8cU3HchYkSgDJD2UGL2kR7
         vBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ffXjTSgljOU0Rufckg2oTsu/vt6+DTnxV1QJabnSz6E=;
        b=TfHrYRm+O/YAYuEiQ6zoh0kWioMbNkjjetk4f0fbHH7kbV05C0TXgKI7BKrxLIV0sL
         W15iV5ZIGyWiH5kaLyeySU67KSZhczZmUxDv8oeXPVdcqQeb3/yNzwJ+ngBu6YT0fBRs
         f32V5oyVtD66lXTkFAyucstwx/nTJQMgoGYF7EgSzwGx4FgotdGVeOE5oV6QGkM4Iww9
         Da0ocT+axUqzMogK0gitEcCPFhxdglnaBVaVJYOQQAwqzrNTK5QbER29bosGilwTp1Za
         d+04kOIyZk5OxMqp08VO8auY6MRIrn8rXnzckE34tr9AWP16yH5VuApdqrnFBR9wPz5d
         QpFw==
X-Gm-Message-State: AOAM532FNR/duRXOs0UTHonBy8dzZ+2WGjlQYVa7XiZT2K3BmcXmbBSu
        J5B5Izy7PujXOFwTvGUvy1U=
X-Google-Smtp-Source: ABdhPJwQVotDakRWeSGeIo1Me2m/PynaPumC2TNw/4sBHZoeqG9AfD6z+7rCiADewXJURi6lxaNUzA==
X-Received: by 2002:a2e:b5d8:: with SMTP id g24mr3257912ljn.64.1615911286566;
        Tue, 16 Mar 2021 09:14:46 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id 188sm3143152lfo.0.2021.03.16.09.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 09:14:46 -0700 (PDT)
Subject: Re: [PATCH v2] phy: tegra: depend on COMMON_CLK to fix compile tests
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20210316075551.10259-1-krzysztof.kozlowski@canonical.com>
 <0e52e932-e5d7-8116-710a-50956caaf87c@gmail.com>
 <CA+Eumj5c2i30Xh2oBGeR5R_9JkPGiAXRGNYc4hKt9s8XuHjGdA@mail.gmail.com>
 <CA+Eumj4WirHRgr3si=nkQpNdUBcCwqLXvs-ihSi2nuJokxg=Xw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d280c555-5ee4-7803-ada1-88257f809816@gmail.com>
Date:   Tue, 16 Mar 2021 19:14:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CA+Eumj4WirHRgr3si=nkQpNdUBcCwqLXvs-ihSi2nuJokxg=Xw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.03.2021 18:51, Krzysztof Kozlowski пишет:
> On Tue, 16 Mar 2021 at 16:47, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On Tue, 16 Mar 2021 at 16:43, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>
>>> 16.03.2021 10:55, Krzysztof Kozlowski пишет:
>>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>>
>>>> The Tegra USB PHY driver uses Common Clock Framework thus it cannot be
>>>> built on platforms without it (e.g. compile test on MIPS with RALINK and
>>>> SOC_RT305X):
>>>>
>>>>     /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
>>>>     phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>>>
>>>> ---
>>>>
>>>> Changes since v1:
>>>> 1. Depend on COMMON_CLK always, not only for compile test.
>>>> ---
>>>>  drivers/usb/phy/Kconfig | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
>>>> index 52eebcb88c1f..7500e77a7d01 100644
>>>> --- a/drivers/usb/phy/Kconfig
>>>> +++ b/drivers/usb/phy/Kconfig
>>>> @@ -163,6 +163,7 @@ config USB_MXS_PHY
>>>>  config USB_TEGRA_PHY
>>>>       tristate "NVIDIA Tegra USB PHY Driver"
>>>>       depends on ARCH_TEGRA || COMPILE_TEST
>>>> +     depends on COMMON_CLK
>>>>       select USB_COMMON
>>>>       select USB_PHY
>>>>       select USB_ULPI
>>>>
>>>
>>> But if COMMON_CLK is disabled, then include/linux/clk.h provides a stub
>>> for clk_get_parent(), meaning that MIPS has its own COMMON_CLK, no?
>>
>> Hi,
>>
>> It depends on the platform. Not all of them implement every clk API,
>> so you can have failures:
>> https://lore.kernel.org/lkml/202102170017.MgPVy7aZ-lkp@intel.com/
> 
> Ah, you mentioned the stub, so let me clarify more. The common clk
> stubs are not used for cases like !COMMON_CLK && HAVE_LEGACY_CLK (or
> HAVE_CLK, I don't remember). This is why you can have a MIPS platform
> defining some of the clock operations thus not using COMMON_CLK at all
> (and neither the stubs).

I see now that the stubs depend on CONFIG_HAVE_CLK and not COMMON_CLK,
thanks.

This raises question about why those platforms select CONFIG_HAVE_CLK,
while not implementing it fully. Sounds like a better fix should be to
add the missing stubs to the MIPS clk implementation, which should avoid
the need to patch each driver individually.

https://elixir.bootlin.com/linux/v5.12-rc3/source/arch/mips/ar7/clock.c#L489
