Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B03EC10F09
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:29:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40E9822CAD
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391209AbhASRcr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 12:32:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391136AbhASRci (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 12:32:38 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BB1C061574
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 09:31:57 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id f11so22843103ljm.8
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 09:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zPc1wezNWEcHbXD9oWjhEsUhtkAJ8GQjtaN8U14txbA=;
        b=n3RPvpZP3zlOrWdFtVWA9NI+nXuoYLnvS88ihv3mbVSJIgHIOIfFwwwwXW2WHL1WEq
         FWdBg71nY16Y8SKOoK6O+gtbwC1fn8KJk9H7ZI6VRXeBKwg3yzqzktW7jhjGldjCoMWp
         gHrQVVko0HhFiMeICpp2+95E5YurOAoffvxcPM6SireRf4e3IoG2NE3E1QvgPT79qjBC
         RauaRhDZHxGdY/ildwvQDm+/JYvd4CquABWRaELvZKTG1TjGbARemVV/uDql9vOE7Yzd
         ll0LyFiE6EyGn1VjFvsJxYHMHWtFCVp/+hJm1MfhQHP38S0FJMtEkeDlQ0u8Klf/xX5t
         AtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zPc1wezNWEcHbXD9oWjhEsUhtkAJ8GQjtaN8U14txbA=;
        b=COcAjJKjCKrFIUJ61MRKanLX1wCKOxKxRGYip/fcIk1fwFhknXJaktfKaBagk7onzU
         zmCsqW1pPWQxPZOWH5FWL0E+S6cY8u1kNyfue9zZ4MNUkktq7JPX6BF6IQtqAvZsIRZc
         C1N3+bcc8E9ymJcaZKedZwh890XhjyHPr+eRvLVgWRNlHwyhYz4ufWpioCxI/rxo6hzL
         K59nEdHTP4ZREjE1JJSpQeO7jOACrjWD/sIhuTrUNubhzAb7Gh1o4YSLU3+PboOHw0JO
         TI/dFJaNIFxF42fqrqAAgleSpz/UVhOuwe7UrORy1D3Sd4/HKw4V0vOTYvjOzXEnDoE8
         8C/Q==
X-Gm-Message-State: AOAM530GVYrW1DVP+Bp3PyqsFx/M3WyDfp7MGOYz4oIVYty6d3t8Qa7h
        kVzaSlzjmaZojnuIGJmFcpS0gnDNzF8=
X-Google-Smtp-Source: ABdhPJxVS0j5/MI25PJkxVP8K7yTl+RZjNhXGQKjXGsiLr7LGPq/MtHFV0tu2bsJRJpHefJMmPUFyA==
X-Received: by 2002:a2e:888e:: with SMTP id k14mr2387140lji.285.1611077515503;
        Tue, 19 Jan 2021 09:31:55 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id l3sm2326933lfd.119.2021.01.19.09.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 09:31:55 -0800 (PST)
Subject: Re: [PATCH v1] ARM: tegra: Don't enable unused PLLs on resume from
 suspend
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org
References: <20210112135031.3196-1-digetx@gmail.com> <YAcV5WX+VPfq5y1y@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <208897f1-6ee2-dcea-4234-fcb9d957fab9@gmail.com>
Date:   Tue, 19 Jan 2021 20:31:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <YAcV5WX+VPfq5y1y@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.01.2021 20:24, Thierry Reding пишет:
> On Tue, Jan 12, 2021 at 04:50:31PM +0300, Dmitry Osipenko wrote:
>> PLLC and PLLM are usually disabled on system suspend because all devices
>> which use these PLLs are either suspended or switched away to other clock
>> source. Don't enable unused PLLs on resume from suspend by keeping track
>> of the enable-state of the PLLs across suspend-resume.
>>
>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
>> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  arch/arm/mach-tegra/sleep-tegra20.S | 38 ++++++++++--
>>  arch/arm/mach-tegra/sleep-tegra30.S | 94 +++++++++++++++++++++++------
>>  2 files changed, 108 insertions(+), 24 deletions(-)
> 
> For future patches with this many tested-bys, can you collect a bit of
> information about where these were tested? That'd be a good way to get a
> better understanding of the coverage and a good way to collect a bit of
> information about what devices are being used.
> 
> I've seen a pattern like this used sometimes:
> 
> 	Tested-by: Name <email> # Board that was tested on
> 
> So perhaps we can adopt this for these cases?
> 
> Applied, thanks.

Okay, for this patch it should be:

Tested-by: Peter Geis <pgwipeout@gmail.com> # T30 Ouya
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # T20 PAZ00 and T124 TK1
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # T30 Ouya
Signed-off-by: Dmitry Osipenko <digetx@gmail.com> # T20 A500 and T30 Nexus7
