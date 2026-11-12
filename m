Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505212;
	b=De9fpMkgdyKeeTidqiQWrFulLRcwAC1DTW6zL2VeAg1GdIU/hMRjPz40dG1YvkotFC8E
	 3CX7VcNU9O51ORuuWoDwQImMiBLf5Zgx+g8lAFHtv61yYBhUhU4005sqnBiy0EwcJ0Mqs
	 oRWCigLFq+vRMNrYgHe9+rDs4LMb7GWWbY+Br+6L2688jYX9gaNWw1hARxhNw067ZghXP
	 FoFzZZkr560yf/JWlrSPvCpBvgWQ7/o0xuTFQVGmf2ZOlo6ey3a/3l6BnI/x4g+6mzGoA
	 kRP0T9zOWVPdR7FieelrhXscSJk7jR14o3sLE6qzZJLx60OwaFhB7OPdRMRiVDoIyYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GMK7MSqRNNJITd9VKn9EN01v+V/w/ND04vZqm17dQrA=;
	b=xaQ7p6TwMldIKbvsHEn8cCFggQW851gUHpsGMDP1hHpQE7nnNUdKDMDwdSIaK2IXyROG
	 GQLSg+X6ear2haRLDdHGPwaEbgBj0AOSyN4yB0KhKxiNJfgMfbd14sjl7YgMKQ9EzrwYR
	 +YWWgdv+jvYTKd47P26o4RKJr7uChq8nGy2rfjg1D9ebBmrPJxL6422LJu3i4JcGBDhNu
	 UeDx3FDRC7cM8E5gtw8o5QPcnHgy7Flwa7m/A0LvrnActX35Pc0Oh10eVcoLlKfacHNpS
	 boQe0/0fzdiMSa+lbf9c2st49ZH7sA2H0bhyMJ+vMk+ASQbrdBK9kIAB0DjHP13JDhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=E7m+7oWT;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF51606C34C
	for <linux-tegra@vger.kernel.org>; Thu, 12 Nov 2026 17:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BF51606C34C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=E7m+7oWT
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53669f7b518so45697611cf.2
        for <linux-tegra@vger.kernel.org>; Thu, 12 Nov 2026 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794505211; x=1795110011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GMK7MSqRNNJITd9VKn9EN01v+V/w/ND04vZqm17dQrA=;
        b=E7m+7oWT5vnwPeCygHD6YEjh7jOWPEC+ZDjeuPdczK1vYBKrloATpEDBVihXvtG9m1
         oi1WkqSgA2COI/tL0rIYwv4W397NzbGvplbxnoPs3COp53kkX/jdv8cbobRJAd8QOxjw
         SNF4IJ69TrBKYjc7paHmPNKvqMzmje7Wlk5KplK3lm03LceoOPQMDRpFo1Z/+zVyEiZe
         cqGu0Or2btrBpahALI8LEKNKbF+yWWsBWtj2Wo3iwDjvCiVEfw0hGu0rLNrZiM3ldNX3
         3TsHxI16od7ea4V61ESiHMCGExqr3qn22Hh6C2DtYSQdOCTdsfdQZMKCCJswEIr5YG7/
         5Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505211; x=1795110011;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMK7MSqRNNJITd9VKn9EN01v+V/w/ND04vZqm17dQrA=;
        b=06rMu1M3Gu5DSOqJ1WEjumhc5eRvZqdopCBGBoH54mY8HTNfIN3YFJtnmFsOUmwP87
         b+S9Nyed001Q3kxmtp6b6/oW5ot3FdiLucO3RmxpR8nQh7FvbgMFMbfW3JELPzExlbpT
         JBOMMPW5ZGKbGNlm/wiQ91u3q2F8YEBVAgM8MQfXckKtOwc58qJsLDVqhO6qbl6WYo6w
         KICpA/p1/S6/U4FqpPLPmtG7wL0w971Gvm4h2n7Cf4Z9gQ2LZNmvh/Frz1xBxTRWzewd
         W/CFhSz5anW+JHICWbuEYhaIGBbtguR2JikD8ZeExdDnju/cYtgB4la5/cDQBswdw3JI
         dMgA==
X-Forwarded-Encrypted: i=1; AL+hErEyiJb7BlQf6q3TqKQ/yXspdogvrnOwFbxQdWLXLcFAsBcODv3vkrf/V2hNvnAueUYCwhhIfy1527veXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/T2LW62Gk1xpiAS1sLGqh5UZu6mOPag7zzIsC1ojeqQY2FYO6d
	YIqVomEGYribdcNbeWbcD/yYRalZHhBRjT+6LtGFMjvZJO7OaejjkEJoVHkjFWbt7WI=
X-Gm-Gg: AYBFou3t9lkM+ZUj9r3tKe/BoiMB+dsYMcTY2pp5mOSUgJN3ItNpWn0liwzXOBNnKvp
	4z7brGhg7AwdSQmAOIXeHOoXnkaEvFUQNKIAAif44fd3gPOqHpaVUqBVaEChRnReLFfX1a6mdqx
	HJMdUvMTQcNQK7sfxFxNvFdHCqSwA/fz+8FRn5vVOzZDOM0FOub7IlYhCPwGs/MLVFOq1ffpI2T
	zo1nRrIjRppLc5anFdg6m0xb0ZfIlQhKtUtGYF/G+d9tVXkkxImwWrkcvuqLDuaIMaGbryqvrvE
	haWCMDUBt0PXxuaksNPrhYLSkt3ckwzhDH9Ccv0AI8JQ+d+sUbYZCel6S18rw9H0z9pywn4zYcB
	dnNyVqAczfffFIgLcRhwvgDZHIjwvUBMFrMEepnE94o1Jcm7OtE5UOn/C3ue5u4PyDDS46TTRxY
	vGwisJf3qLzxdh7qswT64a4PCESiPl5yGiwAPjm2sTkw5PcZf2iF9lg11EB1cA/O8IrFzGRPZ9D
	fULbtxpQNfFSgtwDwqWeX18U/WJ26B7WRnd5wHKjOKaZ2tIwnCh7Z/nIWg/HWlXOyWT/mq6BlMl
	CqL9pQ==
X-Received: by 2002:ac8:5fcb:0:b0:533:8e6b:260e with SMTP id d75a77b69052e-55ac78597d2mr1668441cf.31.1794505210728;
        Thu, 12 Nov 2026 09:40:10 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d70489sm890336d6.21.2026.11.12.09.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:40:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xRYmP-0000000FjX1-1XQV;
	Thu, 12 Nov 2026 13:40:09 -0400
Date: Thu, 12 Nov 2026 13:40:09 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v8 06/15] iommufd/device: Hold a KVM file reference for
 the device lifetime
Message-ID: <20261112174009.GB2532299@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-7-aneesh.kumar@kernel.org>
 <CO1PR11MB4835982DE81AFE060EEE01B88C762@CO1PR11MB4835.namprd11.prod.outlook.com>
 <97053bb6-c221-4ae0-972c-603b194ec25a@amd.com>
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
In-Reply-To: <97053bb6-c221-4ae0-972c-603b194ec25a@amd.com>

On Thu, Nov 12, 2026 at 11:25:46PM +1100, Alexey Kardashevskiy wrote:
> > > Once the remaining KVM file references are released, a later ioctl on
> > > the still-open iommufd can access the stale pointer:
> > > 
> > >    iommufd_fops_ioctl()
> > >      iommufd_viommu_alloc_ioctl()
> > >        iommufd_get_device()         /* finds the surviving device ID */
> > >        get_file(idev->kvm_file)     /* accesses the freed KVM file */
> > > 
> > > Take a KVM file reference when binding the device and release it when
> > > the iommufd_device is actually destroyed. Release it before the igroup
> > > check in the destructor so that bind failure cleanup is covered too.
> > > Document the ownership in the bind API and device structure.
> > 
> > I don't think this needs to be fixed. There is already a WARN_ON()
> > in iommufd_object_destroy_user() and many bad things could
> > happen afterwards...

Yeah, it shouldn't be fixed like this.

Either we need to rethink that warn_on path for some way to actually
wait forever or we leave it.

AFAIK nothing here is going to make that warn on trigger.

> > If we really think an ioctl could take more than 60s in sane scenarios,
> 
> It is quite possible when some TSM operation involves (in)validation
> of hundreds GBs of MMIO.

That won't be under these locks though.

Jason
