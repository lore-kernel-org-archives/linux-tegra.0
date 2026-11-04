Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820702;
	b=4osEeMIniNx2WjbEvsUDOyCFnryIW4cN3A2fT2n9MTuIS22U25JilmYeB1P57Gv9S5RT
	 pV+FomookZ/NqhBqFbQazSkvovTo96+Yh8nNMaDA091wHlgLHUietOk05OtM3FZD+LP7L
	 nb5ShvlUzy3rRvKJ32IEv/0m8D0/q8PvR6c4+LNt8X3WXmCSLce7U5BVw7KLjAINN5C5U
	 fMl91bcbtgJUjuDwEJSZOSkxXIwcF9aLCZ2+cuT8nABF2uUhyy50wx1DnWNoDZcHOgYzV
	 yv14wpaBflSvKcWbm9K78wR0XSYGsw3A0h1qECQFLJmWKgaLhTfDsTWvutaFlupQpbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=U6VmJzWY8/ktSu1tEfSH85YFZcsMq7VS8KWsZUWMCkc=;
	b=KfcC1XdVglyF0Q6noj+9qBRu64sqQ+eJCgS41jX7jHSEWghRHccHgV0jI854tfPTgSmP
	 cQz8dPqkRYmWeHiZSAYpNJGJyD6nRlDqgvyS0LPLV533HcvAhFpAfissqKEoRUJQGpMWI
	 CCvGCpycg+Qi+rIBCO2DYEzDIkCL/CiCtgRJt9piflv9bZLgZ3sTTTMpeeKarPZbzHFvx
	 CcbyZAb3oayq5RfXfnamKIXG+Ol7sjVZbFXlxw6T3Ns0k+5Ob0IC4nnorYZVMwf8wxNaK
	 n8d1EWZlGXlSwD0Haqaj8BoNkJz4sq4IFuyjpGIE3L+VXsKIiEXmQXIb/ABrX9BrC3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=EZcf2wTk;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C556078173
	for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2026 19:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C556078173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=EZcf2wTk
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f3c895a0eso102632385a.2
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2026 11:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793820700; x=1794425500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U6VmJzWY8/ktSu1tEfSH85YFZcsMq7VS8KWsZUWMCkc=;
        b=EZcf2wTkD+DUBFkK4Kf7IDSujj65CxJ1zv9d2f8p3SG06gtvsT0t+m2FBEKwTaLbdx
         FjlAU/gzIVFzN48oCK0JegUU3l6CcBvJYreTY8FfKEqN+7xSbQMxUyxTzpJuRNInWtNX
         bU34dNFsk1Hz4MbrSLbWANgqJFVMh3fjtT+PhutTYP31XcpWwodufBHzJysUUvDTjzjm
         z2wlWgpMF/QNFWFWE7mx8gDC6FV//vyjLuAhsthVQBtJiTVxhVJTyMJrETbYVwJRAVJH
         vpeGwkg4fYdDVWnxGdeXV6ybzqiM6icctzpK30WFh0sYTH5osJ07n+0FWdDxwzHibYfd
         YaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820700; x=1794425500;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6VmJzWY8/ktSu1tEfSH85YFZcsMq7VS8KWsZUWMCkc=;
        b=blb9/igi2CrnuwiXfw3Wr6D6GkZWi3EedfkzjiPHG7pg1o5qwcjQi+RrcKh5J/q87R
         sJwS9vbneNSh5rUalAkYNywlNbo22E9ZGyri5O5QMdMfQbhDDEo8g+vhyjdBkWIQ6wA/
         d2vRQMXmzkEsEP49Xqd2L6RdOQb/A89+kb8O+tH5yCzk93xNSpdZbniE2gEk3/3fK3RK
         Jm2TXwfhYLITUbWPMEDXCTj67DNQ4jxfr9JSmYr09JE7ySOA682VgLZ80UvxrW2zlomb
         O2MS/ZUyhxBwrkKC26VGlP4zy+lv8QAOXAzDiH0mOggpnRxUZpCUMI9efQoumRVUjRgd
         FJuw==
X-Forwarded-Encrypted: i=1; AKwUvBz/ZTjyTQfx9ccZzJjfCWbFET0nCX+iCZaoVfVMilsMBFsKYt7+aB2nriWiDzXNLinicFhiYCWuVoiopg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xy1+9eAHqdYot/pSYPWOhl60SYI6dwK+zcUvBHQoJTpgicOQc
	XYl0og+vHm4/GuX2/PpI6IVZQRD56D2OXDnC26eI7isHruBDHmF+pQVZIjUfGBSMi/4=
X-Gm-Gg: AYBFou1CUEMs/Muotc9Qs/yf/cjl4GAOWldS+d5j3O/gYP6W4f6GxziIQlZkvkHuYNh
	ek7D/vtN7Qm0/Zf8hPf9vtEFbGAKIOuhs6LJHb76T7CzkIPrQt88D7Z9ysole7u2sWj3kP+8ULT
	cg/T+ggVRMRQxjdFDee9BkyW/ASdlApM9642zrzo92MK+zw5CE0X7gVQd9Vv2VCRZP4KwN5TE0z
	+NhZDKJ6mkprbbMHp47YBeKfUHFpduWZwbGrqSOANhjl+i+z8nWZ0RUyqbsFcTDs7od5liYyC79
	l3rfNZPjHh3dgKMmuNVjCA8jYj8fvzT78mM8XTKCKQxAzoyeOeTsu1p+IfdnqmCxxZKOyIr71du
	5bEGi2iKQdAmaLs+VjT/wrkFE2W/FF7ICLVrMUobof5UxT6jUF+jHyiGVEbGrI5nN23NSVruQ/5
	vieJZgiLV9szavTLtaLFJm+VNINzuOSUlZhEr2m9iXySe/EHBiY+OzPnTTZX0/q8ff+PHQzx/kM
	Lh2SRdR0uXMgS/rdFAvrK+DYyZW2FyyIYNn2AYaAA4LnuCEKHVzHcse9OFOS8hQr03Hf30/NREF
	kcYL36TBkX/KMZ///wTT7cnd45bVY10zcAw7bKehzfsSVlW2HanXFeLwjr5LRVRuzCz1dPQLBh4
	9U/GaDvTo6w==
X-Received: by 2002:a05:620a:1a24:b0:93c:6534:d04d with SMTP id af79cd13be357-9442167725emr2767779185a.35.1793820700269;
        Wed, 04 Nov 2026 11:31:40 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4844991sm278199585a.28.2026.11.04.11.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:31:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOghv-0000000HG9b-0zIw;
	Wed, 04 Nov 2026 15:31:39 -0400
Date: Wed, 4 Nov 2026 15:31:39 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
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
Message-ID: <20261104193139.GB3889730@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com>
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
In-Reply-To: <auuBjRjQwXl7UvvO@nvidia.com>

On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
> On Wed, Nov 04, 2026 at 09:46:30PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > VIOMMU_ALLOC currently requires a nesting parent HWPT_PAGING even when
> > the selected vIOMMU implementation has no use for one. This would force
> > implementations such as the following Arm Realm vIOMMU to create an
> > unused parent.
> 
> IIRC, MSI on ARM still goes through the NS pathway. So, it wouldn't
> be "unused" if the device attaches to it (or its nested hwpts)?

It is unused by the RMM VIOMMU. I think that is what is Aneesh is
explaining.

> By dropping the nesting parent from VIOMMU, it just simplifies the
> attachment to an S1 paging hwpt, right?

Yes.

The VMM must always maintain a S1 paging attachment that is the
identity map of the VM on all devices, same action as when there is no
viommu.

Jason
