Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5448D2528EC
	for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 21:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963053; cv=none; b=KLWjQ9tlOl2dvVeUn4ANLGLnBMf272W+XKXJGMi+PqgJSpOOYXuVethGM4qsYQwOYshG5JN+AmwsNfsFufu87wGSZTmMbQcd4erQMctlUuyUljjdZdTMaUEhvmCxGijIzKFWyGgXy6ucAv0IEQBqDd9iF9fBUdFkAGduVkwnhnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963053; c=relaxed/simple;
	bh=woal7ohbjfSc1j5RViMLKYP0aErf7+Ky5j5wTig+x8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXLboSA2uQV4rHiqTl0eP/utjEQEPvhPkb21wxEnOC6Tyz0hDn0DBRRdmV/jnCvIKzhBb9hjn8k0LtnHf8VME1TtEEMuWRIPGq0wkllp51xm9GGHb4vajBxva1DQHDKWNoSofeE5XXd3jhwxgYi7cZA9Uz3TFMCbPrkWvS/KOeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mp3I6NFv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mp3I6NFv"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2240aad70f2so241975ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 14:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745963052; x=1746567852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EjhyY3r971ECUhfqqbl7u+2Mh/jYqDkZEBXpIERaB8I=;
        b=Mp3I6NFvj1GHlCke7taA7OWfe6YL1jqhT7E9XUCb5eir6DLzDf8PZrOaxqjg7rE3Q0
         svka9BF4rw4Nh49BEBJhhsZkBLnhuJdtHAIOOC1sjVUs1QSg5dXEPrqEOPUxdMWAHbRS
         mZDntwGDkTSa56yTLdbXXhGWezcjb/rTGXNyKfnKUiHX2aYf0AQ/xDng+Yrbwqs+Dhsh
         I9/8OLfloqF2t6t4zLXW37PDG/DXYFEgrcZNGp3N4bEmUDfDCCN1fCB6xJ7U4f8ctoNC
         3SUlDl8nMv78/kvGjQyIp+gOxkBeVxOBnWbyqWH2ghicdnXn2Xn88z+GFZCqxeSMPe5d
         61Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963052; x=1746567852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjhyY3r971ECUhfqqbl7u+2Mh/jYqDkZEBXpIERaB8I=;
        b=wMJrIBk7rDy56Hl5c+3g4lvmtWfj7JQMfCA4u3DtyAgcbJZMii3cJaFI12ZkH+OCD7
         qab+aNYnjXv4bhszBZxFihNGYBqIkA0cskcPV34U+P10OQeOjhsOo/CIyQoo+eN7xY2R
         /UQxi7J+vAoVxc9qK5qLNBTIyWMbxwM+ycMJg1N3ABUAS0j07xvv8oucOS2fj6syW20a
         26xY/GABQX4hY7vDpeIZzpmet/Uu4+90wHcR96bj+ig8aMdvOHdlo8XvLkOpNz9Y94yn
         3Z13iklGrOg4PuXXHhrIYAEodoHM0hmLuhJhW4zbPqXZOlvpPtlZSu8AjU+uLnsDN+vc
         H9oA==
X-Forwarded-Encrypted: i=1; AJvYcCW4HREdwaY16z4yRSJ76fkFP7d5dptIQFKhCj8YhcHkAOGUWKDYJdXYionTD1h3M+/+GZFE2e4VJwK5lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3MjJ08bxsaMOmjWlshAFJPJkOD3H28LEDww/ylANCZpbshdEn
	IBx1dZcPEsSoLBGL1ZZh92hHpVsl28bNp/fhN7agVM9k5U+AA055OikxO1nuSw==
X-Gm-Gg: ASbGnctLigUrxaUpbXI7rOvSP6GFSZOMSe3nXMUfY+miTYJpKG4KT5T7w4VFYk7gAYT
	2nAAem4fFZ0iyy/qa6LoGgpqpzRwL0P5Ceb/aiUd1/mmXXKRpfwC87CfBm0QkVYlphN2ydYczLN
	uUfAw2uiaBtkE2bQqrD1CVZS5XgNf2ou3oEKz7jZBNAtnuWsF7r4ojTq/N/zxntbDlM8orgnUTi
	i4u9T1rOFoqd17gf715iOGYULMguoo34b3sH3wmAz6eKlfVMsaqQPfvmmgbBqu1FUfgcoh/4bOU
	ywGZLGHi/8eC/S5n38giTyRNH17JxUd0mUh7wrvq7dnP2GVfPFMEE1AVObEvhNeL1DzbKCw8
X-Google-Smtp-Source: AGHT+IGRVChNm/D/6XmLJRuqupUIJJIIhE6A6CeVKWfGeNxHpzqOmQegP9ON+cIaJRAsz/EcrzoqDw==
X-Received: by 2002:a17:902:db12:b0:224:6c8:8d84 with SMTP id d9443c01a7336-22df3f77cffmr1031875ad.4.1745963051511;
        Tue, 29 Apr 2025 14:44:11 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5f86esm25958a91.44.2025.04.29.14.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:44:11 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:44:00 +0000
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
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 17/22] iommu/arm-smmu-v3-iommufd: Support
 implementation-defined hw_info
Message-ID: <aBFIIJPmjIOecCMj@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <56f048cdc9cd8bf1569434633d709d07a78e9430.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56f048cdc9cd8bf1569434633d709d07a78e9430.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:58:12PM -0700, Nicolin Chen wrote:
> Repurpose the @__reserved field in the struct iommu_hw_info_arm_smmuv3,
> to an HW implementation-defined field @impl.
> 
> This will be used by Tegra241 CMDQV implementation on top of a standard
> ARM SMMUv3 IOMMU. The @impl will be only valid if @flags is set with an
> implementation-defined flag.
> 
> Thus in the driver-level, add an hw_info impl op that will return such
> a flag to use the impl field.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h      |  1 +
>  include/uapi/linux/iommufd.h                     |  4 ++--
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c  | 16 +++++++++++++---
>  3 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index a5835af72417..bab7a9ce1283 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -726,6 +726,7 @@ struct arm_smmu_impl_ops {
>  		struct arm_smmu_domain *smmu_domain, struct iommufd_ctx *ictx,
>  		unsigned int viommu_type,
>  		const struct iommu_user_data *user_data);
> +	u32 (*hw_info)(struct arm_smmu_device *smmu, u32 *impl);
>  };
>  
>  /* An SMMUv3 instance */
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 06a763fda47f..b2614f0f1547 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -554,7 +554,7 @@ struct iommu_hw_info_vtd {
>   *                                   (IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
>   *
>   * @flags: Must be set to 0
> - * @__reserved: Must be 0
> + * @impl: Must be 0
>   * @idr: Implemented features for ARM SMMU Non-secure programming interface
>   * @iidr: Information about the implementation and implementer of ARM SMMU,
>   *        and architecture version supported
> @@ -585,7 +585,7 @@ struct iommu_hw_info_vtd {
>   */
>  struct iommu_hw_info_arm_smmuv3 {
>  	__u32 flags;
> -	__u32 __reserved;
> +	__u32 impl;
>  	__u32 idr[6];
>  	__u32 iidr;
>  	__u32 aidr;
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index a8a78131702d..63861c60b615 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -10,7 +10,9 @@
>  void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type)
>  {
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	struct arm_smmu_device *smmu = master->smmu;
>  	struct iommu_hw_info_arm_smmuv3 *info;
> +	u32 flags = 0, impl = 0;
>  	u32 __iomem *base_idr;
>  	unsigned int i;
>  
> @@ -18,15 +20,23 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type)
>  	if (!info)
>  		return ERR_PTR(-ENOMEM);
>  
> -	base_idr = master->smmu->base + ARM_SMMU_IDR0;
> +	base_idr = smmu->base + ARM_SMMU_IDR0;
>  	for (i = 0; i <= 5; i++)
>  		info->idr[i] = readl_relaxed(base_idr + i);
> -	info->iidr = readl_relaxed(master->smmu->base + ARM_SMMU_IIDR);
> -	info->aidr = readl_relaxed(master->smmu->base + ARM_SMMU_AIDR);
> +	info->iidr = readl_relaxed(smmu->base + ARM_SMMU_IIDR);
> +	info->aidr = readl_relaxed(smmu->base + ARM_SMMU_AIDR);
>  
>  	*length = sizeof(*info);
>  	*type = IOMMU_HW_INFO_TYPE_ARM_SMMUV3;
>  
> +	if (smmu->impl_ops && smmu->impl_ops->hw_info) {
> +		flags = smmu->impl_ops->hw_info(smmu, &impl);
> +		if (flags) {
> +			info->impl = impl;
> +			info->flags |= flags;
> +		}
> +	}
> +
>  	return info;
>  }
>  
> -- 
> 2.43.0
> 
