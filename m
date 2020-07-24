Return-Path: <SRS0=jT6+=BD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE9CC433E3
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 20:42:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3802B206C1
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 20:42:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="kFDFS6yL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgGXUmx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jul 2020 16:42:53 -0400
Received: from mout01.posteo.de ([185.67.36.65]:45610 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726493AbgGXUmw (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jul 2020 16:42:52 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 0BF9A16005C
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2020 22:42:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1595623370; bh=CFRrsybpNNeAyc4qnC2Tdbw8cOnA5BAgyVoXp0fPP0w=;
        h=Date:From:To:cc:Subject:From;
        b=kFDFS6yLy6Y5l6nPABSJnWBC17+oq9/8WFnMS8Ztq0/FPejbco5QQJ0iE4QXVSN9m
         vkjlnpd3CWN9THss9xGYW/MkO2yQTv1RTtziBymFJee6yYs4IhGb/sOMZ3Mb6UOSK9
         SbCR1aSVZqnaeFBWkEXm6ByGVda8LTlpp9/eJe53Lf5Yxi/8KT/Vc8hLGzMrXItjqa
         HH3SyGhMUrSfT4KnTi5R4jrjTGjPmBHJ3wlozzyVr3KkrCw2WpIiRt6hg2DSsBc48v
         L7RRH0G5D+thHdXC3LEE5TmQ+MxStiw3QyhCygxIP5+ndXph1s9nDvhdkT1QIfNBdb
         dn/RujJVFVhiQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4BD1Nn012jz9rxN;
        Fri, 24 Jul 2020 22:42:48 +0200 (CEST)
Date:   Fri, 24 Jul 2020 22:42:48 +0200 (CEST)
From:   Marc Dietrich <marvin24@posteo.de>
X-X-Sender: lucile@macbook-pro.fritz.box
To:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
cc:     Marc Dietrich <marvin24@posteo.de>,
        Greg KH <gregkh@linuxfoundation.org>, p.zabel@pengutronix.de,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org
Subject: Re: [PATCH v3] staging: nvec: change usage of slave to secondary
In-Reply-To: <365fd26d-94b1-760e-48f5-bf8a85a90399@gmail.com>
Message-ID: <alpine.OSX.2.23.453.2007242238230.12486@macbook-pro.fritz.box>
References: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com> <20200724043633.7755-1-bharadwaj.rohit8@gmail.com> <ac0f2bb4-7fa1-26a8-a43b-2db427188d4e@gmail.com> <20200724082810.GA3977020@kroah.com> <34e6c906-7def-816d-a45d-03d366f32c61@gmail.com>
 <alpine.OSX.2.23.453.2007241829180.9201@macbook-pro.fritz.box> <alpine.OSX.2.23.453.2007241835260.9201@macbook-pro.fritz.box> <365fd26d-94b1-760e-48f5-bf8a85a90399@gmail.com>
User-Agent: Alpine 2.23 (OSX 453 2020-06-18)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1424241931-1595623369=:12486"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1424241931-1595623369=:12486
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT


Hi Rohit,

On Fri, 24 Jul 2020, Rohit K Bharadwaj wrote:

> On 24/07/20 10:06 pm, Marc Dietrich wrote:
>>
>>
>> On Fri, 24 Jul 2020, Marc Dietrich wrote:
>>
>>> Hi Rohit,
>>>
>>> On Fri, 24 Jul 2020, Rohit Bharadwaj wrote:
>>>
>>>> On 24/07/20 1:58 pm, Greg KH wrote:
>>>>> On Fri, Jul 24, 2020 at 01:44:27PM +0530, Rohit Bharadwaj wrote:
>>>>>> On 24/07/20 10:06 am, Rohit K Bharadwaj wrote:
>>>>>>> changed usage of slave (deprecated) to secondary
>>>>>>>
>>>>>>> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
>>>>>>> ---
>>>>>>> v3: change patch subject, add version history
>>>>>>> v2: add changelog text in body of mail
>>>>>>> v1: fix style issues by changing usage of slave to secondary
>>>>>>>
>>>>>>>  drivers/staging/nvec/nvec.c | 12 ++++++------
>>>>>>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
>>>>>>> index 360ec0407740..5d7b66719a39 100644
>>>>>>> --- a/drivers/staging/nvec/nvec.c
>>>>>>> +++ b/drivers/staging/nvec/nvec.c
>>>>>>> @@ -718,7 +718,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>>>>>>>      return IRQ_HANDLED;
>>>>>>>  }
>>>>>>>
>>>>>>> -static void tegra_init_i2c_slave(struct nvec_chip *nvec)
>>>>>>> +static void tegra_init_i2c_secondary(struct nvec_chip *nvec)
>>>>>>>  {
>>>>>>>      u32 val;
>>>>>>>
>>>>>>> @@ -744,7 +744,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
>>>>>>>  }
>>>>>>>
>>>>>>>  #ifdef CONFIG_PM_SLEEP
>>>>>>> -static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
>>>>>>> +static void nvec_disable_i2c_secondary(struct nvec_chip *nvec)
>>>>>>>  {
>>>>>>>      disable_irq(nvec->irq);
>>>>>>>      writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
>>>>>>> @@ -784,7 +784,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
>>>>>>>      platform_set_drvdata(pdev, nvec);
>>>>>>>      nvec->dev = dev;
>>>>>>>
>>>>>>> -    if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr)) {
>>>>>>> +    if (of_property_read_u32(dev->of_node, "secondary-addr", &nvec->i2c_addr)) {
>>>>>>>          dev_err(dev, "no i2c address specified");
>>>>>>>          return -ENODEV;
>>>>>>>      }
>>>
>>> as Christoph said, please don't change this line.
>>
>> arr, I meant Dan of course ;-)
> Dear all, thank you so much for your inputs, I will try to make some other patch which will not break the driver (hopefully :p), or if you give me permission to submit this patch itself by just keeping this one line
>
>> if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr))
>
> unchanged, and provided it does not break the driver by doing so, I would gladly make the changes and submit v4 of the patch.

please resend the patch with the line above unchanged as v4. Don't forget 
to to update the changelog to the commit message. I tested your patch 
(without the dt property change) and it does not change behavoir - as expected,
so you will recevice my Ack.

Marc

--0-1424241931-1595623369=:12486--
