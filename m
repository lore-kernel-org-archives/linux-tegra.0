Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40523C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 20:22:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2057C6103B
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 20:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241670AbhJGUY0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 16:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232840AbhJGUY0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 16:24:26 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6B9C061570;
        Thu,  7 Oct 2021 13:22:32 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id r201so900039pgr.4;
        Thu, 07 Oct 2021 13:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HMaYYwsvFJu5yPYeNceqJv1VciF17Wkz8xL47+/e1L8=;
        b=J4ObbtFRwTCG0JKtwfHFlWa3eyOzbC9HVmhoQwJOBNP4h+lo96nNKpk4NwBL1oM3RX
         qEO5ahF6tAERGlLyvxmiwnjk9qZHfIG3vbKhVHFnEWwOXFElr9eRS+VkuANLU+kDVFBa
         o6eiWzGdpvpTONifC0Kpmxm+IpNQaqtu331D3ImpmMUfB3tqGKN+jFb8hzT9mfR/KiO4
         5XxWFBQzQGG94c7qaDOTHFpvjR1sj4cqtPmUK0yl5/4X91Lfkz5cw0E5rcyhx8qNUMed
         xQ9qew0VfhNWkCmxZQDbZ/VYKajeVVaa7zhbgOWLzmUnpqa05KpT+tV87xMPtpA6dL3y
         S4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HMaYYwsvFJu5yPYeNceqJv1VciF17Wkz8xL47+/e1L8=;
        b=4J5/vtW4kMFAdFaLMMYvPMfCQk0QEq4igqc69BAaosjl1XYrRd78mEZUEe6J/eqggk
         eAfxCPRoZl9g/LfRYYb01MfpTDfY4o7+WZGqq1VCgd7mEAm/sBfHKN+tFcs4fb40VjDA
         TiYzBNXHhTQOZpwME6Uv6eZ20s+Y/WIKdvjNZ0CC9CxSMigrLWiowk0mkDd27qTxyvnj
         nVvXpIbAiXE3k2YEcUUCFj9KlbC8A10tBuKH58Jwd2BtNqfRsatJ5EhhYJGaJp7BW+ZE
         GqBptpUKI5STl2SHASK33mrYcOw8YphOzCqYbiH8IITm+e4JCgL2UdUzXOYcJDDaYhI4
         MKTw==
X-Gm-Message-State: AOAM533wNSDLbhY86HAC6Ub9bi63l7kdqIO855IyCs1b9XAy5WvGJ9eu
        RvW0wLUt/qveWL+0D9aAdD6xk5yoGlGgqg==
X-Google-Smtp-Source: ABdhPJyWqbvttFSUpjAZX/J/4Z8uWkF6W0LrsVdB4sFKKLf9QDWamxebP3Su12mkH8ig8En3cJ8KGA==
X-Received: by 2002:a63:101c:: with SMTP id f28mr1336126pgl.330.1633638151472;
        Thu, 07 Oct 2021 13:22:31 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d18sm188951pgk.24.2021.10.07.13.22.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 13:22:31 -0700 (PDT)
Date:   Thu, 7 Oct 2021 13:14:56 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     joro@8bytes.org, will@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        digetx@gmail.com
Subject: Re: [PATCH v6 2/6] iommu/tegra-smmu: Rename struct
 tegra_smmu_group_soc *soc to *group_soc
Message-ID: <20211007201455.GA20821@Asurada-Nvidia>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-3-nicoleotsuka@gmail.com>
 <YV8lbCePQet+vICa@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YV8lbCePQet+vICa@orome.fritz.box>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 07, 2021 at 06:50:52PM +0200, Thierry Reding wrote:

> >  static const struct tegra_smmu_group_soc *
> > -tegra_smmu_find_group(struct tegra_smmu *smmu, unsigned int swgroup)
> > +tegra_smmu_find_group_soc(struct tegra_smmu *smmu, unsigned int swgroup)
> 
> This one might be okay to disambiguate, but even here I think this isn't
> really necessary. It's already clear from the return value what's being
> returned.

The point here is to disambiguate "group", as there are quite a few
places using the same naming for different structures. You may argue
that it's clear by looking at the return value/type. But it is still
hard to tell when reading the code of its caller, right?

> > @@ -921,9 +922,9 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
> >  	}
> >  
> >  	INIT_LIST_HEAD(&group->list);
> > +	group->group_soc = group_soc;
> >  	group->swgroup = swgroup;
> >  	group->smmu = smmu;
> > -	group->soc = soc;
> 
> As another example, it's pretty evident that group->soc refers to the
> group SoC data rather than the SMMU SoC data. The latter can be obtained
> from group->smmu->soc, which again is enough context to make it clear
> what this is.
> 
> So I don't think this makes things any clearer. It only makes the names
> more redundant and awkward to write.

Okay. I will drop the part of s/soc/group_soc.
