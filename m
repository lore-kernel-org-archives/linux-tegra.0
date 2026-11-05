Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902869;
	b=yq/jX1XZvohpL769rRCuvvjJQ3tYKxz7C3IbL3pFTPuJpY3ruAsopZtTiJi+mCEIZTNM
	 GNu3l7sjZ+tdgYp26quqWjcuA6hnuPjfJFThwq+IZh3CNO2we0pa0d5aKLmBp4gzEt2TQ
	 BKyiWvESn3jTcYg4muZ6gTiu5Dn+V6eMpKye/lpBtSeLddxb2bXq/5PHcUJ05wvKmEnKi
	 PULMghWA/ndn/3NZ50s+lD/jMGIh3AmQXQA1mOR6KealYX61h2wOc2bDaHDjzI75ZKNPe
	 lfS1Y5i/JbQbzKHPdpkiPmNEJvrcBa8TYtuFMZgacQWXKjpTg1pFiv4BKdBomWXvepg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jskhMrN6L8/ity8GI6Per+nZ8wI0zDQt0quVEnFZ+Iw=;
	b=ndpzZR+JfrwDDqhbjF7AscqeM7Q/Udk2MYTgaYKQUxrK6Ei9jHggF5WxjYqPjKLme6m2
	 zTnLNTqpI1fuKxUH0dRoDyPBMBgyjMgsF6VgoOEtBj0/35041DgJTVmLso1qHvG1K676I
	 5O2Lta6Xd3k4wFs/nPOZNjlDs2bI4+6/UIgfKgym1gVMWt1yYzKrn78hkOU5giH0eLqP6
	 uwN5OnUkVQUUxP/1RA+89HaJC962hBmfl2jd7fQzWyHpW4TJ0waLnaxABfWvGAUhEpAaN
	 xxmdXKBDy2jAuKXatdwtjWXMKmK3DiEhvZbi6ETcVea1omHF5duFyofi6oDZMHJNvww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bFFc9Qht;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B643A606A328
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 18:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B643A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bFFc9Qht
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so1617417e0c.2
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 10:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793902868; x=1794507668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jskhMrN6L8/ity8GI6Per+nZ8wI0zDQt0quVEnFZ+Iw=;
        b=bFFc9QhtL60aw7SzVi3n90y6OPOQ/SNfmEleQDiv8rFSF4IYFvn/vDsNDsrM4Gn1Kq
         6NotxMMHOEcCQmlAoVORKcim7urCFtTw/C0FIS5N0zHYGsiUaH7T2GwmMtIKCbQmcAhV
         1RmUlci38aA6UOfnOGv5Sgf9HD9MsUcUQgNs4acFwXkFhRT+u+oMnbB1Pl6102I2l5qT
         lWd8WkXOH/mQyEVJYGdTGA7H0/5r1c2DhnnDRtnAjIh8A5gmIhGj8EwYhJRQnem/TWYz
         0Hjy/I7+kIG8z30ux7Xdhyw/zen+A69kXy2SCjMooKnUxu3S7AS2jwZ0JPpNV1f6lpxG
         UuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902868; x=1794507668;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jskhMrN6L8/ity8GI6Per+nZ8wI0zDQt0quVEnFZ+Iw=;
        b=BiVTfNS5QX3Z/KzpAsbDRwRhBkDIRCF60czddq8J1cFJ2ysq+VTqzxXxTYsnVQyLms
         1ESOxvnaR5PPonOG6QYuZgEb/rEG2ny+B3Ff5YHNbUAf+sVOzhpPoCNKAMLz55YpxxW6
         7MEvOXAjjY8RrzJDz/1owIPq2zdgG7yeuevbf9JSSOsQHZeYS6pxlPHVe1aquCAdxPNi
         s1x90B774Ifpf+EvryVCCS1tpv8aaCeqrR7L+eipHUOKEzk+2Ans3iGlEcZi9ldJImPu
         jr7enWS/PC0kW7XjA5ZGhFRUrwb7+NezxCsRYF4QGQ5br1fehcQau/cjDntlpOlzhIRH
         +35w==
X-Forwarded-Encrypted: i=1; AKwUvBzpLMo7+CeWkg36n1P+9A14ZZzi7uCQZ2XGbScjs/K7yMDYjCqnqc/nebJ3sl8lmYd7GYUaaiKaE1Zp6A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/FJtpIABG8AkRRbk4Pe9+OxBzGknHByJGNaoPARGO1mpyAU269
	77nipDGj5zoaCI+Wb8qaJ0aveeleEKmLfxgwgs+EX97Y4a/Xpd/Ag3oPs8As+0hgjOA=
X-Gm-Gg: AYBFou3LhVIKeeGClQ+cwtFO26UfJzlPIANXR3aR0zJevpIjO4h+saJjiMpznJGEFa2
	kPGkXOt6Qd0Ujq/U8axNBAuHUZLeWJSIaqzYzCP/nwNM10kR6stum9ycZeU9Zm1NFMq6GhtKsUW
	PDPck8it3Y2q0Yz9+cSYlNcKhbeJ0bvKDRQkqNxQtfn6QctMoIV68wR8Eq96DDmiV4xQz5XtqBa
	BeBvJJXUDfawUkn1Is/U7qpMhOfyozuhIEEXvtaQNVlyfxgzyQWzkMSLzw1O+XS9qoSessyd6eu
	bJ6iWsW1Ww6WSo/zFRqfdHJkuBh4fItLfSeqrlUoDhpk1ZAwwBM8n604Vk+e+Xeae6S62JIjZEx
	ToNSmr5fma4szFKDOQ5u/MUQzyeC+pU696VPV3ms1G2qSqatbUIBeIs6i+TVjod3S8SdngZ8KEj
	NE8onpL+hQ0QvvIa0q6/mb0z2lljStNZZKtsVKCHhNnQVnIFx4cjNbSYl2xFxNSPGJSBfvcvQsj
	1mWCEwVF2DcPyoJ+HSbRmMadCrXkCWPc/lI/hXtrGHKbMuXphkNUtubZAol1lWtYCZG1wbepiLN
	AFe6ZPNN7QdAtICF/YZP5ZhRMaUTCJ3jwJJ/h1mSOjeF0geo/Px3GOa9Wc1XmMTnc0BIt7mmf+0
	blYk72lYNJA==
X-Received: by 2002:a05:6102:5706:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7d2a1628b19mr348440137.23.1793902867469;
        Thu, 05 Nov 2026 10:21:07 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998da178b59sm5242293241.12.2026.11.05.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:21:06 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP25C-00000003LsF-0vAz;
	Thu, 05 Nov 2026 14:21:06 -0400
Date: Thu, 5 Nov 2026 14:21:06 -0400
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
Message-ID: <20261105182106.GD663069@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com>
 <20261104193139.GB3889730@ziepe.ca>
 <yq5afqxf97a1.fsf@kernel.org>
 <auzAivzpzSUHjEQj@nvidia.com>
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
In-Reply-To: <auzAivzpzSUHjEQj@nvidia.com>

On Thu, Nov 05, 2026 at 09:44:42AM -0800, Nicolin Chen wrote:
> On Thu, Nov 05, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > Jason Gunthorpe <jgg@ziepe.ca> writes:
> > > On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
> > >> By dropping the nesting parent from VIOMMU, it just simplifies the
> > >> attachment to an S1 paging hwpt, right?
> > >
> > > Yes.
> > >
> > > The VMM must always maintain a S1 paging attachment that is the
> > > identity map of the VM on all devices, same action as when there is no
> > > viommu.
> > >
> > 
> > I am currently creating an S2 paging attachment. This results in a
> > configuration with S1 disabled and S2 enabled, which is used by all
> > untrusted devices.
> 
> For validation, that would work. Yet "no viommu" should would be S1
> paging, i.e. hwpt allocated without IOMMU_HWPT_ALLOC_NEST_PARENT.

It doesn't matter, consistently using a single S2 for everything is
probably better..

The VMM should try to minimize the number of hwpts involved, ideally
just one per NUMA

Jason
