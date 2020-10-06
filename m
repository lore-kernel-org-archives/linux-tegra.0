Return-Path: <SRS0=wvja=DN=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D076C4727D
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 01:00:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 572D820853
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 01:00:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tT2/p9kk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgJFBAt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 21:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgJFBAt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 21:00:49 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFE4C0613CE;
        Mon,  5 Oct 2020 18:00:49 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t18so379734plo.1;
        Mon, 05 Oct 2020 18:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ULovZDh4nNXnrhAmYDekggZ1SAII9f678l5WRSniMjQ=;
        b=tT2/p9kkQck2bPx0f4E5gQd74HIXbZmZcy2pFDMGyPLhRXmy2wbiGliiPX7/s0eYIX
         Cu1p6oHsFYVAsEWt8c6zCG9P8iWrZHL4zue7+eSo67dvcqYXtOu1sLmdH8TypU9rx7zR
         1WTDLkQA2Zgqgy2XeqxsLBamJzJ9OXA/f7qvB4ptUL8EBzA8oY47z2gYY6D9X0mLv0ln
         /keIq/rxiTYe5wdCkRor4AHg9wyoHuznv7VHMCMt2LUvnN69qhUn40TNg/M9sy4nAKXH
         QxfnNeyEjWXT1nY9SGDDYAR9fiuokOgj6W3ypq+yX/ZRHgaSs6FeXhANWU0rNEuZCZTL
         pN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ULovZDh4nNXnrhAmYDekggZ1SAII9f678l5WRSniMjQ=;
        b=jvnp2SaYHCFOnl+Cg5rz1kiDaPp7K+0f7+ac6OS09fb0+WVxCmAn8g8S/nCdVs1dBO
         c8Br0wQfSDpWJda4K7YwFoXyZH+md4MABRKrrvEhO/TN0BDwHzw22ccOqos8LBdS1fy/
         oR/AtQn2dT/rBnasOrlCAvVjIIUI8WqSui1m0A/Tqvqu0APT9VEQzfRCp4ZOzw4qo/YQ
         8UydpkQruPcAO1hKbBj/lYD6YQCAg2/NmALjjg62ljNHNIIVj06eA13gPlMBBWFvu/sf
         Sabcw6jEAps4oOu6xpyPDf3kcWO+iUOlTPAVYggCRceIMuZrE9uTMfb+FyKywoBr6o9U
         6xGg==
X-Gm-Message-State: AOAM5322vV+dv5U7e+F9Vn5xiUGJlf6R6HyvmIyvM6oZ5i/AwkFQVFfs
        BSUrIGl437LW8ZuQqcT0YkI=
X-Google-Smtp-Source: ABdhPJzIKzYvGywr9Xvoc+MvkW9hchVKOfUbteeoYw0WFYR6RIRBJDmZRDRkTuoxEOWd9qbYFOe+yQ==
X-Received: by 2002:a17:902:eeca:b029:d3:d8dd:3e4b with SMTP id h10-20020a170902eecab02900d3d8dd3e4bmr1030261plb.68.1601946048616;
        Mon, 05 Oct 2020 18:00:48 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id cs21sm3278844pjb.0.2020.10.05.18.00.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Oct 2020 18:00:48 -0700 (PDT)
Date:   Mon, 5 Oct 2020 17:54:14 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     joro@8bytes.org, digetx@gmail.com, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20201006005414.GA28640@Asurada-Nvidia>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-4-nicoleotsuka@gmail.com>
 <20201005100419.GK425362@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005100419.GK425362@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 05, 2020 at 12:04:19PM +0200, Thierry Reding wrote:
> > +err_bus_set: __maybe_unused;
> > +	bus_set_iommu(&platform_bus_type, NULL);
> > +err_unregister:
> > +	iommu_device_unregister(&smmu->iommu);
> > +err_sysfs:
> > +	iommu_device_sysfs_remove(&smmu->iommu);
> 
> Can you please switch to label names that are more consistent with the
> others in this driver? Notably the ones in tegra_smmu_domain_alloc().
> The idea is to describe in the name of the label what's happening at the
> label. Something like this, for example:
> 
> unset_platform_bus:
> 	bus_set_iommu(&platform_bus_type, NULL);
> unregister:
> 	iommu_device_unregister(&smmu->iommu);
> remove_sysfs:
> 	iommu_device_sysfs_remove(&smmu->iommu);

Okay. Will update in v7.
