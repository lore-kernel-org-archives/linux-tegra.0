Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA0B223707
	for <linux-tegra@vger.kernel.org>; Tue,  1 Jul 2025 12:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374278; cv=none; b=P7OkSYzF4xxCt2VX8AmPyCia059BgkBynfKcisuSEnToxyRM1M2n0k2XI03vdy26wqMXuK6tU6x9YsFirPsc6tkacrBOhd/J0SY8F+UPqOejOIcaqYR813PBSNF4ATBOHLqcq1j++aMKUeunzsyrqDsDSeo3I4mZHCv33fF1kYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374278; c=relaxed/simple;
	bh=UTZrlI9y+37r9TWwpMElUdLKen5fGKONWtUw6j0dYNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIy8BX/y0zZOxjor1buv/gYaFtIMH+wUjeZ3e3UTBo81o+eSNnHgNgbguiFwFUe4YhGjRj+b5ar19v1oQQ92oZmyoot7dbLwE6cAboHD6CV9hqW/+Ra1rkAspGnkQ2zf3FivQQAKNW+hTq/7CqRTNQVr95rp89aZE271a9nM+t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aZ22HQYO; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aZ22HQYO"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235e389599fso210145ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jul 2025 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751374276; x=1751979076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GPts6df6Q4890tqHCArh7YEtzYo+b0PlaNL9e95JEQ4=;
        b=aZ22HQYO2CqPeJ5vOwF6wf4CSqisVmIBvzHTgoCjmt0XbKMp4kwFYuz8OdHg8EPDW8
         7xnR/FJZlhYW+K0ywv5vA5Em26BUKdz+UJjtuMwYD3BtThUNfFqvYgxOM2QUrBqIst5Y
         36bhdgEzDZb0qHcDwSJG76Yov6n0hJ0MEj0MVbB4tjo7xwHce+1mkOr/qB2X7UGd+Ncf
         1wAvl8j0siGa2mztOi5hp9mLcUduWKa6/nrTjceFVyDF9akhAjNYkPg9BWEuV/uQY2Hs
         YFmlPLe++xvJ2f/C0d+fBSyqrCjYNHso4ZZh0UH1MHDrKDVEqxHuZxd0g0TOk8YPCcV/
         DoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751374276; x=1751979076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPts6df6Q4890tqHCArh7YEtzYo+b0PlaNL9e95JEQ4=;
        b=dmD0o/c1RELEpmvsCUrYCBQYGg2/D5UPjsFn6nZb1kyc0lxpPptiFZD414Epb/c6YH
         zPHCwMTZtM8Ie3x5vbwfvM+bY+yy3m2RLFgWheRtggCk9ySqzOq6pBU7KXlyUNJa+XoC
         8KP6eAYn4D2B6Q7wCahaejz7RNXqJydp9SUOSyLvC0+2KtTINS3gScU8h31+/KDYpuuq
         DfGMeByW57Rsx57qGyfuHV7B/wbIhEvVJjnY1oqH126gUSY8GLbUkxiT1ExEpzOGF1B2
         LKfYO6TRFkJv/t1fgnMQWo4VnsM54YqndreXIEX7VPCPRCTOQYbB7AX5VQFMFwupCjqu
         2fsw==
X-Forwarded-Encrypted: i=1; AJvYcCUQl77nU5kGDy7xGpbA1Ir59UUgh4HtqNbY5e0JSwtvLDk9o6Kup/QzNCuoCBOSf7KClQjUzXJZgMB0ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaxSCNDx11uPyhaDyQfYCcUlkEeO/e8q8i+w2NQIF3xLK0H6p6
	oWLI9bMe4x8ZDwEcwD7FrlYT8WnMuMP4z/XLpmsOMj3PX0SfHWoDk4QlusGXjD/Gjw==
X-Gm-Gg: ASbGncvyZAru1HuBcwX8vDLNm+daXenytcrDKE8q8DlUN9c3hBNBQp7AFinqTvWBonr
	cLN2DzAs4gNsJIMR+7ZfsLLmeO9taITuHKZvmxmU+imOxWa+0Ykg0kxMMNNC+92fYYknqR8X/Dk
	zdj445q5oOjHl3XHyLaBJV11zQfOgYjALK6nkzP+HQ5x17nTJTwpVOjQGBdNg24ts4zwZDgf4mx
	glplSL1sZC3DJWdYzrBDEo7NPx7LbPMnMp0MRRVNjkKQV6k2W8dMl8ZXfOW3d8kEiISyGgPLSWV
	1/ipt3hNt96OjpR6go7SSzQ+ZGQvJeZ0OoxEb5wq7/M3NDZOKB5D/vqaoTTI5SspB4z9WgrLk6G
	J64s1hnOV3wthR4bUdF87
X-Google-Smtp-Source: AGHT+IGScnewrdwJXz5o2+pGS36a0Kxzmd5AqmLzt37Kv43BKh9NBBAVMo2i4U9SfF+orF6VioLZJQ==
X-Received: by 2002:a17:903:b07:b0:234:bfa1:da3e with SMTP id d9443c01a7336-23c5ff04d7cmr1891395ad.5.1751374275468;
        Tue, 01 Jul 2025 05:51:15 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ee760sm11194996b3a.155.2025.07.01.05.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 05:51:14 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:51:05 +0000
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
Subject: Re: [PATCH v7 03/28] iommu: Use enum iommu_hw_info_type for type in
 hw_info op
Message-ID: <aGPZuSKBSADLbwas@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <f588bf6a47cbaf350a03e5a1680074b852fb5502.1750966133.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f588bf6a47cbaf350a03e5a1680074b852fb5502.1750966133.git.nicolinc@nvidia.com>

On Thu, Jun 26, 2025 at 12:34:34PM -0700, Nicolin Chen wrote:
> Replace u32 to make it clear. No functional changes.
> 
> Also simplify the kdoc since the type itself is clear enough.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h                               | 6 +++---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 3 ++-
>  drivers/iommu/intel/iommu.c                         | 3 ++-
>  drivers/iommu/iommufd/selftest.c                    | 3 ++-
>  4 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 04548b18df28..b87c2841e6bc 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -563,8 +563,7 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
>   * @capable: check capability
>   * @hw_info: report iommu hardware information. The data buffer returned by this
>   *           op is allocated in the iommu driver and freed by the caller after
> - *           use. The information type is one of enum iommu_hw_info_type defined
> - *           in include/uapi/linux/iommufd.h.
> + *           use.
>   * @domain_alloc: Do not use in new drivers
>   * @domain_alloc_identity: allocate an IDENTITY domain. Drivers should prefer to
>   *                         use identity_domain instead. This should only be used
> @@ -623,7 +622,8 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
>   */
>  struct iommu_ops {
>  	bool (*capable)(struct device *dev, enum iommu_cap);
> -	void *(*hw_info)(struct device *dev, u32 *length, u32 *type);
> +	void *(*hw_info)(struct device *dev, u32 *length,
> +			 enum iommu_hw_info_type *type);
>  
>  	/* Domain allocation and freeing by the iommu driver */
>  #if IS_ENABLED(CONFIG_FSL_PAMU)
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 9f59c95a254c..69bbe39e28de 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -7,7 +7,8 @@
>  
>  #include "arm-smmu-v3.h"
>  
> -void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type)
> +void *arm_smmu_hw_info(struct device *dev, u32 *length,
> +		       enum iommu_hw_info_type *type)
>  {
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
>  	struct iommu_hw_info_arm_smmuv3 *info;
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 7aa3932251b2..850f1a6f548c 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -4091,7 +4091,8 @@ static int intel_iommu_set_dev_pasid(struct iommu_domain *domain,
>  	return ret;
>  }
>  
> -static void *intel_iommu_hw_info(struct device *dev, u32 *length, u32 *type)
> +static void *intel_iommu_hw_info(struct device *dev, u32 *length,
> +				 enum iommu_hw_info_type *type)
>  {
>  	struct device_domain_info *info = dev_iommu_priv_get(dev);
>  	struct intel_iommu *iommu = info->iommu;
> diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
> index 74ca955a766e..7a9abe3f47d5 100644
> --- a/drivers/iommu/iommufd/selftest.c
> +++ b/drivers/iommu/iommufd/selftest.c
> @@ -287,7 +287,8 @@ static struct iommu_domain mock_blocking_domain = {
>  	.ops = &mock_blocking_ops,
>  };
>  
> -static void *mock_domain_hw_info(struct device *dev, u32 *length, u32 *type)
> +static void *mock_domain_hw_info(struct device *dev, u32 *length,
> +				 enum iommu_hw_info_type *type)
>  {
>  	struct iommu_test_hw_info *info;
>  

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 
