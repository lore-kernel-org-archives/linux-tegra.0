Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698ADC4727E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 15:27:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A6FE2071E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 15:27:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qny78H6X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730915AbgI3P1F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 11:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgI3P1E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 11:27:04 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD7AAC061755;
        Wed, 30 Sep 2020 08:27:03 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id n25so1955048ljj.4;
        Wed, 30 Sep 2020 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=avlcz2uYKx1b+VN55Q6AvBFDNm1omKfFEfcGhuPQHCM=;
        b=Qny78H6XMz7lcxvDWiKZ+PwEbQfZI29OOhR2pp5WDOr703oXokC9aSWPUCz7uAiYtn
         5KQDtczgPxw4u4WLrFHgU53BM7V98/W59BoVxz52lX/B4q9V1iS1fuKU/D5aTHpdJepu
         t6VjIzYsgqJcsT+zAIP9cC1TvaM/vaXo/rRJrdW0t2j2TpS9hUbZ4invhNItntIOPjcP
         Wl/AtNk6489vzRarbS+lyM4hP+M/4zMBseuq3KBK7FWjGzMHT8uoW0x3MBy0YVTP1O9R
         E+Ez17z9qIgsO75viR3Hy53SNBtUGdBYEoAWMc+1VemYFRsSO91WjaGYD7oYZtiR0U5j
         BgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=avlcz2uYKx1b+VN55Q6AvBFDNm1omKfFEfcGhuPQHCM=;
        b=aIMOh1GVtwRwoztQ8iqCSQoBKVHxUMLJ6+qXZF97nroCO3P/fZNAYF4ASMIPdQyfds
         L5XsfLFshf4EaxCqtLIHZMOReK5T0gSesPXN9KrFn3OPWwBLeFsHFrU7DQ2uydJvsCPL
         CHOxLEvPPrzpWgy0fHiVikl4ew8oLnSe/4adwb4VkK8aox3swnCOcpu/qtGGNSjaXHvr
         w0ExGVs8eEP5DojXmFWuQAtBlIvDtYsj38Zp5Mg74Ygu1uv7i9zt3DR65oyfJ14KgIAg
         pjvoWY5AiQAe6HCeXyP6jOj7zpxNS+wnF4yny9ppslwBCExd7GH7FrF/++NWc5PuJRvO
         UzNQ==
X-Gm-Message-State: AOAM532wcBDqCC4oLGY6rwqjnmQ7hbl9m9vgh8MQTpc2xZ9wgI+0tnIW
        4EUyA6gZVIK4N5hVVqX0PZi1uh1gbkI=
X-Google-Smtp-Source: ABdhPJxMvgL735tNkm0Fw3/FcRPsu/0e29fGVpKIGpyWEiEk7KdQWJlF8NOR/VUpnD4yoVkeZuTa6w==
X-Received: by 2002:a2e:b178:: with SMTP id a24mr943806ljm.276.1601479622062;
        Wed, 30 Sep 2020 08:27:02 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id l29sm227634lfp.11.2020.09.30.08.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 08:27:01 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] memory: tegra: Add
 devm_tegra_get_memory_controller()
To:     Thierry Reding <thierry.reding@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-2-nicoleotsuka@gmail.com>
 <20200930152320.GA3833404@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f1658651-e3e1-388a-1d4c-a7fe04b27251@gmail.com>
Date:   Wed, 30 Sep 2020 18:27:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930152320.GA3833404@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 18:23, Thierry Reding пишет:
> On Wed, Sep 30, 2020 at 01:42:56AM -0700, Nicolin Chen wrote:
>> From: Dmitry Osipenko <digetx@gmail.com>
>>
>> Multiple Tegra drivers need to retrieve Memory Controller and hence there
>> is quite some duplication of the retrieval code among the drivers. Let's
>> add a new common helper for the retrieval of the MC.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
>> ---
>>
>> Changelog
>> v2->v3:
>>  * Replaced with Dimtry's devm_tegra_get_memory_controller()
>> v1->v2:
>>  * N/A
>>
>>  drivers/memory/tegra/mc.c | 39 +++++++++++++++++++++++++++++++++++++++
>>  include/soc/tegra/mc.h    | 17 +++++++++++++++++
>>  2 files changed, 56 insertions(+)
> 
> Let's not add this helper, please. If a device needs a reference to the
> memory controller, it should have a phandle to the memory controller in
> device tree so that it can be looked up explicitly.
> 
> Adding this helper is officially sanctioning that it's okay not to have
> that reference and that's a bad idea.

Maybe that's because the reference isn't really needed for the lookup? :)

Secondly, we could use the reference and then fall back to the
of-matching for devices that don't have the reference, like all Tegra20
devices + Tegra30/124 ACTMON devices.
