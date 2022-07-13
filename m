Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B582CCA479
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jul 2022 16:26:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237173AbiGMQ0u (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Jul 2022 12:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234677AbiGMQ0t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Jul 2022 12:26:49 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D0F182
        for <linux-tegra@vger.kernel.org>; Wed, 13 Jul 2022 09:26:47 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id z23so4229048eju.8
        for <linux-tegra@vger.kernel.org>; Wed, 13 Jul 2022 09:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pSMeV0UO1e5jzes+Zd0PBMgQ79wPyLQn2ffBVo4YcO4=;
        b=K2cWE3mbwrzYGunognoSm8OrYifu+6ElD6U/XIbW8YDOXvcdIiYXlFGspU0RhyB3c/
         gAg1SL2SYFzad5aK/gR4awmdZZRZ/Ppr8+f+ywt8oKJMZx+h9z+JnFGiNeaGxp8s0rZi
         Artyn/ma+VM3eSDMZ2jA93/fK7RUyew81I4U0lGHPyTxWQBqLAwB0R8+8EWeWivTTtaF
         90q2Cy3K9lHKCMsCARkyTXa8TpWmJVJRA4mVTWarnacvxLiaQ4zfdEN05j0ZfaullAhP
         wZhgTc5fKKJjrahwtar3zwB/UdPRwbridAHwVA4s+6lM1HOy8Fc2n3IYNrg+uL6i13q6
         xoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pSMeV0UO1e5jzes+Zd0PBMgQ79wPyLQn2ffBVo4YcO4=;
        b=vJSvy3tdzN0a9tZsaWbJ1M0Z8dq9pPI4uaPcs6D6OxX02OViOhO/vf2RSbiM3hBO/a
         fg6tavg6CWW1isQm7aMeUfrhlXgjlEtlgYdYYoeMbWSbcJLT9LZpei/3d8D0DxMCDiLQ
         vu6DJvIoqMZk6quq0AXyQW6D0i+33xNqJfmuE3vWp9ddWhl67DLcgJ43nEI2TL+PYBF7
         QLCe9nAjWZocT1U47llbva+4qWuHsTOrbphuD2J/feWVeyUqLrrUVTk7MEC9jtx8UYVl
         hon2YkDi8cXDw8Lxv8gNJ7Z9DdoepERlLaM6yyxCEx0WdnHc296lzhLKQQ89GqciX2P/
         HZZQ==
X-Gm-Message-State: AJIora+A4Qu5frkKwHpR358ViNOhqLcQCDFeTr+68H99p3a+cSQtdckJ
        jR3h73bQ5uCQdK7j7gtJpUm/5BqkXojoa9qZZ9euFg==
X-Google-Smtp-Source: AGRyM1vWzmXIJzE9c9SPtGr1gM78UfRbzB7XavFc2QRd5fGxT5UecMC1zQgjhpA/l2v+d96DAhacviEkAbrUZhzx3Fs=
X-Received: by 2002:a17:906:5a68:b0:72b:3e88:fec1 with SMTP id
 my40-20020a1709065a6800b0072b3e88fec1mr4281064ejc.741.1657729606404; Wed, 13
 Jul 2022 09:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220621055035.31766-1-bwicaksono@nvidia.com> <20220621055035.31766-2-bwicaksono@nvidia.com>
 <73dafe08-d1f1-90b6-995e-7d38e9e1dce7@arm.com> <SJ0PR12MB567600F730B47F3A1007775AA0829@SJ0PR12MB5676.namprd12.prod.outlook.com>
 <20220712163638.GA2945984@p14s> <632f5c80-2be3-ace5-6b0d-ee0c9e5560ff@arm.com>
In-Reply-To: <632f5c80-2be3-ace5-6b0d-ee0c9e5560ff@arm.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 13 Jul 2022 10:26:34 -0600
Message-ID: <CANLsYkyCcRHad+oGXNRG-rieAu9b386XnGoJUTTgHAMFP28=xA@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 1/2] perf: coresight_pmu: Add support for ARM
 CoreSight PMU driver
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Besar Wicaksono <bwicaksono@nvidia.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        "thanu.rangarajan@arm.com" <thanu.rangarajan@arm.com>,
        "Michael.Williams@arm.com" <Michael.Williams@arm.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Vikram Sethi <vsethi@nvidia.com>,
        "mike.leach@linaro.org" <mike.leach@linaro.org>,
        "leo.yan@linaro.org" <leo.yan@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 12 Jul 2022 at 14:13, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-07-12 17:36, Mathieu Poirier wrote:
> [...]
> >>> If we have decied to call this arm_system_pmu, (which I am perfectly
> >>> happy with), could we please stick to that name for functions that we
> >>> export ?
> >>>
> >>> e.g,
> >>> s/coresight_pmu_sysfs_event_show/arm_system_pmu_event_show()/
> >>>
> >>
> >> Just want to confirm, is it just the public functions or do we need to replace
> >> all that has "coresight" naming ? Including the static functions, structs, filename.
> >
> > I think all references to "coresight" should be changed to "arm_system_pmu",
> > including filenames.  That way there is no doubt this IP block is not
> > related, and does not interoperate, with the any of the "coresight" IP blocks
> > already supported[1] in the kernel.
> >
> > I have looked at the documentation[2] in the cover letter and I agree
> > with an earlier comment from Sudeep that this IP has very little to do with any
> > of the other CoreSight IP blocks found in the CoreSight framework[1].  Using the
> > "coresight" naming convention in this driver would be _extremely_ confusing,
> > especially when it comes to exported functions.
>
> But conversely, how is it not confusing to make up completely different
> names for things than what they're actually called? The CoreSight
> Performance Monitoring Unit is a part of the Arm CoreSight architecture,
> it says it right there on page 1. What if I instinctively associate the
> name Mathieu with someone more familiar to me, so to avoid confusion I'd
> prefer to call you Steve? Is that OK?
>

Not sure how the above helps moving the conversation forward.

> As it happens, Steve, I do actually agree with you that "coresight_" is
> a bad prefix here, but only for the reason that it's too general. TBH I
> think that's true of the existing Linux subsystem too, but that damage
> is already done, and I'd concur that there's little value in trying to
> unpick that now, despite the clear existence of products like CoreSight
> DAP and CoreSight ELA which don't have all that much to do with program
> trace either.
>

Happy to see that we are in complete agreement.

> However, hindsight and inertia are hardly good reasons to double down on
> poor decisions, so if I was going to vote for anything here it would be
> "cspmu_", which is about as
> obviously-related-to-the-thing-it-actually-is as we can get while also
> being pleasantly concise.
>
> [ And no, this isn't bikeshedding. Naming things right is *important* ]
>
> Cheers,
> Robin.
>
> >
> > Thanks,
> > Steve
> >
> > [1]. drivers/hwtracing/coresight/
> > [2]. https://developer.arm.com/documentation/ihi0091/latest
