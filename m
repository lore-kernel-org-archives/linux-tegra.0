Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C3FC433E7
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 21:19:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43B9F22227
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 21:19:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jcfw/+Si"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729716AbgJHVTN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Oct 2020 17:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728702AbgJHVTN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Oct 2020 17:19:13 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A523FC0613D2;
        Thu,  8 Oct 2020 14:19:13 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id o9so3382841plx.10;
        Thu, 08 Oct 2020 14:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=I4FFbIdibqfVfvGcOnZYh8MDx+ZE9b8VrGVYJfL3qB0=;
        b=Jcfw/+SiNQlmyBIt6FjxR5VkqooRo8Jyca8LYxYNUoP9rPsJPhuYQfaop/i/ajwbhC
         LMrr702EhiP5/PQBwUczJ8uOPWGOY8MDgYRdAv9ShKXeOwOGVhG0RzUF+2hxqIn0M6Oh
         MeXcrKO3dnO76LdNReUEbZSZ7gWfd3pW0NEQfOZeAbfQIII/hLS302ZbywOAuAfYmUpf
         UfTXyIWSpJIN98x0vpZPY8EUwPUywXHwZH9Wmf6r6i7KvmHKFuKTq/hT6sXkkOsQfbxk
         fr3aOV553dMSRGA4rxNqyuvnvvwLAN3/0rfAXrFgE5YqcKnfb78WAYyQ4tVNcgmjuTEl
         g8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=I4FFbIdibqfVfvGcOnZYh8MDx+ZE9b8VrGVYJfL3qB0=;
        b=KFXQglL7ORY10qZ6kPAigbsRFyv1P7z53MfU8nL6lwT0kJ34G9rY6xUZ1tHKczzW7b
         ScOJH/7ZZIlDmjWSOLanmAqB9UPGP9lZE88LWsoJVObJTQYi3D6Dv45Rl6FO0rVCKuzv
         rKjdNkYsUTAoRE8DXvTwABm5BnWm9nqYASVHq7YgdFDxw4Q/Khrx0HN9oGMmquvh/w28
         J0Ng+J7zZMEMxLdRKlc2zJDtZpQIPmyzkrbWnMFRiTbVIIbTSSkwpC20Rd6e1oItEPEX
         zF4TevCYBj4UfuhrIekYyJC4eLxZqruvI2gEmZL4wvMQqtFYvYRi14MSLy19zlKVUOmd
         MEbw==
X-Gm-Message-State: AOAM530eDZF/LO8WYeZBi4OX3F4rIHrefrcuQ9yFnLm1mhHYfwwz2ge2
        DiaTlTqI8hyz6dYJMRxOPTufDfaQDqE=
X-Google-Smtp-Source: ABdhPJzZEBrqiOk7r0C4DP7Vk9bmm2Fynjhkoj6Ts83lfd7bMAoyl4sMg8H825mxh1Odh3+tV8u74w==
X-Received: by 2002:a17:902:7c83:b029:d3:cc6e:6dae with SMTP id y3-20020a1709027c83b02900d3cc6e6daemr9395932pll.13.1602191953007;
        Thu, 08 Oct 2020 14:19:13 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id r6sm3974279pfg.85.2020.10.08.14.19.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 14:19:12 -0700 (PDT)
Date:   Thu, 8 Oct 2020 14:12:10 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201008211209.GC32140@Asurada-Nvidia>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <5542b314-f414-1e83-8cf6-2bf22a41ae9c@gmail.com>
 <20201002185828.GC29706@Asurada-Nvidia>
 <20201005095754.GJ425362@ulmo>
 <20201006010546.GB28640@Asurada-Nvidia>
 <20201008095343.GA2349275@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201008095343.GA2349275@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 08, 2020 at 11:53:43AM +0200, Thierry Reding wrote:
> On Mon, Oct 05, 2020 at 06:05:46PM -0700, Nicolin Chen wrote:
> > On Mon, Oct 05, 2020 at 11:57:54AM +0200, Thierry Reding wrote:
> > > On Fri, Oct 02, 2020 at 11:58:29AM -0700, Nicolin Chen wrote:
> > > > On Fri, Oct 02, 2020 at 06:02:18PM +0300, Dmitry Osipenko wrote:
> > > > > 02.10.2020 09:08, Nicolin Chen пишет:
> > > > > >  static int tegra_smmu_of_xlate(struct device *dev,
> > > > > >  			       struct of_phandle_args *args)
> > > > > >  {
> > > > > > +	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
> > > > > > +	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);
> > > > > >  	u32 id = args->args[0];
> > > > > >  
> > > > > > +	of_node_put(args->np);
> > > > > 
> > > > > of_find_device_by_node() takes device reference and not the np
> > > > > reference. This is a bug, please remove of_node_put().
> > > > 
> > > > Looks like so. Replacing it with put_device(&iommu_pdev->dev);
> > > 
> > > Putting the put_device() here is wrong, though. You need to make sure
> > > you keep a reference to it as long as you keep accessing the data that
> > > is owned by it.
> > 
> > I am confused. You said in the other reply (to Dmitry) that we do
> > need to put_device(mc->dev), where mc->dev should be the same as
> > iommu_pdev->dev. But here your comments sounds that we should not
> > put_device at all since ->probe_device/group_device/attach_dev()
> > will use it later.
> 
> You need to call put_device() at some point to release the reference
> that you acquired by calling of_find_device_by_node(). If you don't
> release it, you're leaking the reference and the kernel isn't going to
> know when it's safe to delete the device.
> 
> So what I'm saying is that we either release it here, which isn't quite
> right because we do reference data relating to the device later on. And

I see. A small question here by the way: By looking at other IOMMU
drivers that are calling driver_find_device_by_fwnode() function,
I found that most of them put_device right after the function call,
and dev_get_drvdata() after putting the device..

Feels like they are doing it wrongly?

> because it isn't quite right there should be a reason to justify it,
> which is that the SMMU parent device is the same as the MC, so the
> reference count isn't strictly necessary. But that's not quite obvious,
> so highlighting it in a comment makes sense.
> 
> The other alternative is to not call put_device() here and keep on to
> the reference as long as you keep using "mc". This might be difficult to
> implement because it may not be obvious where to release it. I think
> this is the better alternative, but if it's too complicated to implement
> it might not be worth it.

I feel so too. The dev is got at of_xlate() that does not have an
obvious counterpart function. So I'll just remove put_device() and
put a line of comments, as you suggested.

> > > Like I said earlier, this is a bit weird in this case because we're
> > > self-referencing, so iommu_pdev->dev is going to stay around as long as
> > > the SMMU is. However, it might be worth to properly track the lifetime
> > > anyway just so that the code can serve as a good example of how to do
> > > things.
> > 
> > What's this "track-the-lifetime"?
> 
> This basically just means that SMMU needs to ensure that MC stays alive
> (by holding a reference to it) as long as SMMU uses it. If the last
> reference to MC is dropped, then the mc pointer and potentially anything
> that it points to will become dangling. If you were to drop the last
> reference at this point, then on the next line the mc pointer could
> already be invalid.
> 
> That's how it generally works, anyway. What's special about this use-
> case is that the SMMU and MC are the same device, so it should be safe
> to omit this additional tracking because the IOMMU tracking should take
> care of that already.

Okay.

> > > If you decide to go for the shortcut and not track this reference
> > > properly, then at least you need to add a comment as to why it is safe
> > > to do in this case. This ensures that readers are away of the
> > > circumstances and don't copy this bad code into a context where the
> > > circumstances are different.
> > 
> > I don't quite get this "shortcut" here either...mind elaborating?
> 
> The shortcut is taking advantage of the knowledge that the SMMU and the
> MC are the same device and therefore not properly track the MC object.
> Given that their code is located in different locations, this isn't
> obvious to the casual reader of the code, so they may assume that this
> is the normal way to do things. To avoid that, the code should have a
> comment explaining why that is.

Got it. Thanks!
