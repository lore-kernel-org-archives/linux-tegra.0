Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B11212B22
	for <linux-tegra@vger.kernel.org>; Tue,  4 Feb 2025 13:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738675276; cv=none; b=jMR47tbHJP+gFK0iu+DGjhbcCk+P3fZcOWakZ7FJsGagGQ5+k/9efhSF0ZET1+alFb+QGbMPszV42KRZGq9o69NfYo5eU9M218BVJJZgFYwL9oNEbJT3LHXA/d7Ma6XDR0leJ1MGyxc0fX+Mwo4SificFf4h20h9lL63EhewECk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738675276; c=relaxed/simple;
	bh=DYoArqhz9bnwOrJj2sFoc+2pshtV2jJmtePZZiRSIq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSJYvxg3pt5qvfZR+9JFKmjETS/igGIWToxVXDeumXut0jWaZvtpL2/xFChhh4ac0LvARbflikzEbXPlWD2g2GJxZWZpDk3QBC7ivIwKMfCs5+vhqk5n3SbKYH+Sx9IlcGUKCAeuv9/k9WH/SrNkvGngsKzyxl/HpVm6Cl1o5xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=dm+u/REN; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="dm+u/REN"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6ef047e9bso495652085a.1
        for <linux-tegra@vger.kernel.org>; Tue, 04 Feb 2025 05:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738675273; x=1739280073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RYGog+BswJMrw0pyjx8F7JNxxtJRa9tDqKmDTEz+voo=;
        b=dm+u/RENYqBFJbpkMlTuItQ931epOkIE1nRLltGoa9IsC4e9SpknO8PtNRtmDSi71O
         IDKnfo439PmTQz3Sz7sUOsSuKBe1a/0yhtmS0DQ+NnZZwcw6LC4N6dsArWwAjz79i8ln
         PDPrBJC2GTlYrxVf5Le8t89ZPY01km4eUCydp8GKaCGpT+4fbWNuXtg4kl9qo54CLUox
         SNU6CyBy+kMJrE0Lsxo49eVf06hj1lwf5tF2x6Z0LymAzv4NLbcHMSJFwqyh18NFS4Hq
         J548uq+566UwlC8+VKRSGCvYyNcxGA1VryZfnR+YY1nNvAdTHuArS9yIsZhoAeww3kPL
         K+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738675273; x=1739280073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYGog+BswJMrw0pyjx8F7JNxxtJRa9tDqKmDTEz+voo=;
        b=GNJKWExSYUpUncm4vRipJAf20ns4ZxLIqrok2fR4pR32GJMINVHY0RrJ96nzJ60qGg
         6G8x6/5PEeqysoc+MoQeGCPks13Ho82GWrVP+37NjyJmT8UJ0jdafAAbxNQajAie9Co7
         aLaBeAuU8dcq5GhueK7udq1PNRlBCN3CRozWSMi9s8yeeDp/7fukDEuK1HiqgQKEWGhi
         8Q8dQbv8UOC2/NWxby2e0SsYBQxelFl2un25/mQSW+brd4dG2LGRypyIMy3wsy/AZ3Lm
         qtVwHEG2A4VybNbP6mHAiAh/yLMlhbONsD19mD/4ZAK7+qVI1lZUPx0CoTicb19955c8
         A/9g==
X-Forwarded-Encrypted: i=1; AJvYcCXC/RhLjGnBCAz2LTpSqxg5UlHSRe8rVxL2T00FZLGnYa0yWGCNuVs1mmRNS3S9rWIDSMq9i+K08f36pA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxhsw4R1MPzJ6UwA8XmujMzsYXZeW+FwGefee1ObJ0QBmcJyN+
	lLqDl6Czb76+JQIPnb6GkEHK0cF2CjxfctbSmiDiosSOKDyFMGyu4ilNUnFRV8E=
X-Gm-Gg: ASbGncsr52SfcvH9hA6c7L4gliPnUteZUuy2+aotNF1GEkGMf7Ad/oKH6N5YdaET3CX
	cwGb1C9sbmchjrTbt1Ze3UhSL45ccHds6x4isnQnEVejFjY2MjiNFgj2MD73yo+H1n6JJQZWHk8
	t5e8F/Yk8XoOtUWsxiFJ1rl4CrA2JjVDhtMkqjMy0id86+OBj8wDfO1wXvF3g8LlKcvUUogfaMV
	2czvjUdByy6lhLcFls6jUMe88g6cxWuTLICscHZRT+bVOTbcaHXaYin0wY3E0SPpL+v+sjFZpmw
	Z/TE1w3ynaJ24CPK1HBXI1jXYIl5lDtUIkTuTsD2m/SSx58XD5tNNkxEHZyWXsfx
X-Google-Smtp-Source: AGHT+IFUKUoX2jULeFPKEB1swp6FZ+1r6kccPcITYBbJl4Daknruc2a86ltK8n50/s0eCiuq5Mvn3w==
X-Received: by 2002:a05:620a:43a1:b0:7bc:db7a:4f78 with SMTP id af79cd13be357-7c02ec1063cmr525137685a.4.1738675273573;
        Tue, 04 Feb 2025 05:21:13 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a905b6esm637056485a.68.2025.02.04.05.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:21:13 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tfIrY-0000000BRLd-1okT;
	Tue, 04 Feb 2025 09:21:12 -0400
Date: Tue, 4 Feb 2025 09:21:12 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
	vdumpa@nvidia.com, joro@8bytes.org, will@kernel.org,
	jonathanh@nvidia.com, baolu.lu@linux.intel.com, jsnitsel@redhat.com,
	jroedel@suse.de, regressions@lists.linux.dev,
	linux-tegra@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [REGRESSION] Invalid gather when using Tegra210 media engines
Message-ID: <20250204132112.GH2296753@ziepe.ca>
References: <c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt>
 <20250203170617.GE2296753@ziepe.ca>
 <4ea1a48c-9020-4793-ac9b-b51fc289e442@tecnico.ulisboa.pt>
 <20250203174331.GF2296753@ziepe.ca>
 <a0f776ba-bfd2-41fd-8370-14818b86bfbe@arm.com>
 <20250203191346.GG2296753@ziepe.ca>
 <ff901d60-dd54-440f-a0da-4b72052eafd6@kapsi.fi>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff901d60-dd54-440f-a0da-4b72052eafd6@kapsi.fi>

On Tue, Feb 04, 2025 at 12:26:46PM +0900, Mikko Perttunen wrote:
> On 2/4/25 4:13 AM, Jason Gunthorpe wrote:
> > On Mon, Feb 03, 2025 at 06:49:07PM +0000, Robin Murphy wrote:
> > > I'd hope the historical reasons for not supporting IOMMU_DOMAIN_DMA in
> > > tegra-smmu no longer apply, given that all the default domain stuff has now
> > > been integrated into host1x for the newer arm-smmu based Tegras.
> > 
> > Indeed I do see appropriate looking calls to the normal DMA API, and
> > the other mapping path is conditionalized by !host->domain.
> > 
> > So, why didn't it work for Diogo? Even in identity mode the DMA API
> > will return correct DMA addresses and the !host->domain path will skip
> > mapping them.
> > 
> > Poking around I wonder if there is some assumption that if other parts
> > of the stack, maybe the DRM driver, are using the special domain than
> > everyone is? It seems to blindly pass around IOVA without really
> > checking who is consuming it.
> 
> I'm not sure where that would be, but it's certainly possible given that
> this combination of code paths wouldn't have been tested.

I saw some weird stuff.. Like tegra_bo_pin() does:

	/*
	 * If we've manually mapped the buffer object through the IOMMU, make sure to return the
	 * existing IOVA address of our mapping.
	 */
	if (!obj->mm) {
	} else {
		map->phys = obj->iova;
		map->chunks = 1;

And obj->iova isn't obviously linked to a dma map on dev.. The comment
reads like it is making the assumption that there is only one iommu
domain shared by everyone (without checking dev is part of that
scheme)

> > Christian was telling me DMABUF had some drivers that made the
> > (incorrect!) assumption they were all sharing translation.
> > 
> > It does seem like a nice project for someone who has the hardware to
> > rip out all of this custom domain stuff and just have the iommu layer
> > setup a shared dma-iommu domain.
> 
> This has been a long-standing project. The issue is that some boot chains
> set up the display expecting identity mappings,

The smmu driver can match on compatible strings and leave some devices
in identity mode, if that helps. Other drivers are doing this to work
around various issues.

> See https://lore.kernel.org/linux-iommu/20220512190052.1152377-5-thierry.reding@gmail.com/

But using RMR seems like a better solution?

We could perhaps also figure out some way to leave the translation in
identity until the DRM driver completes the reset, then the DRM driver
could activate the DMA API translation manually.

Jason
