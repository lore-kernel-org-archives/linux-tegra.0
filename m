Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83BC20C465
	for <linux-tegra@vger.kernel.org>; Mon,  3 Feb 2025 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604617; cv=none; b=PGrUlsywDc5QxxG/fRaNpcT4KdaxaywzIadaJZFr720/WEOKzzbLTscf9P1wJVTwmE+PvXs61RFq/KkZVaP/KjT0BCzMar33k6mAHr0MJVbUdFu2Aunu1Lfl2mWUxCIflqiyTWKvPxJvtneCSjYG0H4YigIjVNTHv0q4gMqlu7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604617; c=relaxed/simple;
	bh=HHQvq1hJ98PippRm2rDdDIdnVNDSMuo8a6rmO/CZD40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1sfG6mXfAA7kkRIO6dx4LKjMxT4mm8BQDk73kLOmBIfAXcMBtBMFZmDjjrAPfzsY4AsHyv/0Iz9LWQgOgvc73kxlW9FM0PpRlKPQEfh85NUUda1gj+jJFaNAl7k69XbUwEhNqxQgc3RpiCR/IBdvMcsLI5YK28a72McCgd8tds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=KKvGleyA; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="KKvGleyA"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so42804946d6.2
        for <linux-tegra@vger.kernel.org>; Mon, 03 Feb 2025 09:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738604613; x=1739209413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5W3K6ML6p4e0xZMOmmJdUcdAoVitAI41yHN9TtTI54=;
        b=KKvGleyAQiy5EIJCFiHfVZePdGD4FCAxG3qAvrIBlfbHY6otDmfafxyFxz0fL3MyKD
         upBG3oqQdU4+Jtof8CqLksMaKOKBUw62PwxZ8VO3qc83VOGvFeY3sqz8GjfoEW4ZqHCc
         GMbOKzRfXE/VGT8xKYIHQPBm/ElIBbxhbYJf4lTKPwwbQSb0d7T3sQB9rWK6KU3cGTbY
         u9OFvVx2ds78WlrDzDDYJdob40WlZgcXiyZYegDVNOc4e1ANNHDA9SYfW+e0hkCCEzvx
         kpXJ2ox6sV7MyIJUOiHp+ErfXu2coyTDQrQr4AU/mOoIQUO9eCUaXti9t9wxvrEIomDq
         26eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604613; x=1739209413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5W3K6ML6p4e0xZMOmmJdUcdAoVitAI41yHN9TtTI54=;
        b=Ew/Ko+IZP82s6DE9oUDn8jjl4LqnSLQtGxTx4pIWzTei3CEG/vmJurWsWj/sqd1/kX
         OZsQjlXh4eyuNe0rwjRA8kvEteKQVcnolfYki+mZ8uBGChNP1jQfyKq2JKUhKjWXxDgg
         kykSFD694pvKTOcRZHhPv1kg4M9BuLUS+ReQxQ9brY6QrKRxCtJXRlhupoeVwfa9oIav
         xLWPkSAtJ9S56L5l0U5ABvuK+0cswL4eZYGbGPnSnnxRievdc/7emNZBVB5JmC7dpJ4h
         kiRgRCwGJ81fljajh81JLpatdEq2D5HYobt6xM1izxfDuA43rT7bS6VFpT2fX6WTOezT
         galA==
X-Forwarded-Encrypted: i=1; AJvYcCVj+cS3rBUmuIssLfDADjMIGcma7cl90Ozw5q5VNOpMwXFDucvPSIcin2jrRZ2FHOsdNYWM2deTfyk0Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAomPfN+J6/pxNDsemA4jZpzgtEplQ2BsOJfrNEFlMKIua5fJh
	giVBrzzFng/vT57JmIrpFwwTvN+i6r5/IjDowyYgXeqFEnpRWVUWe/fUbtlDq1c=
X-Gm-Gg: ASbGnctSyswE2O1P9L6Yg0ZBYAIKmaP6sc9Qo+hV9jIXb9o+08AXJuG1yKCY0htTow/
	ldogLxuFBuqC/M2l+K0VyZ5MEP4WW5nL8t2QO7OG68GxrAO6xH6pMnlOcFg44ob7DrewFMqFgrq
	vO/r7KjQ3IBlV6xSct3OM5lvAPacowU5pnUOl4QPFJqclVTEyOKnLqfWxQ4JMcwd3Iccae9D7Ha
	Q3jyp9hS+hMSs9YsexQ4w20dD5xjoafbDOtC/PeRYpSrT3EZEvX/AHB3t2Wk6jcWXj01a4DBBN4
	+w+d57gR/JwhimevJpJUhFyezoG9bYn3/MMnF4XvlUOjOQ7m7PEIKCtzKYpPn/SG
X-Google-Smtp-Source: AGHT+IHm7uv9N7X8wM4h9+1EaiklQFdNCX+3gAebwLRk5Q4LNZSNvZzf3U5GFdZCMaWbNR1xrzU4/Q==
X-Received: by 2002:ad4:5de3:0:b0:6d8:876e:ef41 with SMTP id 6a1803df08f44-6e243bf3c79mr338472586d6.21.1738604612660;
        Mon, 03 Feb 2025 09:43:32 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254922543sm52478646d6.74.2025.02.03.09.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:43:32 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tf0Tr-0000000BJp1-2FvQ;
	Mon, 03 Feb 2025 13:43:31 -0400
Date: Mon, 3 Feb 2025 13:43:31 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: thierry.reding@gmail.com, vdumpa@nvidia.com, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, jonathanh@nvidia.com,
	baolu.lu@linux.intel.com, jsnitsel@redhat.com, jroedel@suse.de,
	regressions@lists.linux.dev, linux-tegra@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [REGRESSION] Invalid gather when using Tegra210 media engines
Message-ID: <20250203174331.GF2296753@ziepe.ca>
References: <c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt>
 <20250203170617.GE2296753@ziepe.ca>
 <4ea1a48c-9020-4793-ac9b-b51fc289e442@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ea1a48c-9020-4793-ac9b-b51fc289e442@tecnico.ulisboa.pt>

> > How about this:
> > 
> > diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> > index be2ad7203d7b96..090b1fc97a7309 100644
> > --- a/drivers/gpu/host1x/dev.c
> > +++ b/drivers/gpu/host1x/dev.c
> > @@ -361,6 +361,10 @@ static bool host1x_wants_iommu(struct host1x *host1x)
> >   	return true;
> >   }
> > +/*
> > + * Returns ERR_PTR on failure, NULL if the translation is IDENTITY, otherwise a
> > + * valid paging domain.
> > + */
> >   static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
> >   {
> >   	struct iommu_domain *domain = iommu_get_domain_for_dev(host->dev);
> > @@ -385,6 +389,8 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
> >   	 * Similarly, if host1x is already attached to an IOMMU (via the DMA
> >   	 * API), don't try to attach again.
> >   	 */
> > +	if (domain && domain->type == IOMMU_DOMAIN_IDENTITY)
> > +		domain = NULL;
> >   	if (!host1x_wants_iommu(host) || domain)
> >   		return domain;
> > 
> > (if not can you investigate this function's flow compared to a good
> > kernel?)
> 
> Yes, this worked! Does this mean that with this change we go through the
> path of using the shared Tegra domain (for example in the driver I
> attached client->group == true), and if that is the case would it be
> beneficial for us to try and change tegra_smmu_def_domain_type() from
> returning IOMMU_DOMAIN_IDENTITY into IOMMU_DOMAIN_DMA so that the
> dma_alloc_* functions are called directly?

I do not know the answer those questions.. The whole rational around
this host 1x domain stuff is mysterious to me.

It does sound quite appealing for the implementation to use the dma
api instead of attaching its own special domain.

Jason
