Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379518;
	b=rbSsmwcsWu/pkjnm1BAH90gX9DyvyyWdV0wD1w1qZrZjXotfSSlL0N8KgZsW+kZpdVr1
	 qH4fECYgald88G0Sw/70HlWrOVJMUsPRc0iY2O4cl1AL1qwXDCgfEExUqYrdT+vGOFack
	 h0WBrrHP4wVBz0/Rrkj46s5GJ0u0og66K4di2V4VDHM6m1H1O77sRva0uatZWPs2h+pYf
	 /0wg/EV+nPdK6DJzTBQExgErmI4y0nJ3FbzPyAxdotHbs9EHU3zAd7TlcWz6E/HtZsCFU
	 wzPAQAGksIaceiJaejsLbDBjT/6thE4SpfHd4+MgEHEF1yHUd6D1mgLIeXJHwbO/9Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Of8qcGhrASNngOAxz8m59rDteGhCMKDYRjobFeTSxhE=;
	b=uE9BxyMdr6SIIy6xHLzStK6E14Xb6AkwcgCgZpRQX6vKubf+1hLF8LPJaqLY5aV06cNx
	 cHB392BqaVmpL4PdtBry2iu1Lytg6WsVRtImKEQmdziTLS8desODqoCN2SbP/6B0grJHc
	 q182PGlYHQe1ZNGUtbINJ0WJrLromujChWV7zUiUp7jP7kMx5hr55dYCBmxOPUOPdaXlS
	 hdp7x6n8qazQvUnGNZq3UBzxePsATnzO3/NxilP25icBQqUlbDpKxnWipPgsiXO5m0UoG
	 7n/hhBU9y2/aMk+nUYNSAwYBDJ0UxZX3+bX2kwt9RvqJfsMzgdbL7/fD64FStbtOjkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2B3606A31D
	for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 16:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF2B3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91c11468b5fso10138466d6.0
        for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 09:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793379506; x=1793984306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Of8qcGhrASNngOAxz8m59rDteGhCMKDYRjobFeTSxhE=;
        b=bhjVVBdqP0p5ncqFTagx6Bs8saftcLn5bietHySzPVy+OkEz6ZQ9M/fOli6KxslP2k
         EkGkkKWXOROR+xZ5Y66zJosRACFVLr3t/huYutlqxtRTvemmBSyY8XCDaB4+AHAme/cE
         TUzJOIx69n/1h++BVedB8bNC+bSirPirKyjQj4ta1JNOyf0n7xCiBi3Sgqnppr3n74jW
         MRXn8TAOSdTG77kw9kIjE6+ApVorj0R20JMOvkgwCfupAdhbz9Ne3709GxfyCy0J6QCA
         hcNNS7dNywL5KAaD63ZlJ3I9EzgudyhIHPI13g7bUNcUrkZTtmh9+K8wnpmq1kIruP9q
         kJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379506; x=1793984306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Of8qcGhrASNngOAxz8m59rDteGhCMKDYRjobFeTSxhE=;
        b=ShRfVxjvLPmx2WtQC5F2zdiJ0J/+8RSUqJ6N8vSNWCzOzosOqVOsNl+XUmOblnY283
         Phu9StdkExsIwqJdAoTk2mUy3z2W5SbIHGEiQ02vPP9k/Jyg5wy2mHFsV/tSeD/XpBMz
         jbI/XHhv0eb0dUMZimcaqtVt9aCjshOqY6C7Q3O0mim5MVsNSzW3MMOzsdeGmj5B+8H/
         d4fn2TeNzII8q0/RaKeqYF5Tz9EDzXu9mKJNuunvUXqUyaqD4cezyNQexiLzJqlrJ85D
         TmPu/9Ou4avu59DL1yPJXjl7vaMzi7ZcF5uaqlqg88FapWBMMpkJZUAMUk5B1ZfP5X0D
         yNyw==
X-Forwarded-Encrypted: i=1; AKwUvBw0mdZZ4JuWdG17CpRSwb7AdCyc7bnXFL28BIR922hq4cR+wfntCe76X+wpfBfiEEg+EOR9x+yTSN9vwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8cj0Gg/5yRO8h3BxWGwTgmbOFdSZP2eKnGBeEa5N3nG3QUOPv
	id8qbL5SzDX9AShQtLfHqXA9CYiuagio+KoqKVbOZzFyU/05X0h5fVC0fVt1k1O7AZE=
X-Gm-Gg: AYBFou0uS7Ew+9OoXM+jt7zdA4oA2klRz1lJGtoupEQkn816AtCxa0iG4RCT2I27zzd
	wvdAqQgSaKD8QPAJcje20bKtO5TH/IKJ23jUQEA0kOVuKY75BMc08PbBVcCCtX/3d+SVuT4vhVI
	BAUGhTp+gIwVU4dRqOUkvTNioKm8kpcwZDTyjVmBGFBghJgV7VJFO2eYnLwW3CBioLaAj9RbirB
	nVFVjurRo1DFxoKz4IKbMNzpIWOgB2oQGCvhpmqGTL3CSfvn1+UE1ERm2/Y0IBumVMLtCV1QT9K
	wVyDuSoETxsd8AOLNY7S77jrdDOwQdykdMkdUyZar854JIW0iVpbqv2tB4Dnidi4MWJymgJjJoc
	y/ZnXngVe40zXrUN6Ejj8PW3srTkeR25hPUS5YyOwkupzyONWk1dr5O8zBjEyGpBXvLt91EZz3P
	IQARu1GzTHxme5hUG2XtHgw/m+hjtC3KujhqjZPAmSJTPOrML5Is5BzwBQT68bvfpirYmQiff0Y
	ENDnySSWR3mWzU7bYM8ML6N4Ki2ZCBrWzF/MlEe+CiT2qImvS1NzZIINFZPBI3HOe3wym8tKfCO
	x8MMxxLiWH0sEXUyS52xklM9EYTWBGe1+w4t3jWC7R3U44VIGZcPnnx5hT9VPiL2v6RjRcKucFG
	H0Tc5Qjp/Sg4=
X-Received: by 2002:a05:6214:226b:b0:91b:ec0b:9671 with SMTP id 6a1803df08f44-91ca4b9a540mr46456036d6.52.1793379506439;
        Fri, 30 Oct 2026 09:58:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca80700b5sm19825486d6.38.2026.10.30.09.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:58:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMpvt-000000019rO-0nKn;
	Fri, 30 Oct 2026 13:58:25 -0300
Date: Fri, 30 Oct 2026 13:58:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: Re: [PATCH v7 08/16] iommufd/viommu: Keep a reference to the KVM file
Message-ID: <20261030165825.GE3889730@ziepe.ca>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
 <20261008055955.4014342-9-aneesh.kumar@kernel.org>
 <20261014105913.00001217@linux.microsoft.com>
 <yq5aecd9aupx.fsf@kernel.org>
 <CO1PR11MB48351C4BD0BAD3BF6AFB2E0C8C6D2@CO1PR11MB4835.namprd11.prod.outlook.com>
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
In-Reply-To: <CO1PR11MB48351C4BD0BAD3BF6AFB2E0C8C6D2@CO1PR11MB4835.namprd11.prod.outlook.com>

On Fri, Oct 30, 2026 at 07:54:04AM +0000, Tian, Kevin wrote:

> Besides, it might be a good idea to return an error if idev->kvm_file is
> NULL in iommufd_viommu_alloc_ioctl(). I don't think the viommu logic
> is designed for native application...

That's probably going too far..

It should be possible to fully test most of the viommu stuff without
an actual kvm, for example.

Jason
