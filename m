Return-Path: <SRS0=2JVP=DQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C3BC433E7
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 16:01:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34D342227E
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 16:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYF903DC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389409AbgJIQBU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Oct 2020 12:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388719AbgJIQBU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Oct 2020 12:01:20 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C4BC0613D2;
        Fri,  9 Oct 2020 09:01:20 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r10so7499942pgb.10;
        Fri, 09 Oct 2020 09:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ogwgS6emsTutEVsuDo9NXk+t34Gcwt4eKQ40PbYtC1c=;
        b=NYF903DCt0v/0+TYWAhT8yVHFpc1LbzufF2yMNmTi1tfWldwbX3OGrXXMMzu0+ah6w
         O4VImSJQYR+eL8tpr1o2xglMLUH95M0EpmuznxncmmIZydctgdReGIBVhwIqfvdCZAZa
         PJAZMZQxg0Geq4HPtOurxISai9zNB6tkI0X0JplR4hZcJxt46Qv/LTXtFdcPBTsMlEco
         zKoBbrzV9t14pztYOrGuKXxxHEg5oTANlYs+cMXdRFHkRxvcj+2nGD192YaAZMKVQf/9
         G27DQQZnCv++rJWhXHV0j/rdtvCyAZEzZBsP1e/8v/zHMYhJ2iAD3FR9doTstg0cJ4Fx
         Wxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ogwgS6emsTutEVsuDo9NXk+t34Gcwt4eKQ40PbYtC1c=;
        b=Kp3TEEnD0VitVpoerupHtC/Tb/nw2vumRquY1Cfk28twaOz9OC9pZc9+O5hdTy2mwa
         fg0AT36q2k9RGp+ULf3pbC/TmYP985/mkN0b1uDDdi9XDXtROWjPTu/MqOSZodtWlLK6
         3TDSzMlTxAIJ1t60mJO8gCnZVMLAZNTRiNBZKnKZYVaovi50E2NkA13fwaOveivdjf0c
         1sZOZR5reSMH1vI7/sxL7bojf5e7gr/2Yhl0z9U9An9bOJwLM28FSK+jQVjmfOcP24fE
         Io9IGp2xoZ8PrF2KEWtBtyZdCXqKM/a1O4/Z/9NlA7WMD9uZqNVp2rJBBXO+mKIE6aFh
         UolQ==
X-Gm-Message-State: AOAM530Vetscv9/VJivYxTpAXis4hnOgc0LLf9le/Mw0lwjXRSl4zmId
        L92HBpsjcnw8edftVJNfJm8=
X-Google-Smtp-Source: ABdhPJxyWZNZ+iIn+p2zK8NKmccVn+8rmLdAh7DJeJV40gBUb3dGd00QTxs0o/lyEwHiEOfl3ivRmw==
X-Received: by 2002:a05:6a00:170a:b029:152:6881:5e2d with SMTP id h10-20020a056a00170ab029015268815e2dmr13122365pfc.20.1602259280021;
        Fri, 09 Oct 2020 09:01:20 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id b1sm10805631pft.127.2020.10.09.09.01.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 09:01:19 -0700 (PDT)
Date:   Fri, 9 Oct 2020 08:54:09 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201009155409.GB4469@Asurada-Nvidia>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <5542b314-f414-1e83-8cf6-2bf22a41ae9c@gmail.com>
 <20201002185828.GC29706@Asurada-Nvidia>
 <20201005095754.GJ425362@ulmo>
 <20201006010546.GB28640@Asurada-Nvidia>
 <20201008095343.GA2349275@ulmo>
 <20201008211209.GC32140@Asurada-Nvidia>
 <20201009122556.GE458338@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201009122556.GE458338@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 09, 2020 at 02:25:56PM +0200, Thierry Reding wrote:
> On Thu, Oct 08, 2020 at 02:12:10PM -0700, Nicolin Chen wrote:
> > On Thu, Oct 08, 2020 at 11:53:43AM +0200, Thierry Reding wrote:
> > > On Mon, Oct 05, 2020 at 06:05:46PM -0700, Nicolin Chen wrote:
> > > > On Mon, Oct 05, 2020 at 11:57:54AM +0200, Thierry Reding wrote:
> > > > > On Fri, Oct 02, 2020 at 11:58:29AM -0700, Nicolin Chen wrote:
> > > > > > On Fri, Oct 02, 2020 at 06:02:18PM +0300, Dmitry Osipenko wrote:
> > > > > > > 02.10.2020 09:08, Nicolin Chen пишет:
> > > > > > > >  static int tegra_smmu_of_xlate(struct device *dev,
> > > > > > > >  			       struct of_phandle_args *args)
> > > > > > > >  {
> > > > > > > > +	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
> > > > > > > > +	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);
> > > > > > > >  	u32 id = args->args[0];
> > > > > > > >  
> > > > > > > > +	of_node_put(args->np);
> > > > > > > 
> > > > > > > of_find_device_by_node() takes device reference and not the np
> > > > > > > reference. This is a bug, please remove of_node_put().
> > > > > > 
> > > > > > Looks like so. Replacing it with put_device(&iommu_pdev->dev);
> > > > > 
> > > > > Putting the put_device() here is wrong, though. You need to make sure
> > > > > you keep a reference to it as long as you keep accessing the data that
> > > > > is owned by it.
> > > > 
> > > > I am confused. You said in the other reply (to Dmitry) that we do
> > > > need to put_device(mc->dev), where mc->dev should be the same as
> > > > iommu_pdev->dev. But here your comments sounds that we should not
> > > > put_device at all since ->probe_device/group_device/attach_dev()
> > > > will use it later.
> > > 
> > > You need to call put_device() at some point to release the reference
> > > that you acquired by calling of_find_device_by_node(). If you don't
> > > release it, you're leaking the reference and the kernel isn't going to
> > > know when it's safe to delete the device.
> > > 
> > > So what I'm saying is that we either release it here, which isn't quite
> > > right because we do reference data relating to the device later on. And
> > 
> > I see. A small question here by the way: By looking at other IOMMU
> > drivers that are calling driver_find_device_by_fwnode() function,
> > I found that most of them put_device right after the function call,
> > and dev_get_drvdata() after putting the device..
> > 
> > Feels like they are doing it wrongly?
> 
> Well, like I said this is somewhat academic because these are all
> referencing the IOMMU that by definition still needs to be around
> when this code is called, and there's locks in place to ensure
> these don't go away. So it's not like these drivers are doing it
> wrong, they're just not doing it pedantically right.
> 
> > 
> > > because it isn't quite right there should be a reason to justify it,
> > > which is that the SMMU parent device is the same as the MC, so the
> > > reference count isn't strictly necessary. But that's not quite obvious,
> > > so highlighting it in a comment makes sense.
> > > 
> > > The other alternative is to not call put_device() here and keep on to
> > > the reference as long as you keep using "mc". This might be difficult to
> > > implement because it may not be obvious where to release it. I think
> > > this is the better alternative, but if it's too complicated to implement
> > > it might not be worth it.
> > 
> > I feel so too. The dev is got at of_xlate() that does not have an
> > obvious counterpart function. So I'll just remove put_device() and
> > put a line of comments, as you suggested.
> 
> I think you misunderstood. Not calling put_device() would be wrong
> because that leaks a reference to the SMMU that you can't get back. My
> suggestion was rather to keep put_device() here, but add a comment as to
> why it's okay to call the put_device() here, even though you keep using
> its private data later beyond this point, which typically would be wrong
> to do.

I see. Thanks for clarification! Will send v6 soon.
