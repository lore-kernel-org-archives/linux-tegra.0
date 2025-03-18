Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48AC208961
	for <linux-tegra@vger.kernel.org>; Tue, 18 Mar 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294788; cv=none; b=lGQsSATxY/fFLztUx8Vq+s5Fp//QimbCh+KdUY26nsPzXTkP70NLl+HVuG1+6Biiih8pk+T1DH6x1lugHBImH3BYcyFIP+tPzpdwpxBUbw1sdQ47l78t9Jyr8CoMaaUm9/R40/Z7p4Mq0SodWHPbXJAKQNu0uT+fS+21O94frFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294788; c=relaxed/simple;
	bh=BH/02l/7jfK62esHmL2nQqidEObr1IPIfhlBILiTzRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBYljF/Arm/OXb8Cp/PRdArqi3wZSQfZBkA1zoBziZLev4nPmlwfXMolvfQi0iTe67rVuTWNDYCZGodl9oOva7sppb8vovp85r3TO4OWNJbO/lZdE9qKGPve6ZUXg3hbtvKCq17frnPUTqLOxJ2qK53j1QW53kl0FwL+muzWyJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YYvFUSTV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YYvFUSTV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso32965e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 18 Mar 2025 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742294784; x=1742899584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/+Q9jlO5xuM+dGNN5vOy/zKLThOd0aux5Q2kg9METOQ=;
        b=YYvFUSTVc/u/v4rkVjdR72Zxlg/6lreTqALYmgdy/5IF9ucTaJ3+mE76hX+32l2+T5
         ffHGQD6qCf05nZSHtAdAHd0rAJ/+ArR2DKNPV6+0+GuB+I25iU3862biu+M158pXK3R6
         s2E6FA3kZn+eUDzEDiGRwu5Fzq5RCqIuke1p6J+RuwbEUJa4IW/odm7LSY10QnIyhvhj
         f2ZOwj+i8ihtu8s1LOiRlsFh+RSb96o9X2iM8LN24SiigsnTe8iLFvQctQ3x0USYlzo+
         3vTrov3RVTGPN+UiX9PaKmQnbAoGoBFHIiqZuoDgpzoMV4Eaodd4uvUllHDruJaf5tr2
         Nxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742294784; x=1742899584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+Q9jlO5xuM+dGNN5vOy/zKLThOd0aux5Q2kg9METOQ=;
        b=pIm5Dd2tlCUbqXims+5PiNywu+XABeVyeQMpxIj7DpsspxLcuejnL6B8VacaJMgdGG
         bDaOlpUV3XwCAW6iU9fvtzNdZ8XlyaSPtDC5wB+R/LQJOFDOcT94ZLcYr4DdoZw78P1i
         Lb6WWtd1gHFNAuvtJwosw0TQ5+4w/p1BbLQjHSOV2jgHDZUmo0IIF55IaVzKCG9lskGg
         EYD0N07Sj5ZxpQRAxwfG8kZ8313IlYSPolh8pM7YTSNARAKJr0nS1pCVSU1iJOjs627U
         K3ngGZmsgbVdLwW30G5KWg3+sl762H+OHhYodhlgVU2M0S+gK2H2nQJsFZzNE5KBLNkU
         mOxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdD0hmbIwd17aFIXuk8ybnl574lowps+QMYmvo1CSYBQ+v0gQKPyooPaW/a9VGNjo6oKshlZFw2CWtEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKl7jZp4yU6EfOdpSxrftxF+7yA9BhEenBH9WFepeIipBeyV40
	WJv8upfMv8Ow1jTgTPAGgWsLVhkigslvTMfLQXCT2rqsU00lxAmZikbMZYbVOQ==
X-Gm-Gg: ASbGncuq7GE+cRBmHeuHXTbe3AW/7ReDihieUCldGaFDRQBvlV3vZwObKIaQQgKWN9r
	z6F5eM/p/10B44zCUt7W04l4ep/p7anHmQCutj8U7+W/VLYrwfjGLO6Lo8Uyx4ETR2QCRzrmYEb
	0N9hgXm1HWXOEtu/+9WTtnSitScrYNISEwoVAm3P4uJWDM/ehq8aNWEH1oUB82uxKtCRcl37BsO
	RfDxZtDTt1/gx9wWsqa7v1XUF6Vt3geVtuIclmFQtIezwwUUP7mfIfE/5fr6cnQDVuuIaFZrz4w
	MTGkwTXZfssBIcO2bxr2QVTP2zVzm5eSd6MJ1qEUI6I7w4KjyL/6cJqYZDzf2lCrYziSPhETTtC
	69EkR
X-Google-Smtp-Source: AGHT+IHJJJKc86lCeSfkPHpB/CtXXs0Prp3Nz9+7FXSfTlHmKZ30/6jEnzkR0iwoq3j3jwsYbn5hfA==
X-Received: by 2002:a05:600c:1d20:b0:439:4a76:c246 with SMTP id 5b1f17b1804b1-43d3e14f871mr474575e9.6.1742294783884;
        Tue, 18 Mar 2025 03:46:23 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffbcf00sm129988595e9.10.2025.03.18.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 03:46:23 -0700 (PDT)
Date: Tue, 18 Mar 2025 10:46:18 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 20/23] iommu: Update various drivers to pass in lg2sz
 instead of order to iommu pages
Message-ID: <Z9lO-viudk9YGakl@google.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <20-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <Z9GFFBvUFg7a9WEg@google.com>
 <20250317133500.GC9311@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317133500.GC9311@nvidia.com>

On Mon, Mar 17, 2025 at 10:35:00AM -0300, Jason Gunthorpe wrote:
> On Wed, Mar 12, 2025 at 12:59:00PM +0000, Mostafa Saleh wrote:
> > > --- a/drivers/iommu/io-pgtable-arm.c
> > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > @@ -263,14 +263,13 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
> > >  				    void *cookie)
> > >  {
> > >  	struct device *dev = cfg->iommu_dev;
> > > -	int order = get_order(size);
> > >  	dma_addr_t dma;
> > >  	void *pages;
> > >  
> > >  	if (cfg->alloc)
> > >  		pages = cfg->alloc(cookie, size, gfp);
> > >  	else
> > > -		pages = iommu_alloc_pages_node(dev_to_node(dev), gfp, order);
> > > +		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp, size);
> > 
> > Although, the current implementation of iommu_alloc_pages_node_sz() would round
> > the size to order, but this is not correct according to the API definition
> > "The returned allocation is round_up_pow_two(size) big, and is physically aligned
> > to its size."
> 
> Yes.. The current implementation is limited to full PAGE_SIZE only,
> the documentation imagines a future where it is not. Drivers should
> ideally not assume the PAGE_SIZE limit during this conversion.
> 
> > I'd say we can align the size or use min with 64 bytes before calling the
> > function would be enough (or change the API to state that allocations
> > are rounded to order)
> 
> OK, like this:
> 
> 	if (cfg->alloc) {
> 		pages = cfg->alloc(cookie, size, gfp);
> 	} else {
> 		/*
> 		 * For very small starting-level translation tables the HW
> 		 * requires a minimum alignment of at least 64 to cover all
> 		 * cases.
> 		 */
> 		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp,
> 						  max(size, 64));
> 	}

Yes, that looks good.

Thanks,
Mostafa

> 
> Thanks,
> Jason
