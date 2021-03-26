Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E96C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 16:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CDFD61A27
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 16:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhCZQ4B (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 12:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbhCZQz7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 12:55:59 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB674C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 09:55:58 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id f26so8143745ljp.8
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 09:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lhyOjxCs+l3MNv905gvs5Nsa/THv4syTxxBwZP4KE3k=;
        b=s1LmS7BwlxUC5fYMpsY/r5C0k4N6uMyMEUBhMb17FwH4VuESuMHAMS+KHxbscsX19N
         i4xsWCLrCi+OI7Bid2JBoFbyPFGc5h2P8lh2A6GVQqGP+zv95VqHmvO07Iv5aehTID9i
         7W2rceZ6u8ep51Mhbji64UpFRI8zxu2QDAzy/tG/dsVL179EvspQNrqNe1GrZ0ghrYQl
         hckCvtWHouLxJS+QsUL4MuFUAGgy4ATUv2Oo3Cta5KdURJ53AVSf5pQzVWfMpxztFCrI
         YzEqH2ajthweRg/ivIiA0k2nJIHYXGGTEafm6/a7Plbe75862iA6ctEzGlRzDmslkQ9R
         PnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lhyOjxCs+l3MNv905gvs5Nsa/THv4syTxxBwZP4KE3k=;
        b=YPKrKbolhH98v3hqIBUlEXrXdo2rBxt6563r+ZHyxAoAkrZU6VgjfsYgyomPzOdcE2
         jdS1JrrazfcmLb45vPEAIAZbEFpuqg2Xhohf/BQt8nuC0WkZHrjTduO3uOAWEa/vq1IG
         0NjneRafeU20IJA3XTqEMhv7wm9m0/Bh60kYmIPx+SLfC8xgP3RWDyhZxnPYOoO9BDXH
         GPhNWXD8vZ0XFBLVEfVuGgAH/I5APpGTZsFEhxA5uZn/N/PEwmKEidwQAghB45THXDI1
         f5A5BvNIhDsx4CTL8S+N7kLSVtLhGijDvn3g8/0xPtd50MzEckZwfSyfIeBVZAKbDm6+
         fvCw==
X-Gm-Message-State: AOAM533dFLiJXj1WLtzRIf//6VvMNAf4rvQ5KOvq0TDlw9ZMAlpQmd6D
        wVxWdotmPHvNLSkTqdQi5Os=
X-Google-Smtp-Source: ABdhPJxK3x5g1sh4ng3XERSxCJLJcMj4mSTpotrlnRxwSesJwLiNTIVymxaoExRzGAnlMWjU9yZeMQ==
X-Received: by 2002:a2e:8e36:: with SMTP id r22mr9826222ljk.427.1616777757503;
        Fri, 26 Mar 2021 09:55:57 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:99a9:a10:76ff:fe69:21b6? ([2a00:1370:814d:99a9:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id x13sm1232656ljj.4.2021.03.26.09.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 09:55:57 -0700 (PDT)
Subject: Re: [PATCH 0/9] arm64: tegra: Prevent early SMMU faults
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        iommu@lists.linux-foundation.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <197876d1-0046-f673-5d3e-818d1002542b@gmail.com>
 <YF4NQPee+/Qi6zVd@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9f1a8455-f7a6-1f66-f36c-032abacf71f5@gmail.com>
Date:   Fri, 26 Mar 2021 19:55:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YF4NQPee+/Qi6zVd@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.03.2021 19:35, Thierry Reding пишет:
> On Fri, Mar 26, 2021 at 06:29:28PM +0300, Dmitry Osipenko wrote:
>> 25.03.2021 16:03, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Hi,
>>>
>>> this is a set of patches that is the result of earlier discussions
>>> regarding early identity mappings that are needed to avoid SMMU faults
>>> during early boot.
>>>
>>> The goal here is to avoid early identity mappings altogether and instead
>>> postpone the need for the identity mappings to when devices are attached
>>> to the SMMU. This works by making the SMMU driver coordinate with the
>>> memory controller driver on when to start enforcing SMMU translations.
>>> This makes Tegra behave in a more standard way and pushes the code to
>>> deal with the Tegra-specific programming into the NVIDIA SMMU
>>> implementation.
>>
>> It is an interesting idea which inspired me to try to apply a somewhat similar thing to Tegra SMMU driver by holding the SMMU ASID enable-bit until display driver allows to toggle it. This means that we will need an extra small tegra-specific SMMU API function, but it should be okay.
>>
>> I typed a patch and seems it's working good, I'll prepare a proper patch if you like it.
> 
> That would actually be working around the problem that this patch was
> supposed to prepare for. The reason for this current patch series is to
> make sure SMMU translation isn't enabled until a device has actually
> been attached to the SMMU. Once it has been attached, the assumption is
> that any identity mappings will have been created.
> 
> One Tegra SMMU that shouldn't be a problem because translations aren't
> enabled until device attach time. So in other words this patch set is to
> get Tegra186 and later to parity with earlier chips from this point of
> view.
> 
> I think the problem that you're trying to work around is better solved
> by establishing these identity mappings. I do have patches to implement
> this for Tegra210 and earlier, though they may require additional work
> if you have bootloaders that don't use standard DT bindings for passing
> information about the framebuffer to the kernel.

I'm not sure what else reasonable could be done without upgrading to a
very specific version of firmware, which definitely isn't a variant for
older devices which have a wild variety of bootloaders, customized
use-cases and etc.

We could add a kludge that I'm suggesting as a universal fallback
solution, it should work well for all cases that I care about.

So we could have the variant with identity mappings, and if mapping
isn't provided, then fall back to the kludge.
