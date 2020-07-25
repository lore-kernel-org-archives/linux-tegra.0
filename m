Return-Path: <SRS0=u+5c=BE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08492C433E1
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jul 2020 06:50:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1446206D7
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jul 2020 06:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdxDp21W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgGYGur (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 25 Jul 2020 02:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgGYGur (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 25 Jul 2020 02:50:47 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E92EC0619D3
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2020 23:50:47 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t15so6666729pjq.5
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2020 23:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pAY2tvHeP21yolAuUTkdsq2ZWrtpUyWnSU7nWtm6Js0=;
        b=TdxDp21WTv1YhoQPuyVTgx/O2Urd93QxxNBotlHTNzVb/HNG1B5fkBUUXwUGnjjrwd
         IL6D4nfh6/CtVeGalqOccvcMVlr1Tq1NBUjoxGW0XN5Ylpc2X2+c1EtMmmGwAu4f5cae
         Frx4AxZsBqQz9zk93xrgQ/hbNFBeKv2Hl5L732nwLU7ZXbi213gIN/w/g/zWrC6KUGuS
         V5fQX7DqSt4MsLQ2GK7euFOVuq4Y1dU8ibUpkTq3JVKVu6nD/ngGR5y1kxMLsperjYk8
         dXUSNDztqMzaG4HSt8+r7dBnv8GYHqAuTtbsPfb5SToQbsxG5ysZkLf1SFQiQth4THEc
         VF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pAY2tvHeP21yolAuUTkdsq2ZWrtpUyWnSU7nWtm6Js0=;
        b=jsHYKGVjV/uGvHyDM5BOry7xtL8jJNdKBapgQ5PkRNC93MBLMvEHywg9U/7En9Vyw6
         PL+GD/uFyKqsLFKX20VPBvWeCqGb97klHWl0oRW61excZPfYtZVKtQxYTwHMIGfhIiqW
         MFUnKaZyZutrJ4ON4XLjgBpa6XLP79KLFwp0yRwNO+71xsPV25bmUoLcd773iZczwn+0
         FsHv4jmaNeFRixLdnsIz16/IrXScmAfDI4YfriHUhPlKMzJTrCUQXd6CusCgHHEe7OZF
         9V/NgdudZ93UXVcvNamOG4Zd4F1MrrC3tqdA2tAcFHzwvMBtyVUgpCqKGjgxrVhl1EI9
         O9lw==
X-Gm-Message-State: AOAM530bixg+39YuYaPqm05mXifw7rjeQBW5TRLyD2ubJPmRBA6qrGV3
        sEF6jDCXHUnWExs/AUuGuDk=
X-Google-Smtp-Source: ABdhPJy4kuRnILkVAvVmWm+/kdjDqMD399HL6RV2Q63lo6Dhk8Y5UdK4lP9HfhxqUqyJjFFeK48zKA==
X-Received: by 2002:a17:90a:c715:: with SMTP id o21mr9240782pjt.35.1595659846566;
        Fri, 24 Jul 2020 23:50:46 -0700 (PDT)
Received: from [192.168.0.109] ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id u13sm7361784pjy.40.2020.07.24.23.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 23:50:45 -0700 (PDT)
Subject: Re: [PATCH v3] staging: nvec: change usage of slave to secondary
To:     Marc Dietrich <marvin24@posteo.de>
Cc:     Greg KH <gregkh@linuxfoundation.org>, p.zabel@pengutronix.de,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org
References: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
 <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
 <ac0f2bb4-7fa1-26a8-a43b-2db427188d4e@gmail.com>
 <20200724082810.GA3977020@kroah.com>
 <34e6c906-7def-816d-a45d-03d366f32c61@gmail.com>
 <alpine.OSX.2.23.453.2007241829180.9201@macbook-pro.fritz.box>
 <alpine.OSX.2.23.453.2007241835260.9201@macbook-pro.fritz.box>
 <365fd26d-94b1-760e-48f5-bf8a85a90399@gmail.com>
 <alpine.OSX.2.23.453.2007242238230.12486@macbook-pro.fritz.box>
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Message-ID: <6db6189a-3bc9-72c4-7c7c-98ab5e03a0c0@gmail.com>
Date:   Sat, 25 Jul 2020 12:20:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.OSX.2.23.453.2007242238230.12486@macbook-pro.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25/07/20 2:12 am, Marc Dietrich wrote:
> 
> Hi Rohit,
> 
> On Fri, 24 Jul 2020, Rohit K Bharadwaj wrote:
> 
>> On 24/07/20 10:06 pm, Marc Dietrich wrote:
>>>
>>>
>>> On Fri, 24 Jul 2020, Marc Dietrich wrote:
>>>
>>>> Hi Rohit,
>>>>
>>>> On Fri, 24 Jul 2020, Rohit Bharadwaj wrote:
>>>>
>>>>> On 24/07/20 1:58 pm, Greg KH wrote:
>>>>>> On Fri, Jul 24, 2020 at 01:44:27PM +0530, Rohit Bharadwaj wrote:
>>>>>>> On 24/07/20 10:06 am, Rohit K Bharadwaj wrote:
>>>>>>>> changed usage of slave (deprecated) to secondary
>>>>>>>>
>>>>>>>> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
>>>>>>>> ---
>>>>>>>> v3: change patch subject, add version history
>>>>>>>> v2: add changelog text in body of mail
>>>>>>>> v1: fix style issues by changing usage of slave to secondary
>>>>>>>>
>>>>>>>>  drivers/staging/nvec/nvec.c | 12 ++++++------
>>>>>>>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
>>>>>>>> index 360ec0407740..5d7b66719a39 100644
>>>>>>>> --- a/drivers/staging/nvec/nvec.c
>>>>>>>> +++ b/drivers/staging/nvec/nvec.c
>>>>>>>> @@ -718,7 +718,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>>>>>>>>      return IRQ_HANDLED;
>>>>>>>>  }
>>>>>>>>
>>>>>>>> -static void tegra_init_i2c_slave(struct nvec_chip *nvec)
>>>>>>>> +static void tegra_init_i2c_secondary(struct nvec_chip *nvec)
>>>>>>>>  {
>>>>>>>>      u32 val;
>>>>>>>>
>>>>>>>> @@ -744,7 +744,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
>>>>>>>>  }
>>>>>>>>
>>>>>>>>  #ifdef CONFIG_PM_SLEEP
>>>>>>>> -static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
>>>>>>>> +static void nvec_disable_i2c_secondary(struct nvec_chip *nvec)
>>>>>>>>  {
>>>>>>>>      disable_irq(nvec->irq);
>>>>>>>>      writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
>>>>>>>> @@ -784,7 +784,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
>>>>>>>>      platform_set_drvdata(pdev, nvec);
>>>>>>>>      nvec->dev = dev;
>>>>>>>>
>>>>>>>> -    if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr)) {
>>>>>>>> +    if (of_property_read_u32(dev->of_node, "secondary-addr", &nvec->i2c_addr)) {
>>>>>>>>          dev_err(dev, "no i2c address specified");
>>>>>>>>          return -ENODEV;
>>>>>>>>      }
>>>>
>>>> as Christoph said, please don't change this line.
>>>
>>> arr, I meant Dan of course ;-)
>> Dear all, thank you so much for your inputs, I will try to make some other patch which will not break the driver (hopefully :p), or if you give me permission to submit this patch itself by just keeping this one line
>>
>>> if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr))
>>
>> unchanged, and provided it does not break the driver by doing so, I would gladly make the changes and submit v4 of the patch.
> 
> please resend the patch with the line above unchanged as v4. Don't forget to to update the changelog to the commit message. I tested your patch (without the dt property change) and it does not change behavoir - as expected,
> so you will recevice my Ack.
> 
> Marc

Thank you so much for the suggestions and the Ack sir, I have made the necessary changes and I have sent the v4 of the patch.
