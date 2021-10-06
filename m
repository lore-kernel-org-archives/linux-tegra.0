Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7400CC433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 21:07:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 466F661184
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 21:07:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239454AbhJFVJQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 17:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhJFVJP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 17:09:15 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C1FC061746
        for <linux-tegra@vger.kernel.org>; Wed,  6 Oct 2021 14:07:22 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b20so16112395lfv.3
        for <linux-tegra@vger.kernel.org>; Wed, 06 Oct 2021 14:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TflpwPZE9QDA5GXWczKBZDym4osUpjQCVJ+bbBsqiE0=;
        b=nr8IPaGR1dE28DEaaKLAuVRaakV/rT8o2sub72N4Vzwem33US+OZ7pRqFAGpsv2b+i
         lI1rER4JJusEF+6mm4DL/JFQ+c8vjYTakgRkk8StkAmvPx8iVagXD12N8eOMSjvPujB/
         GReojgRxWsTnoVGdH0LFU+t3QJiN6Nzxd7+VDIOJscDBMK/K+smxLe77tvD+SxZ265C7
         36pkNhYiQL1xmOPs6W5FJDZoo0rOz5LOPbmjEzLto19t7MTdAHvRFohyKA6WcUu/QVkm
         eH937ELGYfEyA7CUukGQgofCi0SuIIxds6vA/F+2kxMSSD+HuXSmW/UfnzXii39GRf2R
         STVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TflpwPZE9QDA5GXWczKBZDym4osUpjQCVJ+bbBsqiE0=;
        b=nj6tjyDHfLXRV3sXHxOG7a8y2VpYUN4EOi2qRXKEZJwwtV8LyRuIbsQecSxV531Tj2
         VBBz1K+rncGrrR8MMcT7t8M+T0mLTXx+gKke4oidAZYoo/Mjr2oNJVsVEP3vxkQjGaEJ
         9bRuF/xLgbPOcE93huetVRmsL6gS/GeRORKEfEYClVjclRivgRM2571YxNdfd/kPWQXK
         YMCqrDGPNgGheqmiXmLMtWUy/DZlYYlW4vSwrTKrE0AYaeO0Dvi6M1166C76Y240IATL
         DEmMSN4it1LzK4RfnJPIx9jBrHbYYZ0e6qQnv6OOBgkPKqu/H6mqygAimLXwPnKl8ZiW
         08Uw==
X-Gm-Message-State: AOAM530YSUZX6StK+cCZRH+zqY8MRcquVHShETs8ceV+W47fA5zwf/RG
        F61eguoorLCk/w4fS6m4ORoSrFvcatE=
X-Google-Smtp-Source: ABdhPJxH3M3UiC/acM65+VrH5JGJnrQ/jXtTLT/Et40R0BaNG9dEoR4GmjTFe9pdwQITkdGBSbWWqQ==
X-Received: by 2002:a2e:7311:: with SMTP id o17mr296029ljc.267.1633554441149;
        Wed, 06 Oct 2021 14:07:21 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id p5sm155845lfk.282.2021.10.06.14.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 14:07:20 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] drm/tegra: dc: rgb: Allow changing PLLD rate on
 Tegra30+
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210929222805.16511-1-digetx@gmail.com>
 <20210929222805.16511-3-digetx@gmail.com> <YV3nQuo7eG6dkl0f@orome.fritz.box>
 <b858348a-698e-c22b-da9a-83cd2f00e668@gmail.com>
Message-ID: <b43c8e99-ba34-d853-c052-b9e7212d117e@gmail.com>
Date:   Thu, 7 Oct 2021 00:07:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b858348a-698e-c22b-da9a-83cd2f00e668@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

06.10.2021 21:27, Dmitry Osipenko пишет:
> 06.10.2021 21:13, Thierry Reding пишет:
>> On Thu, Sep 30, 2021 at 01:28:05AM +0300, Dmitry Osipenko wrote:
>>> Asus Transformer TF700T is a Tegra30 tablet device which uses RGB->DSI
>>> bridge that requires a precise clock rate in order to operate properly.
>>> Tegra30 has a dedicated PLL for each display controller, hence the PLL
>>> rate can be changed freely. Allow PLL rate changes on Tegra30+ for RGB
>>> output. Configure the clock rate before display controller is enabled
>>> since DC itself may be running off this PLL and it's not okay to change
>>> the rate of the active PLL that doesn't support dynamic frequency
>>> switching since hardware will hang.
>>>
>>> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/gpu/drm/tegra/dc.c  | 27 ++++++++++++--------
>>>  drivers/gpu/drm/tegra/dc.h  |  1 +
>>>  drivers/gpu/drm/tegra/rgb.c | 49 +++++++++++++++++++++++++++++++++++--
>>>  3 files changed, 65 insertions(+), 12 deletions(-)
>>
>> This seems overly complicated. I especially don't like the way how
>> clocks are looked up with clk_get_sys() and then used in the comparison.
>> Could this not be achieved by using assigned-clocks and friends
>> properties in DT?
> 
> Assigned-clocks have nothing to do with this patch. We need to check
> whether PLLD *is* already pre-assigned as the parent.
> 
> Adding properties for describing the clk parents is overly complicated,
> clk_get_sys() is a much simpler solution that doesn't involve extra DT
> changes.
> 
> BTW, assigned-clocks can't be used for display controller  because
> controller is usually turned on during boot and reparenting of active DC
> will hang machine.
> 

To make it more clear, we change the DC's "parent" in TF700T device-tree
to PLLD [1] to match the bootloader's configuration, otherwise it will
hang on boot since default "parent" in tegra30.dtsi is PLLP, and thus,
tegra_dc_rgb_probe() will try to reparent it to PLLP. Display of TF700T
won't work with PLLP anyways since it needs a specific clock rate.

[1]
https://github.com/grate-driver/linux/blob/master/arch/arm/boot/dts/tegra30-asus-tf700t.dts#L13
