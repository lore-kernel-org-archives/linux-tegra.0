Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D773C47080
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:44:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 745BE610C9
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbhFARqD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 13:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhFARqD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 13:46:03 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557E5C061574;
        Tue,  1 Jun 2021 10:44:21 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id i10so11067185lfj.2;
        Tue, 01 Jun 2021 10:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sptds5+nmUjMz5WSZykG6yT08EhbN0cTXQfwU+dolb8=;
        b=vAwZkaGkcW5IdFnf6/QkWmZzuJpSH9INFalf6LBxStpLC6Q7MzPlkthNFATTKVcixA
         btbkR8z6g051uD7ahfCzRtU7hveYQ2iGzkZ/sU7GPinua1UH15mViuJyvzEqHRq7HVMv
         NndzbnBEGXZ8XcYkdq9ig1ASzNQRUwQNIfYtxwtzqNOJ9kY6fVyIWIQZdhSZ11KIclYQ
         tjcLgc4cyL9xg/ZyFJmxbmmsl0t/wWcgi0FNg8fH6kYtC7Q/+TQBV2MzFXo+6v+Oi5Dn
         03rFXGxYqJm8ZmHUcIqrGPvgQpYyM4Kt+qXEPJo3w7eySRUvWCsR1v8yA1jZNE7yzaKQ
         Tvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sptds5+nmUjMz5WSZykG6yT08EhbN0cTXQfwU+dolb8=;
        b=LzHRmGSFoB8smVh0D/ashtNlYJkj6Qj4nWF9h9F1cMrS84hEmNsmRW61zNAG8+i4fM
         xXUA8Kmx0W2BVNQzSduwodoZniY1dbnlPenyWOaFW46gahq6q/hg2mjg+MVt08BMBEXP
         8/+4NXaJSfnfrIrqO4AQ2zj2uVJsIBAnH8FVoTQquUnm1w+o+OTREzBubn5yQpIm5s15
         sHw465xe/N3DF293oP59myKBa27RR3uDP0yUvJh5pRRKCafm6fYqLEB3BrdQzfXYd79M
         aIsxcufHvBJCOTym7flquROf0rqxOHFqEvPCtl8a7ZUK/7pMr/d3kvip7Tg+vUhqFOM/
         pcVw==
X-Gm-Message-State: AOAM531797em+hayEtGcWF6riO73KHBdRpng9LQRXukQ56uT8Wl3px54
        nHlqQiF1axLYdDqpSbkqAZru2v+BabM=
X-Google-Smtp-Source: ABdhPJx5NbShuKhjIAMDZtDNQiq4g8ZpD8ma8TpVlyNVRH5ohaeyMK3qv1ChOz+eUj1I5OmzvvUFeQ==
X-Received: by 2002:a05:6512:3483:: with SMTP id v3mr6111459lfr.154.1622569459499;
        Tue, 01 Jun 2021 10:44:19 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id a25sm2091581ljp.11.2021.06.01.10.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 10:44:19 -0700 (PDT)
Subject: Re: [PATCH v1 04/10] ARM: tegra: Add reg property to Tegra20 EMC
 table device-tree nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210510202600.12156-1-digetx@gmail.com>
 <20210510202600.12156-5-digetx@gmail.com> <YLSpCXNtut3z8U9a@orome.fritz.box>
 <1ab11cc8-b45a-0c2d-c0c4-fa5779756c05@gmail.com>
 <YLYZHPpjZB9amRBW@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <056fed54-b075-443b-a445-ede45bc8eb54@gmail.com>
Date:   Tue, 1 Jun 2021 20:44:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLYZHPpjZB9amRBW@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.06.2021 14:25, Thierry Reding пишет:
> On Mon, May 31, 2021 at 11:45:19PM +0300, Dmitry Osipenko wrote:
>> 31.05.2021 12:14, Thierry Reding пишет:
>>> On Mon, May 10, 2021 at 11:25:54PM +0300, Dmitry Osipenko wrote:
>>>> The reg property is now specified for the emc-tables nodes in the Tegra20
>>>> device-tree binding. Add reg property to the EMC table device-tree nodes
>>>> of Tegra20 board device-trees in order to silence dt_binding_check warning
>>>> about the missing property.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++++
>>>>  arch/arm/boot/dts/tegra20-paz00.dts             | 1 +
>>>>  2 files changed, 5 insertions(+)
>>>
>>> In retrospect we should've just used "reg" in the first place rather
>>> than adding the custom "nvidia,ram-code". It's a bit redundant to have
>>> both of them with the same value. I wonder if we should deprecate the
>>> use of "nvidia,ram-code" and at least make the code look at the "reg"
>>> property first and only fall back to "nvidia,ram-code" if "reg" does
>>> not exist. We probably won't ever be able to get rid of the fallback
>>> for backwards-compatibility reasons, but at least that would make the
>>> intent a bit clearer.
>>
>> This may be not doable. We have Asus TF101 which doesn't use RAM code
>> for the memory identification, instead it uses LPDDR chip info [1]. I
>> will send the LPDDR patches later on.
>>
>> [1]
>> https://github.com/grate-driver/linux/blob/master/arch/arm/boot/dts/tegra20-asus-tf101.dts#L1115
> 
> That DTS defines both "jedec,lpddr-manufacturer-id" and "reg" with the
> same value, so we could simply use "reg" there. If you plan to support
> the JEDEC properties, we'll have to add code for that anyway, so there
> is no downside to first trying "reg". 

At least in my mind the reg property is associated with a hardware
register. Changing the purpose of the reg and removing the verbose
properties should create confusion for anyone who looks at device-tree
and not familiar with the binding.

The current main purpose of the reg is "Either an opaque enumerator to
tell different tables apart or the valid frequency for which the table
should be used (in kHz)", like the binding says. It should be better to
keep the reg optional and additional, especially if we will give it
another meaning, IMO.

> And we may not even need to add
> support for any of those JEDEC properties if we can just use the "reg"
> standard property in the first place.

We will need all those JEDEC properties for identifying memory chips,
including information about chip version and h/w geometry. This method
of matching is borrowed from the official downstream kernel of TF101,
apparently board designers decided not to use the RAM code.
