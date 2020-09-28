Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97646C4727F
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 23:43:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D3DD2078B
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 23:43:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIyYvXda"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgI1Xno (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 19:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgI1Xno (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 19:43:44 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F44DC0613E8;
        Mon, 28 Sep 2020 15:23:47 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e18so2160833pgd.4;
        Mon, 28 Sep 2020 15:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tSPHkz2Us2cBVrXsw7CUcaG7reiU6MJM3Q+fVPb4/V4=;
        b=DIyYvXda4Y/TU2MXpd1ebaArX3qhiMfcRdRNbSkXa5hQslxaMnK4ic55ZdFZUN44k4
         /AOhYWUIwwQ/S0VOSzS+Q/bn6r/x2jMDXV9nVs7J7Daboi4EcAhQr9/fj61F7BA5+e2o
         030EuPuiUEf3ouHFfk53YFkZQPJ4GH9icqIJ+Cb/20CDZsCcK1bqjpse11G/Ze0PkWNg
         aE1oJG82zuADToC8R71oOO7l8E86eAUD1ZNWU+36AsNbEqzhYJWLYALX8P1DR41ojYT+
         7aBdX76Bmdu2eWuRywwB7khwNBTK2pw7lPcsaqzTH77pkfsceyKLC3b7Qw9iIq4Ns8dv
         LAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tSPHkz2Us2cBVrXsw7CUcaG7reiU6MJM3Q+fVPb4/V4=;
        b=YxeE5QCG5fdmXiZ4jSCSdd8NzlYyxrXCMChd4O6muZqCbD9azpPD9csRvpgJDGMsOx
         Ft712FlD+82VLaENvao1/J/O8gmeYNlXRfHFn+UwqrQ8mMshhsSoLcIfTIyRdVSX7XbA
         tpT8z+7LyJfisC2NzgEGod24SRK3KQHqCBx7BfAV8wcBJCbbNBzPPe26Moy2H9BnVM+A
         uhqZ+EyBlcoZBTmt6Ky43X0Wt3zvsnXMq/B8L8v5iysfQmJ1ZZxm+VB0aoTAg1SsayA5
         //lafcdimFzQPDXTq/IZkH/LmVDLPeRBmn2UjN0lrtpRSeBzuRJPs1y3gOteZeP9PfSU
         Jr2w==
X-Gm-Message-State: AOAM531BcRRmvb8C6ylzlz9dP5L6ib8d9ySXGqFoessSLd6oXXsS+fnI
        BoWm4y1sYTmaf0hBXzQnf/CSkbKJL/c=
X-Google-Smtp-Source: ABdhPJxIJMbt3uGyV6MRNLX4bn9gZegg0TMjxu5SzarjjqRjk+cvpxgMfgQd3kyo9zPsMvEoUw6Cmw==
X-Received: by 2002:a63:e61:: with SMTP id 33mr857877pgo.394.1601331826526;
        Mon, 28 Sep 2020 15:23:46 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id n72sm3129174pfd.27.2020.09.28.15.23.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 15:23:46 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:18:29 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] iommu/tegra-smmu: Use iommu_fwspec in
 .probe_/.attach_device()
Message-ID: <20200928221829.GB15720@Asurada-Nvidia>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-4-nicoleotsuka@gmail.com>
 <20200928075212.GF2837573@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928075212.GF2837573@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Sep 28, 2020 at 09:52:12AM +0200, Thierry Reding wrote:
> On Sat, Sep 26, 2020 at 01:07:17AM -0700, Nicolin Chen wrote:
> > @@ -13,6 +13,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> >  #include <linux/spinlock.h>
> > +#include <linux/dma-iommu.h>
> 
> Why is this needed? I don't see any of the symbols declared in that file
> used here.

Hmm..I think I mixed with some other change that needs this header
file. Removing it....

> >  #include <linux/dma-mapping.h>
> >  
> >  #include <soc/tegra/ahb.h>
> > @@ -61,6 +62,8 @@ struct tegra_smmu_as {
> >  	u32 attr;
> >  };
> >  
> > +static const struct iommu_ops tegra_smmu_ops;
> > +
> >  static struct tegra_smmu_as *to_smmu_as(struct iommu_domain *dom)
> >  {
> >  	return container_of(dom, struct tegra_smmu_as, domain);
> > @@ -484,60 +487,49 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
> >  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
> >  				 struct device *dev)
> >  {
> > +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> >  	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
> >  	struct tegra_smmu_as *as = to_smmu_as(domain);
> > -	struct device_node *np = dev->of_node;
> > -	struct of_phandle_args args;
> > -	unsigned int index = 0;
> > -	int err = 0;
> > -
> > -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> > -					   &args)) {
> > -		unsigned int swgroup = args.args[0];
> > -
> > -		if (args.np != smmu->dev->of_node) {
> > -			of_node_put(args.np);
> > -			continue;
> > -		}
> > +	int index, err = 0;
> >  
> > -		of_node_put(args.np);
> > +	if (!fwspec || fwspec->ops != &tegra_smmu_ops)
> > +		return -ENOENT;
> >  
> > +	for (index = 0; index < fwspec->num_ids; index++) {
> >  		err = tegra_smmu_as_prepare(smmu, as);
> > -		if (err < 0)
> > -			return err;
> > +		if (err)
> > +			goto err_disable;
> 
> I'd personally drop the err_ prefix here because it's pretty obvious
> that we're going to do this as a result of an error happening.

Changing to "goto disable".

> > @@ -845,10 +837,25 @@ static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
> >  	return 0;
> >  }
> >  
> > +static struct tegra_smmu *tegra_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
> > +{
> > +	struct device *dev = driver_find_device_by_fwnode(&tegra_mc_driver.driver, fwnode);
> > +	struct tegra_mc *mc;
> > +
> > +	if (!dev)
> > +		return NULL;
> > +
> > +	put_device(dev);
> > +	mc = dev_get_drvdata(dev);
> > +
> > +	return mc->smmu;
> > +}
> > +
> 
> As I mentioned in another reply, I think tegra_smmu_find() should be all
> you need in this case.

This function is used by .probe_device() where its dev pointer is
an SMMU client. IIUC, tegra_smmu_find() needs np pointer of "mc".
For a PCI device that doesn't have a DT node with iommus property,
not sure how we can use tegra_smmu_find().
