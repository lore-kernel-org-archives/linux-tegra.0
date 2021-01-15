Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65458C43332
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 12:59:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F498221FA
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 12:59:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387452AbhAOM7v (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 07:59:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387680AbhAOM7t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 07:59:49 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E0B1C061757;
        Fri, 15 Jan 2021 04:59:08 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id o19so13012848lfo.1;
        Fri, 15 Jan 2021 04:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z88+UL1Kj6t4xLAfVZNrkkERr8HUHthYkN4y2Wjje3c=;
        b=MhqrXC/dYh36OxJjw9QxGR7fCLRbvk85JQynbg3YfDCRakvYIS2Kj7eLzV+qQseEZV
         I2fFwjm/LEiIi7w5QxR5ao4tXK9SNBWkBzwZpyvOreKbXTXhqBKbD0uWpuABKNazhKiH
         fxNhIsXG4Pgq7BgK9x8CvW123eDyZEzJo9v1yJM2YeyByXtqQBm2TewW3+kD4BvRHurr
         6Yk2+vbRYWhRL/5ftCxTyERNtjR1txQt4T6RDbefYMnjYipT5Hc2MKh4yqPZ4majDo3n
         f7UzJC2/z7cuJCur8u1TMvomCullcaLWJ+kQXuFurardizuUImGxfDRBr7ew1i6KFJvx
         FvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z88+UL1Kj6t4xLAfVZNrkkERr8HUHthYkN4y2Wjje3c=;
        b=NVCCKd6TP8dOxZsJROwKdfcfvXg0jf2TmfxJq7tKiVXpMgxSHstQ0z5Bvvx1Dzg/tD
         XZI2Ep5HsLvQ4zBvJqCa1y5/EF9K4Nz1KRAZ7I/WuUAQIvmZ2sCIY2xKRK4OJ+bIp/qn
         5w11YMGf9cJsNehTGctRM0NwKVcNjYfa/VzGkVH/qOSrGROJuFnzg+JjJX9sLIY7MBRU
         FlU0/wx1NUnFRrfxGNKHmwfg1rjOYEHON4NTrMqm9Lw92mGBtzDsrB8AlZfUTkYHvJJb
         W6hmOWYOW1O0LuWamtu8Y8ZcmJZBsX0J8/RIQ7a6iZrT8s0BaeaAdN5F4F8rJI4F5DHX
         Pl5w==
X-Gm-Message-State: AOAM530ZAQSB/9dWuAOdxlzUNghraM+PoCEgrfaVH2osMU6kj43Cd+ru
        n2nEyWMpxUFkZjMGkpSUMeD9DMLWhuY=
X-Google-Smtp-Source: ABdhPJyEfV1U5TCVbyHg3GM67rUvvGiwT27nwjAQZNQRykEEs3obQTaas/aimmSJGg9/+8LvfXgtcg==
X-Received: by 2002:a19:4352:: with SMTP id m18mr3722258lfj.107.1610715546746;
        Fri, 15 Jan 2021 04:59:06 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id s5sm909129lfc.150.2021.01.15.04.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 04:59:06 -0800 (PST)
Subject: Re: [PATCH v1 0/5] Clock and reset improvements for Tegra ALSA
 drivers
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210112125834.21545-1-digetx@gmail.com>
 <d09b6953-fc74-9fbc-e66d-556df4674746@codethink.co.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fc95043e-1bc4-61e1-7d83-61aa7797ae0e@gmail.com>
Date:   Fri, 15 Jan 2021 15:59:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <d09b6953-fc74-9fbc-e66d-556df4674746@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.01.2021 13:52, Ben Dooks пишет:
> On 12/01/2021 12:58, Dmitry Osipenko wrote:
>> This series improves the handling of clock and reset controls of
>> NVIDA Tegra ALSA drivers. Tegra HDA and AHUB drivers aren't handling
>> resets properly, which needs to be fixed in order to unblock other
>> patches
>> related to fixes on the reset controller driver since HDA/AHUB are bound
>> to fail once reset controller driver will be corrected. In particular
>> ALSA
>> drivers are relying on implicit de-assertion of resets which is done
>> by the
>> tegra-clk driver. It's not the business of the clk driver to touch resets
>> and we need to fix this because it breaks reset/clk programming sequences
>> of other Tegra drivers.
>>
>> Dmitry Osipenko (5):
>>    ALSA: hda/tegra: Use clk_bulk helpers
>>    ALSA: hda/tegra: Reset hardware
>>    ASoC: tegra: ahub: Use of_reset_control_array_get_exclusive()
>>    ASoC: tegra: ahub: Use clk_bulk helpers
>>    ASoC: tegra: ahub: Reset hardware properly
>>
>>   sound/pci/hda/hda_tegra.c      |  86 +++++++++------------------
>>   sound/soc/tegra/tegra30_ahub.c | 103 ++++++---------------------------
>>   sound/soc/tegra/tegra30_ahub.h |   6 +-
>>   3 files changed, 49 insertions(+), 146 deletions(-)
> 
> I wonder if this will help with the issues we saw when the tegra is
> the i2s clock slave.

Probably no, this series shouldn't fix any of the current problems. I
will be surprised if it does.
