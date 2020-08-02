Return-Path: <SRS0=KjKx=BM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F4BC433DF
	for <linux-tegra@archiver.kernel.org>; Sun,  2 Aug 2020 08:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D62092083B
	for <linux-tegra@archiver.kernel.org>; Sun,  2 Aug 2020 08:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="EctfdyHP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgHBINv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 2 Aug 2020 04:13:51 -0400
Received: from mout01.posteo.de ([185.67.36.65]:47685 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725819AbgHBINv (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 2 Aug 2020 04:13:51 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id A26D7160064
        for <linux-tegra@vger.kernel.org>; Sun,  2 Aug 2020 10:13:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1596356027; bh=uAUgQdFrVVYolTVMI7InZ/rP4hH1B0Oi+OXjMUurkYY=;
        h=Date:From:To:cc:Subject:From;
        b=EctfdyHPZKPpRkwjGyOEmvfE7nRrylo85aVG+YgkdVY7CCMuYl5LFbjrGLKBpuBug
         K9SW5jlaMPvmfBYTkSvIMDYRyo678xvHhDmRhySblR98jO6QzvF/M5mXCWX+TV0Bs2
         n4uoIrHdHklaUubOfXzoViLl8+hj32EPW6x1GV+ZritpcSO58CJpLhja4ykTcuOm6i
         ix6japEr5dCiuxbSCO4MYoPAWLn7TKYXj2sMdzO5oBG3+VB7lAHkO4nd/TmEEqqz2K
         KcGpBUquUjjjHr2LB5HKXKGx7nSL7ioYIfSmDgkzt2WJ0q/1IcTjBV/Y+uHrP4RmU4
         mfiQK8pqOG64g==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4BKDLL3vY3z9rxW;
        Sun,  2 Aug 2020 10:13:46 +0200 (CEST)
Date:   Sun, 2 Aug 2020 10:13:46 +0200 (CEST)
From:   Marc Dietrich <marvin24@posteo.de>
X-X-Sender: lucile@macbook-pro.fritz.box
To:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
cc:     marvin24@posteo.de, gregkh@linuxfoundation.org,
        p.zabel@pengutronix.de, ac100@lists.launchpad.net,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4] staging: nvec: change usage of slave to secondary
In-Reply-To: <20200725062938.15388-1-bharadwaj.rohit8@gmail.com>
Message-ID: <alpine.OSX.2.23.453.2008021007460.41131@macbook-pro.fritz.box>
References: <20200724043633.7755-1-bharadwaj.rohit8@gmail.com> <20200725062938.15388-1-bharadwaj.rohit8@gmail.com>
User-Agent: Alpine 2.23 (OSX 453 2020-06-18)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello Rohit,

On Sat, 25 Jul 2020, Rohit K Bharadwaj wrote:

> changed usage of slave (which is deprecated) to secondary without breaking the driver
>
> Tested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Marc Dietrich <marvin24@posteo.de>
> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>

please don't add "*-by"'s by yourself when you send a new patch version.
These will be added "automatically" during the patch handling. I just 
said, I *will* ack your patch, when you resent it, not that I did it 
already.

Thanks!

Marc

> ---
> v4: undo the changes (which broke the driver) to this line: if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr))
> v3: change patch subject, add version history
> v2: add changelog text in body of mail
> v1: fix style issues by changing usage of slave to secondary
>
> drivers/staging/nvec/nvec.c | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 360ec0407740..a7e995bfe989 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -718,7 +718,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
> 	return IRQ_HANDLED;
> }
>
> -static void tegra_init_i2c_slave(struct nvec_chip *nvec)
> +static void tegra_init_i2c_secondary(struct nvec_chip *nvec)
> {
> 	u32 val;
>
> @@ -744,7 +744,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
> }
>
> #ifdef CONFIG_PM_SLEEP
> -static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
> +static void nvec_disable_i2c_secondary(struct nvec_chip *nvec)
> {
> 	disable_irq(nvec->irq);
> 	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
> @@ -839,7 +839,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
> 	}
> 	disable_irq(nvec->irq);
>
> -	tegra_init_i2c_slave(nvec);
> +	tegra_init_i2c_secondary(nvec);
>
> 	/* enable event reporting */
> 	nvec_toggle_global_events(nvec, true);
> @@ -913,7 +913,7 @@ static int nvec_suspend(struct device *dev)
> 	if (!err)
> 		nvec_msg_free(nvec, msg);
>
> -	nvec_disable_i2c_slave(nvec);
> +	nvec_disable_i2c_secondary(nvec);
>
> 	return 0;
> }
> @@ -923,7 +923,7 @@ static int nvec_resume(struct device *dev)
> 	struct nvec_chip *nvec = dev_get_drvdata(dev);
>
> 	dev_dbg(nvec->dev, "resuming\n");
> -	tegra_init_i2c_slave(nvec);
> +	tegra_init_i2c_secondary(nvec);
> 	nvec_toggle_global_events(nvec, true);
>
> 	return 0;
> -- 
> 2.25.1
>
>
