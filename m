Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB867221704
	for <linux-tegra@vger.kernel.org>; Thu, 19 Jun 2025 11:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333659; cv=none; b=s0lg2DUSYQFDocd5CE8YiqODpwwVZ9/I7B6Qwvtdt+6bFEuTQXB9/exHEOqN/TaDDrG3RrQgmN/y/WGtJFKsbdXCH4xumOSnhVS8sCp1Ivblby51Sq3p60cMHcYvC9m8ktofXA1GsxqxWIojZhOKjTxDCkwcZ8LvcWW0GiLIS8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333659; c=relaxed/simple;
	bh=l6Xo2u+S5d7TcFeamcILKuqUG2JxPDCCMjkKufM4aVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUCHRAHgV2AfKIrbGg9NiK+Of+Mor6CFLp6RHLJNcvJ2tpiaTGxSzQAPDGb6lVF+hEviF/v5pGODr/szSIHsENTKZcTZvrKmbTRKOEwvwun02Ec6+axF0f5hxxwSkg2mLyZJx9sCruUtdWjtT3chKViazxqcmurXJm8zaY3bavM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fo7amhoE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fo7amhoE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2348ac8e0b4so125905ad.1
        for <linux-tegra@vger.kernel.org>; Thu, 19 Jun 2025 04:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750333656; x=1750938456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=09J0YSNlS/RD38iZ7EgK8rqCHnRR998neTro1uy3CQ8=;
        b=Fo7amhoELjgy8G7vhHqpy1FLFhoxe+NKdAayABXlfYuOkvzJ9+vg0l4aJ1+C5gDVNx
         2ic84ujDwcPYKizpvYPrPR33ESmjFvMLCEzcZ12/xf7EzN4n83UxwbCxpg+mVXleLNvN
         bx3s2qciduvhACR0D1XjRKRy55TVXFg5vsyf/sjemVSPvupgeeHHwZjirROA+ypFoMjA
         LXG5iRsRXBfZPA7+YiDVe61+RFRvgIa2H0mx2l3IzhyazqzstynuipksxD6BapJSdKvb
         PpwdJCngpTRQI3HAyEa2gaMSr1RTfcuy2UqR8Qx1nki1lCMWL6KbcFhLol4aHrSfsRrI
         5owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750333656; x=1750938456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09J0YSNlS/RD38iZ7EgK8rqCHnRR998neTro1uy3CQ8=;
        b=TXnct+BpJhc94oQRe8qqksPy8/34krXXRPO1TcmxqksD3MV9EW/zA/vt74nhfXn0c8
         fFmjrxFK/9bb4LAwTR5vZvx7Q/1GjGbJVgGFuOtw8As05j9bojBM6GVslgxJtI1xHCeo
         pdNGvflmOH0na6xMWp4RFCGS2cj4ooNiX905EEj5UxCA3yEhlxhbpSK5gfFe8+nwaBiC
         rhQ38CRn22q6yg9N6hnWadBobXJhLcwrvvUS5WySfy2aDxg0pRn4okyOw7pYhBG/mq0Z
         pmnzDPGrPSudyhFeQhiAFR0pxXt4jDAihQNN8J19vp4GS0xaHjsTuaDxwSZlhNe0PI4v
         B6IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdI6kEpDsxh7yI9O5XUpmNNef8Z41hwAwF55vzF+oSF9AzmjE8bgDfpBddflga4jziDcwU8IK82JV7eA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz2T/tyygC0GC0VT+Ob37Sl7kI1Iz/75ksUrA/IXvxoZMRHPm5
	hn0W0N3TnOBdJjpt/6JN4qBx9cVxtzJ/1JaVOtQk6FY7WThDJnjcKhaJVriHxv/QkQ==
X-Gm-Gg: ASbGnctUvp9IXXM3F85IEsHRwBRejTP7yAydZsUq9v/g/PQws4Oid0K+dCZYQLdl1b1
	bmrBhTv3oyK39zbsgcKkMlk6fv+BYTcCFdwPmHC1IgvoScHaRHMW/aO2z/MSel1FpKrctsxRCV0
	bG3FP2Jso8cnRDgSu6OnYnyQsvFsnl4hib7gss/pkMUJTpX6mdB92kJMmSGGeHV4FdqMYbEBRH2
	XVHygiJW86b69dv0jxdT5PVRStyMhmKWu/DmJlErHzrPdSAAM/AtVg9k9neeuVephnb8m7yg3QZ
	G0kEqpzeiVzoPOcvIxgWI8y78WhSjGB4TOayEjzCTa9amwB01fhEqDXJt6enn8Z5lSx6Z7vAZGE
	hO/v6Q9MhcChU0Cw8GWlbuGP9BQLllTI=
X-Google-Smtp-Source: AGHT+IGbvEiTa5QOLk5NW8yLzYkB32wsjmC6sfvRD4CcA87KLToKCvr4HcCmPmyYeXbSKEiK4HR2MA==
X-Received: by 2002:a17:903:2b03:b0:215:42a3:e844 with SMTP id d9443c01a7336-237ce0478f4mr2445465ad.17.1750333655627;
        Thu, 19 Jun 2025 04:47:35 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23c0c5sm1932766a91.13.2025.06.19.04.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:47:35 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:47:24 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 20/25] iommu/arm-smmu-v3-iommufd: Add hw_info to
 impl_ops
Message-ID: <aFP4zHIVT6epJeLb@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>

On Sat, Jun 14, 2025 at 12:14:45AM -0700, Nicolin Chen wrote:
> This will be used by Tegra241 CMDQV implementation to report a non-default
> HW info data.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 8 ++++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 07589350b2a1..c408a035e65d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -721,6 +721,7 @@ struct arm_smmu_impl_ops {
>  	int (*init_structures)(struct arm_smmu_device *smmu);
>  	struct arm_smmu_cmdq *(*get_secondary_cmdq)(
>  		struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> +	void *(*hw_info)(struct arm_smmu_device *smmu, u32 *length, u32 *type);
>  	const size_t vsmmu_size;
>  	const enum iommu_viommu_type vsmmu_type;
>  	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 445365ae19e0..1c138aff73d1 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -10,13 +10,17 @@
>  void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type)
>  {
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	const struct arm_smmu_impl_ops *impl_ops = master->smmu->impl_ops;
>  	struct iommu_hw_info_arm_smmuv3 *info;
>  	u32 __iomem *base_idr;
>  	unsigned int i;
>  
>  	if (*type != IOMMU_HW_INFO_TYPE_DEFAULT &&
> -	    *type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
> -		return ERR_PTR(-EOPNOTSUPP);
> +	    *type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3) {
> +		if (!impl_ops || !impl_ops->hw_info)
> +			return ERR_PTR(-EOPNOTSUPP);
> +		return impl_ops->hw_info(master->smmu, length, type);
> +	}

I'm not sure if I get this right.. if the user (while porting a VMM or
something) mistakenly passes *type == IOMMU_HW_INFO_TYPE_INTEL_VTD here,
they'll get impl-specific info? I agree in that case the impl-specific
driver needs to check the type, but shouldn't we simply return from here
itself if the type isn't arm-smmu-v3?

>  
>  	info = kzalloc(sizeof(*info), GFP_KERNEL);
>  	if (!info)
> -- 
> 2.43.0
> 
