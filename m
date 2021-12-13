Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6DAC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 16:52:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236723AbhLMQwo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 11:52:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbhLMQwo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 11:52:44 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1992C061574
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:52:43 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id p8so24607273ljo.5
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dcBqRMNe8FVn4gvm/jJDh5sStaYcFUKC0ArU/88cKDQ=;
        b=PXQW29cpyBxeJoutCcPkvJ/PlQdbH0JVzHTx6Y4+Oa8fabEINMkOxD9e1CoPtonEXo
         Uypb0vd6ukY5Nu7YYVqhu+7U47VRb8SCDADmF7jNrFgzYmc5AxXT+qH8/H4CphKFpMPm
         dgwQuefBdnTuh8yBq+vY4ic3SVJdOm5BDesakvGDxtylSx8q9jMFS1L9NbRb6C5e2JDV
         G4BkraYy5FeFz3dzuUV+aOZsx0eQK7j36eo8rWL6GlqCF4xWWDEioWPFCmDIOwUeykPV
         D5n6yNOqxheJ/HvG10x5OROK6a7umYEu1szuyNAFGHgaK9BbpgR5RpT+75kFn8Sq+6M3
         mUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dcBqRMNe8FVn4gvm/jJDh5sStaYcFUKC0ArU/88cKDQ=;
        b=L+lz5x5G/bNQTEdZZ1HPuZ2/1npGH5yByAYAHyM8IjCcBot8Q2PTBTZIb2/1UXDTib
         3E5cUzLuLD5qcUZBS+6xQU9StZZmA99BvBJKvbs0RyiXBijkxQaUMnKygASTjmkstxHT
         i9TBJxSqDj5oMOoQ/cXsqcfbcEWSwEMwZhoTlXhII34G7fpjhfj3bw8//8Wp1UPPFp84
         /DebKSsFFXd/ijiCwn2roGwcCU5XZASzivySC/sDmXUiUybScvgR7NcOImx169qgtMTi
         eVy+RGj2VXOU0e/jJcG0t8xGeUN1Mx4cJFBvSrK/1f9AbvqKrERHYpQ+VRvb/ZTK3oJl
         /9QQ==
X-Gm-Message-State: AOAM531maULfysDYIKYwddCPf8ttD6mcja4MVyM2sA2Tdhc3/Ret4uC4
        Wtdy+LBHrHvOd82DzI4n45AWEpGuLbI=
X-Google-Smtp-Source: ABdhPJycoYtk/n5Pq6bqu8hIXoIb+6ajqAKrjJbX7trqUAUEfibKLIhxx5F7jSZuzSNX/kFVMvD7FA==
X-Received: by 2002:a2e:9617:: with SMTP id v23mr30216269ljh.363.1639414361784;
        Mon, 13 Dec 2021 08:52:41 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id w6sm1499958lfn.169.2021.12.13.08.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 08:52:41 -0800 (PST)
Subject: Re: [PATCH 04/25] ARM: tegra: Rename top-level clocks
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-5-thierry.reding@gmail.com>
 <d545f269-7d99-f126-0ace-b1a5cffe3ab2@gmail.com> <YbNNs+H05YZxA2ex@orome>
 <b2499ff2-78cf-8f97-eb00-3380f651c4d8@gmail.com> <Ybduh/k/UFES5IzE@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9d129339-afd0-61bf-a384-8c9e58665d63@gmail.com>
Date:   Mon, 13 Dec 2021 19:52:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybduh/k/UFES5IzE@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.12.2021 19:02, Thierry Reding пишет:
> On Sat, Dec 11, 2021 at 07:45:11PM +0300, Dmitry Osipenko wrote:
>> 10.12.2021 15:53, Thierry Reding пишет:
>>> On Thu, Dec 09, 2021 at 09:27:01PM +0300, Dmitry Osipenko wrote:
>>>> 09.12.2021 20:33, Thierry Reding пишет:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> Clocks defined at the top level in device tree are no longer part of a
>>>>> simple bus and therefore don't have a reg property. Nodes without a reg
>>>>> property shouldn't have a unit-address either, so drop the unit address
>>>>> from the node names. To ensure nodes aren't duplicated (in which case
>>>>> they would end up merged in the final DTB), append the name of the clock
>>>>> to the node name.
>>>>>
>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>> ---
>>>>>  arch/arm/boot/dts/tegra114-dalmore.dts                    | 2 +-
>>>>>  arch/arm/boot/dts/tegra114-roth.dts                       | 2 +-
>>>>>  arch/arm/boot/dts/tegra114-tn7.dts                        | 2 +-
>>>>>  arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 +-
>>>>>  arch/arm/boot/dts/tegra124-nyan.dtsi                      | 2 +-
>>>>>  arch/arm/boot/dts/tegra124-venice2.dts                    | 2 +-
>>>>>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts           | 4 ++--
>>>>>  arch/arm/boot/dts/tegra20-harmony.dts                     | 2 +-
>>>>>  arch/arm/boot/dts/tegra20-paz00.dts                       | 2 +-
>>>>>  arch/arm/boot/dts/tegra20-seaboard.dts                    | 2 +-
>>>>>  arch/arm/boot/dts/tegra20-tamonten.dtsi                   | 2 +-
>>>>>  arch/arm/boot/dts/tegra20-trimslice.dts                   | 2 +-
>>>>>  arch/arm/boot/dts/tegra20-ventana.dts                     | 2 +-
>>>>>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 +-
>>>>>  arch/arm/boot/dts/tegra30-beaver.dts                      | 2 +-
>>>>>  arch/arm/boot/dts/tegra30-cardhu.dtsi                     | 2 +-
>>>>>  16 files changed, 17 insertions(+), 17 deletions(-)
>>>>
>>>> This and the next patch duplicate the preexisting patch [1] that you saw
>>>> and skipped previously. It looks odd that you redoing it on your own
>>>> now. This is not okay to me unless you talked to David and he is aware
>>>> about it.
>>>
>>> I had completely forgotten about it. I'll substitute David's authorship
>>> for mine, but I'd prefer to keep the two changes in separate patches.
>>
>> I'll better separate David's patch and give you credit for that. David's
>> patch was well tested and improved over couple months in grate kernel,
>> while yours not.
> 
> It's pretty much the same thing. There are slight differences in the
> names, but other than that there should be no functional difference.

Sure, but instead of guessing whether there is any functional difference
or not, let's simply use the version that was not only create earlier,
but also tested much wider.

Once again, I already took care about it. All the patches are in yours
email inbox. If there is a need for more  coordination, then please ping
me on the IRC.
