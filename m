Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8288FC433B4
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Apr 2021 14:41:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 643BE610F7
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Apr 2021 14:41:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235670AbhDBOlb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Apr 2021 10:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235584AbhDBOlb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Apr 2021 10:41:31 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAB2C0613E6;
        Fri,  2 Apr 2021 07:41:29 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d13so7879596lfg.7;
        Fri, 02 Apr 2021 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IsX2fSpKSdiwRPQlQlIkNhzwSN2iZpEukx+GE8vH9qg=;
        b=fFDfjIFUquAmZhBi79ZzBpPk8+pSX5NyVymkZyitmoi8HBcBpJOZk6E0VXmiwNT24h
         1I2ySRqqaoLzP96y6aDYdBYayiybVzEmPuYuQWr4UyKWtwzfUTt6q58ekkwqJ6S1Tu54
         FdWi856BHZtiMeNf9djvldoC41p1vhRHr115ksgkBOTI6aW+ade4OTNp10viyhYyyWh6
         gVe57qpwV0m5wEUH8+CsHWXpZZ3pWazL9nmkZ70HMERVlIRFpGyDEXBPmf8dXC5r0wmX
         ixrIMy95017vGsprcoRWBrHgbedvXjdqZHkqdAaA2+rbLd/2obfXgHGouQQDbQnWJwOj
         PZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IsX2fSpKSdiwRPQlQlIkNhzwSN2iZpEukx+GE8vH9qg=;
        b=HKD5ToiK3E07uGiJF2be6z9Ha+9HdfC63ZUNnCp95uK+mavc0BZYPKQOMn6CMaGQbq
         8dUrYVK4azq3xpJhQL6LHUnXpUj2jS9yRP+RzXMhc7LYJlM+MVgyCc3Sd7TWXjacLoW6
         leADibXygD4cnqF4AD9mAAn0EZiS7vrB1QuTZeUGWkW3LWTMFnrUEOiMtAjMv+ofa/am
         Sr9FQJJYd/yqzUm6fcX3WJ5zgRBWJ8ByevQLdvRQGgbtxcjfX7/w52uy25gXMTw9XPbs
         Zc850ufzolPhri/QxoRYBehjFGHCePuARvbGHhaFF34nqfp8hKjawwocGHU48U4f93kP
         kDHA==
X-Gm-Message-State: AOAM532jTlEjY+syTia4piFkPL3hXMOe+Ufuet6AY/96avW7eXNGYe3p
        kJ0TQPh2PWtgTEO/bNJhjfMGGbcZVTk=
X-Google-Smtp-Source: ABdhPJwwoUZvVSq/hePy5G963Ex3XoRDx03nWyTsTGIxWHYwZG/Fs5XTPo/9Yv99F31iN3SgR4Kx/w==
X-Received: by 2002:a19:5008:: with SMTP id e8mr8987591lfb.571.1617374488127;
        Fri, 02 Apr 2021 07:41:28 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-85.dynamic.spd-mgts.ru. [109.252.193.85])
        by smtp.googlemail.com with ESMTPSA id x19sm878929lfr.198.2021.04.02.07.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 07:41:27 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] iommu/tegra-smmu: Revert workaround that was
 needed for Nyan Big Chromebook
To:     Nicolin Chen <nicoleotsuka@gmail.com>,
        guillaume.tucker@collabora.com
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210328233256.20494-1-digetx@gmail.com>
 <20210328233256.20494-2-digetx@gmail.com>
 <20210401085549.GA31146@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <50a7e4c7-0e72-534a-a317-366e455213c1@gmail.com>
Date:   Fri, 2 Apr 2021 17:40:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210401085549.GA31146@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.04.2021 11:55, Nicolin Chen пишет:
> On Mon, Mar 29, 2021 at 02:32:56AM +0300, Dmitry Osipenko wrote:
>> The previous commit fixes problem where display client was attaching too
>> early to IOMMU during kernel boot in a multi-platform kernel configuration
>> which enables CONFIG_ARM_DMA_USE_IOMMU=y. The workaround that helped to
>> defer the IOMMU attachment for Nyan Big Chromebook isn't needed anymore,
>> revert it.
> 
> Sorry for the late reply. I have been busy with downstream tasks.
> 
> I will give them a try by the end of the week. Yet, probably it'd
> be better to include Guillaume also as he has the Nyan platform.
> 

Indeed, thanks. Although, I'm pretty sure that it's the same issue which
I reproduced on Nexus 7.

Guillaume, could you please give a test to these patches on Nyan Big?
There should be no EMEM errors in the kernel log with this patches.

https://patchwork.ozlabs.org/project/linux-tegra/list/?series=236215
