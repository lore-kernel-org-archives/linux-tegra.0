Return-Path: <SRS0=wvja=DN=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD0DC4363A
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 01:12:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10FC62076B
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 01:12:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkLC/GI/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgJFBMU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 21:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgJFBMU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 21:12:20 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646C2C0613CE;
        Mon,  5 Oct 2020 18:12:20 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n136so2088704pfd.11;
        Mon, 05 Oct 2020 18:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=imTCIXq15ZpJ5OmxGTdYsT7lvQK/QATisA5P9vMs8x0=;
        b=YkLC/GI/dYo71KtwLzR8kFLfW+MvUAE2BUVCxmKpasHP75UyE9bTW8Pnj5oD7qyUFf
         K61uuE0WMBsVVkpv9Ld5pgIpCQ68nFyuttpTuBG4vsa9H3JhRATp/yFiGC8sUmduHT7W
         M09VwRO7dEJ34FxLtHe9mpN4SOdoxNSbH3bQfcuQOUJkdwBkTcNBxtMJWvVMQjSTetn4
         44c4BVtyTNMwJzOmurmVqza0WpmauJV+zKFLGms4+f2YQEzFN94YcCRdgiejtQinhsdg
         CBJ91lWiCqBHfR/50soHRkQzUJBU2+1Dqc0k9cryApXffnKV+WrHGuit423vZQc+nRYh
         WcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=imTCIXq15ZpJ5OmxGTdYsT7lvQK/QATisA5P9vMs8x0=;
        b=JJ4LGhDbzXRxvy6lgtmsyxWWwPIfCEd7Xd84xZF96UXvoqB5BxIjhg3D/xTHOjiF0B
         p0XM23eeL1grsbIfkc2uqq2mmZgxAnO588Oa/V+w6+r169UHCL1YPNa2KJA77ald6Z+q
         OjLaCkFGB22Uj0STpOgL8bsOqWo6mEQNWFkRhDSsMOqSlZATdCWMkhYLYSiUDFoUJvd7
         /V03z6kRpZcoVbHGWM2hgBwWjZxw5kwc+NdTVd5sIYgWvve27yBp/QqsyZuqcwqZBPvL
         eM+65jHOcQYh5XBpcZo0rAdajwU3/XotnZfva2b68ppE3RQD3cYRRGmHDIhYRQljwTlG
         KDoQ==
X-Gm-Message-State: AOAM53204IbAF7yZpbxjFQF+qK2G654GJdog71gPlTU+2pCLssLE0lmW
        vvP7nN4qFXdXqaIe+qHUoRc=
X-Google-Smtp-Source: ABdhPJzyQodL+KRlo6JhOJ13FjfVK1Cw/lwkgMZs3x1nYk7bQSdKtQS38iBW+0IDF5yfC+QTAVmRKA==
X-Received: by 2002:a63:4959:: with SMTP id y25mr1979680pgk.206.1601946738447;
        Mon, 05 Oct 2020 18:12:18 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id w5sm899955pgf.61.2020.10.05.18.12.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Oct 2020 18:12:18 -0700 (PDT)
Date:   Mon, 5 Oct 2020 18:05:46 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201006010546.GB28640@Asurada-Nvidia>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <5542b314-f414-1e83-8cf6-2bf22a41ae9c@gmail.com>
 <20201002185828.GC29706@Asurada-Nvidia>
 <20201005095754.GJ425362@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201005095754.GJ425362@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 05, 2020 at 11:57:54AM +0200, Thierry Reding wrote:
> On Fri, Oct 02, 2020 at 11:58:29AM -0700, Nicolin Chen wrote:
> > On Fri, Oct 02, 2020 at 06:02:18PM +0300, Dmitry Osipenko wrote:
> > > 02.10.2020 09:08, Nicolin Chen пишет:
> > > >  static int tegra_smmu_of_xlate(struct device *dev,
> > > >  			       struct of_phandle_args *args)
> > > >  {
> > > > +	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
> > > > +	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);
> > > >  	u32 id = args->args[0];
> > > >  
> > > > +	of_node_put(args->np);
> > > 
> > > of_find_device_by_node() takes device reference and not the np
> > > reference. This is a bug, please remove of_node_put().
> > 
> > Looks like so. Replacing it with put_device(&iommu_pdev->dev);
> 
> Putting the put_device() here is wrong, though. You need to make sure
> you keep a reference to it as long as you keep accessing the data that
> is owned by it.

I am confused. You said in the other reply (to Dmitry) that we do
need to put_device(mc->dev), where mc->dev should be the same as
iommu_pdev->dev. But here your comments sounds that we should not
put_device at all since ->probe_device/group_device/attach_dev()
will use it later.

> Like I said earlier, this is a bit weird in this case because we're
> self-referencing, so iommu_pdev->dev is going to stay around as long as
> the SMMU is. However, it might be worth to properly track the lifetime
> anyway just so that the code can serve as a good example of how to do
> things.

What's this "track-the-lifetime"?

> If you decide to go for the shortcut and not track this reference
> properly, then at least you need to add a comment as to why it is safe
> to do in this case. This ensures that readers are away of the
> circumstances and don't copy this bad code into a context where the
> circumstances are different.

I don't quite get this "shortcut" here either...mind elaborating?
