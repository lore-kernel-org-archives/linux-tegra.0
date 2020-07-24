Return-Path: <SRS0=jT6+=BD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7967C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 08:35:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF01620674
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 08:35:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vaag5+kX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgGXIfx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jul 2020 04:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgGXIfx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jul 2020 04:35:53 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A6EC0619D3
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2020 01:35:53 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id z5so4843667pgb.6
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2020 01:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VakwdzTZbI2NrCcqrnEUNuPYEf7c6UvJxHXZ+U7HH4E=;
        b=vaag5+kXqh0WoB5YdjhridcMexiFTp4DHEGtD16kRVcu3+qu0M3MT47HNoZihGGvNv
         TyWGOZfT1NERXzL5ZDffLMeBm6e6lcwiEmOxvRCl3gkeXHaEaickWtz47D4z4ONUS3nh
         TV60q6saBvHjLbPPvbvBm0RzYUJGN/QsgLLM1P7m4tsFGaKLEQ/AMQUobpsCefP0FAnD
         r7znb5iHrKfixfHAgixO4u8mkqeh8qYeKuBKX5OlBrt+PBCNR34Ni/UtP6OqYwBhBlD+
         GERR0sLUwWWgziMFlFzGectNCgX2UCYOl1691qcrJDRpp6awF1MjDnQdNB6d/svVUYW2
         XZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VakwdzTZbI2NrCcqrnEUNuPYEf7c6UvJxHXZ+U7HH4E=;
        b=kIASQePye7J/VqjiOJ8DHQg4ymgHAjVOvoF/+DlTFdsX/tGcS2Y4XKcdDhmrwTF3jP
         lNSstLUVS2ef2Foo66KJOXPxqUoF8uGljPt5kYFRfIytPjCWMXUrZht5dWw2GZQLq0kJ
         g1YWmNy6hCTVlLn4rHKT4PiFcRufEkUF9iD5yI6J06e9chovbQlBR/bHOmm2YqSyF15/
         HbmDzcGG2ng0eTQc2bY/5FRKKBUGxkuJDmA+V2H+fvUI9/tLt6f/FKGdJFyaRAfA0l9N
         5aIb5aQfQ55isI+7KSN085db9j5Ef+oKXRyNw06AEim1HDrvf2P1VKD8121KZJqVlB9q
         KnNw==
X-Gm-Message-State: AOAM530Ih9zgFaQFTI9KiXuJQ4BF7X5tkuekDoNBS2+9qbigoobov1N5
        2awz7bnqwoq8IzQqQjH8mJw=
X-Google-Smtp-Source: ABdhPJzBefa0MLGwqncznAGtC+wzq8qw2xBQKiR3rn+mgB4J8bbDiglgqAPgbhnnAbm415CwvYFEsw==
X-Received: by 2002:a62:8482:: with SMTP id k124mr7980683pfd.285.1595579752530;
        Fri, 24 Jul 2020 01:35:52 -0700 (PDT)
Received: from [192.168.0.109] ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id x66sm5523500pgb.12.2020.07.24.01.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 01:35:51 -0700 (PDT)
Subject: Re: [PATCH v3] staging: nvec: change usage of slave to secondary
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     marvin24@gmx.de, p.zabel@pengutronix.de,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        ac100@lists.launchpad.net
References: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
 <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
 <ac0f2bb4-7fa1-26a8-a43b-2db427188d4e@gmail.com>
 <20200724082810.GA3977020@kroah.com>
From:   Rohit Bharadwaj <bharadwaj.rohit8@gmail.com>
Message-ID: <34e6c906-7def-816d-a45d-03d366f32c61@gmail.com>
Date:   Fri, 24 Jul 2020 14:05:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724082810.GA3977020@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/07/20 1:58 pm, Greg KH wrote:
> On Fri, Jul 24, 2020 at 01:44:27PM +0530, Rohit Bharadwaj wrote:
>> On 24/07/20 10:06 am, Rohit K Bharadwaj wrote:
>>> changed usage of slave (deprecated) to secondary
>>>
>>> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
>>> ---
>>> v3: change patch subject, add version history
>>> v2: add changelog text in body of mail
>>> v1: fix style issues by changing usage of slave to secondary
>>>
>>>  drivers/staging/nvec/nvec.c | 12 ++++++------
>>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
>>> index 360ec0407740..5d7b66719a39 100644
>>> --- a/drivers/staging/nvec/nvec.c
>>> +++ b/drivers/staging/nvec/nvec.c
>>> @@ -718,7 +718,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>>>  	return IRQ_HANDLED;
>>>  }
>>>  
>>> -static void tegra_init_i2c_slave(struct nvec_chip *nvec)
>>> +static void tegra_init_i2c_secondary(struct nvec_chip *nvec)
>>>  {
>>>  	u32 val;
>>>  
>>> @@ -744,7 +744,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
>>>  }
>>>  
>>>  #ifdef CONFIG_PM_SLEEP
>>> -static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
>>> +static void nvec_disable_i2c_secondary(struct nvec_chip *nvec)
>>>  {
>>>  	disable_irq(nvec->irq);
>>>  	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
>>> @@ -784,7 +784,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
>>>  	platform_set_drvdata(pdev, nvec);
>>>  	nvec->dev = dev;
>>>  
>>> -	if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr)) {
>>> +	if (of_property_read_u32(dev->of_node, "secondary-addr", &nvec->i2c_addr)) {
>>>  		dev_err(dev, "no i2c address specified");
>>>  		return -ENODEV;
>>>  	}
>>> @@ -839,7 +839,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
>>>  	}
>>>  	disable_irq(nvec->irq);
>>>  
>>> -	tegra_init_i2c_slave(nvec);
>>> +	tegra_init_i2c_secondary(nvec);
>>>  
>>>  	/* enable event reporting */
>>>  	nvec_toggle_global_events(nvec, true);
>>> @@ -913,7 +913,7 @@ static int nvec_suspend(struct device *dev)
>>>  	if (!err)
>>>  		nvec_msg_free(nvec, msg);
>>>  
>>> -	nvec_disable_i2c_slave(nvec);
>>> +	nvec_disable_i2c_secondary(nvec);
>>>  
>>>  	return 0;
>>>  }
>>> @@ -923,7 +923,7 @@ static int nvec_resume(struct device *dev)
>>>  	struct nvec_chip *nvec = dev_get_drvdata(dev);
>>>  
>>>  	dev_dbg(nvec->dev, "resuming\n");
>>> -	tegra_init_i2c_slave(nvec);
>>> +	tegra_init_i2c_secondary(nvec);
>>>  	nvec_toggle_global_events(nvec, true);
>>>  
>>>  	return 0;
>>>
>> Dear All, this message was not delivered to marvin24@gmx.de, I'm getting that The response from the remote server was:
>> 554 gmx.net (mxgmx016) Nemesis ESMTP Service not available No SMTP service Reject due to policy restrictions, 
> 
> Not a big deal, email address atrophy over time.  That's why you always
> cc: a public mailing list for patches.
> 
> thanks,
> 
> greg k-h
> 
Thank you so much for the reply sir, I hope this patch gets accepted.
