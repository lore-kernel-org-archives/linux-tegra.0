Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DA1158DD4
	for <linux-tegra@vger.kernel.org>; Tue,  1 Jul 2025 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374110; cv=none; b=RUaVV+FMYHTFYMNz02MAV6g0OUfRfinHkNW7hW+Ys4dCHjjZF63oTIv+ONhub/n4WGs7QiwOYgveSWwLB9UZSQzK5u/V2mgZEMulx5b4BKG96satkqXjE0zBpGLWUcALaS6BTM2uGGnW/BUC7zjjkc3WGigcmQnhbREQ66+bJbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374110; c=relaxed/simple;
	bh=lMQz4zmsd7w5xt6oF1tWg4U3+aXJ3dQRmn4Q70GwhfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwA3gGHE2H2Xq+/TyolqzFB8ssQaDg9WT4wF0tgAOD7nO1fUrZRclFDQ2wXOn3BFylGtu1t9A56B2ZTf4Tt49ipem1ECw8Loq0uvp2RhH+CXAun2sVcs67hzBlh6/sb1x1+ZFzzQn4p/7YGIYHUXfkyJ2m3haRXSS/aRsTN6QbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YPgoFGGG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YPgoFGGG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-237f18108d2so178185ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jul 2025 05:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751374108; x=1751978908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GPts6df6Q4890tqHCArh7YEtzYo+b0PlaNL9e95JEQ4=;
        b=YPgoFGGGz8YqBQUQrMCpEDYCJe1L0EqIwq50aqDT6fOApqa7NKCycHFfaM73oXfZZ6
         Oo9EQbdNPCC1q+2dWgyvxm8S/tXKGEyk38XRgW6gu3w2X31d5iWG7tyCrUeowgzhPN2e
         tKA99D4xwAS9ePM8pZSjgJS0ZBhySFVQyXGraL9B3BXBpZgn6YzWyTZ7wLVH/sglgjE3
         hxh6hkYl23r/cj6cPbPlAXUQ1jgzxPb8wDw7MQ6+VL1LapdAKk/C5l8wbTHHDH9UfkJT
         5mYDehtkgCfW88QtdMtlzX0OluKqsI9+rcvLQXcOchq9a11DB/sr+k3jfvpNfdZRENGs
         h9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751374108; x=1751978908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPts6df6Q4890tqHCArh7YEtzYo+b0PlaNL9e95JEQ4=;
        b=a+xU8F5JqZROrnakrcGxUdx+DTUisLJgEQP3yxXfdsH5MK0j9BrFhJl094FYzCLWRt
         nXsXhyYYc+kwrrQUqs8yA+AojrMvlS8zlEzPB8dOVe5oKYUnGQ6SZsSwglwWVGTD5IDc
         HTPviNYRqigFzwbcaywoM2WoR92OAPsCqOtRPvAnCA6v4ABRmYY2/CGrCbM9fzWpOMag
         +4mw9VqwXo2OE/MN2R/JLG1rLcph5IXTnSPh2skN3Vphdgop8MRUpaTFoZEmoMKnreqa
         fuTIkNquffJ615fA0UAiJMK6rlQXMGQ0kHpCboC42aDp9i72gY4ybv1qZp5oOQ/vHL5n
         qddQ==
X-Forwarded-Encrypted: i=1; AJvYcCU27Y2uv9EMGp6m91FZ188J1PDR/G2IqR8ujnS81NUVEiLtqha+PrrnZwCk/lkL+LjYtudgn/rU0qmhNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzig7yR9s4VYBThKn6PVLoAtNt/0Swgv7oCFCnWQgjI3LhyEiFQ
	KZ8SrSATkw0+X8h2plVQZh9wR0iJkHhkAp3OPmM9kob8UVMkj+TPsjPPUelBxIyYIw==
X-Gm-Gg: ASbGncvshhqbhtY35bc+3+weoavBZWyB/RchkkFaPcEEJYjXLQMlbTzeD99EThhdjuI
	YlMpUylv6kL8uOrnt0A4sC9lA786p354jw1sBsnB6tkY2tIn5eB8zoEqUUBcnFJuZt+PEVbzaow
	X06L7Y2Gm/RFbva0PoAIn0I34pxdbHwCMUT1Zoc/JYDeWeyh+ynRUrkYzt9dw0RKIhn1A63qtBj
	V1J/Xt32Wi1kL2smzcstAVb+9q8VeTpRFFMw2XmpXrNgtNqmBwvRIPa5UxdJPR4QHTbx/DSGxB3
	1H0JoIaLQ6ky60/tIAgrBv0qFxINdWDk3dxVcGN8miaQ9lBm0PEVAOUJJbjAk8KHwKk2ompzwkA
	cJzOPw4hOxZkMDo1Sr3Q7
X-Google-Smtp-Source: AGHT+IE1AhXNqed/8JZKyAmcFp7SvY2x6/U4LqFKGR3TbYVNdWAQposrAbDssUYuNO2iiJxapdN4ug==
X-Received: by 2002:a17:903:2cf:b0:231:e069:6195 with SMTP id d9443c01a7336-23c6015a715mr2208215ad.23.1751374107263;
        Tue, 01 Jul 2025 05:48:27 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541e5c1sm11877926b3a.70.2025.07.01.05.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 05:48:26 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:48:17 +0000
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
Message-ID: <aGPZEbur-8d5cHz1@google.com>
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
