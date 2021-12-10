Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFEEC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 15:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhLJPgn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 10:36:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239838AbhLJPgm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 10:36:42 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4B5C061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:33:07 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id l7so14321410lja.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YT5OhJSOVagYfiHWTxAQ1yjGIEZSxLWFQONBfXyYLrc=;
        b=J2dmM/4bKF+VkEEh/iS8gJfYe1pTaiOtgZZqIZ8etkb8+0h2vIoaXqiKaEgR9A53rt
         F/BN4kENQp0Ochfevbb7HNB3CoOGQPnNdeJ+KOzIm4sOrfXNCWE0C+SmO1Y8mngRZWz6
         DDKtlJFzAiDm4mOwXihG4qvv7hHxBKWF7b1w2yGXJKh/zyokan8qLYn4giQ6Fql7ER7u
         SnGS9jzfiDEk7zPaH+HSig1tMZbMoNdjyrInqtxeOMzZeBud5FKScate21oz57HGJNPO
         7+g1C3c3tg6FpZubN2N+nrSoE7LE8hPS3VjhQqWeg7NmVuRGqGus/FF3yGG5NDGsYLGk
         AAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YT5OhJSOVagYfiHWTxAQ1yjGIEZSxLWFQONBfXyYLrc=;
        b=oilvwlAlePGrBsUahk6emBXCfsfeUQrORIAR6WIL1zcZCjd2GClrAyetHGIxCNnT6z
         sAD848pCus0xB4Uxd0+jq3uy7bwaF5UM/XCy4ccNE54yj0x+mFSwWcSXNxg29wdVLMPw
         Pe9p2CHP3vRpMfFV0O9BToyVJaQjYlYenA008fmW0HCc+jq3BrCcwgYL8jkEdWfkDCjG
         hh+5GQH9Pft1DIBym52XZFSaX/3bgzSvqfk77sB6Zh0Edemv+QN7AItjY4gph+7YmvY+
         92/pB6rbbWDtO86FFDxUijF4K2i4AuBioO7ALTLXnDoHquqEQ4Xu14V5aM6n9h3e6K/Z
         RDjw==
X-Gm-Message-State: AOAM533TuSFqD/bEQL00IGjgxwJXvmTbVlzrX63j0fNW+aQK7erRd+mq
        Zqr2GB9V4MQQHxYWEYVqKSifjyBeIyI=
X-Google-Smtp-Source: ABdhPJxekexjJbfyQZXHYjbzi4ozX67rOQIK6ujxBPAYijX3CPk6z4I0ZrerFM+upp9tQHmi+khf8w==
X-Received: by 2002:a2e:b4a6:: with SMTP id q6mr12845478ljm.7.1639150385516;
        Fri, 10 Dec 2021 07:33:05 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id j19sm370893lfe.120.2021.12.10.07.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 07:33:05 -0800 (PST)
Subject: Re: [PATCH 12/25] ARM: tegra: Do not use unit-address for OPP nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-13-thierry.reding@gmail.com>
 <b133948b-1705-b27e-d0fb-b71481148bad@gmail.com> <YbNj0ifkaDIDEJdn@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ec0b9923-c45a-f23a-4059-6c9281edb666@gmail.com>
Date:   Fri, 10 Dec 2021 18:33:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbNj0ifkaDIDEJdn@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.12.2021 17:27, Thierry Reding пишет:
> On Thu, Dec 09, 2021 at 09:38:06PM +0300, Dmitry Osipenko wrote:
>> 09.12.2021 20:33, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> OPP nodes do not have a "reg" property and therefore shouldn't have a
>>> unit-address. Instead, use a dash instead of the '@' and ',' characters
>>> to allow validation of the nodes against the DT schema.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  .../boot/dts/tegra124-peripherals-opp.dtsi    | 142 ++++++++---------
>>>  .../boot/dts/tegra20-cpu-opp-microvolt.dtsi   |  82 +++++-----
>>>  arch/arm/boot/dts/tegra20-cpu-opp.dtsi        |  82 +++++-----
>>>  .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  36 ++---
>>>  .../boot/dts/tegra30-cpu-opp-microvolt.dtsi   | 144 +++++++++---------
>>>  arch/arm/boot/dts/tegra30-cpu-opp.dtsi        | 144 +++++++++---------
>>>  .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 130 ++++++++--------
>>>  7 files changed, 382 insertions(+), 378 deletions(-)
>>
>> This patch is wrong, you haven't renamed the delete-node properties [1].
> 
> Yeah, I noticed that too as I was reworking the EMC timing nodes as you
> requested.

Please use my version of the patch that was well tested.

>> Please stop rewriting patches and use what already has been sent out and
>> tested, thanks.
>>
>> [1]
>> https://patchwork.ozlabs.org/project/linux-tegra/patch/20211130232347.950-35-digetx@gmail.com/
> 
> I've had versions of this in my tree for literally years now, so I
> haven't exactly been rewriting these. Rather this is an iteration of
> work that I had started over 18 months ago:
> 
> 	http://patchwork.ozlabs.org/project/linux-tegra/patch/20200616135238.3001888-26-thierry.reding@gmail.com/

I was commenting on that old patchset and was aware about that old
patch, it's unrelated here.

> After that obviously things had to be changed again. The earliest
> version that you sent that I can find is from late October which is when
> I was already in the midst of this latest effort to get Tegra DTBs to
> validate.

What you're saying here, is that you don't look at the patches on the
ML. This is exactly what happened more than one time in the past when
patches missed merge window and a large part of work was held back by
another two months.  This happened not only to me, but also to other
people, it's bad to see when you're about to do it again.

> What's really been happening here is that we haven't been communicating
> and ended up duplicating work.
> 
> Stop making this into something it isn't.

It's impossible to communicate when you're not looking at the messages
or not replying.  I don't know where the problem is.  If you're too busy
and don't have enough time for maintaining upstream, then solution could
be to share the duties with more people.
