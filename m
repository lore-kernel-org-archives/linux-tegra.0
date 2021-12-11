Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839F3C433EF
	for <linux-tegra@archiver.kernel.org>; Sat, 11 Dec 2021 16:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhLKQpP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 11 Dec 2021 11:45:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhLKQpP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 11 Dec 2021 11:45:15 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8945C061714
        for <linux-tegra@vger.kernel.org>; Sat, 11 Dec 2021 08:45:14 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id u22so17862120lju.7
        for <linux-tegra@vger.kernel.org>; Sat, 11 Dec 2021 08:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OAhUOO/XYTQu+liKPdFUoAA/VSTQzCtvS0dN7WytkJQ=;
        b=ZjhzjeGxYpVJFU2ss/sCQZGp1u+59QODv21pMejoVHOlAuyu8iuo5Lh0YsQI/nIeNL
         OiQxQPZ/GGilRPB+kCbaFfRx30qq72eGnxLDcfmIzr+OptW6icqwz7Y+0/yd/5FBE5OJ
         Z1XV44bpht59AMvFFkvJNBK+ufQb2hhIpLpWq/l5s6COSxjVT/9KWhkAEMXJXlaCyuuD
         sefw6vtIlPukY+V23Ldsjxx7GPIf6TQ0b5J2P75vXq4M9tiFU4EirTaxjti144J+eZgU
         Kb3M/D2G97lp8q9i5iW2FSJLcbnP+32Q8TQbN4j9GVsRAUit2Tn+l8UBHBHS9oAMSpcZ
         15xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OAhUOO/XYTQu+liKPdFUoAA/VSTQzCtvS0dN7WytkJQ=;
        b=yjGXO6/+FgDJ72dpsYgchxdkEz+57XQrIQmhSM4BnetRUbhk4t7Npvi6Cpa058yyrv
         Xbl8tOqyWtPjCRwh63+xe+OfWElAyRzcSRStrthxsRe/e0sGJDOtd1rhqb/sq+9ziRJJ
         0akXQa3vaH7jzF0tDlAkIzUkhWlV2boj0NGnXh+nzv+avb6+wfq6ZeYsJ3R6MY526iRE
         LGMGbqUadeUO7vDP0dlSOulY4NXgJJatZm5Lhn9PqNOR7ogU5OZeEm7BmVyfd9CK2jV/
         yBS0Ykc9Ybnu/eE2X1y+dYXJyOOEQNku9P+8DCdvzuvTpCAhocyEOGgLeoNP75l409XZ
         HaCw==
X-Gm-Message-State: AOAM532JPgPfGDsPuEdyjHVtqkKUElJj2Eb/WnGXu7M4xGqbsQLwCvEi
        EYHY6/9wwbt6GktrzPomhnOlx9385ss=
X-Google-Smtp-Source: ABdhPJxrMTk61DOJgYoelkiKWfwtdWX3zjwyJFVI3nExSolKNMs9A1Y/EInassUOrFwV5x+kLEZFAQ==
X-Received: by 2002:a05:651c:12c9:: with SMTP id 9mr19580422lje.474.1639241112860;
        Sat, 11 Dec 2021 08:45:12 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id d15sm692833lfq.38.2021.12.11.08.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Dec 2021 08:45:12 -0800 (PST)
Subject: Re: [PATCH 04/25] ARM: tegra: Rename top-level clocks
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-5-thierry.reding@gmail.com>
 <d545f269-7d99-f126-0ace-b1a5cffe3ab2@gmail.com> <YbNNs+H05YZxA2ex@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b2499ff2-78cf-8f97-eb00-3380f651c4d8@gmail.com>
Date:   Sat, 11 Dec 2021 19:45:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbNNs+H05YZxA2ex@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.12.2021 15:53, Thierry Reding пишет:
> On Thu, Dec 09, 2021 at 09:27:01PM +0300, Dmitry Osipenko wrote:
>> 09.12.2021 20:33, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Clocks defined at the top level in device tree are no longer part of a
>>> simple bus and therefore don't have a reg property. Nodes without a reg
>>> property shouldn't have a unit-address either, so drop the unit address
>>> from the node names. To ensure nodes aren't duplicated (in which case
>>> they would end up merged in the final DTB), append the name of the clock
>>> to the node name.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  arch/arm/boot/dts/tegra114-dalmore.dts                    | 2 +-
>>>  arch/arm/boot/dts/tegra114-roth.dts                       | 2 +-
>>>  arch/arm/boot/dts/tegra114-tn7.dts                        | 2 +-
>>>  arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 +-
>>>  arch/arm/boot/dts/tegra124-nyan.dtsi                      | 2 +-
>>>  arch/arm/boot/dts/tegra124-venice2.dts                    | 2 +-
>>>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts           | 4 ++--
>>>  arch/arm/boot/dts/tegra20-harmony.dts                     | 2 +-
>>>  arch/arm/boot/dts/tegra20-paz00.dts                       | 2 +-
>>>  arch/arm/boot/dts/tegra20-seaboard.dts                    | 2 +-
>>>  arch/arm/boot/dts/tegra20-tamonten.dtsi                   | 2 +-
>>>  arch/arm/boot/dts/tegra20-trimslice.dts                   | 2 +-
>>>  arch/arm/boot/dts/tegra20-ventana.dts                     | 2 +-
>>>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 +-
>>>  arch/arm/boot/dts/tegra30-beaver.dts                      | 2 +-
>>>  arch/arm/boot/dts/tegra30-cardhu.dtsi                     | 2 +-
>>>  16 files changed, 17 insertions(+), 17 deletions(-)
>>
>> This and the next patch duplicate the preexisting patch [1] that you saw
>> and skipped previously. It looks odd that you redoing it on your own
>> now. This is not okay to me unless you talked to David and he is aware
>> about it.
> 
> I had completely forgotten about it. I'll substitute David's authorship
> for mine, but I'd prefer to keep the two changes in separate patches.

I'll better separate David's patch and give you credit for that. David's
patch was well tested and improved over couple months in grate kernel,
while yours not.
