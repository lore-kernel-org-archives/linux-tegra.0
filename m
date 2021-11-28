Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717AAC433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Nov 2021 21:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359269AbhK1VRd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Nov 2021 16:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238256AbhK1VPd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Nov 2021 16:15:33 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5C1C061756;
        Sun, 28 Nov 2021 13:12:16 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id z8so30605009ljz.9;
        Sun, 28 Nov 2021 13:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lilqoZy8e6A7KMDRW1iz9itZAyY0GoMETvcZuSaTU0M=;
        b=dZw6p7rCW1rDkyKoDdOTaNzzZfsR7NWOHR/qfKuR1DAt/RhnCRBRGojOWhDw+3WWoZ
         p4f+9g8Amvjzxc9xacK4TsRbazRgaCnNFEayYyryT5O8dD/bETbjBPHoG0d2HLBZojWI
         tfvGrHOLONzGjeZgFSn/y5NBVNUTU/KzfSCjakYMI1W0692v3nts3CLhByjpKsPa3ndg
         AHy1EWgC/OV2Rkev5MGSjlkuAFndVoyZ8QAh6WyG+Bba9F+IaCCrxdNkWUPyrFRKIdh2
         VbvLfFgBeMqg2NHVHykH1sElAg9wkWDX/LnGZ1ymx9OSm5nMogboHEBsaIQl5+BDNYDV
         1lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lilqoZy8e6A7KMDRW1iz9itZAyY0GoMETvcZuSaTU0M=;
        b=MRiEq81wqUyu9YGEZxQmghIDj+MSzz0CvCNQGBnCHndPpolkZMgZW2tT8ITz8EDXz6
         G8k0oF/CP2uxlPueJh+ssgMOWjLi0GqDFbEivXD4Werpu/GErP8hMf0SYSHlydmcYCDr
         PHX4uP3CeCIvzXQu1AwscThKVql02r4fta2TC/JHonrINkGCpc6IjjPxNsbLyDJbYLcs
         lsLE061BVh0tXZKKy9pQWteh3aEV9HMjTxPRXW++D8sC+4Bm/Cc4vtqoyikn6EtJViD5
         iiMC6dsIg3S3abU/Z38Nack3ehZZdspB5fkU5E4+cO7663KQD+4Jq7eUUfaXJ/zbuxE2
         JiqA==
X-Gm-Message-State: AOAM530RKGqqSNsxtNNgvOs/nD+Zwe1wdUhLFShH9rl/sYDTk16hGjpH
        mDGvsTgDBVe/42Up6KkVYqqwdnN27o4=
X-Google-Smtp-Source: ABdhPJzrsusHafFXTuug+S9e2vr5aXPJIDM8qQwEMHbrAPJ8OQCz1qjxKlIRVbGqagyhp8b1Hbob7A==
X-Received: by 2002:a2e:a726:: with SMTP id s38mr46575529lje.415.1638133934428;
        Sun, 28 Nov 2021 13:12:14 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id h18sm1166998ljh.133.2021.11.28.13.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Nov 2021 13:12:14 -0800 (PST)
Subject: Re: [PATCH v3 03/14] ARM: tegra: Add labels to tegra114.dtsi
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Nikola Milosavljevic <mnidza@outlook.com>,
        Ion Agorria <ion@agorria.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211127142327.17692-1-digetx@gmail.com>
 <20211127142327.17692-4-digetx@gmail.com> <YaLcF9PxYUj8v3uj@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <710f7d45-2e04-9b51-1c2b-7ec4b34e9f8a@gmail.com>
Date:   Mon, 29 Nov 2021 00:12:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaLcF9PxYUj8v3uj@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.11.2021 04:32, Michał Mirosław пишет:
> On Sat, Nov 27, 2021 at 05:23:16PM +0300, Dmitry Osipenko wrote:
>> From: Anton Bambura <jenneron@protonmail.com>
>>
>> Add more labels in order to use label reference in device-specific
>> dts files. Labels make device-trees more readable and prevent typos
>> that are difficult to notice.
> 
> I believe that you had also a similar patch for Tegra3 (or my [1]).
> Could you pull it into this series to make the DT's easier to manage?
> 
> [1] https://rere.qmqm.pl/git/?p=linux;a=commitdiff;h=2c3341163b07d94d209680a22286608d0e4d711a

I had a thought about including it in to this series, but we don't have
a user for that patch right now, so I decided not to include it.

I'll reconsider to include it into v4, now that you're asking about it.
It won't hurt to have that patch, but I really would want somebody to
add a similar patch for T20 and then convert all DTs to use those labels
uniformly, this will take some time and effort to type these patches.
