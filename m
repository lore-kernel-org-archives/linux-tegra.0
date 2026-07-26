Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966AA3CA486
	for <linux-tegra@vger.kernel.org>; Sun, 26 Jul 2026 16:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785083004; cv=none; b=Z4CS6xlT71/Wlm0RBX3GB6ylTW8nTH/mep89WSq3hzbbNVIpKeRrzW2E++QEilImzX4IPGzDUeiyKm1jjrdzyllzqGGWuSwK4KhRXgQdPdJKYLzKG/kMRQE2kna9Rj4Fhfoo8eeIFs2UMLRH0eyqX905q2/bsJ3YInCdCOMoH90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785083004; c=relaxed/simple;
	bh=eh2uHeTUG5CmXS9cNmYuwq/yTrAZwmMBCh6xBgYyXpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHJYhvMaEjmSAro1PKH7fvcA66PagFK0X8qTGAvNzd+Z6q4AdJ7Up3qsxeA/W1rNZfqxzF7ooraj99Kqop4j5/4o1vlfOP/pfdbXDnbJ/4iGGVUtiQ/JZu96wYQxbGmRNUnJt0a3O0milNNs7M/VrAsAMtLAP+w2inTYq932kJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=lqUZ28II; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="lqUZ28II"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so24421065ad.1
        for <linux-tegra@vger.kernel.org>; Sun, 26 Jul 2026 09:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785083001; x=1785687801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHRV8RVQazd81DBcHd8LNzyzM/eTYjhER1/AreGPfK4=;
        b=lqUZ28II4mN+pz3ssfvM094CWZ4FCq/m18+CxzOWrVHqCPE9iUBpk+qG/vG+pjcVDf
         7iib6tASisd4sDH7uyNuyQBpUhL5c/yUbUPzIdhIebaTW1GuvlTmMrTuh/OP5JV6CnzB
         8GSxSRZwwHYtLYflc6/TktpgQG+UyEoISpYg5CDm8cJQFDWTgOonBG/mGbPQKlYN6yTY
         dtMgD7UxxRze5fLGSJ9SYEBBy5y6vpWrX5TUj6G3ygRhzif59JdvuxrhSkkBQjq8CqeU
         oy2dOhBd+lFt20IUkwpfE1NgfMljswoc0l6qZB4L2sxdTF/yypVVvZJRIByhWHWnuXxt
         9Q4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785083001; x=1785687801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHRV8RVQazd81DBcHd8LNzyzM/eTYjhER1/AreGPfK4=;
        b=r3JFBBmcADIXhqLh5VAQzuqsv2hbkKXPBAOzVSTCGtjDE87W8zYJZkjALoxvEXyPP4
         tw2jJ+GFfZm9xlK+ktNeJvrezKf+nVAGoOvd30Cvg2uTMah24/t51uzuDHLhqR0KPfoM
         DkUfeKjmk8YXzZtogAgDEqhnkVyNsi+jj/fUvpA+x5qaduo+/Tg/NK68RWIi9BPo1pLX
         8SQWWo0To2VnSu5TVVchXRT0R5zj9mTsTvmvtwZtOvBuhJFspscl+h4wh+5D7lUag2bE
         yVlXo4CJL149ApdSRcfpBgtvZnZ8NGj1rwMZ7HsXbxNu1RK0w/HijCTiJvxHgZhlL6w0
         MWvg==
X-Forwarded-Encrypted: i=1; AHgh+Rry6dsjVaWGFaz94yGwmydgsfIhvcsrOwZi6oFwVAhStDvNrDyLdQXQyczAoYgM1v1dEagWyoaDWTgXnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy72+UL324KZTDc24WijNS+M85tBi1eDNtLZQtJT+5jYfRnQH6V
	OmUebFaQTKXCtw0spg7YlHmpwhhYQxKjPWWREgYbzfHOWpDpr8A7YDGKvNZiKxcpUu8=
X-Gm-Gg: AR+sD13QYDt+qy6FblvuV80Af8iae35d9OXXeaILWsAJk4eymJvOrMAC0SfeUTKv2EH
	eRXGHGpN71qlr67HaN7z4nGky4cti476pKn+GdcS+Q2o5OSJLcZgJawUcOy+AMDeiCZ8qcN/sAg
	4WbRyY3abN9AslEMfm8VM9cSMj8hh1aBFDXthCQfFIXtSt+H/a546qI/fe/Lr655cAddxiYFT+X
	x6yzryxuGTwQSw9Ub5ZXHoV9w7pwi6YJBxTstPu5VtI1PAiXCTijGxv2V/BmsBdZoU0ouS0KgoP
	M26b1ry+4/QpSWCw/q8kcb4BOwoz5WWiab57kJi0/fvgSGu17VPDhwlzgfTC4KHc5e1ZGJkcpxG
	ehBuLKaGEBqr6ZILKsSiNIDf3sBynkzM2rbSszV62Tnk6wCS1Rns=
X-Received: by 2002:a17:903:124f:b0:2cf:7882:a444 with SMTP id d9443c01a7336-2cfde7bd3d6mr49402625ad.16.1785083001604;
        Sun, 26 Jul 2026 09:23:21 -0700 (PDT)
Received: from ziepe.ca ([64.114.68.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5c8337sm22177955ad.20.2026.07.26.09.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 09:23:21 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1wo1dJ-0001U5-2C;
	Sun, 26 Jul 2026 13:23:21 -0300
Date: Sun, 26 Jul 2026 13:23:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 4/4] iommu/arm-smmu-v3: Enable CFGI/TLBI-repeat
 workaround on Tegra264
Message-ID: <amY0edpcgNbqFQ7s@ziepe.ca>
References: <20260726081904.1408859-1-amhetre@nvidia.com>
 <20260726081904.1408859-5-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726081904.1408859-5-amhetre@nvidia.com>

On Sun, Jul 26, 2026 at 08:19:04AM +0000, Ashish Mhetre wrote:
> Nvidia Tegra264 SMMU is affected by an erratum where a TLB entry can
> survive an invalidation that races with concurrent traffic targeting
> the same entry. The hardware-recommended software workaround is to
> issue every CFGI/TLBI command (each followed by CMD_SYNC) twice, and
> that infrastructure is already in place behind
> arm_smmu_erratum_repeat_tlbi_cfgi_key.
> 
> Neither IDR nor IIDR flags this Tegra264-specific bug, so hardware
> detection is not possible. Tegra264 is device-tree-only (no ACPI/IORT
> support) and already has a dedicated "nvidia,tegra264-smmu" compatible,
> so DT-probe is the only viable detection path.
> 
> Enable the workaround on instances matching the existing
> "nvidia,tegra264-smmu" compatible by calling static_branch_enable() on
> arm_smmu_erratum_repeat_tlbi_cfgi_key. Document the erratum in
> Documentation/arch/arm64/silicon-errata.rst.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst | 2 ++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
