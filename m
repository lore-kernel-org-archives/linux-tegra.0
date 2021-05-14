Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292B1C433B4
	for <linux-tegra@archiver.kernel.org>; Fri, 14 May 2021 22:18:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F410061454
	for <linux-tegra@archiver.kernel.org>; Fri, 14 May 2021 22:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbhENWTR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 May 2021 18:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhENWTQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 May 2021 18:19:16 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D378C06174A;
        Fri, 14 May 2021 15:18:03 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h4so530356lfv.0;
        Fri, 14 May 2021 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sSuwnMJwt5TkKzd21q3ncqH2PcAU+59JiCcaK8Su3ls=;
        b=jdjutopzVNNN7D++SEKeSXxMHEWc3CSDfc5/qC9F00pLkzjPx67A8PBghXQruxJVnI
         lMIzQig/xUAPi520/jVmaj/zX/2Y7etTp0dnKZvP1vXVIBnv6ioG2EQ3/FDgwD1Y9cYi
         F270hOlCRFN2LtBBLTEbBD44j2EZyRwP7lEgheBYSMVdrxIUhitEGFAqSbzbAr06mvmE
         /ZAYKsSyzOAvL2kyjBBBYxwInJeK0+G1WB6UXEj2YX1nPbspDeXMw/aQKTNUO6jcrej9
         m2g0il3U3pVWqpFpoPdqHzFcQha3H81XOYGujmqAJKf9EfldgfNP7y4x50Vk1+KEz1LF
         oyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sSuwnMJwt5TkKzd21q3ncqH2PcAU+59JiCcaK8Su3ls=;
        b=P2oajS2AVfRv9d/pmPNhK31sBdzu1aS7oSPR4MSgQWpinuptJ07CcYj654uozIBuzt
         +9oC68h4ikTDbAv2mAe21CxqtLw8ZkiR96Ihfwmozx2DUg2HQwltg8Fjq3QhkB4rZ1oN
         i2kGmItHOlhvTGwIFFsTKbEbmJswBiqeiALcuKz8L0vQb7hBnhqYQ5IubunHYwB6wjd1
         hR95Bn7r8Ky5LJ4tXHn2KBRPS6qskoUT+IrdHn8sXlHcVFX9yxx2BkC6B35l+lelF5tq
         CyuS7IbCUkpZYFLuYW4BEs0yTV1C/D5cS97+atFLM3rGGfEtR3/Ewc1X2k7b5pZ8RLa+
         valw==
X-Gm-Message-State: AOAM532CP0OyCuNAo89ePuCsySkv7uq1CBe+iq+nRuxstdilImpgmAX/
        go1Y9dyobW/HGACEv5fOsK5fa7N7OeU=
X-Google-Smtp-Source: ABdhPJx6s2KmvRqKK5Sx3043r+5lEkFhJIASs1bCmOy60xh+0wm2AG0ray6aCJKmL3gk/EBkzAjh8w==
X-Received: by 2002:ac2:4e0a:: with SMTP id e10mr32370473lfr.33.1621030681817;
        Fri, 14 May 2021 15:18:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id b18sm686268lfp.20.2021.05.14.15.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 15:18:01 -0700 (PDT)
Subject: Re: [PATCH v1 0/2] Restore voltages before rebooting of NVIDIA Tegra
 SoCs
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        =?UTF-8?Q?Nikola_Milosavljevi=c4=87?= <mnidza@outlook.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210510220526.11113-1-digetx@gmail.com>
 <20210514213251.GB1969@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5047e49e-fa86-1e9d-a114-cbaf31f5b86b@gmail.com>
Date:   Sat, 15 May 2021 01:18:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514213251.GB1969@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.05.2021 00:32, Michał Mirosław пишет:
> On Tue, May 11, 2021 at 01:05:24AM +0300, Dmitry Osipenko wrote:
>> Hi,
>>
>> Nikola Milosavljević reported that rebooting wasn't working properly on
>> Asus Transformer TF101, which is Tegra20-based tablet device.  We found
>> that TF101 and some other devices have bootloader which doesn't re-initialize
>> voltages properly on a reboot.  The problem is resolved by ensuring that
>> SoC voltages are at a levels that are suitable for the rebooting of the
>> SoC before reboot happens. This series adds reboot handler to the Tegra
>> regulator couplers, it bumps voltages on the reboot event.
> 
> Which tree does this series apply to?

It was made on top of linux-next, but it should apply to 5.13 as well.
What conflict do you get?
