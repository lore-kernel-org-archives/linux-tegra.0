Return-Path: <SRS0=jT6+=BD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A952C433F8
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 16:23:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C2B8206D8
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595607814;
	bh=kWOqPLbIxJiKn2O2IMkU20zkOXo+hlHrLVnq9YiRIdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=faLkNUU6abYIO5Q/8ea44tSE7maEIIJgBgzjaE1VA+a1de59TWKfkDp/5V9biHdBz
	 tM0q+9Po4QuRANMU6RNvoDYtLfDstUzN86UrHoDeb7lA4vDXgPU2mIhezoeu1y9h96
	 TCJchhC5GGvJCki5ctG0Cwqg3gnvKHZzHcY4L1MY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgGXQXd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jul 2020 12:23:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:49690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726895AbgGXQXa (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jul 2020 12:23:30 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BB865206F6;
        Fri, 24 Jul 2020 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595607810;
        bh=kWOqPLbIxJiKn2O2IMkU20zkOXo+hlHrLVnq9YiRIdM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZOXUlXMIY/dy791ByZRJ63cB2egO9nk3M7qJOLqhKrgnbZZlON8BA3+KofLbzKdra
         dHvIFpK/XYU1UNIiglMjNnNCd5+gB1vqF+lJarw4ktB6t5aLp9XBIX2hxpZbvbuNt1
         v2rHtUVGyEhjnLgcyXdHPNRvV9y088qo48x39dn4=
Date:   Fri, 24 Jul 2020 18:23:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        devel@driverdev.osuosl.org, marvin24@gmx.de,
        p.zabel@pengutronix.de, linux-tegra@vger.kernel.org,
        ac100@lists.launchpad.net
Subject: Re: [PATCH v3] staging: nvec: change usage of slave to secondary
Message-ID: <20200724162331.GA542507@kroah.com>
References: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
 <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
 <20200724140947.GW2549@kadam>
 <79c59734-d4ed-7968-5c9d-17d0ffe37b73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79c59734-d4ed-7968-5c9d-17d0ffe37b73@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 24, 2020 at 09:21:47PM +0530, Rohit K Bharadwaj wrote:
> On 24/07/20 7:39 pm, Dan Carpenter wrote:
> > On Fri, Jul 24, 2020 at 10:06:34AM +0530, Rohit K Bharadwaj wrote:
> >> @@ -784,7 +784,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
> >>  	platform_set_drvdata(pdev, nvec);
> >>  	nvec->dev = dev;
> >>  
> >> -	if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr)) {
> >> +	if (of_property_read_u32(dev->of_node, "secondary-addr", &nvec->i2c_addr)) {
> > 
> > Sorry, I should have looked for v3 at the start to reply to it.  This
> > line will break the driver.
> > 
> > regards,
> > dan carpenter
> > 
> 
> Thank you for your review sir, my intention was to fix kernel coding style issues and hence had picked this one. 
> Could you please let me know whether I should undo that particular line and submit the patch again so as not to break the driver? 

Try making patches that do not break things :)

Maybe a different type of patch?

thanks,

greg k-h
