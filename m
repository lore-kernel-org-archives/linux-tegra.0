Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AFBC4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:46:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DA0220754
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEbhdnxy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgI3Fqw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgI3Fqv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:46:51 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FC9C061755;
        Tue, 29 Sep 2020 22:46:51 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t14so383695pgl.10;
        Tue, 29 Sep 2020 22:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=YTntM7CoJaV8IezMsAd4LGcSeXceEkxjfopvkjTdjsU=;
        b=nEbhdnxyzhDE0kOHHmSlYHi0f4zsO7yr9B4e+Yozh7cqTvGvD9a0EZhp7Ir1N/chk4
         NjKk+Am1QSFrHwhJcidg+R0DcNMCUOjirA/v14DVt9FC/dVeO73JLVTLTxGT4CLvZ1dT
         RG5SrWDhkCvTQ/7NwZ/+Ma9NkpCi8YNwAUXLbQZDHK5BAdM4gau1lLC/Zgfr62497o+e
         8skSGjaSs5h4QPdvROAGV8twcjPzLpXz1YXDYaUm1DbgnhENGLpAPZR6HMGZGcD5Mj28
         hn7jBzjMy+wnTnH+kRYbabVaW1EP9FjcE671mEiXgV3VKHGupwWVAad4PITp83QTF1mC
         hsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=YTntM7CoJaV8IezMsAd4LGcSeXceEkxjfopvkjTdjsU=;
        b=Xc7vs2D/SsDb3gi6um1xmtf/e6V4KonFAwhPyN2bVrgWMcV+oK4lXzgZopxmt/fc4O
         PMalhz+BMkIdKvl0JtqxlFpQjKkKTbKYMvV3P04SQ7Q9c1xOs05+LqRCiyR1J4Nw4jnw
         0F3+6Zhq48nVap7BOObKdaPyZTQXmVckQtWaaxHkUJbWsrMqLhirJHO745jJu3vh2Ca5
         BFMUrBHgpJw1znztCvOK6PJMfhjAGDNDpcEKJXV3+0xTDh9+N7pLYlV6qd1jKjDUeOe6
         hyHwZhOWuWRwOiexw4uR6Y/gosJc18zFViKLWQMhBvPsBMAC7Hi0xD4dKiBPrGVvaVvi
         asCw==
X-Gm-Message-State: AOAM533IXy8dwTpdEksS9gymbz+OrGpi5VRXejLCvNz1keQWWHD4yKQK
        dkQACEmMkoZMvtfn5gsHhSs=
X-Google-Smtp-Source: ABdhPJzkXK6Lv65fdf9edZA4EeNgXlSsNPrn8Q0WXCu/aqssic2rq6TvSREyvyuzymXIAoh771xnnA==
X-Received: by 2002:a63:ce47:: with SMTP id r7mr888011pgi.360.1601444810709;
        Tue, 29 Sep 2020 22:46:50 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id v13sm728237pjr.12.2020.09.29.22.46.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 22:46:50 -0700 (PDT)
Date:   Tue, 29 Sep 2020 22:41:20 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930054119.GE31821@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
 <e557a09b-bcc3-11cb-9529-096aafb42051@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e557a09b-bcc3-11cb-9529-096aafb42051@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 08:39:54AM +0300, Dmitry Osipenko wrote:
> 30.09.2020 03:30, Nicolin Chen пишет:
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
> > +	if (!fwspec || fwspec->ops != &tegra_smmu_ops)
> > +		return -ENOENT;
> 
> s/&tegra_smmu_ops/smmu->iommu.ops/
> 
> Secondly, is it even possible that fwspec could be NULL here or that
> fwspec->ops != smmu->ops?

I am following what's in the arm-smmu driver, as I think it'd be
a common practice to do such a check in such a way.
