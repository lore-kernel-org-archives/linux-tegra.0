Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAD5C4727C
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 10:33:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECA362085B
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 10:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIlhuTNq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732150AbgJAKdt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 06:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732191AbgJAKdZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 06:33:25 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39524C0613D0;
        Thu,  1 Oct 2020 03:33:25 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q4so1742235pjh.5;
        Thu, 01 Oct 2020 03:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rGjo8l+NdpUXZUZilL4Q0g6fe7v4+HYilXIVrlEcVns=;
        b=kIlhuTNqwSTNhpHOrcs3e9r8cZPB4BQivq2B++Zm7J3/CHW/Q1TguGqKMZqeU9Etek
         rXcQE2DBMTI02L3/D7/2zw2SBASLVn7JPYyGbwvmCKZM6OOhy4ewV1MSEDCFAhJfZQto
         QoQE7DyXm+g8YWoG01UrHPNSjm6PV2+cNF/IQUanhW5bL0nJkaBH7oNnPZ7FCHECkU2E
         ERneJFOPz70xBd676Ns1f/VFEL0QcI4yxFSV5F9p8mbwe7lARibAQ7IuedFD9jtrJoai
         SThkqUcd9rE/QVJQ2RNjR8DrPFR7FOzdhfeOXK3F6s+7LflIhKxFx+DmyZrtEFN+51AP
         XstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rGjo8l+NdpUXZUZilL4Q0g6fe7v4+HYilXIVrlEcVns=;
        b=uRStvAmtjl+0Qls7hDHK/OUPjD5khEa4jfE352NMgujwahM3xihZlNApusydOMu5LP
         ttM57GKnqQknru/QfQXN/rkXYVDNXnjvFnqLSNee92HqHlIou29jWmEF+TMyuMDDifxI
         C35NZrcfVDfWzS1gikf9xBciroWbTMvWLQNJlujILmyr+M3MOdNm2iCJb/VBW40IfttU
         +zQ+xXR6MLZe5R3FUv2lbx/f51zweGSq/xZC4aYkxu6tpq9TOdEglidTVGdEX0RGUNqH
         PKjhlUuKjUh/yMfxNYL7XzBanuTmHQGb2RlRxNgD12ek1THxKuEwJGaAUER9Z9igVxcO
         LM2g==
X-Gm-Message-State: AOAM531xw5xXX9EoekWJPZv+qqd1i7rRZBJoscithsq68uFYeirxOCAS
        gcexkAk6SgsywkTjXZcjhxs=
X-Google-Smtp-Source: ABdhPJzDPpJPeWaB0a9XY6UYJikyluOcFnxBCnGqwbuZq2h+kV9PGioTgzS16S8Vp0+7n2WHSE0rVg==
X-Received: by 2002:a17:90b:a44:: with SMTP id gw4mr6137841pjb.26.1601548404519;
        Thu, 01 Oct 2020 03:33:24 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
        by smtp.gmail.com with ESMTPSA id h5sm5432799pja.55.2020.10.01.03.33.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Oct 2020 03:33:24 -0700 (PDT)
Date:   Thu, 1 Oct 2020 03:33:19 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201001103318.GA1272@Asurada>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <20201001095152.GD3919720@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001095152.GD3919720@ulmo>
User-Agent: Mutt/1.5.22 (2013-10-16)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 01, 2020 at 11:51:52AM +0200, Thierry Reding wrote:
> > > >> ...
> > > >>>> It looks to me like the only reason why you need this new global API is
> > > >>>> because PCI devices may not have a device tree node with a phandle to
> > > >>>> the IOMMU. However, SMMU support for PCI will only be enabled if the
> > > >>>> root complex has an iommus property, right? In that case, can't we
> > > >>>> simply do something like this:
> > > >>>>
> > > >>>> 	if (dev_is_pci(dev))
> > > >>>> 		np = find_host_bridge(dev)->of_node;
> > > >>>> 	else
> > > >>>> 		np = dev->of_node;
> > > >>>>
> > > >>>> ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
> > > >>>> sure that exists.

> > @@ -814,12 +815,15 @@ static struct tegra_smmu *tegra_smmu_find(struct device_node *np)
> >  }
> >  
> >  static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
> > -				struct of_phandle_args *args)
> > +				struct of_phandle_args *args, struct fwnode_handle *fwnode)
> >  {
> >  	const struct iommu_ops *ops = smmu->iommu.ops;
> >  	int err;
> >  
> > -	err = iommu_fwspec_init(dev, &dev->of_node->fwnode, ops);
> > +	if (!fwnode)
> > +		return -ENOENT;
> > +
> > +	err = iommu_fwspec_init(dev, fwnode, ops);
> >  	if (err < 0) {
> >  		dev_err(dev, "failed to initialize fwspec: %d\n", err);
> >  		return err;
> > @@ -835,6 +839,19 @@ static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
> >  	return 0;
> >  }
> >  
> > +static struct device_node *tegra_smmu_find_pci_np(struct pci_dev *pci_dev)
> > +{
> > +	struct pci_bus *bus = pci_dev->bus;
> > +	struct device *dev = &bus->dev;
> > +
> > +	while (!of_property_read_bool(dev->of_node, "iommus") && bus->parent) {
> > +		dev = &bus->parent->dev;
> > +		bus = bus->parent;
> > +	}
> > +
> > +	return dev->of_node;
> > +}
> 
> This seems like it's the equivalent of pci_get_host_bridge_device(). Can
> you use that instead? I think you might use the parent of the host
> bridge that's returned from that function, though.

I noticed that one when looking up one of the of_ functions, yet
also found that this pci_get_host_bridge_device() is privated by
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/pci/pci.h?id=975e1ac173058b8710e5979e97fc1397233301f3

Would PCI folks be that willing to (allow to) revert it?
