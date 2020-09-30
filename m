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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B439CC4727E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:06:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69B912085B
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFSzWCe1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731217AbgI3QGg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgI3QGa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 12:06:30 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FA9C0613D0;
        Wed, 30 Sep 2020 09:06:30 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c2so2054280ljj.12;
        Wed, 30 Sep 2020 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4gz7hftu8wVBoM2xjJ8sNgXbJ69uPZrDK6qSgjMFO8I=;
        b=hFSzWCe1t/zf7VGo+FfqCZaoM/N2qY5YJVjPZrrragCSJ0GCR0wNhhr5u/xxo/tWTm
         NcgaqdHrXLERvv4almzK8/pq914nCnSiudPKBqkHHqSe5YmKUiPKLgOEH0UcpRMjCFZb
         ILpPyXIxobmb6CVlCLhWwB7qqDGBUvb6JmMV9CAfQ8latiICicceLFFrr/LSRbOFnBRz
         fOEFHGDu8XTrH+lUko8EgIv8aFEW/Me6673r1OR1PgGNtbQm4UguXXS6kdioPrTVUAdf
         v/OrZzPNbiiJ9bU22qt8XjdjfTed+eqe4P/3N/dqANE+FAYkrC93UjbEOKWIKopWSYXv
         DOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4gz7hftu8wVBoM2xjJ8sNgXbJ69uPZrDK6qSgjMFO8I=;
        b=EKh6H6KYcep+kEOpo+1Kno3IM3FG3SaF9GqwgpihhOkPE/L7DtvhSuFm9skgIULn+P
         C9vzbMT1943szrYF+f5F5DoH9zDkhH13hDSjbSm/9evKomY8FrjG6wUHZi4RiEkliDyS
         h55Ha9KfcouRGfpsPeVbrEP3DyHNHpxmg/boWX4AGme4wVq4NrfI+DsTSX6FnzbR97Tk
         HIKyfREupvsOYrEPNF3lQAppdabsGzyneVdowzEcl+Sc6w4V2TKVkyEDeyMaWNBWaVMS
         HAG910UEfGcdF9Eg0AeCYdhlygGJZEyFj+f6bMt03jGI2Cck1XVudY3bwzaUHkAXtrVQ
         NGQw==
X-Gm-Message-State: AOAM532Ga+1phTTIqdmZC3nMIZGeNGerzi4wYElVnT5gss/TsbHm1fTv
        AkpHLNInlBse1vNeB3YmMloIyBoA6Pc=
X-Google-Smtp-Source: ABdhPJySEV3K0WwibW3y87Twid/De/fw/N9Cf01bPjdaok5d/TQT/lVjDYUNqNrOHN6liUWW/eo3Qg==
X-Received: by 2002:a2e:3511:: with SMTP id z17mr1000169ljz.58.1601481988722;
        Wed, 30 Sep 2020 09:06:28 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id l4sm236175lfg.296.2020.09.30.09.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 09:06:28 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <839df5d6-513f-3d77-ba5f-a1afe5d0883a@gmail.com>
Date:   Wed, 30 Sep 2020 19:06:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930160355.GC3833404@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 19:03, Thierry Reding пишет:
> On Wed, Sep 30, 2020 at 06:53:06PM +0300, Dmitry Osipenko wrote:
>> 30.09.2020 18:23, Thierry Reding пишет:
>>> On Wed, Sep 30, 2020 at 01:42:56AM -0700, Nicolin Chen wrote:
>>>> From: Dmitry Osipenko <digetx@gmail.com>
>>>>
>>>> Multiple Tegra drivers need to retrieve Memory Controller and hence there
>>>> is quite some duplication of the retrieval code among the drivers. Let's
>>>> add a new common helper for the retrieval of the MC.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
>>>> ---
>>>>
>>>> Changelog
>>>> v2->v3:
>>>>  * Replaced with Dimtry's devm_tegra_get_memory_controller()
>>>> v1->v2:
>>>>  * N/A
>>>>
>>>>  drivers/memory/tegra/mc.c | 39 +++++++++++++++++++++++++++++++++++++++
>>>>  include/soc/tegra/mc.h    | 17 +++++++++++++++++
>>>>  2 files changed, 56 insertions(+)
>>>
>>> Let's not add this helper, please. If a device needs a reference to the
>>> memory controller, it should have a phandle to the memory controller in
>>> device tree so that it can be looked up explicitly.
>>>
>>> Adding this helper is officially sanctioning that it's okay not to have
>>> that reference and that's a bad idea.
>>
>> And please explain why it's a bad idea, I don't see anything bad here at
>> all.
> 
> Well, you said yourself in a recent comment that we should avoid global
> variables. devm_tegra_get_memory_controller() is nothing but a glorified
> global variable.

This is not a variable, but a common helper function which will remove
the duplicated code and will help to avoid common mistakes like a missed
put_device().
