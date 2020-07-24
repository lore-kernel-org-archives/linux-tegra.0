Return-Path: <SRS0=jT6+=BD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E543BC433EB
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 08:28:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2CD12074F
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 08:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595579289;
	bh=HxrBo0cV5eMlY+L4piyrTy6vrY5kjObTbnSnVkWBAKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=X/iBuVlExys8/K04R7Vs34uHanUaxxy7vB+MhymgsBeMbrEhuFRQjL1n9/Rf4tcw+
	 JWO1g0cITiwbwcfSSQdFzL3PP88UzNH1r2SwGIHKDMHBEQ8sBRl+wtB8SvXRGORl68
	 MeLfEBuWvKwNz09LsjD93p2tnD5ZSJj9a7Z9PpEo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgGXI2J (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jul 2020 04:28:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:53776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726573AbgGXI2J (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jul 2020 04:28:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 150DB206EB;
        Fri, 24 Jul 2020 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595579288;
        bh=HxrBo0cV5eMlY+L4piyrTy6vrY5kjObTbnSnVkWBAKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G3xt6y5jfIVzw3rPlO/dOAj9i1JU+ymsbEDmuI3BmunTPWayFOsWu3sA29sI0sRD6
         HJLK0NArpfZj68Wa5sj6fCxvIxRuqsEwO+pDCIrVOYVjX+KLo7eT+P48hV7q5P+pc4
         K/L6AWsAbGVmxOTKDFTAJku1/cuE3nr4H99hPx+k=
Date:   Fri, 24 Jul 2020 10:28:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rohit Bharadwaj <bharadwaj.rohit8@gmail.com>
Cc:     marvin24@gmx.de, p.zabel@pengutronix.de,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        ac100@lists.launchpad.net
Subject: Re: [PATCH v3] staging: nvec: change usage of slave to secondary
Message-ID: <20200724082810.GA3977020@kroah.com>
References: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
 <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
 <ac0f2bb4-7fa1-26a8-a43b-2db427188d4e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac0f2bb4-7fa1-26a8-a43b-2db427188d4e@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 24, 2020 at 01:44:27PM +0530, Rohit Bharadwaj wrote:
> On 24/07/20 10:06 am, Rohit K Bharadwaj wrote:
> > changed usage of slave (deprecated) to secondary
> > 
> > Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
> > ---
> > v3: change patch subject, add version history
> > v2: add changelog text in body of mail
> > v1: fix style issues by changing usage of slave to secondary
> > 
> >  drivers/staging/nvec/nvec.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> > index 360ec0407740..5d7b66719a39 100644
> > --- a/drivers/staging/nvec/nvec.c
> > +++ b/drivers/staging/nvec/nvec.c
> > @@ -718,7 +718,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > -static void tegra_init_i2c_slave(struct nvec_chip *nvec)
> > +static void tegra_init_i2c_secondary(struct nvec_chip *nvec)
> >  {
> >  	u32 val;
> >  
> > @@ -744,7 +744,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
> >  }
> >  
> >  #ifdef CONFIG_PM_SLEEP
> > -static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
> > +static void nvec_disable_i2c_secondary(struct nvec_chip *nvec)
> >  {
> >  	disable_irq(nvec->irq);
> >  	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
> > @@ -784,7 +784,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
> >  	platform_set_drvdata(pdev, nvec);
> >  	nvec->dev = dev;
> >  
> > -	if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr)) {
> > +	if (of_property_read_u32(dev->of_node, "secondary-addr", &nvec->i2c_addr)) {
> >  		dev_err(dev, "no i2c address specified");
> >  		return -ENODEV;
> >  	}
> > @@ -839,7 +839,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
> >  	}
> >  	disable_irq(nvec->irq);
> >  
> > -	tegra_init_i2c_slave(nvec);
> > +	tegra_init_i2c_secondary(nvec);
> >  
> >  	/* enable event reporting */
> >  	nvec_toggle_global_events(nvec, true);
> > @@ -913,7 +913,7 @@ static int nvec_suspend(struct device *dev)
> >  	if (!err)
> >  		nvec_msg_free(nvec, msg);
> >  
> > -	nvec_disable_i2c_slave(nvec);
> > +	nvec_disable_i2c_secondary(nvec);
> >  
> >  	return 0;
> >  }
> > @@ -923,7 +923,7 @@ static int nvec_resume(struct device *dev)
> >  	struct nvec_chip *nvec = dev_get_drvdata(dev);
> >  
> >  	dev_dbg(nvec->dev, "resuming\n");
> > -	tegra_init_i2c_slave(nvec);
> > +	tegra_init_i2c_secondary(nvec);
> >  	nvec_toggle_global_events(nvec, true);
> >  
> >  	return 0;
> > 
> Dear All, this message was not delivered to marvin24@gmx.de, I'm getting that The response from the remote server was:
> 554 gmx.net (mxgmx016) Nemesis ESMTP Service not available No SMTP service Reject due to policy restrictions, 

Not a big deal, email address atrophy over time.  That's why you always
cc: a public mailing list for patches.

thanks,

greg k-h
