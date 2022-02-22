Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B3EC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Feb 2022 10:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbiBVKjk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Feb 2022 05:39:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbiBVKjj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Feb 2022 05:39:39 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618A91520E6
        for <linux-tegra@vger.kernel.org>; Tue, 22 Feb 2022 02:39:14 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id w27so6122553lfa.5
        for <linux-tegra@vger.kernel.org>; Tue, 22 Feb 2022 02:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bA82aRvveeHb4EfwxS91IfJ8rNVGJgeKZIsr7UMLI1g=;
        b=Gb358b/tkcnDwPm0miT5c8AUxhKk3NMVBDVKVh76hn1QnBgsP7txJa3g7CqqXWqaeK
         eKIWfL4V9xFON8mVeLC1KXgOXR0M3AF/fuAt2TftjIokBgV7+erBBUUdivtH0mTMPVOv
         uaiT1is+XAZalMf1P33AdTHRb04PVUPuU8HWhcdjkrNbjsdw3RGdbG/UKmVv74qXsvOO
         W/FJW8rjXnALvs619uQX55IWOEmfJvgJMQC4BDlOAHdXtJerKGVbaGawcmGJbT/eVqpS
         +SzWSLbtcpOro58I4EHOmoZ9CQlvGQ5UyU7UR/LJsrIVtBvWqgNv5JakxdW0Pb+B+BJC
         gNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bA82aRvveeHb4EfwxS91IfJ8rNVGJgeKZIsr7UMLI1g=;
        b=4cNHqBf186F/S08IUCkt10/5DcmQE0gTjjUMueGrtVt9UIS9Dta8zHdcE+UcWCvVo4
         GEv+KLe5zm6t7JgxYD5YfGuHxQIGvV/6kit2Q5BS7+1xAWR6XfFy9vsQoohuFRvSFB78
         jpxGNJXc9ufQ+SEtGiQeczp4TAV7bjg/vn6GIFsufdTYfCf7xXIymrGyy5zWfqh3/PBi
         /vqddcnXRNQ5Doedje4+BQBwk4guoaks0o4ZrEUv25jODvdvl87Hnck2zbYJ7oBouD/7
         P+oDUuQUOhL13RVCB5qa+fB6+CuR5/LLogN4Ch3syRTgLtvE3JR7QYz9TVpEMJ0++oRv
         f6oA==
X-Gm-Message-State: AOAM533AwG0ik2r1vhkJs8BHNLlF3aMJu49sodsmSy0nFvukvYaK30da
        48WhA0kQ8XLCre/VNCMdH7g=
X-Google-Smtp-Source: ABdhPJwRW2DfFi7vaENUA23Jq3YSQCwkSFxTvN+A+UDSLBW3imjJteLUnHwhO8atUISlgmzgaNxWbQ==
X-Received: by 2002:ac2:4194:0:b0:442:ed9e:4a25 with SMTP id z20-20020ac24194000000b00442ed9e4a25mr16609681lfh.629.1645526352564;
        Tue, 22 Feb 2022 02:39:12 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id 26sm1674219ljt.99.2022.02.22.02.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 02:39:11 -0800 (PST)
Message-ID: <de5a48a4-4aca-5ac6-e4f2-e90244c9936d@gmail.com>
Date:   Tue, 22 Feb 2022 13:39:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thomas Graichen <thomas.graichen@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20211220104855.428290-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20211220104855.428290-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.12.2021 13:48, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> this is an alternative proposal to fix panel support on Venice 2 and
> Nyan. Dmitry had proposed a different solution that involved reverting
> the I2C/DDC registration order and would complicate things by breaking
> the encapsulation of the driver by introducing a global (though locally
> scoped) variable[0].
> 
> This set of patches avoids that by using the recently introduced DP AUX
> bus infrastructure. The result is that the changes are actually less
> intrusive and not a step back. Instead they nicely remove the circular
> dependency that previously existed and caused these issues in the first
> place.
> 
> To be fair, this is not perfect either because it requires a device tree
> change and hence isn't technically backwards-compatible. However, given
> that the original device tree was badly broken in the first place, I
> think we can make an exception, especially since it is not generally a
> problem to update device trees on the affected devices.
> 
> Secondly, this relies on infrastructure that was introduced in v5.15 and
> therefore will be difficult to backport beyond that. However, since this
> functionality has been broken since v5.13 and all of the kernel versions
> between that and v5.15 are EOL anyway, there isn't much that we can do
> to fix the interim versions anyway.
> 
> Adding Doug and Laurent since they originally designed the AUX bus
> patches in case they see anything in here that would be objectionable.
> 
> Thierry
> 
> [0]: https://lore.kernel.org/dri-devel/20211130230957.30213-1-digetx@gmail.com/
> 
> Thierry Reding (2):
>   drm/tegra: dpaux: Populate AUX bus
>   ARM: tegra: Move panels to AUX bus
> 
>  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
>  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
>  drivers/gpu/drm/tegra/Kconfig             |  1 +
>  drivers/gpu/drm/tegra/dpaux.c             |  7 +++++++
>  5 files changed, 33 insertions(+), 19 deletions(-)
> 

Will we see the v2 anytime soon?
