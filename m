Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B4BC433B4
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 13:20:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AB21600D4
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 13:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346765AbhESNVW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 May 2021 09:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353571AbhESNVV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 May 2021 09:21:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C78CC06175F;
        Wed, 19 May 2021 06:20:02 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a2so18999672lfc.9;
        Wed, 19 May 2021 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K0tyFpLNzaxBLTrHlN/nxnuC6O2P+PiZwClq7ZqWBaM=;
        b=mqWWHjRZOghl8Z76kF+UyaEuEdY9mINqCmF9GBzGn4E5R1ojPV/v1mUhYAHOuv0qNc
         vpOp59VpbwxswUFAeO3r0hzEC6ScaBwSlbD0LoSUMx0vDP1bViiAumgeBjDfPM5apLWi
         n5HdU09HXaaB8y1QtfLllNeOcWVMpb5DLm/tfDAfzT3lFkrTFhECBq5Yw5bYlylfRP+Z
         Ji/pgEAnO3YKsPFR3WdBEw0fkGSoIXERvmbhZdwUnpR31dLW+f29qMSBDpy1V4CfPDsy
         F54rTpLeA44phJL3SIemAOeKLjJbVTsQ85xgmMJYlBENkgwfs4AzjWIfbqbde2YP2Ywo
         bwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K0tyFpLNzaxBLTrHlN/nxnuC6O2P+PiZwClq7ZqWBaM=;
        b=BzQroi4zX1Ev2/lJDXKYteq7mm6pp8902X5r59coF6wEAYX9nX2FRNKLqNB/eCIm2h
         moRU1XZ77s/vtwOJUXLytRk3penRSyy/5BQu53RdgPxGV74RJgIn7ypnXRVxMAUVMUNV
         uVomuhMI8hIaQwSWJQHVvZE2d0o/HcUQitxiWczJ44hbWSkYdZRYKghHvd2axzcN4Zpz
         9qFWIX5iuQednaVkhPrE6Yuq9nhIfRFF+bicUkoz7NsVjicqfTQjgjtw8wrcvTVpLa9D
         vKWupyi07x9I6sCUZ/koSMrA0zd8AwVY+CWkXrebn3AWcb7nCS2ea1bdRakAY9koBVwH
         uCKw==
X-Gm-Message-State: AOAM530pFE76yl05UMzRh2ieXkQmpF6UF2dslH8VdUWP49C6P1gDVd25
        EDqBM5v3+oLFc1wf3Sj5yQ8=
X-Google-Smtp-Source: ABdhPJyHl3qOihv/iXmc4cZoDNOJr2jrkCw3AxpksFtYZPExomt097pp4S/ac07ioJGNxmW5qvVP2g==
X-Received: by 2002:a05:6512:b98:: with SMTP id b24mr8475964lfv.216.1621430400378;
        Wed, 19 May 2021 06:20:00 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-55.dynamic.spd-mgts.ru. [109.252.193.55])
        by smtp.googlemail.com with ESMTPSA id t15sm3773514ljk.99.2021.05.19.06.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:20:00 -0700 (PDT)
Subject: Re: Question about Tegra UCMs
To:     Mark Brown <broonie@kernel.org>
Cc:     Jaroslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>, Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
 <20210518180949.GA949047@robh.at.kernel.org>
 <20210518183455.GE4358@sirena.org.uk>
 <92cef674-c454-e08c-b44d-d8c08b1e8ccf@gmail.com>
 <20210519113805.GA4224@sirena.org.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2da02135-2173-fb63-474f-aa63ad6f4a90@gmail.com>
Date:   Wed, 19 May 2021 16:19:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519113805.GA4224@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.05.2021 14:38, Mark Brown пишет:
> On Wed, May 19, 2021 at 01:31:28AM +0300, Dmitry Osipenko wrote:
> 
>> Mark, could you please help me to understand the UCM naming scheme that ALSA uses..
> 
> I have no real idea, sorry.  Most of my userspace work has been with
> Android which doesn't use UCM.
> 
>> IIUC, the "ucm2/Tegra/codec_name" scheme [2] that the current ALSA UCM
>> uses simply doesn't work at all. Is there anything on the kernel side
>> that I could change to get a working naming scheme? If yes, I may try
>> to do something about it in the v2, thanks in advance.
> 
> Could you elaborate on the way in which it simply doesn't work at all?
> I'd expect there to be something in there that first tries to match on
> something to do with the specific hardware platform to take account of
> plastics differences but that'd be a userspace change.

I also expect that there should be some kind of fall back matching, but
I don't see it happening. I will work with Jaroslav on this trouble.

> Please fix your mail client to word wrap within paragraphs at something
> substantially less than 80 columns.  Doing this makes your messages much
> easier to read and reply to.
> 

I turned off the word wrapping for that email to make it more readable
in a generic email clients since it contained long lines which shouldn't
be wrapped.
