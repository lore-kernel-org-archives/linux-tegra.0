Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87173C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 16:27:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240765AbhLMQ07 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 11:26:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240799AbhLMQ04 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 11:26:56 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D97DEC06173F
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:26:55 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 207so24431760ljf.10
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wjzJ6Ey08u+xuZ73cHM4lp0wpPkVBGZs6sug28wqIAo=;
        b=ZnKm4Vl1zYSz5/FqVOxjGLwzQJYJY8+VqRikSQJjJE7FYu20p4J5I+cVE/x1/w7i1g
         zWBQzqnSzVJNSnoO12iq5PiMiGepZuQFKzs0kzx6E1JSGRjJL7hOneRA39ZWSjbn6g/a
         WVnc+EIyIAZokTEtv6s+WXxZw/JeW5g4BUn6zzNAq/LNfd+bcNNfWJAZPDIR/kH9eTXE
         1myO3j40983KhjAjOLkKGKqg6YwHtnkYNsz2GKFNCcOj3/DhsAdYD9NO/HqfND8PrSBW
         EyiFGDW3x/vyJ7bDdcxDOMDfRp6NVL8TK2Rvf8gty6KMUMlWNfBaHZoBcjTl5Uozwmyv
         4nFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wjzJ6Ey08u+xuZ73cHM4lp0wpPkVBGZs6sug28wqIAo=;
        b=D+q0UrANzXJuHl35Q6gtqDAyaIvNi918jX2j6pJ2r6WFCkGceUlV+1gxlePzgeHqlf
         MW1Re/gA3Nhi8pEGKtN2P10TPDhlk8sdcKhqG0JqjG321PUZudoLReusW+4UQeuVEQRz
         UZDzORCvJuFYvyMp60XMrJaucczOB0ODojvoryOkf/0IRnlWgkeJ4ptBckdDb8kKq1/Q
         82cih6k7rhuzt++UfGmskRpcFUxVKJaiQBf84TOoP19gYnw5yraE5XT4NFtpe6VWJO3J
         p/Zll/v7QDoj2meDjhJ/WRtUHDdeQ/A7VDFAdEdytzIcoknmdmaPNxpgcuKDsNBRMVTY
         u0mA==
X-Gm-Message-State: AOAM532BixYvbFJwOcEF5qNQxzVQArKy3xKf41gFnZPZ1BiXp2KloKy7
        JE9HTTFMDEClI8/Dpb9DkIPoRShWeu8=
X-Google-Smtp-Source: ABdhPJwrfK6LehIvaEOWMHKRxLQcG8gtAK8dBIT93ou31Zbv7dZmTooUm7gegn8IeKOux8WISH+PZg==
X-Received: by 2002:a2e:aa14:: with SMTP id bf20mr30045880ljb.376.1639412814026;
        Mon, 13 Dec 2021 08:26:54 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id o11sm1472070ljc.100.2021.12.13.08.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 08:26:53 -0800 (PST)
Subject: Re: [PATCH 23/25] ARM: tegra: Remove stray #reset-cells property
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-24-thierry.reding@gmail.com>
 <9b59ae8b-0c99-c59d-e837-aff49d78cbbc@gmail.com> <YbNs1SCLclVifFDP@orome>
 <80f3fac6-ad64-988e-636d-5d872890f56e@gmail.com> <YbdwrnFH8GAZLfhv@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d1b1568e-e218-a6e3-8b34-147b27cd5a1c@gmail.com>
Date:   Mon, 13 Dec 2021 19:26:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbdwrnFH8GAZLfhv@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.12.2021 19:11, Thierry Reding пишет:
> On Fri, Dec 10, 2021 at 09:08:43PM +0300, Dmitry Osipenko wrote:
>> 10.12.2021 18:05, Thierry Reding пишет:
>>> On Thu, Dec 09, 2021 at 10:24:26PM +0300, Dmitry Osipenko wrote:
>>>> 09.12.2021 20:33, Thierry Reding пишет:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> The Ouya board specifies the #reset-cells property for the GPIO
>>>>> controller. Since the GPIO controller doesn't provide reset controls
>>>>> this is not needed, so they can be dropped.
>>>>>
>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>> ---
>>>>>  arch/arm/boot/dts/tegra30-ouya.dts | 1 -
>>>>>  1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
>>>>> index 4259871b76c9..fd64aadc472a 100644
>>>>> --- a/arch/arm/boot/dts/tegra30-ouya.dts
>>>>> +++ b/arch/arm/boot/dts/tegra30-ouya.dts
>>>>> @@ -70,7 +70,6 @@ hdmi@54280000 {
>>>>>  
>>>>>  	gpio: gpio@6000d000 {
>>>>>  		gpio-ranges = <&pinmux 0 0 248>;
>>>>> -		#reset-cells = <1>;
>>>>>  	};
>>>>>  
>>>>>  	pinmux@70000868 {
>>>>>
>>>>
>>>> Can we uncomment the gpio-ranges in tegra.dtsi? I reviewed and tested it
>>>> almost 3 years ago [1].
>>>>
>>>> [1]
>>>> https://lore.kernel.org/linux-tegra/20180726154025.13173-2-stefan@agner.ch/
>>>
>>> Does it still work today?
>>
>> It works. That patch still applies as-is.
> 
> Alright, I'll pull that in then.

No-no-no, please rebase your patches on top of latest mine [1]. Please
do it that way, this will be better for everyone. I already took care of
all the conflicts between the patches and added the new ones, all you
need to do is to *rebase your* patches.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=276354

You're again not looking at the incoming emails, are you receiving them
at all? This situation is very strange to me. I'll continue to keep eye
on what you're doing to make sure that everything will be merged properly.
