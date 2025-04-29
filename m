Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3224325E47D
	for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 21:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745962584; cv=none; b=W339sm+oN8qXEhoRKeD4ipRWMCHrkmi0FnQT5c7mnbeVPfL6z4dxO7Lo4F1y0GME1bnlxY9N4ezKwY/VDyxbOY1jzTfoZW1pmsng6mbV7S+OTzOgfJJV5AUHDc6YriBoYaWx4NS4cJR4N37x2KBPbHj72VzklNDe3l34kA9+6Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745962584; c=relaxed/simple;
	bh=pjG0WRYPmuFXgp5l4sOIxBPQ0JCTtzB9fn/bSzP4aws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMMQqo5qYVpayJACK0CtIjZiGXVof0Junf63bS5oWYPeKWKmgkOeUx4dyywagSIQJ3SV5iHVf98kNJvCfOV8EIC24uFflozulSbGQOBnG+vP0/a8fgG7wWWtRLoju8AAJUEdBGNs+MVoJqBfhSDTPulyMTw0nOeYesUel+Wx9JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h3WWJR3K; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h3WWJR3K"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2263428c8baso80925ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 14:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745962580; x=1746567380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFHhD4L18F4DbheB1ANr+oLMK0ky8CpJtw12v2WCTVo=;
        b=h3WWJR3KHXoQt4F4HvEAoj3cZePfCxVWD/1YrVTrrUx/6XLQ9Mj7T3CWXVaterMCIj
         o+f91xIgBixGEZC0C2r87PY8UA+jmJlZQW3xeRXM4TO5H96RLlP53C4ymC5tcnVJx/AK
         Z0YLKoHsCSfPw9vVkrM4v6TAQJSZDfAFSVOdTCNJiHJh8DJhbsmVYktXfPSzQ8FJKXeq
         tKglu6tzlyfieyouUrDXeUN5vwvw9kMuDkkesc4LD236DRTL2VF6s//yFAI5aWU69dj5
         cV6eg5KvtCKcF2F0k0dsiYHjKNMCS94HgphR5j7jqp7SYEBtP34vX5T0QrO13H9lZ4Ja
         6scQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745962580; x=1746567380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFHhD4L18F4DbheB1ANr+oLMK0ky8CpJtw12v2WCTVo=;
        b=VMMKYguHKGWTZ4MyOubG+lfm66zJ65YJERWlRh19U4Vi0stE2nyAKxT7+KkvOxx7Vz
         ssC7x6HrzqDCHsv9ErtKb48vULJCsBN9w6gjkf2NSR1aKbWHdoTUMwfclT5RboEeF1Lk
         +LbUCSVX0+P8g9tZW0GHZGHU4F9e/tT7OGqgmvFKKmHQKH35+suna795DyqpdTqvBiDM
         S6CrX7bSjg3NOcPHrTLVgGlvhLifmTl6rbOL6Jny7wC37kcd60IkkP4Md0imm4skY/O3
         rQfpiTB+v1IT/IpD6zDM3zzrKWWAgEtbWg+gny3syXSh3sgj2PHPk9/CrpSsJEr1uK7u
         e4iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSrCEBWBZvesGVw1zhK5UbCJHaeW7BhTDbOuLvvEabY8J8D10x50EFACIpULygZ0/D42QqAdJNbTlexQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLZ3rQbpfPcmtwpY9LbRuQl/F8ExxtIcKO44MF2SBKXrRafr2J
	+EVSUleu+o3bBkA82Q/6CFTW6nWrH3eUZdTCYnJ8GVBde6lg0tTXb81xskyCkA==
X-Gm-Gg: ASbGncvN3hkXWsL2qzzS+I07snpfGIrAJC7SjNDDZ80ua6GXgqpNu6g7Z2diDAm4NRW
	n03SnkLBkn08KPMLhie3NGVBGuxQQ3+ltwZtXMzXiaBqQSW1YQyPz48tNRzUsSMsHtL2cRKRdID
	isM+JjWry+onOhmXSIklhyn24lcPhEYgAHfDVDLMwFMmU7heYfnMhoitkfNm6BbST1DCK06flhc
	jEg4275q0HJRmufqkXUE+4SB3GdcXUf848GYQ3plGQeFaICECZ8RViLz3/cobD/2UXT+cvCuwGV
	6z7tPXhwup+wb3lXYZO9J62o7PXIORVNUB7K8IfT17wEiA79/6SMr6uWjFGWjzL6CckGvAi9
X-Google-Smtp-Source: AGHT+IHMqNgjircjCmAkmKl5VbBskPIbU47nTYxADS2hK6tD9L6Ge4YAR4USLtbPpDWqfiuVVAQ0lQ==
X-Received: by 2002:a17:903:144f:b0:21f:3f5c:d24c with SMTP id d9443c01a7336-22df3dda537mr1044155ad.0.1745962580224;
        Tue, 29 Apr 2025 14:36:20 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76d34sm108297185ad.39.2025.04.29.14.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:36:19 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:36:09 +0000
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
Subject: Re: [PATCH v2 16/22] iommu/arm-smmu-v3-iommufd: Add vsmmu_alloc impl
 op
Message-ID: <aBFGSRGcIsCDU1Zj@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <73b1fc34b07f2ac42d542dd996c7119ae5f8939c.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73b1fc34b07f2ac42d542dd996c7119ae5f8939c.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:58:11PM -0700, Nicolin Chen wrote:
> An impl driver might support its own vIOMMU object, as tegra241-cmdqv will
> add IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV.
> 
> Add a vsmmu_alloc op to give impl a try, upon failure fallback to standard
> vsmmu allocation for IOMMU_VIOMMU_TYPE_ARM_SMMUV3.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewd-by: Pranjal Shrivastava <praan@google.com>

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     |  6 ++++++
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 17 +++++++++++------
>  2 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 6b8f0d20dac3..a5835af72417 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -16,6 +16,7 @@
>  #include <linux/sizes.h>
>  
>  struct arm_smmu_device;
> +struct arm_smmu_domain;
>  
>  /* MMIO registers */
>  #define ARM_SMMU_IDR0			0x0
> @@ -720,6 +721,11 @@ struct arm_smmu_impl_ops {
>  	int (*init_structures)(struct arm_smmu_device *smmu);
>  	struct arm_smmu_cmdq *(*get_secondary_cmdq)(
>  		struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> +	struct arm_vsmmu *(*vsmmu_alloc)(
> +		struct arm_smmu_device *smmu,
> +		struct arm_smmu_domain *smmu_domain, struct iommufd_ctx *ictx,
> +		unsigned int viommu_type,
> +		const struct iommu_user_data *user_data);
>  };
>  
>  /* An SMMUv3 instance */
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 66855cae775e..a8a78131702d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -392,10 +392,7 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
>  		iommu_get_iommu_dev(dev, struct arm_smmu_device, iommu);
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
>  	struct arm_smmu_domain *s2_parent = to_smmu_domain(parent);
> -	struct arm_vsmmu *vsmmu;
> -
> -	if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> -		return ERR_PTR(-EOPNOTSUPP);
> +	struct arm_vsmmu *vsmmu = ERR_PTR(-EOPNOTSUPP);
>  
>  	if (!(smmu->features & ARM_SMMU_FEAT_NESTING))
>  		return ERR_PTR(-EOPNOTSUPP);
> @@ -423,8 +420,16 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
>  	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> -	vsmmu = iommufd_viommu_alloc(ictx, struct arm_vsmmu, core,
> -				     &arm_vsmmu_ops);
> +	if (master->smmu->impl_ops && master->smmu->impl_ops->vsmmu_alloc)
> +		vsmmu = master->smmu->impl_ops->vsmmu_alloc(
> +			master->smmu, s2_parent, ictx, viommu_type, user_data);
> +	if (PTR_ERR(vsmmu) == -EOPNOTSUPP) {
> +		if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> +			return ERR_PTR(-EOPNOTSUPP);
> +		/* Fallback to standard SMMUv3 type if viommu_type matches */
> +		vsmmu = iommufd_viommu_alloc(ictx, struct arm_vsmmu, core,
> +					     &arm_vsmmu_ops);
> +	}
>  	if (IS_ERR(vsmmu))
>  		return ERR_CAST(vsmmu);
>  
> -- 
> 2.43.0
> 
