Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD96C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Nov 2021 12:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhKVMkj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 22 Nov 2021 07:40:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbhKVMkh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Nov 2021 07:40:37 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71C8C061574
        for <linux-tegra@vger.kernel.org>; Mon, 22 Nov 2021 04:37:30 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b1so79652484lfs.13
        for <linux-tegra@vger.kernel.org>; Mon, 22 Nov 2021 04:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L1uhObnjuKqdfe3bHv1in23rkOkEksmpXxvQjlYo8r4=;
        b=KeguRqTIBdbDHRaq27oGOd8YRQm8N+1luusnK2c3O/L30BEmnq2uqmsGrN8WrmMmSR
         dTQhi8jNnAo8STOeRi41dEeTqWt9Gbie7O5susjYFYR56ImsokP1oDU+CEDKIKL5qSDN
         YvnKwVQbSTiBwz1wQ7SL0wzQ7REGK7ny6zmZQRBBfHsyI78ozJaKEiLgPq3KBCPqWup3
         nXx5jd8IaF7CDRawORxNcc5Uy+fIE3LoF/3mKGoSsQxOkeFW6EcOFzbq0XTaI8lEOcs3
         jUlg8LZftAx2YSmmt7qzsvkvQmQIy9A7GG90GjZ2KejcSbs6sj95wsCRTSkPhgUzCstN
         dHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L1uhObnjuKqdfe3bHv1in23rkOkEksmpXxvQjlYo8r4=;
        b=cCJSlSAEYidOh2uZ0pN1KBwl4EVZufUAC2WuQo4x5R1UG2zPgSH1kNxFBAeYOrO8Y+
         zfjMUVwSonB+BhXO22AMGxxt5CTwj5BQ1A1I5kvdcvMiZrOzkoRtfB/QCXTjwSnQOIcD
         BAtn6dnWpKeYgTrWrTgRcPzYrdNy07yoXXjWCafSMHn2SM1HphXWBHQK8h/ZDz8x8FIt
         L40LkKiyRpy/thBAKIjkYaWCKA130jATiO9ZggeygfYmGx1x+m9xmY8d/5Fa5EhZ0ip2
         Z8SzdAv34dko27mlsYAOeUzZn/nO1g6Dmn43J/ypJo2jrPeZqx/iFdZd6s9kWff/bUL7
         S+5Q==
X-Gm-Message-State: AOAM533iwsw1PUj+NfJzk4jHslGeHsA1KqvCAE+BLIllg5FqJGMWpdIH
        tpHZamVVzPNA9Day/sa0xFF5HBx1HBg=
X-Google-Smtp-Source: ABdhPJzChzkF2i8o1YJVu3c/gXEI6MO1a1zqIGe+KqkhDiC1wQXr17BEdesR+zwR3o3Kyqv6YE6yoQ==
X-Received: by 2002:a2e:b541:: with SMTP id a1mr52639457ljn.289.1637584648914;
        Mon, 22 Nov 2021 04:37:28 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id r13sm1069908ljn.99.2021.11.22.04.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 04:37:28 -0800 (PST)
Subject: Re: [PATCH] soc/tegra: pmc: Add reboot notifier
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
References: <20211115113208.237296-1-jonathanh@nvidia.com>
 <b0274558-7ad3-bc56-01ea-eb9f89716c24@gmail.com>
 <5ae5e584-aa2e-8026-d941-d39849c91064@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d79a1db8-f16c-9cbd-7c71-975429a69390@gmail.com>
Date:   Mon, 22 Nov 2021 15:37:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5ae5e584-aa2e-8026-d941-d39849c91064@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

22.11.2021 15:12, Jon Hunter пишет:
> 
> On 18/11/2021 19:13, Dmitry Osipenko wrote:
>> 15.11.2021 14:32, Jon Hunter пишет:
>>> -static int tegra_pmc_restart_notify(struct notifier_block *this,
>>> -                    unsigned long action, void *data)
>>> +static void tegra_pmc_program_reboot_reason(const char *cmd)
>>>   {
>>> -    const char *cmd = data;
>>>       u32 value;
>>>   +    if (!cmd)
>>> +        return;
>>
>> There is no explanation of this change in the commit message. Previously
>> scratch register was cleared if command is NULL, now it's not. Why?
> 
> 
> No reason, just an oversight on my part. I can change this back to keep
> the behaviour the same.

Alright, I'd expect bootloader to clear the register, although perhaps
there could be a reason why kernel needs to clear it since all
downstream kernels do it.

BTW, this patch is also needed in order to support restarting to
bootloader using PMIC's restart handler, which should become a thing for
some T30 devices soon. Although, will need to double check whether
scratch reg state retains after a full SoC power-cycle, but I assume it
should retain since RTC domain should stay always-on.
