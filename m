Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839778;
	b=qd1xi40s1XyAvhe5KXsQtVDUfiOxKMc1ShWFpngspZyQxf2IOmwxhC+ZuRrujAcsYn8t
	 m9uNXka/JeYx2WVUnNjzJefldaukMXrFbN5xEitrgMqzR5Is2camZ8IQOR6i9QZsnEezg
	 v7Ea41wg0Gp7hzzKCfSxIKwqoLRHyGOD9Qy5Y8jyBLCHfKJ++OtRv7JVwaSA5V8EDxSRR
	 vZO2fraXKuqce9xTV8WhL2z/8lhHRIHAFBFi+YNtVgtba45NHM3Sgb+dyyWE4rI0Zoskh
	 1VmkgcdNs/iZ/U6XfqiBQLti2KfksvQkc/jym/5ig6Rwk3RQ3S3PX9JZniShEICDekw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LRIt6wL5JukeI7CutNHrB30kNWGfRXMCU9CjLoUJZrc=;
	b=HhlgSI8LpSxf90/z6qhp04HEOwSwMwtccCm6TbC+Ug5zXqu+Ubpy34dAazgDdWFvTAnu
	 6xw9D5PciOGtENKnrSMvJbfFqwVdFXoBWj2UzwySzbOep8qZSWmOkD0j7xs8IfXjY7uP/
	 4WFGrVVNKe0xenWFuEszNHs9loVRoTsS8uWrrDTmGmw0n1bDjuu8+SERhlc2sMpX0ruGB
	 gDnTD9fDJPvftTL4wKRcLzambTags+nqJLH7NViN/N9AShSO4kAvsk75BskGLC/HviweX
	 oucCI3Nff84hzZNGjxLaqck7Xh6rWyBPNr3g1slXgp4XLM63GfJ9OdJyBf0LI5HLWoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Vrr7HJ5Z;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819D3606A32D
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 00:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 819D3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Vrr7HJ5Z
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eadf48fb2dso527558e0c.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2026 16:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793839776; x=1794444576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRIt6wL5JukeI7CutNHrB30kNWGfRXMCU9CjLoUJZrc=;
        b=Vrr7HJ5ZqhVHrUH4gQ1nhUYTf6eI4jAFUgOXuIroG+8vYSC8wq9FMKyRpAS0X3S8Ia
         X1WvaOw/i4Kvigi7NNddiUqbBVXB0bl8fUKtHXcRmXnwjafymJGOic0zOT0I6oSflaLk
         NOUATYSym2MCrlG4yos53f9Oevky9c0aEBqEq6qkq82K/dxjsJuVvv0TmlNCrPGnNsvZ
         FAiUD7z3B7GJMVLpYW2SE1rjX1GAd8E6xXhVi7LPD3Ev25HhFl5bCAGXS/2HTyk1k0Wu
         WdSBZyZbyw2N/RIxEj2XlnVmCNcH65D4QX9iezm0KOHSHS4RBEb3WjnO1Olgkp9XzRqW
         1OLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839776; x=1794444576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRIt6wL5JukeI7CutNHrB30kNWGfRXMCU9CjLoUJZrc=;
        b=GLmqrwb6Ti9/J4Bny+dv4YPoiEjuktd4SHVmHnp0iMUzCycPIJ06HnRPHC/FeEUl70
         WYVR6ucluLEFQ7pSma7mvQ8bX09uFcv1HpPR9CDGYH2N+ToF9zaLEVgKvpnQeaWpzFAY
         WhzgVgWPJZzB1T7N+wU2k0GV59d44nOEgj4MxRq/BmQW6ZlXbwRe5krzcGSLkrHjW2cb
         /tJU27K40lF/hcdCD2vhSM9mGPGvIL734+SKmkfBN0zfk8CnUZevdB54yi8ommuKqumA
         SrezeJXz8sQ/uFq3UqSpAl5uRkNIj1Wgr2TI66bHNOo+an4x4Qof7SyiuFyTS+mdQkPy
         5ygA==
X-Forwarded-Encrypted: i=1; AKwUvBwE8nElCwo1wh84vabrKgn+fzpk8XTm1+BftLWqPnXfeF6j85FGZg5rpzte3cnMoZJl44CL8VUoo193YA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+kXxNkZVz9XsuqGUcNgRs+7WpkPv8LwrT/m4cgKCoDwiNY71Eh
	pNaUUx+k37rpZdKNEGWidyN+NbacuQxoR0Ho2vO4dFVA4s8YuKeNXS4872SCt+BwC3U=
X-Gm-Gg: AYBFou1VlfrC44Gr60fkEpVsiC9tas6tQ1ysS69aaVplHTha/JIOQ6FQodoz+VdvuQf
	dm9XzZK3k5TnQZCRDtqkr/lhBiD5R2rS1aLLH1M4LQ+/uO1OXOK+K5yxtexBzBNkEnNF/ViseJA
	27s7VFrmC2fjKkLANjhHN2Su5eA6H4r+Khc9t706G+o3pZQQ6p/1ht+nOnuqcU9Y6f61fbwy3P6
	S06WXulT+HAy/ErORR9rO+OgdL6OEW+ungXUEtzmHVECiJCmqXJZiqqqrWewoIYgBKoLzx9eXZw
	zk3MaG9lJpNJOjwTElIgEZT1Ux2d4IqcSy5u73A7cuNxBbi9clHK1rGuojpk/xgqPuZuRQhAsbt
	yljmSsFeThyffGVyVNdH+G0vMbvAGIzW+yi2j2qXPToblKeRXbZLs2I/64hPQZl+mxTCF7EEUZ3
	GdAzZp+pbLfkF3e6XGIsM+5Zx24WWZpABaA3YO5WDFnxp3WLUSj8gmafy3wRcmSc+LaRwqnY12L
	LIwz+S/wOrS5KH6xnW3qJMga2K9RWgL9Hh1aGtk5mq9LUxMRCvR+Q3gwT8W4q82g4YjuGBanjId
	UqDu+cBn2oc1B3TJLidhOjjuURmnHg56lV75r2KAJ6ZdaInEpk+WZbhaQ2CaF3j4U34FqAsqdUP
	BX+R3O5YAfMw=
X-Received: by 2002:a05:6102:5126:b0:7cc:56a:58e0 with SMTP id ada2fe7eead31-7d0725e16d4mr6016853137.21.1793839776242;
        Wed, 04 Nov 2026 16:49:36 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d9a9ca31sm3266318241.10.2026.11.04.16.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:49:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOlfb-00000000cqL-0257;
	Wed, 04 Nov 2026 20:49:35 -0400
Date: Wed, 4 Nov 2026 20:49:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
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
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v8 12/15] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
Message-ID: <20261105004934.GE3889730@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-13-aneesh.kumar@kernel.org>
 <20261104152351.00002565@linux.microsoft.com>
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
In-Reply-To: <20261104152351.00002565@linux.microsoft.com>

On Wed, Nov 04, 2026 at 03:23:51PM -0800, Jacob Pan wrote:

> I am thinking MSHV/pKVM can register an assignment-only tsm_dev to
> leverage this? Could PCI/TSM support this role without device-security?

It is certainly not what TSM was originally imagined for, but with our
new arrangement, yah maybe so?

TSM basically just becomes this weird overlay driver on the PCI device
that does stuff. Some of the stuff it might do:
 - Register an attestation subsystem device to do SPDM
 - Register to allow iommufd to create a viommu
 - Some status sysfs ?
 - ??

It all seems separable and composable to me, so if you don't want to
launch an attestation subsystem device because there is no SPDM then I
think that might be OK?

Another option would be to somehow obtain the viommu from the kvm file
descriptor and rely on the fd to handle the module pinning/etc. I
don't know how to do that nicely with the way the modules work
though..

Jason
