Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909259;
	b=GK/yvyAkZu3FVf8ao8bDc0F+uVRzcc9/D3f5cXgk8uxjN/VlJFrGtYa05c8YH9TCrXlM
	 SlMIzt3Ic0bHzAliOSlrA90KF7rFsFU5MefXuMCJfrsIyBAIwWi+vVrJ73zv8ZmimqGKv
	 cV7kySNLgyCkkKuS2umctosDSVRO7v02xCwAcR5DXXcH9/ThDr8cj+B1GVZuGLL2QjYGc
	 uj/qKKk824W5hwCnvMU4Ns3zzh0qFnfSFgbjSz14cMWRLN0TYu4h5mJlKVr9icPHkvnZD
	 dVM1qFjQfojb67lHodrSykSsKfRbe34dV6vNjQfDCCBhNDpJEtCzPzyEtoBmGB4wWvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=z52AWMMx/NPlxXG7BPdw5LHgxa12llcgL1Kha+Q5UfY=;
	b=ztq845fTweSgyAUCyryxwG/bAsIcXJzscl8FXjduuVktedo+zkW6XxlwEW7SP/inqlE9
	 /2v1mMqQzqPltiQjNsQ7jXBrucrcZqmfriGuk+WSaShk3n1nabyC+kvaicwxwW6O+sVS0
	 vwMMw7AnLMOVOgtj2ruyCgHWfr45wJIKs0xiPfUW4B1I+TXak/DhYy2zTv+3Kv/7+rMiy
	 vwUlqM9JHcXMAapaDaXSH+3hRw6mJOGG/0mSJzKl+4OqKqzcLWq2KzUfIwwMfTGOxrGrg
	 pX4Bk4outLyb5ydNPFxuk8k0ftfAsF9aK7ERd8bTjAKIxdZde7qCgvpjmZ3/ecBfkRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TTLwqXLA;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27026082BD2
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 20:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C27026082BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TTLwqXLA
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99071945aa7so1202111241.3
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 12:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793909258; x=1794514058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z52AWMMx/NPlxXG7BPdw5LHgxa12llcgL1Kha+Q5UfY=;
        b=TTLwqXLAQlPsKskFCXnoS1GvrY+1X2rnxZbk187/wHnZsGUa7Aw+sS4kEijUFCDoeL
         JgKdNPv4bg8thMPXIZPCzqJBPxRgwcYFSea4AIbvhdkPLC4Jv0WRxbirxhZIlwbT0++L
         FtFZJmMXP/QlUTvUBRgFqZnnlppVdzB/CqHL4/dsbSEZxEnJdccx0EpXh3G/xe+BhUqC
         UfsfwAA8QmU9VJ/FAPUF8xduHrEPWUUJE9owKGHIYUiAAfL4J6Rvf5TSpTjCI4FVP9kq
         dUkeK2kBPUyD9r8Cq70IGPShAXhXY2CLNJUfLVrP38NArB6DEwlnVe2VSDdatpc0Vc69
         ve/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909258; x=1794514058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z52AWMMx/NPlxXG7BPdw5LHgxa12llcgL1Kha+Q5UfY=;
        b=FH9vry9+E69TvjJMxtfo0Rtr8HN65TXlPwQ8mKw65FpnPFZ6Cxqav5Q8SfdOkcyxnM
         C3QAJ/bF4dq+U19YAo2r3tRFIirroeLddGCU24fTNlC7zIwLlF5v9WCw87cz79HeWSKH
         YXbIXFm8aoOs+foTNoAonNbKpUiUsLXpZEDs+8118BjU2jOshtSQ4CbAjKCVP03efY3n
         HEgQsVvIAYl8GI1IdGGCUmAeYjZCxAHy2ZH1I7P4V030K46eS+zitZEEdm2U+nVhRypM
         2Kgl53B+MMa1KwRPSgXec6+3otd0dXlodb/Xc+0iVy/RgUZlyZ+WeU2gn9mgz6Wxemqu
         OQmg==
X-Forwarded-Encrypted: i=1; AKwUvBxICOcu8+KsYPiTRMG3W3Y27Rr8KcvY3PDk7LPZSxDpkveK8Hh8RLhKAzbwk2VVowXektACSnzdVnaIyQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z870WQLfL1VXVBy+uureCfTxrMqRIJDHjgrwusojV07fJ+E9yje
	8gtRRmCXBAlCfgW1KRQsaSowuXFaKOs/Ra4rEP6ysQ2r/btoVzNsurOuLXXER9jsGS8=
X-Gm-Gg: AYBFou2474s3X/hqRj8RI+Vop+6JQ6eMULom7/YZTXQJspjVzD9XRCpnNpUo7yDkwb+
	nP2QvP71axkMUirOHfU8sNA9thyLaC383Vjda6SkKTS6XpTR3CmjaqrRTY3Zwg53Ym2vJvq6G2S
	r8wsWh3b65BQ5dwKOC8GdYseCFr8bfQwn4xXB0K8nmgG8Gk1JusgV0Hlb6zV02DXe5ra0DdIYxT
	LDEBh/MnApHYy+NvVVWRgMRB3mQImXdTZ43I0t5yFQNzW1UVY+NuirBZROTMm5808nP3icYf+RU
	1uIpUwCsMXZVhrV2V8U+DfF+NQUBWrJqpWfv9eaf3Bmt/rRDk9ppaQoY+61Ts+cTGfbNzQK77v6
	oAJS2PsKCTKlLZi1yo2q4M70znL+T9ISbWObtjeOBDHUo9At+y7VxYmWbd2agKrJgUjv2GLIHsw
	OJ6M84vQVeFTISllYgNZHHDlMmICzBLeInhDwqQGtp9qWJsKFL0W08JxfhtW9UvIUJdIAlR5ho0
	mdDFmA2IkSaMR2kt3jYG9XHlce07ZMWbZP/QRMJiKPNPbWTIDUSBvrGRNiZQCS5q1Xx2Nrqe/pw
	tK/CZYVkrcSfbWvz+rSZZ1HVb4Xv5xoim82/7UBKXtoJr+ZF5XFpZ6y2cl2964a07RmpXaICLRG
	kp7dTOHqRKA==
X-Received: by 2002:a05:6102:390f:b0:7c3:99a3:314a with SMTP id ada2fe7eead31-7d2a1509e88mr658597137.9.1793909257584;
        Thu, 05 Nov 2026 12:07:37 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecb6d79d9fsm2610604e0c.7.2026.11.05.12.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:07:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP3kF-00000003dYX-3Q5c;
	Thu, 05 Nov 2026 16:07:35 -0400
Date: Thu, 5 Nov 2026 16:07:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 13/15] iommufd/viommu: Allow vIOMMUs without a parent
 HWPT
Message-ID: <20261105200735.GF663069@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com>
 <20261104193139.GB3889730@ziepe.ca>
 <yq5afqxf97a1.fsf@kernel.org>
 <auzAivzpzSUHjEQj@nvidia.com>
 <20261105182106.GD663069@ziepe.ca>
 <auzNkAGFLH6da8fq@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auzNkAGFLH6da8fq@nvidia.com>

On Thu, Nov 05, 2026 at 10:40:16AM -0800, Nicolin Chen wrote:
> On Thu, Nov 05, 2026 at 02:21:06PM -0400, Jason Gunthorpe wrote:
> > On Thu, Nov 05, 2026 at 09:44:42AM -0800, Nicolin Chen wrote:
> > > On Thu, Nov 05, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > > > Jason Gunthorpe <jgg@ziepe.ca> writes:
> > > > > On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
> > > > >> By dropping the nesting parent from VIOMMU, it just simplifies the
> > > > >> attachment to an S1 paging hwpt, right?
> > > > >
> > > > > Yes.
> > > > >
> > > > > The VMM must always maintain a S1 paging attachment that is the
> > > > > identity map of the VM on all devices, same action as when there is no
> > > > > viommu.
> > > > >
> > > > 
> > > > I am currently creating an S2 paging attachment. This results in a
> > > > configuration with S1 disabled and S2 enabled, which is used by all
> > > > untrusted devices.
> > > 
> > > For validation, that would work. Yet "no viommu" should would be S1
> > > paging, i.e. hwpt allocated without IOMMU_HWPT_ALLOC_NEST_PARENT.
> > 
> > It doesn't matter, consistently using a single S2 for everything is
> > probably better..
> 
> Hmm, I am confused: if we use a nesting parent, why do we need to
> allow a viommu without a parent HWPT here?

It is because it doesn't *use* it. It is a confusing to pass in a hwpt
that is never used for anything.

Jason
