Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02577C4727E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 17:32:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5D792074B
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 17:32:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHnIsVkQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgI3Rcl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 13:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3Rcl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 13:32:41 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F1AC061755;
        Wed, 30 Sep 2020 10:32:40 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b12so3132735lfp.9;
        Wed, 30 Sep 2020 10:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JE7rBNz3fAbpVUCcAxjlxKk3sByhl6O4kPv4ljqcvpY=;
        b=VHnIsVkQF0lihwBssQWLf+Pu7tPzC5QONVf4BUB+G5RTnlAHTWw5N5qTkvNLp7MPTE
         bCIHXVJJMCzFKau9nV4c+2S/eDcN5dfZKm769aSNghPSLhtsqJSGhM5b9Ar6j6XVZ+2y
         pln4yC4J+s7/eWGYMqxmF0eAU65EQPQcVSGvWd988rolq5qSJaNR0CGWS6OMg0sFP8oP
         PP0qcPUoUEEukz8wv14j6RRgmWENL4pwl9MFbUS13EmkcQvYERWXM4CDVtl0PzLc56NE
         CTQXzFyYiC6FhufdWkkoaFF3bCB/PZLWNSE0PYmfDgInVwF2MNu1UAHmN0okPUUtmbry
         RfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JE7rBNz3fAbpVUCcAxjlxKk3sByhl6O4kPv4ljqcvpY=;
        b=HSJSFaTNSxWqFKLcGarHROpA9PMBraYN+gHBWSHlVdTPHZBp5/MM1x4Up2/E+0El3E
         A4/0Z9F24TiXEmyzOsX5jFzCGiDJjxeT3qnkJYqWYoiMr0ed59mkXGKMdmN8QtxR31Di
         sLqUxiD6lHqfIQ6BLnE7ME3pVmFORFFA/7egfr2zJH0bBUa7Y+WcJsQEdhv2N0iSDZoi
         5548SJ2hJNvistj1br3X+RVlShvRAkIIRnI28GIPdTpYf2zhfNyWeQbFXltzQhU5Y+3Y
         34lp6w5vswfhc5i97LuraY5GemDSS4p2ACLziU5HQiKbt7kc2koD05ydMOqjYx/Ill8k
         YWvA==
X-Gm-Message-State: AOAM531eU7BT63j1tIqoqT9rGAtY5wdK/ShacensE0k2rlYGqF2aofSX
        /5xUJHvt6/v9vfQVPw+F4+6HAVj9T8M=
X-Google-Smtp-Source: ABdhPJzUASOVFi/Kk4L8m9nUPQoSa4qijLEjRQ8iUhedNTqvM198PrBOsczLmapI0GqjFz/R5pD1Sg==
X-Received: by 2002:ac2:4301:: with SMTP id l1mr1148884lfh.389.1601487158733;
        Wed, 30 Sep 2020 10:32:38 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id j23sm214983ljh.96.2020.09.30.10.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 10:32:38 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] memory: tegra: Add
 devm_tegra_get_memory_controller()
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-2-nicoleotsuka@gmail.com>
 <20200930152320.GA3833404@ulmo>
 <ed7b4375-d06e-2750-e6fa-603ef2b60d36@gmail.com>
 <20200930160355.GC3833404@ulmo>
 <839df5d6-513f-3d77-ba5f-a1afe5d0883a@gmail.com>
 <20200930161503.GF3833404@ulmo>
 <29a989b3-a8cc-5c1f-ba12-47ed0d667e8e@gmail.com>
 <20200930163842.GA3852280@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eacbcce4-4574-6b24-9f06-02349ec3092f@gmail.com>
Date:   Wed, 30 Sep 2020 20:32:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930163842.GA3852280@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

...
>> I don't think that the MC driver will stay built-in forever, although
>> its modularization is complicated right now. Hence something shall keep
>> the reference to the MC device resources while they are in use and this
>> patch takes care of doing that.
> 
> It looks to me like all the other places where we get a reference to the
> MC also keep a reference to the device. That's obviously not going to be
> enough once the code is turned into a module. At that point we need to
> make sure to also grab a reference to the module. But that's orthogonal
> to this discussion.
> 
>> Secondly, the Nicolin's patch doesn't pretend on anything, but rather
> 
> Yes, the patch does pretend to "look up" the memory controller device,
> but in reality it will always return a singleton object, which can just
> as easily be achieved by using a global variable.
> 
>> brings the already existing duplicated code to a single common place.
> 
> Where exactly is that duplicated code? The only places I see where we
> get a reference to the memory controller are from the EMC drivers and
> they properly look up the MC via the nvidia,memory-controller device
> tree property.

Yours observation is correct, all the drivers *do the lookup*. My point
is that the nvidia,memory-controller usage isn't strictly necessary.

The tegra20-devfreq driver doesn't use the phandle lookup because
Tegra20 DTs don't have it, instead it uses the compatible lookup. Hence
this patch doesn't really change the already existing behaviour for the
drivers. The phandle usage is optional.

This patch adds a common API that is usable by *all* the already
existing drivers, starting from the Tegra20 drivers.

> But that's not what this new helper does. This code will use the OF
> lookup table to find any match and then returns that, completely
> ignoring any links established by the device tree.

As I already said in the other reply, it should be fine to add lookup by
the phandle and then fall back to the compatible matching. On the other
hand, this is not strictly necessary because we always have only a
single MC device at a time.

Please note that I don't have any objections to improving this patch. In
the end either way will work, so we just need to choose the best option.
I was merely explaining the rationale behind this patch and not trying
to defend it.

Yours suggestion about using static mc variable is also good to me since
currently MC driver is built-in and at least that won't be a
globally-visible kernel variable, which doesn't feel great to have.

I think we can follow approach of the static mc variable for the starter
and improve it once there will be a real need. This should be the
simplest option right now.

But again, we may slightly future-proof the API by adding the
resource-managed variant. Either way will be good, IMO :) Currently I
don't have a strong preference.
