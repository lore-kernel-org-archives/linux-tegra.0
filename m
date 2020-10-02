Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7516FC4363C
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 23:59:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AE52206DB
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 23:59:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uV51v3n2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgJBX7c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 19:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgJBX7c (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 19:59:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D96BC0613D0;
        Fri,  2 Oct 2020 16:59:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id n14so2470219pff.6;
        Fri, 02 Oct 2020 16:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cEwMT8zhmCOTK4dn4wJHnutFKvkcPru3sg5M5Ou9uiQ=;
        b=uV51v3n2ao+EwdBPLJkXHu/VhIwvBHMFZOSMkL+r9h5h+g274KejT08OjfQL7We0m9
         Uw0QBu/jr9QMu1eOOv462dhyLHHg060jPWfyiq19WRnOCRZ/ELwmDGoxWzEalm9r/6SE
         KbIVX8T2SV1FxezmpWLedTryoK9HL2aWhme5O6GWoPKTFZRuwPJlcl+oloVUM7NoLW6a
         r4CDmPofaYOgrBuVER3otbXC/aAag6zaooih893H/nmfQvy11fAmgeCD/sxu10/JZbo7
         Ucnsc/8peSOS+WbzdqeA65q6aWJIl+2EV5yTr+wb4s/vm/0N8Y5UfBpaI62D9GXsRi4H
         tF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cEwMT8zhmCOTK4dn4wJHnutFKvkcPru3sg5M5Ou9uiQ=;
        b=KI6jDdHbfd6CyhHvBYR1HNdKD87Eg7jo8Z6SAMEHkxiT2ie9a6E/lT+3sqolzx/sVZ
         O0yQFurLZOtmcMpJmoNmIe7JhF+r0YkX5DmI4xpsqpcIt9crImojzo3reKyZ4AckYRrC
         MgL3n8M6sxbPz5B5j/snv2Ni4GbE4of4EWYjUhzQ91RBsvaLmUXjY9/Jf0Evn9A811YR
         So1VjQooe1jieKaOEa0Gn/RNF9wRM/S4iB8++wUuQ4An0W1z3OF4du+EmymP6uiU0cTD
         wKLlZa/0xnHlHsyA6qWxYcSTjfMf7beMkKw/4w94rUhxpOucwcIuSK12jtfinbQcynJY
         kQYg==
X-Gm-Message-State: AOAM5315kvzwoFid7w3qyIuENBclarGDT/7UK59C4Q5LvYcHP3An/ntM
        4Sl2r84dL/rloeX/2rJCY8Y=
X-Google-Smtp-Source: ABdhPJwAQRO8CGixT56i5K6YcLkU40fsKQ1AdlA/xQtYW8SDhWeD6964MtOOPLb5Vz4J0S+BkHIf9A==
X-Received: by 2002:a05:6a00:174a:b029:152:2bb6:4877 with SMTP id j10-20020a056a00174ab02901522bb64877mr4848736pfc.29.1601683171943;
        Fri, 02 Oct 2020 16:59:31 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id i62sm3405092pfe.140.2020.10.02.16.59.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 16:59:31 -0700 (PDT)
Date:   Fri, 2 Oct 2020 16:53:30 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] iommu/tegra-smmu: Use fwspec in
 tegra_smmu_(de)attach_dev
Message-ID: <20201002235329.GA11409@Asurada-Nvidia>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-2-nicoleotsuka@gmail.com>
 <de0b717f-af5c-8813-eb3e-07d19eff5271@gmail.com>
 <20201002194508.GD29706@Asurada-Nvidia>
 <e594374b-d701-fb6f-93f2-4efb9c5eb608@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e594374b-d701-fb6f-93f2-4efb9c5eb608@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 02, 2020 at 11:12:18PM +0300, Dmitry Osipenko wrote:
> 02.10.2020 22:45, Nicolin Chen пишет:
> > On Fri, Oct 02, 2020 at 05:41:50PM +0300, Dmitry Osipenko wrote:
> >> 02.10.2020 09:08, Nicolin Chen пишет:
> >>>  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
> >>>  				 struct device *dev)
> >>>  {
> >>> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> >>>  	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
> >>>  	struct tegra_smmu_as *as = to_smmu_as(domain);
> >>> -	struct device_node *np = dev->of_node;
> >>> -	struct of_phandle_args args;
> >>>  	unsigned int index = 0;
> >>>  	int err = 0;
> >>>  
> >>> -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> >>> -					   &args)) {
> >>> -		unsigned int swgroup = args.args[0];
> >>> -
> >>> -		if (args.np != smmu->dev->of_node) {
> >>> -			of_node_put(args.np);
> >>> -			continue;
> >>> -		}
> >>> -
> >>> -		of_node_put(args.np);
> >>> +	if (!fwspec)
> >>> +		return -ENOENT;
> >>
> >> Could the !fwspec ever be true here as well?
> > 
> > There are multiple callers of this function. It's really not that
> > straightforward to track every one of them. So I'd rather have it
> > here as other iommu drivers do. We are human beings, so we could
> > have missed something somewhere, especially callers are not from
> > tegra-* drivers.
> > 
> 
> I'm looking at the IOMMU core and it requires device to be in IOMMU
> group before attach_dev() could be called.
> 
> The group can't be assigned to device without the fwspec, see
> tegra_smmu_device_group().
>
> Seems majority of IOMMU drivers are checking dev_iommu_priv_get() for
> NULL in attach_dev(), some not checking anything, some check both and
> only arm-smmu checks the fwspec.

As I said a couple of days ago, I don't like to assume that the
callers won't change. And this time, it's from open code. So I
don't want to assume that there won't be a change.

If you are confident that there is no need to add such a check,
please send patches to remove those checks in those drivers to
see if others would agree. I would be willing to remove it after
that. Otherwise, I'd like to keep this.

Thanks for the review.
