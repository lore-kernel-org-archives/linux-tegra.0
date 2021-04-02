Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7707C433B4
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Apr 2021 04:21:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BE99610E7
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Apr 2021 04:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhDBEV6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Apr 2021 00:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhDBEV5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Apr 2021 00:21:57 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E77C0613E6;
        Thu,  1 Apr 2021 21:21:55 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id x126so2848598pfc.13;
        Thu, 01 Apr 2021 21:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WpaaAD4PmenHHvOL/jyRNYMJvLhUShrEir1c7Nvth/w=;
        b=TiJLbOXPDzTlqOKy5t1e7/FJ7kHujYcoRlmf0TDUDrdD+jIAB9lqtjO4UDN/+Xl9nY
         7d/nJ1e1UlB3HmHXr1mZ0lLpdl3ZjZRHTEr1SoofgI7XmUtSGRI6NJKNfn9tVIFF+u4A
         T5p2fCub/HvLz3VC7QesCriApf1lEOQ/uHcSjaqHFgsTtqD3xUnPvtFQylPiLUspBj/0
         u7hi9LIVl28SO/7ChuAPzlofRIEP99j833FvcqOfI0Vkj1PrEwFxDhReBA0LWRArtSEs
         Xwnk6Qx2nLc35xpHoDJv4xlCXISvv2KmZyvv8PEzF4UT3ZN2ykvHT6RmqJe+TezFcu+2
         9bbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WpaaAD4PmenHHvOL/jyRNYMJvLhUShrEir1c7Nvth/w=;
        b=gj/+Xm2zVycBK9aa2GPckSKE0XOd08/EAaUxTraGTieC/iYk74By4okqxszXJMbzcR
         8DsNYC+Z3jrGU6SE2x42GXQoq39s8EiYual9AWJHEQfQRR0I7SISWwCFJZ2xER+SsAtk
         SLDF4OfGlo0v9sTXj0Imeq9Y/Z53/fe4fqeaEqVYFBcCrgWvXLS7AsMNH6xrC89bUnT7
         cC9/bP/YRAKpnmHjS5up7MiCaifY7bWkEwo3IXHaTDXPxhwKqxyMhFfUw1H6643A9wFf
         OEoE9S3BPpY/fUO9/9oLi/hIJDEmr/f2uN92oYDnHgRHvhdjd6C60rYEue9Psf+ahGys
         FyYg==
X-Gm-Message-State: AOAM530xA0WOTGXci14CezqnLI9Iw3eZVxsxaJlOZiri5n9cVU8z630S
        1RN6ij1hlhkqIy2qEWl7iJ0=
X-Google-Smtp-Source: ABdhPJyMgaBfBZCLfajiEHBf2YuYh0t6oFpmY6xtz0Nj9SKi5CRXY7FXqgFjYwPvIDhkjivbml4vhQ==
X-Received: by 2002:a62:1ad5:0:b029:1fa:c667:2776 with SMTP id a204-20020a621ad50000b02901fac6672776mr10524988pfa.6.1617337314902;
        Thu, 01 Apr 2021 21:21:54 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id v13sm6423592pfu.54.2021.04.01.21.21.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 21:21:54 -0700 (PDT)
Date:   Thu, 1 Apr 2021 21:19:56 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     joro@8bytes.org, will@kernel.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] iommu/tegra-smmu: Add pagetable mappings to debugfs
Message-ID: <20210402041954.GB31146@Asurada-Nvidia>
References: <20210315203631.24990-1-nicoleotsuka@gmail.com>
 <YFCTmwpg9pMQqcSu@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFCTmwpg9pMQqcSu@orome.fritz.box>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Mar 16, 2021 at 12:16:43PM +0100, Thierry Reding wrote:

> > +struct tegra_smmu_group_debug {
> > +	const struct tegra_smmu_swgroup *group;
> > +	void *priv;
> 
> This always stores the address space, so why not make this:
> 
> 	struct tegra_smmu_as *as;
> 
> ? While at it, perhaps throw in a const to make sure we don't modify
> this structure in the debugfs code.

OK. I will try to change that.

> > @@ -334,7 +350,7 @@ static void tegra_smmu_domain_free(struct iommu_domain *domain)
> >  }
> >  
> >  static const struct tegra_smmu_swgroup *
> > -tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
> > +tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup, int *index)
> >  {
> >  	const struct tegra_smmu_swgroup *group = NULL;
> >  	unsigned int i;
> > @@ -342,6 +358,8 @@ tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
> >  	for (i = 0; i < smmu->soc->num_swgroups; i++) {
> >  		if (smmu->soc->swgroups[i].swgroup == swgroup) {
> >  			group = &smmu->soc->swgroups[i];
> > +			if (index)
> > +				*index = i;
> 
> This doesn't look like the right place for this. And this also makes
> things hard to follow because it passes out-of-band data in the index
> parameter.
> 
> I'm thinking that this could benefit from a bit of refactoring where
> we could for example embed struct tegra_smmu_group_debug into struct
> tegra_smmu_group and then reference that when necessary instead of
> carrying all that data in an orthogonal array. That should also make
> it easier to track this.
> 
> Come to think of it, everything that's currently in your new struct
> tegra_smmu_group_debug would be useful in struct tegra_smmu_group,
> irrespective of debugfs support.

Will try to embed it or see what I can do following the suggestion.

> > +static int tegra_smmu_mappings_show(struct seq_file *s, void *data)
> > +{

> > +	seq_printf(s, "\nSWGROUP: %s\nASID: %d\nreg: 0x%x\n",
> > +		   group->name, as->id, group->reg);
> 
> Is group->reg really that useful here?

Can drop it.

> > +
> > +	smmu_writel(smmu, as->id & 0x7f, SMMU_PTB_ASID);
> > +	ptb_reg = smmu_readl(smmu, SMMU_PTB_DATA);
> > +
> > +	seq_printf(s, "PTB_ASID: 0x%x\nas->pd_dma: %pad\n",
> > +		   ptb_reg, &as->pd_dma);
> 
> This looks somewhat redundant because as->pd_dma is already part of the
> PTB_ASID register value. Instead, perhaps decode the upper bits of that
> register and simply output as->pdma so that we don't duplicate the base
> address of the page table?

That's a good idea. Will change that too.
