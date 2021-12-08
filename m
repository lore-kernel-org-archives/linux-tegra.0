Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732EDC433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Dec 2021 15:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235647AbhLHPI1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Dec 2021 10:08:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235602AbhLHPIU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 10:08:20 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6EEC061746;
        Wed,  8 Dec 2021 07:04:48 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id l22so6140758lfg.7;
        Wed, 08 Dec 2021 07:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pLM9HZ9n1mg6yabOYtKuyDD+seWYDWNPU36hG44sqN4=;
        b=k5RK3MMcyEG0+wHMzZ82/z5goy9S25Z/gLJOSyOhYSPoIXovaEU8FYMkbf5mts1nl/
         ZN4e69XKWz16rkSQJsHcqyYADU8WM7p/f5z/2p2u5UEDpQDOjDXSsVB/dxz+C7lvuwJ7
         KuOKHKnTJ2PcJqW9hWssIiE2UVS8Xn+tyQYKMTW+OSNnn8lw5F9IUcRXyFNYbv6VcaGs
         0zX1uTij+3qLBl4JUoNVCoYwipO7InJJZdgD1QpeWa6ZkD6DT+tQIu8Qm9n1wvDA7BvL
         WVWOGUnwDqASWAgYy1QdnSZCfhxLLx4UC0MenPUKfxr/vLoZHEXHx8FiFQinlMYfsfAK
         yDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pLM9HZ9n1mg6yabOYtKuyDD+seWYDWNPU36hG44sqN4=;
        b=b/Ctuu/cS4MC4dH3klvC+CEmhbI68kDM1k9oOvgJk4K8A8Z9qZHM56lZesGuijeLCc
         TIDTIHWISOy1PED+mZGUAdu00CO9fAzlkh8fl9BHBdlsi+5dKl3N0zAL66yyShSlRXby
         oKQUSGw7blVaGfJkcRowQfqA/MZZkWWCTPaoFNvUae4Hj90MNZFjC+h4CVRD4aMDSfuw
         5napEMmPiSgN2PZlZDdkVBmm2VWavqwY/zOx3y7ZI1MKfx99ug7E+pNRlh7yn2MpG4Kq
         73nYYoVkHjoogtBBzmAPI/D28xMVBvG1xDGveESLHsh3tK2eydr08br4zm1vSObOAc1u
         wNRA==
X-Gm-Message-State: AOAM530y7ZGZwy5kCXeTOecbd0wiD5AerRMB69QDv6zr0OMxFUF1hS2J
        DAf0bvv8AGeTNoTNZjmr/i7sN5grL9Q=
X-Google-Smtp-Source: ABdhPJyn3b7XGl/H+4v/Y7t/fCWAQJsUlrR3eyGItGF02Yza/iO/CUMzUAO56llq7f4NmENX1DE6MQ==
X-Received: by 2002:a05:6512:32c9:: with SMTP id f9mr66263lfg.308.1638975886478;
        Wed, 08 Dec 2021 07:04:46 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id w8sm277025lfe.183.2021.12.08.07.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 07:04:46 -0800 (PST)
Subject: Re: [PATCH] ARM: tegra: Drop reg-shift for Tegra HS UART
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211207101316.381031-1-thierry.reding@gmail.com>
 <91755ddf-0b4d-aa73-f898-f15ccc214804@gmail.com>
 <24a7e99e-0a00-08c9-eb32-b9b64d747bac@gmail.com> <YbDIYjlActbuTuyf@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <97c48f01-1224-2538-9368-41d23b617bd2@gmail.com>
Date:   Wed, 8 Dec 2021 18:04:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbDIYjlActbuTuyf@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

08.12.2021 17:59, Thierry Reding пишет:
> On Tue, Dec 07, 2021 at 05:41:52PM +0300, Dmitry Osipenko wrote:
>> 07.12.2021 17:19, Dmitry Osipenko пишет:
>>> 07.12.2021 13:13, Thierry Reding пишет:
>>>> From: Thierry Reding <treding@nvidia.com>
>>>>
>>>> When the Tegra High-Speed UART is used instead of the regular UART, the
>>>> reg-shift property is implied from the compatible string and should not
>>>> be explicitly listed.
>>>>
>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>> ---
>>>>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi               | 3 +++
>>>>  arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 ++
>>>>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 ++
>>>>  arch/arm/boot/dts/tegra30-colibri.dtsi                    | 2 ++
>>>>  4 files changed, 9 insertions(+)
>>>
>>> What about Ouya?
>>>
>>
>> What about T20?
> 
> I went through all of the above based on results from a dtbs_check run.
> I don't see these errors flagged for Ouya or any Tegra20 boards. I have
> no idea why and will need to look into it some more.

Alright, something is wrong then. The serial@70006200 node on Ouya is
exactly the same as on Nexus7, T20 Acer A500 is almost the same.
