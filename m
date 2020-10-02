Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5BAC4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 19:51:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28CDF206DD
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 19:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkF3+Yoh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgJBTvI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 15:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJBTvI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 15:51:08 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BACC8C0613D0;
        Fri,  2 Oct 2020 12:51:06 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id p21so1570614pju.0;
        Fri, 02 Oct 2020 12:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=x4V3VUVCJPCE35BDFhz+FiLE5PfEEmnFxZ7BPxNwq5s=;
        b=pkF3+Yohz2ImUFjF1Fwi3jUaJUmG6l9awkh83VMpCy6blLY5ZY9S09WS5+2vgI/zow
         ys9Kc6GT/Tbom8ruv41Hmx2Waz8hLnP0V6AG8i8SQ8EgKeoa2GYNV/p59StoEduOVl51
         p7DhFTpnBYtaIhi/poOb+3gPdxdX2k5tart974/Pg0/IPbJFeOWYhVM5KBvQG1iVLwSH
         6LMl1/UiNWnKwgrwWEXoIHIWWCRbM3t16LNMEYa0JNeSMRPl9593f028Q8wnCLJtxM1F
         fBT9PIw7eADfCiobIfKtvtkjQbLHB141Q65PiUkc1H90s4iO3rBMq0kiTXckNoyeNUnA
         HCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=x4V3VUVCJPCE35BDFhz+FiLE5PfEEmnFxZ7BPxNwq5s=;
        b=hPp5uHLlIFOKwhDdinACkyICUDyEZCgzGfCu671tU0OHy8OQ+ifQtbWHcL9Y1crICz
         8JOX3aHlrkXTLMe0GZKAJATyt3MieMjrXzOiSFa9V6VAP0FAL5pOTVif+OQSwaBT3yIp
         GEWsZSvl+Ow3+EnpncR88r5jti4fYqJHx/vbV4K2B6spXUy2RxbG93qj/RQPbUyp/v1A
         v5hT75Z84Ps0yruumAe3D0+bwNK3fHWun9FjRe2pkMvDZmbq4Ei4Ch+k3soGC+OKZ5ha
         ZpGYRivFi1dnWnBo/0bUZRZAMoGOvC0HztTXGSJLlyF8fIoj4X/B22Rog1mGwCzpTsT0
         zKZA==
X-Gm-Message-State: AOAM530gnK6TbdkKLZ8KjYu84/3OH13Q5D7nDmEFrZ4PoLFLLrGC1rih
        cJAXaoFxEObiRy/dpKHrXEQ=
X-Google-Smtp-Source: ABdhPJxO3pRWrQgJxmyXJQ7h+39Ykp6X7jI+m7yDWbup3Lg0EaVcSgt5BRjyDLgmzm44NIFeJ2DAhA==
X-Received: by 2002:a17:90b:289:: with SMTP id az9mr4534418pjb.31.1601668266254;
        Fri, 02 Oct 2020 12:51:06 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id 34sm2430512pgp.5.2020.10.02.12.51.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 12:51:06 -0700 (PDT)
Date:   Fri, 2 Oct 2020 12:45:08 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] iommu/tegra-smmu: Use fwspec in
 tegra_smmu_(de)attach_dev
Message-ID: <20201002194508.GD29706@Asurada-Nvidia>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-2-nicoleotsuka@gmail.com>
 <de0b717f-af5c-8813-eb3e-07d19eff5271@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de0b717f-af5c-8813-eb3e-07d19eff5271@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 02, 2020 at 05:41:50PM +0300, Dmitry Osipenko wrote:
> 02.10.2020 09:08, Nicolin Chen пишет:
> >  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
> >  				 struct device *dev)
> >  {
> > +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> >  	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
> >  	struct tegra_smmu_as *as = to_smmu_as(domain);
> > -	struct device_node *np = dev->of_node;
> > -	struct of_phandle_args args;
> >  	unsigned int index = 0;
> >  	int err = 0;
> >  
> > -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> > -					   &args)) {
> > -		unsigned int swgroup = args.args[0];
> > -
> > -		if (args.np != smmu->dev->of_node) {
> > -			of_node_put(args.np);
> > -			continue;
> > -		}
> > -
> > -		of_node_put(args.np);
> > +	if (!fwspec)
> > +		return -ENOENT;
> 
> Could the !fwspec ever be true here as well?

There are multiple callers of this function. It's really not that
straightforward to track every one of them. So I'd rather have it
here as other iommu drivers do. We are human beings, so we could
have missed something somewhere, especially callers are not from
tegra-* drivers.
