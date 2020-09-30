Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EF8C4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 20:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D17C2075F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 20:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEMDCtG4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbgI3Ul4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 16:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3Ul4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 16:41:56 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 948C9C061755;
        Wed, 30 Sep 2020 13:41:56 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id f18so2058105pfa.10;
        Wed, 30 Sep 2020 13:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fKcEMy/ulXrnRj6nhbg7hxEiGUdxQcOBj8d9p5GeIrs=;
        b=dEMDCtG4Z8qeThTZjQSOV5VHZGsWYSPocP8+QB50e8Ff5aVZFQaP4AttnqsUN61UlM
         WuTkEr1O1+kOZsiqxThUtIIVfX6d84IQRDYm84K95UVwW3xzg4dJRUwMXuTwrTw5mlGF
         H3Ln4wcHNXa1OUniVjJRghT+eEk3lJ77ZJyR18IosybkkDAGmGC7gLPAsqdwxTkcd53z
         AxDBQtj2wXXbooKRbY3yzb1UzvtBVpreboS7xcBsu5Y69SPYySlv6kAIb1cczxiS0GCE
         t80P9PvOgL01FcRv4K347XKV/bNOzHWEbn9vEnaZ1BwEpLitz5n2ePuwElmWFz9OTph/
         BHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fKcEMy/ulXrnRj6nhbg7hxEiGUdxQcOBj8d9p5GeIrs=;
        b=J1Vi6wufgu9guogAYSIW0wSJMtF+qLqUJcJOMfq9X/5EuddCJKByW+rAPX2OVX03N+
         GBwQWUBVxAB+LnowAG6nckA3pXp/nUuNLl+EVJ2AyuGCAZ3rx1mzIsNa+keQpItlTBUP
         N0NkrhqTiRKIzjm+XlPqMv6IJJloK3D9+FQ6lk3XwWDiiXEzapCtaMhfKtGdByIW1mzS
         vSKUbpeTeQShdU7arewgbvYRafGKWcGfeji3pLXMNmQmJTdxbxq8gnprxWeCNMWVJEUW
         tJVNUgHyoSqqgEhf+aX9AMSCekzBfWXfD/TyGrVnJWUlpTprC3rXX3C8y2Bv2Y0irh3Z
         YIEw==
X-Gm-Message-State: AOAM530jbqEmGkVsMnLmG2K06JYkdyZ4507CuUQCshETLyNfxqW0Iy+B
        xBUaa3IINch9rSj2MPY308k=
X-Google-Smtp-Source: ABdhPJzLUM8z+Nxjy5D9N+ZEMW0GlDyPlbp49BmUAFMqmD/WlERu9xu3u5TBCCZifBmTcJBEUKnV+Q==
X-Received: by 2002:a63:f104:: with SMTP id f4mr3546772pgi.365.1601498515932;
        Wed, 30 Sep 2020 13:41:55 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id p11sm3545097pfq.130.2020.09.30.13.41.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 13:41:55 -0700 (PDT)
Date:   Wed, 30 Sep 2020 13:36:18 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930203618.GC2110@Asurada-Nvidia>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930153131.GB3833404@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 05:31:31PM +0200, Thierry Reding wrote:
> On Wed, Sep 30, 2020 at 01:42:57AM -0700, Nicolin Chen wrote:
> > Previously the driver relies on bus_set_iommu() in .probe() to call
> > in .probe_device() function so each client can poll iommus property
> > in DTB to configure fwspec via tegra_smmu_configure(). According to
> > the comments in .probe(), this is a bit of a hack. And this doesn't
> > work for a client that doesn't exist in DTB, PCI device for example.
> > 
> > Actually when a device/client gets probed, the of_iommu_configure()
> > will call in .probe_device() function again, with a prepared fwspec
> > from of_iommu_configure() that reads the SWGROUP id in DTB as we do
> > in tegra-smmu driver.
> > 
> > Additionally, as a new helper devm_tegra_get_memory_controller() is
> > introduced, there's no need to poll the iommus property in order to
> > get mc->smmu pointers or SWGROUP id.
> > 
> > This patch reworks .probe_device() and .attach_dev() by doing:
> > 1) Using fwspec to get swgroup id in .attach_dev/.dettach_dev()
> > 2) Removing DT polling code, tegra_smmu_find/tegra_smmu_configure()
> > 3) Calling devm_tegra_get_memory_controller() in .probe_device()
> > 4) Also dropping the hack in .probe() that's no longer needed.
> > 
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
[...]
> >  static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
> >  {
> > -	struct device_node *np = dev->of_node;
> > -	struct tegra_smmu *smmu = NULL;
> > -	struct of_phandle_args args;
> > -	unsigned int index = 0;
> > -	int err;
> > -
> > -	while (of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> > -					  &args) == 0) {
> > -		smmu = tegra_smmu_find(args.np);
> > -		if (smmu) {
> > -			err = tegra_smmu_configure(smmu, dev, &args);
> > -			of_node_put(args.np);
> > -
> > -			if (err < 0)
> > -				return ERR_PTR(err);
> > -
> > -			/*
> > -			 * Only a single IOMMU master interface is currently
> > -			 * supported by the Linux kernel, so abort after the
> > -			 * first match.
> > -			 */
> > -			dev_iommu_priv_set(dev, smmu);
> > -
> > -			break;
> > -		}
> > +	struct tegra_mc *mc = devm_tegra_get_memory_controller(dev);
> > +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> 
> It looks to me like the only reason why you need this new global API is
> because PCI devices may not have a device tree node with a phandle to
> the IOMMU. However, SMMU support for PCI will only be enabled if the
> root complex has an iommus property, right? In that case, can't we
> simply do something like this:
> 
> 	if (dev_is_pci(dev))
> 		np = find_host_bridge(dev)->of_node;
> 	else
> 		np = dev->of_node;
> 
> ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
> sure that exists.
> 
> Once we have that we can still iterate over the iommus property and do
> not need to rely on this global variable.

I agree that it'd work. But I was hoping to simplify the code
here if it's possible. Looks like we have an argument on this
so I will choose to go with your suggestion above for now.

> > -		of_node_put(args.np);
> > -		index++;
> > -	}
> > +	/* An invalid mc pointer means mc and smmu drivers are not ready */
> > +	if (IS_ERR(mc))
> > +		return ERR_PTR(-EPROBE_DEFER);
> >  
> > -	if (!smmu)
> > +	/*
> > +	 * IOMMU core allows -ENODEV return to carry on. So bypass any call
> > +	 * from bus_set_iommu() during tegra_smmu_probe(), as a device will
> > +	 * call in again via of_iommu_configure when fwspec is prepared.
> > +	 */
> > +	if (!mc->smmu || !fwspec || fwspec->ops != &tegra_smmu_ops)
> >  		return ERR_PTR(-ENODEV);
> >  
> > -	return &smmu->iommu;
> > +	dev_iommu_priv_set(dev, mc->smmu);
> > +
> > +	return &mc->smmu->iommu;
> >  }
> >  
> >  static void tegra_smmu_release_device(struct device *dev)
> > @@ -1089,16 +1027,6 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
> >  	if (!smmu)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > -	/*
> > -	 * This is a bit of a hack. Ideally we'd want to simply return this
> > -	 * value. However the IOMMU registration process will attempt to add
> > -	 * all devices to the IOMMU when bus_set_iommu() is called. In order
> > -	 * not to rely on global variables to track the IOMMU instance, we
> > -	 * set it here so that it can be looked up from the .probe_device()
> > -	 * callback via the IOMMU device's .drvdata field.
> > -	 */
> > -	mc->smmu = smmu;
> 
> I don't think this is going to work. I distinctly remember putting this
> here because we needed access to this before ->probe_device() had been
> called for any of the devices.

Do you remember which exact part of code needs to access mc->smmu
before ->probe_device() is called?

What I understood is that IOMMU core didn't allow ERR_PTR(-ENODEV)
return value from ->probe_device(), previously ->add_device(), to
carry on when you added this code/driver:
    commit 8918465163171322c77a19d5258a95f56d89d2e4
    Author: Thierry Reding <treding@nvidia.com>
    Date:   Wed Apr 16 09:24:44 2014 +0200
        memory: Add NVIDIA Tegra memory controller support

..until the core had a change one year later:
    commit 38667f18900afe172a4fe44279b132b4140f920f
    Author: Joerg Roedel <jroedel@suse.de>
    Date:   Mon Jun 29 10:16:08 2015 +0200
        iommu: Ignore -ENODEV errors from add_device call-back

As my commit message of this change states, ->probe_device() will
be called in from both bus_set_iommu() and really_probe() of each
device through of_iommu_configure() -- the later one initializes
an fwspec by polling the iommus property in the IOMMU core, same
as what we do here in tegra-smmu. If this works, we can probably
drop the hack here and get rid of tegra_smmu_configure().
