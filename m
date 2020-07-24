Return-Path: <SRS0=jT6+=BD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BF1C433E1
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 16:36:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A50AD20674
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 16:36:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Bdnbc6v3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgGXQgk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jul 2020 12:36:40 -0400
Received: from mout02.posteo.de ([185.67.36.66]:50467 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726397AbgGXQgj (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jul 2020 12:36:39 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 2C6E22400FD
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2020 18:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1595608598; bh=WUn1vISGBg8YHDaWclh9H7idtEY4XvlGeJbKwqiax/o=;
        h=Date:From:To:cc:Subject:From;
        b=Bdnbc6v38ITAhXMYP5F3L93c4Px1v5H6Yh4lIA72UHt7w0xvDZvhhC1Gt6xOMDX0c
         7EjIWxZQnvw9uhnKCZBOeWQ9KtuvYVgX3omMGT+ahKwTBAReQy1TIkztXzamZxALhA
         CU1dzvpZY3x/3LS0HXuetQg9zHnOBerukuxSH9Im3hOlnxy25ANTYJ3nXkU1S1VQqV
         h8Cn3gwJsAV/PLiPBXbUjObeU6fuCSVW6g1QHPKQ+tsCtKf742zbEoLMbr8HZNd5ub
         nvKnslU8XBneHooqGYtZVF9aVV3VOewKNzmvS++giIwJcnA70dsofrHwwj73JkyypO
         KGPT1P7F/R7Cw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4BCvwj15Jcz6tm6;
        Fri, 24 Jul 2020 18:36:37 +0200 (CEST)
Date:   Fri, 24 Jul 2020 18:36:36 +0200 (CEST)
From:   Marc Dietrich <marvin24@posteo.de>
X-X-Sender: lucile@macbook-pro.fritz.box
To:     Marc Dietrich <marvin24@posteo.de>
cc:     Rohit Bharadwaj <bharadwaj.rohit8@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>, p.zabel@pengutronix.de,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org
Subject: Re: [PATCH v3] staging: nvec: change usage of slave to secondary
In-Reply-To: <alpine.OSX.2.23.453.2007241829180.9201@macbook-pro.fritz.box>
Message-ID: <alpine.OSX.2.23.453.2007241835260.9201@macbook-pro.fritz.box>
References: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com> <20200724043633.7755-1-bharadwaj.rohit8@gmail.com> <ac0f2bb4-7fa1-26a8-a43b-2db427188d4e@gmail.com> <20200724082810.GA3977020@kroah.com> <34e6c906-7def-816d-a45d-03d366f32c61@gmail.com>
 <alpine.OSX.2.23.453.2007241829180.9201@macbook-pro.fritz.box>
User-Agent: Alpine 2.23 (OSX 453 2020-06-18)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On Fri, 24 Jul 2020, Marc Dietrich wrote:

> Hi Rohit,
>
> On Fri, 24 Jul 2020, Rohit Bharadwaj wrote:
>
>> On 24/07/20 1:58 pm, Greg KH wrote:
>>> On Fri, Jul 24, 2020 at 01:44:27PM +0530, Rohit Bharadwaj wrote:
>>>> On 24/07/20 10:06 am, Rohit K Bharadwaj wrote:
>>>>> changed usage of slave (deprecated) to secondary
>>>>> 
>>>>> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
>>>>> ---
>>>>> v3: change patch subject, add version history
>>>>> v2: add changelog text in body of mail
>>>>> v1: fix style issues by changing usage of slave to secondary
>>>>>
>>>>>  drivers/staging/nvec/nvec.c | 12 ++++++------
>>>>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>>>> 
>>>>> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
>>>>> index 360ec0407740..5d7b66719a39 100644
>>>>> --- a/drivers/staging/nvec/nvec.c
>>>>> +++ b/drivers/staging/nvec/nvec.c
>>>>> @@ -718,7 +718,7 @@ static irqreturn_t nvec_interrupt(int irq, void 
>>>>> *dev)
>>>>>  	return IRQ_HANDLED;
>>>>>  }
>>>>> 
>>>>> -static void tegra_init_i2c_slave(struct nvec_chip *nvec)
>>>>> +static void tegra_init_i2c_secondary(struct nvec_chip *nvec)
>>>>>  {
>>>>>  	u32 val;
>>>>> 
>>>>> @@ -744,7 +744,7 @@ static void tegra_init_i2c_slave(struct nvec_chip 
>>>>> *nvec)
>>>>>  }
>>>>>
>>>>>  #ifdef CONFIG_PM_SLEEP
>>>>> -static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
>>>>> +static void nvec_disable_i2c_secondary(struct nvec_chip *nvec)
>>>>>  {
>>>>>  	disable_irq(nvec->irq);
>>>>>  	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
>>>>> @@ -784,7 +784,7 @@ static int tegra_nvec_probe(struct platform_device 
>>>>> *pdev)
>>>>>  	platform_set_drvdata(pdev, nvec);
>>>>>  	nvec->dev = dev;
>>>>> 
>>>>> -	if (of_property_read_u32(dev->of_node, "slave-addr", 
>>>>> &nvec->i2c_addr)) {
>>>>> +	if (of_property_read_u32(dev->of_node, "secondary-addr", 
>>>>> &nvec->i2c_addr)) {
>>>>>  		dev_err(dev, "no i2c address specified");
>>>>>  		return -ENODEV;
>>>>>  	}
>
> as Christoph said, please don't change this line.

arr, I meant Dan of course ;-)
