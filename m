Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EBA27932B
	for <linux-tegra@vger.kernel.org>; Thu, 19 Jun 2025 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750324485; cv=none; b=PIUShemIZKJhn/wcUHUxApMWJeo38cJ4gMzvPKa3nxoES7QzyLUciRoVpQlkwRInV0RCVYSfR+4hdQ0uo29+pTsmIJwTC/M3dWdGlV3tz7rLtBS8nAKOfCAl99p+yQPHP/RXKrJeqC/Tv8p9aGASteI7jxhHsh7Uk43qC0H73go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750324485; c=relaxed/simple;
	bh=oskZaqewOdI9Q2vgMTv3V9kHOUv/J7lvDhpMHUc35DM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T57nVh0J/nsUI9LXc1X/vWh6nmzBKUqgx4SYMOdd55K0qq35kF6kTrjKD+qMmqtVfZLI4gp6D+F9xgRCKN/r0LDrWMe1g9Vso6vrxbs3/ImC9Ip8PjC9+qVuC498gEu+0esVPAW0tbPcN8v8N7eCAIbIqW/RsPPho8u8c6lW/wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dv7WycaE; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dv7WycaE"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235e389599fso154935ad.0
        for <linux-tegra@vger.kernel.org>; Thu, 19 Jun 2025 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750324482; x=1750929282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oWamqH4Qzt1P4RdD6HP7YstMpMkIZRoPsNcDiTnzqKM=;
        b=Dv7WycaEyXueQqTKSG90D4rovykObav7TJQAiW1sEQx62haVBoBiKX3WPYyRQBbGbL
         8hZQXnpKZanDb5N1CltTayyBnZL1BJQFHkD4g/0176tSaXpCkvuONuc96qP6MNWqXh5r
         lTPO192S9TTYxQCYs/ux9DTLUS0k7TyDDONPZPnoa68NR9CIPyEQHkTtVKD1nrSLp2k3
         TFRNJdq0uTJQSHHiHWXKeGSL9EHLAIMgm8zIfcYh+YGyaHCDakyBqNIsSSWgYGRcZKCC
         RcNfpO84uh0nqkK5B1uERm1X1RvUbC2bpLnBkrRF8TPJiUg7AK1LuGYqQeW8FEM+c579
         9Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750324482; x=1750929282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWamqH4Qzt1P4RdD6HP7YstMpMkIZRoPsNcDiTnzqKM=;
        b=hedP9sQWIBsa6Qe7h4wQXR8sHJXqSAhZ2NkULRdMGRshZnywIam0JeAvLPGxmEusBb
         hcdqjnYc7Vh+WD4oGADaLpOQVOdRz9ZXgLac/OpryEB71Tya4GtYVgA6qUJRS8AmdfZ7
         FjNiiaeqRnf55S7dgP3YL+Bo0XB/lNLehlCyhj1gjtljOh3ycDmjxBfkyYsbEywXCtf6
         1tZQQKgQBxexqyzjEXsDhs0b5PWJKGFKE3dZ5g8IMjoA9otxWQrzcxDZwke+4vhnJ5Qs
         ZQjmy1/o88Vmepj/CftFDy9KFrT/9hiN9JFWM3DREeaHaXTN7VVvcfi6uvhf5VDywMth
         6BSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYqRkcXSEQ1nja0ykmXDyTow24nbFKv0Kfg6+4G/Gg6enxXPHvjj1VVAfGkPA8J1VqmYbCh5eVDuDyEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoMw4xXMC10gxxKTABLz+Axq6eO3iCa3yqcFgB2C0ml9kSWSR7
	SonEagRSO0YkUFsiHhqpNAfxx9pe3kstkeGcOEIQEdYfkYszSRdytGJM7E6wBTbWBQ==
X-Gm-Gg: ASbGncvAtEhjXwMBblk9uFwY5wT2vvZGm17jZnsg6CMytzsB9UcefyOaXOJQ+W36FVT
	Dogkfg7bqDSyXEMsyxwRbYu/R7NsT542En/zyzG2Dts/xwTujqeheje1Z7AEbexHw+eC6UZrQt5
	5vPgDs1JctX5CKIPA7wbA7rYCEHiuvh+/SaM+1dTOzb5wMX2xnt7dQfdSwt+ZzJcjCI0LC7UgjN
	bmi+N4Uxm2w3XdTgapRtBZcdn5a+uPsBGlQ0EOok41VoPdeZ6IPIqE4D8DhTlVtarKrzz5VGPix
	iTAP+kvXrAtQ+/5SWHpW4+6YwyUlAYsbuzkf69JNLmvGEN36wcqDGbzpIKAq+xt02C08b2sqKrR
	X/Gd8rmhxek9Fv+voIjDX
X-Google-Smtp-Source: AGHT+IEvh8ntAaeawSzvvAW9v54xfOai3SDk6b1VSkUWtSTdDIzpJHZdPCeE04W9I0TDOLd777OhYA==
X-Received: by 2002:a17:902:da48:b0:234:13ad:7f9f with SMTP id d9443c01a7336-237ccb4af65mr2441805ad.22.1750324481903;
        Thu, 19 Jun 2025 02:14:41 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c029sm114860565ad.26.2025.06.19.02.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:14:41 -0700 (PDT)
Date: Thu, 19 Jun 2025 09:14:29 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, corbet@lwn.net,
	will@kernel.org, bagasdotme@gmail.com, robin.murphy@arm.com,
	joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
	jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
	nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
	mshavit@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 06/25] iommufd/access: Allow access->ops to be NULL
 for internal use
Message-ID: <aFPU9TKgU0Lofl-O@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <e6a989c4dd9cb94aa4a98d46ed56a2afcb41b70d.1749884998.git.nicolinc@nvidia.com>
 <20250616133305.GB1174925@nvidia.com>
 <aFDRKEsdVZc2XQ91@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFDRKEsdVZc2XQ91@nvidia.com>

On Mon, Jun 16, 2025 at 07:21:28PM -0700, Nicolin Chen wrote:
> On Mon, Jun 16, 2025 at 10:33:05AM -0300, Jason Gunthorpe wrote:
> > On Sat, Jun 14, 2025 at 12:14:31AM -0700, Nicolin Chen wrote:
> > > @@ -1321,7 +1328,7 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
> > >  
> > >  	/* Driver's ops don't support pin_pages */
> > >  	if (IS_ENABLED(CONFIG_IOMMUFD_TEST) &&
> > > -	    WARN_ON(access->iova_alignment != PAGE_SIZE || !access->ops->unmap))
> > > +	    WARN_ON(access->iova_alignment != PAGE_SIZE))
> > >  		return -EINVAL;
> > 
> > I don't want to loose this check, continuing blocking mdevs is still
> > important. Only the internal access should be able to use this
> > mechanism.
> 
> OK. So, it probably should be 
> 	if (IS_ENABLED(CONFIG_IOMMUFD_TEST) &&
> 	    WARN_ON(access->iova_alignment != PAGE_SIZE ||
> 		    (access->ictx && !access->ops->unmap))
> 

Nit: Probably worth mentioning in a comment that access->ops shouldn't
be NULL during selftests and hence we avoid checking for !access->ops?

If you feel it's too verbose, you can let be as well.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> Thanks
> Nicolin
