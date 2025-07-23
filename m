Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C61815530C
	for <linux-tegra@vger.kernel.org>; Wed, 23 Jul 2025 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277881; cv=none; b=PcCsSDXxTyH4YnvQ+1rH9KslFsX3XLRjIm2UChjDmYFOhPc/XJjb7f3/CeIj1KGg2RtmIxy1lk28nVBPWhanWbvfLvFC4nZ9wfXMBgu0j2u+nS2+Dho6IRk4WS6RJLVVu0xvJ5fv7iUsPY+QDYxOJxm9Z1IYrLRJxggzRU+x3+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277881; c=relaxed/simple;
	bh=loj95alexQ30u6RYGhFIYnYsaA5hCj9ehW16PyQpKvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+rrHY4Fb1xIfjhtIk5rgt6jE5B8/1dX2SM4rOzKYjL+vJ4uYcS1SBpoQJKlSzaneZOx+xxCui1ZZDsSgISP//N39NHxFlI1WVmVU8zqlXzJOYUtQHGnB9UfdIhCnNi9r77XF26RHL4iSJDDM2xBx4bcbDG8MvKTy7++dlS1dUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JdGk9JPI; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JdGk9JPI"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2357c61cda7so117055ad.1
        for <linux-tegra@vger.kernel.org>; Wed, 23 Jul 2025 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753277879; x=1753882679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m+JLK8o3lT0td/MYczWJEZnb2L8d00AyuRGacnswf14=;
        b=JdGk9JPI8X4t66bEVRyd90KaD6AvgRS2ajscRpw0gn84aBeIcLgVNDHJOuHuEvNCdh
         ymv9soxA9fVMMK/Lna7aPTK8R+KjSz6sg55UGFbvqdjM51Q0JLfzdr0RMfke7dXmH3iy
         5rnOHdwh6NVnW7jmkNYfxZdj2fr2zgvVIbyuNxk0vTGU2M2+EUAUTsRi/UlwUvxdD8m6
         On3Q0VtiekwK17M2oTwxGXB+mR6pIEjXZJhe/qsdvYBpVMGC0rHfy+n/hm81b3XYgqBt
         emIFcb/P11lbkctNscVFaQsh7kjjaLHSkXiAJwlVWLHAwW4SC97VdQPN3AU1WVfWMudr
         HvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277879; x=1753882679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+JLK8o3lT0td/MYczWJEZnb2L8d00AyuRGacnswf14=;
        b=qnFlps0VG+vgjkW0msbMv41TO1qMGbKCvr4OXmHkrT0th6fou8VL6by9hrE/pCLN0J
         XMoqej8zHPPolYyowtInSEeq9z0FiLsOFdDacoQh41reAsjtY1y5cDyANIs4HqCEfKF0
         cKcuE3Lqy2xtBtE1i6+O29H5hs77BsoQ6o6IH1EFte/pB/ut5MvbGEVOUweOT+9jrL+1
         fIbLzP7CnHeYdY2yJSBI6dxH5V/7PR9WsdjMzQtahTSibXhCk26xz7cQHhn3ePbhQKMi
         aiKcbliAaln+10bGS/NTyoc23l5OQa7t0HyRI4V/VqtdUOd3Gf5Nh5Tx8YVqSpzT2mEG
         D5jA==
X-Forwarded-Encrypted: i=1; AJvYcCV9OuhFBcHpXLc0Cp7aTGnRr51BTEbBzkHqoAeBuJdJSXuUG9zEqDZRW3SUL4PwqP9lbtCwFyiwd+qrog==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxsxB01JDYfTjo4Oa3+f3MXwCGx6mE4e99t8xdWmQ/H24HYwuE
	SxaV6xP8hhr/nUuNQ5Wv4A276J5X/4lxWVizOISZbZwVY1pzA8dKWZbqsEOQCGotlQ==
X-Gm-Gg: ASbGncts0Q8ZkG19ktgICw3MEi723hzyqa82jUTZV9gMiQXlDGT3/2n20p/oTwN809b
	yA+mzNEtfAqHK18hI5x0klP8d0z3xQYhzfPYXl4n/tBx0tILDIzwdRFaAh5jUX08wrjNkUBE2vK
	GcIlxEV/eQfu3yGjhhSiwslj6m8fn0I15EK20auzWuI4ULwWGa1YNwYMRAFnGLjlmBX9isjqw5p
	dvSrSoR+NbTaI9k8wFcEkmABXPTZdPl4v2KSz4Y5Ih9uWUz12Age4xoWWKLm1vYHptTM3lZ1QnT
	EyOWJQNrUF01gMEVxB/DCsgZc9mhK5yzyW8KbaxHe1Je3+IApucbDn5esqKKbI9AS7tXKmbXTkd
	R9Rl4/XYDQEzMN/2bodJjVhEZzZxuh/kKq98mZZLmgGRYDwywGEbFUhI/0epeDdscKig=
X-Google-Smtp-Source: AGHT+IHNDySI/nH+OMkMv0ChQEdtb4UFgDV0ZT5tuGjSaRubSm3kOT/oocHqF0dfxqVXTEfR3wYujw==
X-Received: by 2002:a17:903:15c3:b0:234:13ad:7f9f with SMTP id d9443c01a7336-23f978e398cmr3323895ad.22.1753277878789;
        Wed, 23 Jul 2025 06:37:58 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23f75d13bdfsm77086475ad.51.2025.07.23.06.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:37:58 -0700 (PDT)
Date: Wed, 23 Jul 2025 13:37:53 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIDlsUvF2Xbdelvx@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721200444.1740461-3-nicolinc@nvidia.com>

On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> It's more flexible to have a get_viommu_size op. Replace static vsmmu_size
> and vsmmu_type with that.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Acked-by: Will Deacon <will@kernel.org>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c    |  8 ++------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c        |  4 ++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h        |  3 +--
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c     | 14 ++++++++++++--
>  4 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index c034d6c5468f..8cd8929bbfdf 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -423,10 +423,9 @@ size_t arm_smmu_get_viommu_size(struct device *dev,
>  	if (viommu_type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
>  		return VIOMMU_STRUCT_SIZE(struct arm_vsmmu, core);
>  
> -	if (!smmu->impl_ops || !smmu->impl_ops->vsmmu_size ||
> -	    viommu_type != smmu->impl_ops->vsmmu_type)
> +	if (!smmu->impl_ops || !smmu->impl_ops->get_viommu_size)
>  		return 0;
> -	return smmu->impl_ops->vsmmu_size;
> +	return smmu->impl_ops->get_viommu_size(viommu_type);
>  }
>  
>  int arm_vsmmu_init(struct iommufd_viommu *viommu,
> @@ -451,9 +450,6 @@ int arm_vsmmu_init(struct iommufd_viommu *viommu,
>  		return 0;
>  	}
>  
> -	/* Unsupported type was rejected in arm_smmu_get_viommu_size() */
> -	if (WARN_ON(viommu->type != smmu->impl_ops->vsmmu_type))
> -		return -EOPNOTSUPP;
>  	return smmu->impl_ops->vsmmu_init(vsmmu, user_data);
>  }
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 9f4ad3705801..f56113107c8a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4716,8 +4716,8 @@ static struct arm_smmu_device *arm_smmu_impl_probe(struct arm_smmu_device *smmu)
>  
>  	ops = new_smmu->impl_ops;
>  	if (ops) {
> -		/* vsmmu_size and vsmmu_init ops must be paired */
> -		if (WARN_ON(!ops->vsmmu_size != !ops->vsmmu_init)) {
> +		/* get_viommu_size and vsmmu_init ops must be paired */
> +		if (WARN_ON(!ops->get_viommu_size != !ops->vsmmu_init)) {
>  			ret = -EINVAL;
>  			goto err_remove;
>  		}
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 3fa02c51df9f..e332f5ba2f8a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -728,8 +728,7 @@ struct arm_smmu_impl_ops {
>  	 */
>  	void *(*hw_info)(struct arm_smmu_device *smmu, u32 *length,
>  			 enum iommu_hw_info_type *type);
> -	const size_t vsmmu_size;
> -	const enum iommu_viommu_type vsmmu_type;
> +	size_t (*get_viommu_size)(enum iommu_viommu_type viommu_type);
>  	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
>  			  const struct iommu_user_data *user_data);
>  };
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index 4c86eacd36b1..46005ed52bc2 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -832,6 +832,13 @@ static void *tegra241_cmdqv_hw_info(struct arm_smmu_device *smmu, u32 *length,
>  	return info;
>  }
>  
> +static size_t tegra241_cmdqv_get_vintf_size(enum iommu_viommu_type viommu_type)
> +{
> +	if (viommu_type != IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV)
> +		return 0;
> +	return VIOMMU_STRUCT_SIZE(struct tegra241_vintf, vsmmu.core);
> +}
> +
>  static struct arm_smmu_impl_ops tegra241_cmdqv_impl_ops = {
>  	/* For in-kernel use */
>  	.get_secondary_cmdq = tegra241_cmdqv_get_cmdq,
> @@ -839,8 +846,7 @@ static struct arm_smmu_impl_ops tegra241_cmdqv_impl_ops = {
>  	.device_remove = tegra241_cmdqv_remove,
>  	/* For user-space use */
>  	.hw_info = tegra241_cmdqv_hw_info,
> -	.vsmmu_size = VIOMMU_STRUCT_SIZE(struct tegra241_vintf, vsmmu.core),
> -	.vsmmu_type = IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV,
> +	.get_viommu_size = tegra241_cmdqv_get_vintf_size,
>  	.vsmmu_init = tegra241_cmdqv_init_vintf_user,
>  };
>  
> @@ -1273,6 +1279,10 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
>  	phys_addr_t page0_base;
>  	int ret;
>  
> +	/* Unsupported type was rejected in tegra241_cmdqv_get_vintf_size() */
> +	if (WARN_ON(vsmmu->core.type != IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV))
> +		return -EOPNOTSUPP;
> +

Nit: I don't think we'd expect a call to this if the vintf_size returned
0? I see that in iommufd_viommu_alloc_ioctl, we already have a check:


        viommu_size = ops->get_viommu_size(idev->dev, cmd->type);
	        if (!viommu_size) {
			rc = -EOPNOTSUPP;
			goto out_put_idev;
		}

And call ops->viommu_init only when the above isn't met. Thus,
if we still end up calling ops->viommu_init, shouldn't we BUG_ON() it?
I'd rather have the core code handle such things (since the driver is
simply implementing the ops) and BUG_ON() something that's terribly
wrong..

I can't see any ops->viommu_init being called elsewhere atm, let me
know if there's a different path that I missed..

Apart from the above nit,

Reviewed-by: Pranjal Shrivastava <praan@google.com>

>  	if (!user_data)
>  		return -EINVAL;
>  
> -- 
> 2.43.0
> 
> 
