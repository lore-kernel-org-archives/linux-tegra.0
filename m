Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B80211484
	for <linux-tegra@vger.kernel.org>; Mon, 28 Apr 2025 21:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874132; cv=none; b=J9M8jJL0kBCQGxjWQ+rrwthCR/Pgb6sKxTq0/pUKd4CYHDTAt1+BIQaEbk92t2zzayCf36ns+PF59RjArktm5uF9I31iwUui7wAalF1V8656DDLmzjpgisJR6szK1zjv59HUvnRKptswZ0LqYhOrvInJi6rSfM6uj1DVDtRbijk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874132; c=relaxed/simple;
	bh=2ZfuLVsCa3uyg/dV83Ti5a2MISfnFj53Uosz+hvO9pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMe2Raxe2TgQFjHwTayWGDfCS+9PI2Qgqe7fG72FkRxE57XK4JhXLnks1lqbWpKIHX6RbTUENMX1LZtz2bbJDPrI36I1j05WLaNQ03gCvsRfc8Noy+k3AziGl1CRLRgrRWf2BVX7VVxknn857D1jES+/zyAHOgL7N4AqoSXtrGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lQyujIb3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lQyujIb3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2263428c8baso14185ad.1
        for <linux-tegra@vger.kernel.org>; Mon, 28 Apr 2025 14:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745874130; x=1746478930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YTPDgyBQFtwamlv7MOGnKiNXfQ7Dnv+t8g+TQ5a6GG8=;
        b=lQyujIb3M0N2fS87nJJnXN2/MRoFi2d0yYqLtIxzYHmfyDOzXMYl3IgaiOeZ6RPfPl
         xwqkDy0Wu93ESuBReZI8i7TFKgz6NBdfKLDL2cBI7MUot5IxxXJ4H/ZsrIstqM8Szmga
         PwkyiX7p8lr1NlBYML1W2EZMYSuNXoVTxyDbrR3C9fX91PSOxNF/IiPxifrqbhMUHIeO
         svXULhg40SL0CPo2RKbt6/s4jgLwuXjcDCVR22/9T8C/RZlH7sgHUA2xrrdqkofOsRoq
         1OqAVyWA2CXWcGbXFnV1a539Kq3thmrJoS7FoaahKHcycS+LZS0tBQiek1eZS82bIe8I
         7f8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874130; x=1746478930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTPDgyBQFtwamlv7MOGnKiNXfQ7Dnv+t8g+TQ5a6GG8=;
        b=nFACY+Ows5TZ6Unhs4CxVkWPFi86DYCEDnFt8V5DJCMu7b/lGfnM3nkpMCNwxNjW0l
         AO7L+YdAvz0ubfWDpyMStrCO3RAhMa12JBew0RxohpCobv0LXdTp2l6ntR/XkK/hfv37
         ofOXwg9Mz0ydT47yESweqi4f/gEZsMc+ds//5oAcLyGGO6dng6mkLLDGxShdRt8a19kh
         7ztOpdoySneUFaf91wJEwp7Txb+dYGIvfnFzE3kkodFk1Xy2maYL/0nMbpYc7IIarTHB
         IjaAN8bMuzzXUST4OGOLONvf+zHAUxO7wHFpApwqnMPo7hkXa5UVcUIiivEvVym9TfBI
         P4/g==
X-Forwarded-Encrypted: i=1; AJvYcCVNaMsg6CLqu0I6IZNRCyqq9ZgKhPju5AQokAljt+oOTgkuUVQSZN/HBPDC/lm61je5Re/Y5ZrO1dxqFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+VFAJZoU+vGbzMvswmt7HJE3QIubO0tR6KR8ronfE4tmh51U0
	PAIrqiuOAC0eh+FKo1GaZDGl4OMml+Re8asSDMF3uweSfodM/S3nRBpapsYakg==
X-Gm-Gg: ASbGncuePHjzQ0Io5Q8hTQao5Em+zEHOBI968aW1Yh2J6DqiUDFfMr+26iR1xUJu5Mb
	Vi/1mxoWntl4vrO73KgX2btcNrYA+31X8omf380rWiWULLvX/mdGlrWc55RB91iX/7DoSD+uQcZ
	/HjMpW3obZQnR0FRqQZlKnM4bV+5d9MhAW+u8YspWXOhnbPV/yJHc6n9+WbkqB6VoeJAa6EFlBP
	paEw50yICzkIV0W/Js+UHpj3HvjcQkotbDesF+QQ135NIcqwTXQM3KjF5kAAdfHkAUWGV8kCX/n
	nxFdP4PmQJulehqt6S1Z7PNAHybiXLvKj5+v2CNH+SD90esiGWMEdzJzhijZ+YrZsUcFTFSfci2
	xwKcFvvI=
X-Google-Smtp-Source: AGHT+IGSuMnWnZQ91ixDrXUdSEwCsKBdyqU3BwTCUj27r44/z7SX9aXDHYQTjWFgiPOhsJhMa9YvFg==
X-Received: by 2002:a17:903:124d:b0:223:37ec:63be with SMTP id d9443c01a7336-22de6c49626mr781305ad.4.1745874129655;
        Mon, 28 Apr 2025 14:02:09 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a3casm8778803b3a.96.2025.04.28.14.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:02:09 -0700 (PDT)
Date: Mon, 28 Apr 2025 21:01:58 +0000
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
Subject: Re: [PATCH v2 09/22] iommufd/viommu: Introduce IOMMUFD_OBJ_VCMDQ and
 its related struct
Message-ID: <aA_sxstJRbG1znKs@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <8bab0069503fa21b48298ed2ffe29a06963f71f5.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bab0069503fa21b48298ed2ffe29a06963f71f5.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:58:04PM -0700, Nicolin Chen wrote:
> Add a new IOMMUFD_OBJ_VCMDQ with an iommufd_vcmdq structure, representing
> a command queue type of physical HW passed to a user space VM. This vCMDQ
> object, is a subset of vIOMMU resources of a physical IOMMU's, such as:
>  - NVIDIA's virtual command queue
>  - AMD vIOMMU's command buffer
> 
> Inroduce a struct iommufd_vcmdq and its allocator iommufd_vcmdq_alloc().
> Also add a pair of viommu ops for iommufd to forward user space ioctls to
> IOMMU drivers.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> ---
>  include/linux/iommufd.h | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index ef0d3c4765cf..e91381aaec5a 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -37,6 +37,7 @@ enum iommufd_object_type {
>  	IOMMUFD_OBJ_VIOMMU,
>  	IOMMUFD_OBJ_VDEVICE,
>  	IOMMUFD_OBJ_VEVENTQ,
> +	IOMMUFD_OBJ_VCMDQ,
>  #ifdef CONFIG_IOMMUFD_TEST
>  	IOMMUFD_OBJ_SELFTEST,
>  #endif
> @@ -112,6 +113,14 @@ struct iommufd_vdevice {
>  	u64 id; /* per-vIOMMU virtual ID */
>  };
>  
> +struct iommufd_vcmdq {
> +	struct iommufd_object obj;
> +	struct iommufd_ctx *ictx;
> +	struct iommufd_viommu *viommu;
> +	dma_addr_t addr;
> +	size_t length;
> +};
> +
>  /**
>   * struct iommufd_viommu_ops - vIOMMU specific operations
>   * @destroy: Clean up all driver-specific parts of an iommufd_viommu. The memory
> @@ -135,6 +144,13 @@ struct iommufd_vdevice {
>   * @vdevice_destroy: Clean up all driver-specific parts of an iommufd_vdevice.
>   *                   The memory of the vDEVICE will be free-ed by iommufd core
>   *                   after calling this op
> + * @vcmdq_alloc: Allocate a @type of iommufd_vcmdq as a user space command queue
> + *               for a @viommu. @index carries the logical vcmdq ID (for a multi-
> + *               queue case); @addr carries the guest physical base address of
> + *               the queue memory; @length carries the size of the queue memory
> + * @vcmdq_destroy: Clean up all driver-specific parts of an iommufd_vcmdq. The
> + *                 memory of the iommufd_vcmdq will be free-ed by iommufd core
> + *                 after calling this op
>   */
>  struct iommufd_viommu_ops {
>  	void (*destroy)(struct iommufd_viommu *viommu);
> @@ -147,6 +163,10 @@ struct iommufd_viommu_ops {
>  						 struct device *dev,
>  						 u64 virt_id);
>  	void (*vdevice_destroy)(struct iommufd_vdevice *vdev);
> +	struct iommufd_vcmdq *(*vcmdq_alloc)(struct iommufd_viommu *viommu,
> +					     unsigned int type, u32 index,
> +					     dma_addr_t addr, size_t length);
> +	void (*vcmdq_destroy)(struct iommufd_vcmdq *vcmdq);
>  };
>  
>  #if IS_ENABLED(CONFIG_IOMMUFD)
> @@ -286,6 +306,21 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
>  		ret;                                                           \
>  	})
>  
> +#define iommufd_vcmdq_alloc(viommu, drv_struct, member)                        \
> +	({                                                                     \
> +		drv_struct *ret;                                               \
> +									       \
> +		static_assert(__same_type(struct iommufd_viommu, *viommu));    \
> +		static_assert(__same_type(struct iommufd_vcmdq,                \
> +					  ((drv_struct *)NULL)->member));      \
> +		static_assert(offsetof(drv_struct, member.obj) == 0);          \
> +		ret = (drv_struct *)_iommufd_object_alloc(                     \
> +			viommu->ictx, sizeof(drv_struct), IOMMUFD_OBJ_VCMDQ);  \
> +		if (!IS_ERR(ret))                                              \
> +			ret->member.viommu = viommu;                           \
> +		ret;                                                           \
> +	})
> +
>  /* Helper for IOMMU driver to destroy structures created by allocators above */
>  #define iommufd_struct_destroy(ictx, drv_struct, member)                       \
>  	({                                                                     \
> -- 
> 2.43.0
> 
