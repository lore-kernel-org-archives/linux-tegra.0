Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882DFC433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 22:07:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4332B64DCD
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 22:07:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233215AbhA0WHb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 17:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234345AbhA0WH2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 17:07:28 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6FBBC061573
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 14:06:47 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m22so4875220lfg.5
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 14:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w4UzLpV8aeIvghlGpXTYskzYBALzwvbsPewbvs0UWB0=;
        b=uNq31EBc1MHV0VcDHLVub0/i7Z0pS7OB6tHn+5pTo84LYs/r3KMtS4mMF8gIz4LLFr
         zvY7T5uSQzlMCMno0ehRnLiXn7tlOMOinIuzEBj2Fj8lu6Wgsnr0tnDFL508TuNCyeEC
         WULq60W87WJpMkIrstv+cRNPep7QZDxwOLv/tPzJaQuE51hllbFhGDoZ/ttRseH1ncZd
         B74YRxJz9ClvpUST0oi6e3mQxj3HhrznXBzfV+ZhPuOUkj/Emk/CHYSq1HqjkU5vwiha
         V2jCjSQotlcN6VWu+3A6Z0IHJkKLz4LhAEMTYb0sftPB+FOYQu/Js/3ljPEMN/4NpMOI
         5Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w4UzLpV8aeIvghlGpXTYskzYBALzwvbsPewbvs0UWB0=;
        b=L69aTphQCx4K1rp6rW6uaxvrtifEf9gSUvJwK/YdmcluPfiKTyLhUEJHcMfQApOqUc
         ygGylVMA912mBHq0YIsu1bGVJrbumA7S+yIdVo6myGaJkgUUoo1Fko7cFwP2RGjCUS/x
         4oPi7r6vGOr5vUwnRQnRvPhRkMBoKzXXRaB2hGFDyPYvxq9fvNrORKIGfyIuvGUIkILF
         glsa1HSBWE/bfKW92j1SaT/bX1p0/KeqHP6RwuSmKVFFOAMIG//xR6muNcK5pV54uG5h
         9oHigxPYLIqlZPuzEqVEykRqucobXADMB45p76wmiwrGpir9isUP6vZsAyg71LThbWrA
         mQcg==
X-Gm-Message-State: AOAM532wi0N13oBioEf+JubdObbuFUqdEMvmQLKNlHVtTrU2PxrGvoMf
        B2t/h4/u6VVolmCJcRwOBR4=
X-Google-Smtp-Source: ABdhPJw1hofd9fLlol38qlFI48ZZMLmBA4ldPwxc4kQMLljkdKlyBtH4c1m0aYzMiMFzZG9cLI0u3A==
X-Received: by 2002:a05:6512:224f:: with SMTP id i15mr6174387lfu.545.1611785206351;
        Wed, 27 Jan 2021 14:06:46 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id 24sm848983lfy.32.2021.01.27.14.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 14:06:45 -0800 (PST)
Subject: Re: [PATCH v5 00/21] Host1x/TegraDRM UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <638c1aeb-921b-0ea2-5258-16c6d3183306@gmail.com>
 <9f755e95-97fc-4f57-5e8d-426af589c857@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <007d123f-526a-c68a-3c52-aba165172cdf@gmail.com>
Date:   Thu, 28 Jan 2021 01:06:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <9f755e95-97fc-4f57-5e8d-426af589c857@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.01.2021 00:57, Mikko Perttunen пишет:
> 
> 
> On 1/27/21 11:26 PM, Dmitry Osipenko wrote:
>> 26.01.2021 05:45, Mikko Perttunen пишет:
>>>> 5. The hardware state of sync points should be reset when sync point is
>>>> requested, not when host1x driver is initialized.
>>>
>>> This may be doable, but I don't think it is critical for this UAPI, so
>>> let's consider it after this series.
>>>
>>> The userspace should anyway not be able to assume the initial value of
>>> the syncpoint upon allocation. The kernel should set it to some high
>>> value to catch any issues related to wraparound.
>>
>> This is critical because min != max when sync point is requested.
> 
> That I would just consider a bug, and it can be fixed. But it's
> orthogonal to whether the value gets reset every time the syncpoint is
> allocated.
> 
>>
>>> Also, this makes code more complicated since it now needs to ensure all
>>> waits on the syncpoint have completed before freeing the syncpoint,
>>> which can be nontrivial e.g. if the waiter is in a different virtual
>>> machine or some other device connected via PCIe (a real usecase).
>>
>> It sounds to me that these VM sync points should be treated very
>> separately from a generic sync points, don't you think so? Let's not mix
>> them and get the generic sync points usable first.
>>
> 
> They are not special in any way, I'm just referring to cases where the
> waiter (consumer) is remote. The allocator of the syncpoint (producer)
> doesn't necessarily even need to know about it. The same concern is
> applicable within a single VM, or single application as well. Just
> putting out the point that this is something that needs to be taken care
> of if we were to reset the value.

Will kernel driver know that it deals with a VM sync point?

Will it be possible to get a non-VM sync point explicitly?

If driver knows that it deals with a VM sync point, then we can treat it
specially, avoiding the reset and etc.
