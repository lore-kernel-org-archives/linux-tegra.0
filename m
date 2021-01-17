Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE9EC433DB
	for <linux-tegra@archiver.kernel.org>; Sun, 17 Jan 2021 23:58:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCC84207AE
	for <linux-tegra@archiver.kernel.org>; Sun, 17 Jan 2021 23:58:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbhAQX6a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 17 Jan 2021 18:58:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728042AbhAQX63 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 17 Jan 2021 18:58:29 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63837C061573;
        Sun, 17 Jan 2021 15:57:47 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id f11so16418586ljm.8;
        Sun, 17 Jan 2021 15:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1XQU/jlKodYjZCARkN0MwwUNSf7G3pxTNeJxAK/aghY=;
        b=X4Iigl4JPmRRWt70bybHbfbzsqjhJFYXEgrlNjJBKCLlsodALvRXU+1alvbqt5lDDw
         NCIXSoOww/egixhTdX9Yn8GtOlJ9aVRYg3Q222L0wRbCPN+ghTEIpPPHs2C+fAAHew8e
         8r8LfTzRS5YZxA9pxfhXReQkzmAKDSqxRA52ilH497PimTDWBczejK7Rc82EoXBN4mbQ
         OS2Of2VWKoEDKh8JJtLutgRzr4J4yI+Nuem2yEVXF0NRZpDq3bHiSmCyHi2tw0Ug6pjV
         dNH8Ox0rJP4UoTkg9NKq/k37gJErTxWAVvcxIqXUliFoOmuIK7ZitjWAThyonz9KM09L
         1u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1XQU/jlKodYjZCARkN0MwwUNSf7G3pxTNeJxAK/aghY=;
        b=Lr4sBUIZeJsWBAIlC5vQlO/B1uN+ofdECb6K/rRM90vMKjVtlqHbj4VhoFHrCYNXcZ
         UP8CzWcSpvuADPlGWHRXmuC4zFJP+V4k/xzs1nZptrvFFW32dP/InAul8y8+h2sbNKr1
         +vSJCR2V1Y4eSUq6GTxu9qPGVEXFrb6QB1thWrFBUkTOFBEmPcrkfKfDRcyM8aPtMs5d
         XO1tSAr53n1wRD04OcNyNt5quQy6WCmw4J1waUNbdhqaD88gh1ivTSqoGX8yFclH4FA5
         Y+RbxHjrqyY/wlchKl0c846HNO5emQs5TIab0HG6p3YKQjur/yBN9LC6x6NMR0vNH1+F
         LKGg==
X-Gm-Message-State: AOAM531gJjWyto/5q7kJhfq7eVdZ5GxJG6/7YoLmLH5iPZ6l3m7YmyUX
        scIe2oca6o8GSemwPcvbfI5DNxLHwFg=
X-Google-Smtp-Source: ABdhPJyDX06Q+PtppeEr5l7IRznkvqdGomix4s8UXi+IWDei4oSR9i5kYdV2yR7yWs0jHERTyFCJOA==
X-Received: by 2002:a05:651c:1022:: with SMTP id w2mr9512185ljm.327.1610927865844;
        Sun, 17 Jan 2021 15:57:45 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id k10sm1288283lfe.234.2021.01.17.15.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jan 2021 15:57:45 -0800 (PST)
Subject: Re: [PATCH v1 3/5] ASoC: tegra: ahub: Use
 of_reset_control_array_get_exclusive()
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-4-digetx@gmail.com> <YAG211gFXExjp7Zh@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <68b20608-b0f9-d481-4d38-7b6ba3366795@gmail.com>
Date:   Mon, 18 Jan 2021 02:57:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <YAG211gFXExjp7Zh@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.01.2021 18:37, Thierry Reding пишет:
> On Tue, Jan 12, 2021 at 03:58:32PM +0300, Dmitry Osipenko wrote:
>> Some of resets are erroneously missed in the configlink_mods[], like APBIF
>> for example. Use of_reset_control_array_get_exclusive() which requests all
>> the resets. The problem was hidden by the clk driver which implicitly
>> de-asserts the missing resets.
>>
>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  sound/soc/tegra/tegra30_ahub.c | 66 +++++-----------------------------
>>  sound/soc/tegra/tegra30_ahub.h |  1 -
>>  2 files changed, 9 insertions(+), 58 deletions(-)
> 
> Doing it this way is slightly suboptimal because now we don't actually
> have a way of checking that the DT has all the necessary resets listed.
> 
> Can we not just make the list complete instead to keep the checks in
> place? That should be a much smaller patch, too.

I'll change it in v3.
