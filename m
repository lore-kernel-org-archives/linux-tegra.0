Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE26C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 20:49:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 939FC603E5
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 20:49:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241753AbhJGUvs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 16:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242589AbhJGUv1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 16:51:27 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B73FC0613E6;
        Thu,  7 Oct 2021 13:49:05 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id qe4-20020a17090b4f8400b0019f663cfcd1so7866877pjb.1;
        Thu, 07 Oct 2021 13:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bhgPzo/xge5/zFI2TSPfpgswsPE9zHpB8iHMVkQHlSw=;
        b=jI9nq91FC8rOOui8jGO8sglNaGKserkkZQ8zpLMKvtnOot+ZzxLVwmEpspyWhkEwOj
         ynAJoTDWnWjCs/e5do50HTfEdL5GlIrsbnAkHpikDeFk63Q+oHmhpi23U57DzboQ1H+i
         1DFGzDSnSKy99ymTAFYz7hk+TDKTh1prB6oGBqqVlO3ej1v7NeTdqh8DWNepH+bt5COy
         NvIvzWv0jmcbB0+Q7RTH6TSSJCrKPudoAKJIhcc8RmL0ymrwpFuT8nMI1lTtccwlgpEu
         ST79XaDFTaoFinmIZrJpHGfHZ8WcwkwOzCWKTMx8joQrimsuuBANsfIO1zJzX4jzUGLn
         rG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bhgPzo/xge5/zFI2TSPfpgswsPE9zHpB8iHMVkQHlSw=;
        b=TFq4rFrNLvYmLCligx4iTyI3nysIh0Q35FY6eC3tS+9NgnI69DQSpa3OPbQRAKybZp
         157PA8dSBtPqxFzHLb8DgOlzsfb9ITu9Nx5m9esgVtuqo6PSRtQCd4ZZxwaWYK0yuGzA
         Psoz259A73zCOYve//KPFceJNRvKVIE1kSxaUQIaJzWgOoenlkjg5PVoSI7sWBOWs0fq
         qsiWjVSPnIKBtcbRiGFmNSm5HdIvytWmu9Lai+7VeBLKAUj33f5hjKsvg3JuTBXavbY4
         5i6OiH3MMmnc0pioVvPtjanhhhc6UmMlJaYIzOftLBVuG18G2ga8RZsqZxakezRmv9bL
         x7Hg==
X-Gm-Message-State: AOAM531KCS4KltTWoI/AXP3VPLNs6lPfYlPfRn/3PsOCRfodIVS5aVOL
        EeTrz6N1B9v+1MyGlsUORKw=
X-Google-Smtp-Source: ABdhPJwTfQIIFj6A+SKeWcAntMwEp6giOe8pAQOzHut75MmdlBJMJYeol8+c3sUZA+CVZHY8ngTnlw==
X-Received: by 2002:a17:90b:3b8e:: with SMTP id pc14mr7413160pjb.180.1633639744494;
        Thu, 07 Oct 2021 13:49:04 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id 1sm281000pfm.163.2021.10.07.13.49.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 13:49:04 -0700 (PDT)
Date:   Thu, 7 Oct 2021 13:41:31 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     joro@8bytes.org, will@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        digetx@gmail.com
Subject: Re: [PATCH v6 6/6] iommu/tegra-smmu: Add pagetable mappings to
 debugfs
Message-ID: <20211007204131.GC20821@Asurada-Nvidia>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-7-nicoleotsuka@gmail.com>
 <YV8qtdicr4+PcIAf@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YV8qtdicr4+PcIAf@orome.fritz.box>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 07, 2021 at 07:13:25PM +0200, Thierry Reding wrote:
> > @@ -496,6 +506,8 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
> >  	mutex_unlock(&smmu->lock);
> >  }
> >  
> > +static const struct file_operations tegra_smmu_debugfs_mappings_fops;
> 
> Could the implementation be moved up here to avoid the forward
> declaration?

I thought that keeping all debugfs fops together would be preferable.
But yes, I will move it if you prefer no-additional forward declare.

> > +	seq_printf(s, "\nSWGROUP: %s\n", swgrp->name);
> > +	seq_printf(s, "as->id: %d\nas->attr: %c|%c|%s\nas->pd_dma: %pad\n", as->id,
> > +		   as->attr & SMMU_PD_READABLE ? 'R' : '-',
> > +		   as->attr & SMMU_PD_WRITABLE ? 'W' : '-',
> > +		   as->attr & SMMU_PD_NONSECURE ? "NS" : "S",
> > +		   &as->pd_dma);
> > +	seq_puts(s, "{\n");
> 
> Maybe this can be more compact by putting the name, ID, attributes and
> base address onto a single line? Maybe also use "'-' : 'S'" for the
> non-secure attribute to keep in line with what you've done for readable
> and writable attributes.

Okay. Will change that.

> Then again, this is going to be very verbose output anyway, so maybe it
> isn't worth it.

Are you saying the whole debugfs thing or just attributes? Yet, for
either case, I don't think so, as mappings info would help for sure
from our past experience while the attributes are just one line...
