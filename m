Return-Path: <SRS0=KjKx=BM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46337C433DF
	for <linux-tegra@archiver.kernel.org>; Sun,  2 Aug 2020 09:10:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D67E206F6
	for <linux-tegra@archiver.kernel.org>; Sun,  2 Aug 2020 09:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amywwoYV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgHBJKF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 2 Aug 2020 05:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbgHBJKF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 2 Aug 2020 05:10:05 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EABDC06174A
        for <linux-tegra@vger.kernel.org>; Sun,  2 Aug 2020 02:10:05 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t6so5966069pjr.0
        for <linux-tegra@vger.kernel.org>; Sun, 02 Aug 2020 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jMBOZeJGvfg3X8PhLQhFyeJeFCQRr0UEYDyvk1N24Yg=;
        b=amywwoYVdxR8JOo6iIDliLAeOvw9dQTtw0AvBLqLehbyuI4X1YXfRzJwuY0UXArQeD
         OimglDgIP+WDwgSQHT8VPDfC67wKadsIcJXWMNQQDazS+8gT0BJ12+uv486yn+oVlKsY
         bzokZlGxHFjemgKPkL43SK6WLq2pNnxG95GhMzd3jxt8NKItALOqyZO0M8RuoVYfz19u
         zh66T7TLPlTawIIx03+o26oIyREGnVKaxJ9zzcUFBLSemQQd6h8HJGh31FHnrQKvo1Eu
         jCquhoA2lSEOCEDz2O6mdHt8OWTKbdPG22B+kBSs6j60wpXHuN+vFGEewMxcE2Eum9hO
         RkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jMBOZeJGvfg3X8PhLQhFyeJeFCQRr0UEYDyvk1N24Yg=;
        b=Hoqr1td3VSgJC1x9bQ6fxmFi8vbrMJGPunrOacyYcPHg3Iqsi/syioLGJD2R2R5H6p
         NlyRTJlvZkB+aFLKQTXu96Ntxc5dh+SXOwx2buFUsNE94cL1t3VBbJb/PzG9aU2180X5
         mA94mLR3FyR0enUrJY8PrBXmH8JKi6/adpBUnApuVKmb7vYzddsWQKA5N5RQ5AuLA6LV
         Bv9aFzls8ylUNNS3JI/G1Xd1lgBtsXPlJbxqITC1vz/Ps9fLkGD/LbCN+6UDvaKwBakV
         Pz2lRKngvuK2T2kA0dO/yJKHDt+6ZBRXiHzwShdVdvq60CFvYYKzmxVPo3hovXeA5XC+
         OuVA==
X-Gm-Message-State: AOAM533kzCHu3xTPPZn/U2PSBdN4mMpFER7KV7KM9DFGXEceZ1w6KH2g
        W1TgPxw/azXkP4r5Kf1LNbY=
X-Google-Smtp-Source: ABdhPJwS8f3l9bATb4yxn1V6knGaj53cgRt8trIEoYFkckaHze4zhqd77UFOA1VNih5Wf6rvFKDHYQ==
X-Received: by 2002:a17:90a:c70b:: with SMTP id o11mr11399042pjt.169.1596359404190;
        Sun, 02 Aug 2020 02:10:04 -0700 (PDT)
Received: from [192.168.0.109] ([1.186.117.197])
        by smtp.gmail.com with ESMTPSA id y200sm16267009pfb.33.2020.08.02.02.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2020 02:10:03 -0700 (PDT)
Subject: Re: [PATCH v4] staging: nvec: change usage of slave to secondary
To:     Marc Dietrich <marvin24@posteo.de>
Cc:     gregkh@linuxfoundation.org, p.zabel@pengutronix.de,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
 <20200725062938.15388-1-bharadwaj.rohit8@gmail.com>
 <alpine.OSX.2.23.453.2008021007460.41131@macbook-pro.fritz.box>
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Message-ID: <c81040b7-f094-77c7-1598-31e18d7f9402@gmail.com>
Date:   Sun, 2 Aug 2020 14:39:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.OSX.2.23.453.2008021007460.41131@macbook-pro.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 02/08/20 1:43 pm, Marc Dietrich wrote:
> Hello Rohit,
> 
> On Sat, 25 Jul 2020, Rohit K Bharadwaj wrote:
> 
>> changed usage of slave (which is deprecated) to secondary without breaking the driver
>>
>> Tested-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Acked-by: Marc Dietrich <marvin24@posteo.de>
>> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
> 
> please don't add "*-by"'s by yourself when you send a new patch version.
> These will be added "automatically" during the patch handling. I just said, I *will* ack your patch, when you resent it, not that I did it already.
> 
> Thanks!
> 
> Marc
> 
>> ---
>> v4: undo the changes (which broke the driver) to this line: if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr))
>> v3: change patch subject, add version history
>> v2: add changelog text in body of mail
>> v1: fix style issues by changing usage of slave to secondary
>>
>> drivers/staging/nvec/nvec.c | 10 +++++-----
>> 1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
>> index 360ec0407740..a7e995bfe989 100644
>> --- a/drivers/staging/nvec/nvec.c
>> +++ b/drivers/staging/nvec/nvec.c
>> @@ -718,7 +718,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>>     return IRQ_HANDLED;
>> }
>>
>> -static void tegra_init_i2c_slave(struct nvec_chip *nvec)
>> +static void tegra_init_i2c_secondary(struct nvec_chip *nvec)
>> {
>>     u32 val;
>>
>> @@ -744,7 +744,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
>> }
>>
>> #ifdef CONFIG_PM_SLEEP
>> -static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
>> +static void nvec_disable_i2c_secondary(struct nvec_chip *nvec)
>> {
>>     disable_irq(nvec->irq);
>>     writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
>> @@ -839,7 +839,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
>>     }
>>     disable_irq(nvec->irq);
>>
>> -    tegra_init_i2c_slave(nvec);
>> +    tegra_init_i2c_secondary(nvec);
>>
>>     /* enable event reporting */
>>     nvec_toggle_global_events(nvec, true);
>> @@ -913,7 +913,7 @@ static int nvec_suspend(struct device *dev)
>>     if (!err)
>>         nvec_msg_free(nvec, msg);
>>
>> -    nvec_disable_i2c_slave(nvec);
>> +    nvec_disable_i2c_secondary(nvec);
>>
>>     return 0;
>> }
>> @@ -923,7 +923,7 @@ static int nvec_resume(struct device *dev)
>>     struct nvec_chip *nvec = dev_get_drvdata(dev);
>>
>>     dev_dbg(nvec->dev, "resuming\n");
>> -    tegra_init_i2c_slave(nvec);
>> +    tegra_init_i2c_secondary(nvec);
>>     nvec_toggle_global_events(nvec, true);
>>
>>     return 0;
>> -- 
>> 2.25.1
>>
>>
I'm sorry for the tags sir, I would make sure not to make the mistakes in future, Thanks for taking your time, I hope I can contribute on other aspects of Linux kernel.
