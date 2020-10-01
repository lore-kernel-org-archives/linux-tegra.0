Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BF6C4363D
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 01:32:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADB46207C3
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 01:32:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPmVyKZS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729617AbgJABcO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 21:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727210AbgJABcO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 21:32:14 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B279BC061755;
        Wed, 30 Sep 2020 18:32:12 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id k8so2866056pfk.2;
        Wed, 30 Sep 2020 18:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=z8LIhLPs0CLI8pgGxkD8y/EyOMrZ9o3X/QkFKdqYOkY=;
        b=hPmVyKZSZIWUx3U9XvhNpCdAUv3EOSbI50OUAVahggy4kboKiB5dkvCcnCaaE44K9p
         VcLL3BA+StQzYj4DsxKjJz3yLh33p/0et1CLvdfHNxmuHIs7YIoEuASZrvdHAHBOQ+bt
         hbfahfAL9NLdfXltVXPGKIY+5Yx90b0iZx0cbX8xt4K5eYSgGFgmgJqQilKRHR9hSG4M
         71lrsV/5SlX2ie7jFjAKPG2d1aW1ktENRyagnbAoHZg9efzO/OiKuxiqVC4aNWqKRoic
         LVraKaGqvIZGF0+mx69zTTopn+4cDHVg++iV4SI9zUiXI8bzlnYqvA0XZusig0FRtcXx
         TUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=z8LIhLPs0CLI8pgGxkD8y/EyOMrZ9o3X/QkFKdqYOkY=;
        b=MFthPv1h6s8nAN19T8LPuKyKEgMRvSHCrUr1hQ7SV/lPlsCmgvih76Rp3cjrN6TUKb
         qh2iIYU/eF0oWrRc4mLyPZhRU6gbJETGv2uQNCGjqYQX+7CYEnburba1b6sWWZoQRyet
         06KAW6cooiqef+cRkzcPgZl9Lj5WlrdcAJOdUE5hmM8Tn+yddYKOQ4pT+fxibOXGI8nb
         /4HUQNmH8slhRYuOGvXXqmUuPkiRjVWiZjty1GNzMuHdEJarbGAn54H09W8fLnyYKJRj
         k7ecYsfglo+pJvf1nvXeFhm7Vx+xxePe38Bx9myr1sSVg2WLabaTgRQ5exF8v3BoGuUi
         jhog==
X-Gm-Message-State: AOAM532jwhxm0+6yjb19CNZzaGklHF8SMDtv21US9ZJSKYr/Kl7xOgoV
        7UyW4OQfbCHL6gMZJLLeZu4=
X-Google-Smtp-Source: ABdhPJxwlnwGtdmC3yo/+A3DVIPS7iRM1g+GOpZ6teMUos8ZoA+cxlB0PTpGBm/hnlysi09P+RI/MA==
X-Received: by 2002:a63:e802:: with SMTP id s2mr4195240pgh.350.1601515932087;
        Wed, 30 Sep 2020 18:32:12 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id c3sm3871806pfn.23.2020.09.30.18.32.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 18:32:11 -0700 (PDT)
Date:   Wed, 30 Sep 2020 18:26:30 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201001012630.GA28240@Asurada-Nvidia>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 01, 2020 at 12:56:46AM +0300, Dmitry Osipenko wrote:
> 01.10.2020 00:32, Nicolin Chen пишет:
> > On Thu, Oct 01, 2020 at 12:24:25AM +0300, Dmitry Osipenko wrote:
> >> ...
> >>>> It looks to me like the only reason why you need this new global API is
> >>>> because PCI devices may not have a device tree node with a phandle to
> >>>> the IOMMU. However, SMMU support for PCI will only be enabled if the
> >>>> root complex has an iommus property, right? In that case, can't we
> >>>> simply do something like this:
> >>>>
> >>>> 	if (dev_is_pci(dev))
> >>>> 		np = find_host_bridge(dev)->of_node;
> >>>> 	else
> >>>> 		np = dev->of_node;
> >>>>
> >>>> ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
> >>>> sure that exists.
> >>>>
> >>>> Once we have that we can still iterate over the iommus property and do
> >>>> not need to rely on this global variable.
> >>>
> >>> I agree that it'd work. But I was hoping to simplify the code
> >>> here if it's possible. Looks like we have an argument on this
> >>> so I will choose to go with your suggestion above for now.
> >>
> >> This patch removed more lines than were added. If this will be opposite
> >> for the Thierry's suggestion, then it's probably not a great suggestion.
> > 
> > Sorry, I don't quite understand this comments. Would you please
> > elaborate what's this "it" being "not a great suggestion"?
> > 
> 
> I meant that you should try to implement Thierry's solution, but if the
> end result will be worse than the current patch, then you shouldn't make
> a v4, but get back to this discussion in order to choose the best option
> and make everyone agree on it.

I see. Thanks for the reply. And here is a sample implementation:

@@ -814,12 +815,15 @@ static struct tegra_smmu *tegra_smmu_find(struct device_node *np)
 }
 
 static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
-				struct of_phandle_args *args)
+				struct of_phandle_args *args, struct fwnode_handle *fwnode)
 {
 	const struct iommu_ops *ops = smmu->iommu.ops;
 	int err;
 
-	err = iommu_fwspec_init(dev, &dev->of_node->fwnode, ops);
+	if (!fwnode)
+		return -ENOENT;
+
+	err = iommu_fwspec_init(dev, fwnode, ops);
 	if (err < 0) {
 		dev_err(dev, "failed to initialize fwspec: %d\n", err);
 		return err;
@@ -835,6 +839,19 @@ static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
 	return 0;
 }
 
+static struct device_node *tegra_smmu_find_pci_np(struct pci_dev *pci_dev)
+{
+	struct pci_bus *bus = pci_dev->bus;
+	struct device *dev = &bus->dev;
+
+	while (!of_property_read_bool(dev->of_node, "iommus") && bus->parent) {
+		dev = &bus->parent->dev;
+		bus = bus->parent;
+	}
+
+	return dev->of_node;
+}
+
 static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
@@ -843,11 +860,14 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 	unsigned int index = 0;
 	int err;
 
+	if (dev_is_pci(dev))
+		np = tegra_smmu_find_pci_np(to_pci_dev(dev));
+
 	while (of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
 					  &args) == 0) {
 		smmu = tegra_smmu_find(args.np);
 		if (smmu) {
-			err = tegra_smmu_configure(smmu, dev, &args);
+			err = tegra_smmu_configure(smmu, dev, &args, &np->fwnode);
 			of_node_put(args.np);
 
 			if (err < 0)

