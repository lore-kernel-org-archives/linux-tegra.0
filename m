Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D93C433E2
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 17:29:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 929C9222C8
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 17:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PX7zxOa0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbgIPR3c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 13:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbgIPR3L (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 13:29:11 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D079AC02C29D;
        Wed, 16 Sep 2020 09:09:06 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v23so6451953ljd.1;
        Wed, 16 Sep 2020 09:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WU8kkRrE3jlr7jbbJ1vMZoztyKQSB8TKep3W2+Nhdpo=;
        b=PX7zxOa0V1P+T5PQE8MemGbm8QD2DVms2wDVKL0zvIl654L3hn4IH9ImISDHPhiUWx
         BLk3uerGbG/Cu2WECtitLX5tZZYQKw3GN4pYJvktzAaSEFy2rjZ9L+bBA+MjWJH1F9Pi
         uU750U2N7VA4ZXpPre+5W7l1Hw0xSQJA6+zZ31HZQ0EFegsM7WqaZrCq9QSIr/E2H2nR
         SgKr1UhwmwJq57nEy5CrwC6fUeShqN2u2jOMgRC5gKOCdvD2z6cNaTumY1duObWGvYm7
         A32s+XjKK9tDlVKTOjrnjYuiWzyviQLKEAoET98SqTVV3MBctGHXYFgAY9nvxk/jQQxg
         pu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WU8kkRrE3jlr7jbbJ1vMZoztyKQSB8TKep3W2+Nhdpo=;
        b=YEGqkzzZgHbVAZzs2jZKHZeGETO9yRu2YyG5N1FmRr/5+gMVTz2QGHa1XDoL+maXl3
         mYHksa8uwNt0hQSSHukORmNDZFi9GsGYTqfer304GNGubBOQLkXQWK87GLlogmB0d03u
         1Ji726eaQdQC7Eon1widUmLfDAd5fylBbZ3GzxNOAGvknDMF5OSbbEMkqCDf2OaF4RHy
         UlS9l8phKCBbCq9fKM5c3Z97Oo4AXMEAptBT8iUkt/fI9fhjZ/IQE9d6dQuDu5Ord7uJ
         4i2vAN+JA/ahbXjyCVeyvQExWUUrxrxsh+Rv5maThO7I588jZD4KJY4eU7zRIW/RxuAu
         ixNg==
X-Gm-Message-State: AOAM533O0CzlDhGb4IdI5MU09ar5OOaRb0dnvfzeOMGk9Ta2NFo7BZ7r
        PjseKq7DnUMsJVnLg9qR3iqvcB0Q9zg=
X-Google-Smtp-Source: ABdhPJwgUpIjt1JfZmr2hIDAqmuETyFK5I1BMqLPpG/JmuzJbZgHaxUG0ETD48tl/QDqV3qD5CzHdQ==
X-Received: by 2002:a2e:9116:: with SMTP id m22mr8286871ljg.387.1600272544856;
        Wed, 16 Sep 2020 09:09:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id l82sm5051890lfd.58.2020.09.16.09.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 09:09:03 -0700 (PDT)
Subject: Re: [PATCH 1/3] ARM: tegra: Add device-tree for Ouya
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200916122247.534374-1-pgwipeout@gmail.com>
 <20200916122247.534374-2-pgwipeout@gmail.com>
 <3cdcb877-e4c7-aab8-b7f9-0c88f2247d03@gmail.com>
 <CAMdYzYrKHBrh47PMrj=TP_FPttFOkRO2J_wrDr7oEyBNnyexAA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c92a457d-9829-99ce-8d7c-29fe5395728c@gmail.com>
Date:   Wed, 16 Sep 2020 19:09:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMdYzYrKHBrh47PMrj=TP_FPttFOkRO2J_wrDr7oEyBNnyexAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.09.2020 17:57, Peter Geis пишет:
> On Wed, Sep 16, 2020 at 10:17 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 16.09.2020 15:22, Peter Geis пишет:
>>> The Ouya was the sole device produced by Ouya Inc in 2013.
>>> It was a game console originally running Android 5 on top of Linux 3.1.10.
>>>
>>> This patch adds the device tree supporting the Ouya.
>>> It has been tested on the original variant with Samsung ram.
>>>
>>> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>>> ---
>>>  arch/arm/boot/dts/Makefile         |    3 +-
>>>  arch/arm/boot/dts/tegra30-ouya.dts | 4498 ++++++++++++++++++++++++++++
>>>  2 files changed, 4500 insertions(+), 1 deletion(-)
>>>  create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts
>>
>> Hello, Peter! Very nice work!
> 
> Thanks!
> 
>>
>> Could you please clarify how many variants of the board exist?
> 
> It is unknown how many exist in reality.
> At least three RAM variants are supported in the downstream kernel,
> Samsung, Hynix M, and Hynix A.
> Two variants in storage capacity, the original had 8GB eMMC while the
> new variant had 16GB eMMC.
> 
>>
>> What are the differences between the variants?
> 
> Aside from the RAM and storage changes there should be no functional
> differences.
> It is unknown at which point the RAM changes were cut in with the eMMC change.
> 
>>
>> Is this device-tree suitable for all variants?
> 
> This device tree should support all variants, but I haven't been able
> to locate anyone with the newer variants who can test it yet.
> 
>>
>> How user could determine the board's variant?
> 
> On upstream:
> The tegra emc driver will output the RAM code detected in the kernel log:
> tegra30-emc 7000f400.memory-controller: got 6 timings for RAM code 0
> (min 25MHz max 800MHz)
> The mmc-core will output the storage capacity in the kernel log:
> mmcblk1: mmc1:0001 MMC08G 7.19 GiB
> 
> On downstream:
> The ram variant is output in the kernel log:
> DDR Strap Pin AD4: 0
> DDR Strap Pin AD5: 0
> Init DFS table for Samsung DDR
> The mmc-core outputs the storage capacity in the kernel log:
> mmcblk0: mmc0:0001 MMC08G 7.18 GiB
> 

I was thinking that maybe it could be necessary to separate the DT per
board variant, like we did it for Nexus 7, but it shouldn't be needed
given yours answer.

So far looks good to me!
