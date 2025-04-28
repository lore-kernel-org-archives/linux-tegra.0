Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE9820FAB3
	for <linux-tegra@vger.kernel.org>; Mon, 28 Apr 2025 21:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876061; cv=none; b=G6mdEBCZVnYPShJANup1Y/9tm4RVjym7JotZx4PfuJIlLAJsPikwm2oa6w9yYLOqnuUMQFxPSSt6DtbdgJDi6q7Lq9CbUjG5rsQlO50iRgrBYrU1vUYR5nsuXz0bUGVkBcf9nt1lVab6skl8Ph8wCDTRZ5qhdVU15k/OToJIuo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876061; c=relaxed/simple;
	bh=NhoJqartshSidWBnqA3biJF0Iyls9l8gGjN8DFMEjgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vh6UY9FnNdee0OMgxoArBsa/BFDOn5iASdUbf/gom7NYgTyqKCZe7jdsB7b3/r+SkbtWdvMihSj0KoHLfhrOhb80hCwI56Q4XjDWAiazYkw3N0PldAjpfwVMQ8RtxhAqcQ6esmrkDJJgLk7abtlIekI1BxiGu7DVBYwJwziD1vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vao2GL0e; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vao2GL0e"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2264c9d0295so3965ad.0
        for <linux-tegra@vger.kernel.org>; Mon, 28 Apr 2025 14:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745876057; x=1746480857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsfJi5GV4gNJPXGtyMAi/qAe8sWnYVRwN1YewUo6rSc=;
        b=Vao2GL0eAqh6o3IilW9VNv7k7EWrikBA9VfzG7aQXUdpo/91eG6DpGBpx6rb6LlPIs
         321UHrOddkkBMLbpqF3SnoGOVQEhSGsOya9kZD8YXZ/QW4RrX0ltwLregoKz4ToNezFZ
         1u/xGqNqYtm+P0DCh64pnQyFJCRk+4VCl5YVnW9oYf9zXBNsQZ+OHG9dYF5LwJL+WUvm
         4qkwCK14ngxJUMIE0UVMcpTXTmpXcTpO5Ljij0arUMepkGtyTHrvP7ciGnhU/x76Vgj1
         IIlj34JCUn7kI0BPU45JJVwKFQKYs+GUkOpBtWMe58bBmkYZnw5MahCb9r2rmuTcNy9T
         jAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745876057; x=1746480857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsfJi5GV4gNJPXGtyMAi/qAe8sWnYVRwN1YewUo6rSc=;
        b=JtNIgFvyBhdaNpho5fLzNu9fOcshpA2sx+Pg1ZBFOnnkgmlJCgizDmo+Frza+Hz68b
         F4O60nog5OaOXhSActgejdDQQNvk9o2O7nEktFWTrLI4Ie0CcLOnD69BaOTO7Q0QJukG
         EJmh/txlbVM3BZTl8foYeuznQ1ai8wdMQw7XxY1/sIWZy1xsYTQeYX7cMih36Vw/ChBS
         4eqrFRKEZkG2Tuw1yL2+O0jbeePkxW6vHJlPcZpvhWz4upxeqdX0klcQoariEqY8oQQp
         XJSXqcFwTYlewzgruxWWbPH7hdT1D8J2PX8grR17se4FMD9FG1FA5AYVkfV4AWm49Hi+
         chuA==
X-Forwarded-Encrypted: i=1; AJvYcCW6+mGiJRHBU6u8xFmu+4yjIZ5A2L1G+AdA8TilbYjLFFOeACGLN9xYEKW9g/DPoD5KwofslYfxkojocA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOOeY46BmcNPkFXXv/FG6v9a/XgvrCx5cB7SbiBb1knMG9r1Es
	QR+jgE9Zxw2cQdEJfpmniqUoGgNfLL2+AMH68kJF/OFxUNjUOqVHed9xZylMxQ==
X-Gm-Gg: ASbGncth1YM48MGKaBio2EsWMnfeZ2pGUoGmmJwcTjKxPKMCeokWEQ2APh1d6nFYn6q
	VAkLYGFAdrkEIlJ2cXg6fBbAGJs0rC81uk42DoZ+r2hBvCleVmk+6PRzwgd5D+lHDQXqnTqaELX
	ilP9LgW1OGj6kI/Vn+NqkHlwtil2btat2EimH4zlw26i6Dnc2vjsrM0hE3euXdfgkY6VJiX7J4q
	Cz+xhomXWI6/m1D9rbfuY1aiPEWhU4ods6dRa0xR3YDoHlh0u4CK7Ubcn7HPa9J7R22OmoJ5Gis
	MGydViuj5//tzHqoyvcYctWi8QsNeoiQvcMKNig2mitcS5Rvw4wSDeJdlQFIEMkJTE52fgMq
X-Google-Smtp-Source: AGHT+IE+KaoUm6FAcva/asMGpdAdvSvxi6I/nzVOjZdBDcnh+kzvq6u61j/01qvHClHVKIVW/FIR3A==
X-Received: by 2002:a17:903:124d:b0:223:37ec:63be with SMTP id d9443c01a7336-22de6c49626mr880365ad.4.1745876056773;
        Mon, 28 Apr 2025 14:34:16 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e75fdsm88595955ad.120.2025.04.28.14.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:34:16 -0700 (PDT)
Date: Mon, 28 Apr 2025 21:34:05 +0000
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
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
Message-ID: <aA_0TV0RkVOHk7Qj@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:58:05PM -0700, Nicolin Chen wrote:
> Introduce a new IOMMUFD_CMD_VCMDQ_ALLOC ioctl for user space to allocate
> a vCMDQ for a vIOMMU object. Simply increase the refcount of the vIOMMU.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h |  2 +
>  include/uapi/linux/iommufd.h            | 41 +++++++++++
>  drivers/iommu/iommufd/main.c            |  6 ++
>  drivers/iommu/iommufd/viommu.c          | 94 +++++++++++++++++++++++++
>  4 files changed, 143 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 79160b039bc7..b974c207ae8a 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -611,6 +611,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd);
>  void iommufd_viommu_destroy(struct iommufd_object *obj);
>  int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd);
>  void iommufd_vdevice_destroy(struct iommufd_object *obj);
> +int iommufd_vcmdq_alloc_ioctl(struct iommufd_ucmd *ucmd);
> +void iommufd_vcmdq_destroy(struct iommufd_object *obj);
>  
>  #ifdef CONFIG_IOMMUFD_TEST
>  int iommufd_test(struct iommufd_ucmd *ucmd);
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index cc90299a08d9..06a763fda47f 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -56,6 +56,7 @@ enum {
>  	IOMMUFD_CMD_VDEVICE_ALLOC = 0x91,
>  	IOMMUFD_CMD_IOAS_CHANGE_PROCESS = 0x92,
>  	IOMMUFD_CMD_VEVENTQ_ALLOC = 0x93,
> +	IOMMUFD_CMD_VCMDQ_ALLOC = 0x94,
>  };
>  
>  /**
> @@ -1147,4 +1148,44 @@ struct iommu_veventq_alloc {
>  	__u32 __reserved;
>  };
>  #define IOMMU_VEVENTQ_ALLOC _IO(IOMMUFD_TYPE, IOMMUFD_CMD_VEVENTQ_ALLOC)
> +
> +/**
> + * enum iommu_vcmdq_type - Virtual Command Queue Type
> + * @IOMMU_VCMDQ_TYPE_DEFAULT: Reserved for future use
> + */
> +enum iommu_vcmdq_type {
> +	IOMMU_VCMDQ_TYPE_DEFAULT = 0,
> +};
> +
> +/**
> + * struct iommu_vcmdq_alloc - ioctl(IOMMU_VCMDQ_ALLOC)
> + * @size: sizeof(struct iommu_vcmdq_alloc)
> + * @flags: Must be 0
> + * @viommu_id: Virtual IOMMU ID to associate the virtual command queue with
> + * @type: One of enum iommu_vcmdq_type
> + * @index: The logical index to the virtual command queue per virtual IOMMU, for
> + *         a multi-queue model
> + * @out_vcmdq_id: The ID of the new virtual command queue
> + * @addr: Base address of the queue memory in the guest physical address space
> + * @length: Length of the queue memory in the guest physical address space
> + *
> + * Allocate a virtual command queue object for a vIOMMU-specific HW-accelerated
> + * feature that can access a guest queue memory described by @addr and @length.
> + * It's suggested for VMM to back the queue memory using a single huge page with
> + * a proper alignment for its contiguity in the host physical address space. The
> + * call will fail, if the queue memory is not contiguous in the physical address
> + * space. Upon success, its underlying physical pages will be pinned to prevent
> + * VMM from unmapping them in the IOAS, until the virtual CMDQ gets destroyed.
> + */
> +struct iommu_vcmdq_alloc {
> +	__u32 size;
> +	__u32 flags;
> +	__u32 viommu_id;
> +	__u32 type;
> +	__u32 index;
> +	__u32 out_vcmdq_id;
> +	__aligned_u64 addr;
> +	__aligned_u64 length;
> +};
> +#define IOMMU_VCMDQ_ALLOC _IO(IOMMUFD_TYPE, IOMMUFD_CMD_VCMDQ_ALLOC)
>  #endif
> diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
> index 2b9ee9b4a424..ac51d5cfaa61 100644
> --- a/drivers/iommu/iommufd/main.c
> +++ b/drivers/iommu/iommufd/main.c
> @@ -303,6 +303,7 @@ union ucmd_buffer {
>  	struct iommu_ioas_map map;
>  	struct iommu_ioas_unmap unmap;
>  	struct iommu_option option;
> +	struct iommu_vcmdq_alloc vcmdq;
>  	struct iommu_vdevice_alloc vdev;
>  	struct iommu_veventq_alloc veventq;
>  	struct iommu_vfio_ioas vfio_ioas;
> @@ -358,6 +359,8 @@ static const struct iommufd_ioctl_op iommufd_ioctl_ops[] = {
>  	IOCTL_OP(IOMMU_IOAS_UNMAP, iommufd_ioas_unmap, struct iommu_ioas_unmap,
>  		 length),
>  	IOCTL_OP(IOMMU_OPTION, iommufd_option, struct iommu_option, val64),
> +	IOCTL_OP(IOMMU_VCMDQ_ALLOC, iommufd_vcmdq_alloc_ioctl,
> +		 struct iommu_vcmdq_alloc, length),
>  	IOCTL_OP(IOMMU_VDEVICE_ALLOC, iommufd_vdevice_alloc_ioctl,
>  		 struct iommu_vdevice_alloc, virt_id),
>  	IOCTL_OP(IOMMU_VEVENTQ_ALLOC, iommufd_veventq_alloc,
> @@ -501,6 +504,9 @@ static const struct iommufd_object_ops iommufd_object_ops[] = {
>  	[IOMMUFD_OBJ_IOAS] = {
>  		.destroy = iommufd_ioas_destroy,
>  	},
> +	[IOMMUFD_OBJ_VCMDQ] = {
> +		.destroy = iommufd_vcmdq_destroy,
> +	},
>  	[IOMMUFD_OBJ_VDEVICE] = {
>  		.destroy = iommufd_vdevice_destroy,
>  	},

When do we expect the VMM to use this ioctl? While it's spawning a new
VM? IIUC, one vintf can have multiple lvcmdqs and looking at the series
it looks like the vcmdq_alloc allocates a single lvcmdq. Is the plan to
dedicate one lvcmdq to per VM? Which means VMs can share a vintf?
Or do we plan to trap access to trap the access everytime the VM
accesses an lvcmdq base register?

> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index a65153458a26..02a111710ffe 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -170,3 +170,97 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  	iommufd_put_object(ucmd->ictx, &viommu->obj);
>  	return rc;
>  }
> +
> +void iommufd_vcmdq_destroy(struct iommufd_object *obj)
> +{
> +	struct iommufd_vcmdq *vcmdq =
> +		container_of(obj, struct iommufd_vcmdq, obj);
> +	struct iommufd_viommu *viommu = vcmdq->viommu;
> +
> +	if (viommu->ops->vcmdq_destroy)
> +		viommu->ops->vcmdq_destroy(vcmdq);
> +	iopt_unpin_pages(&viommu->hwpt->ioas->iopt, vcmdq->addr, vcmdq->length);
> +	refcount_dec(&viommu->obj.users);
> +}
> +
> +int iommufd_vcmdq_alloc_ioctl(struct iommufd_ucmd *ucmd)
> +{
> +	struct iommu_vcmdq_alloc *cmd = ucmd->cmd;
> +	struct iommufd_viommu *viommu;
> +	struct iommufd_vcmdq *vcmdq;
> +	struct page **pages;
> +	int max_npages, i;
> +	dma_addr_t end;
> +	int rc;
> +
> +	if (cmd->flags || cmd->type == IOMMU_VCMDQ_TYPE_DEFAULT)
> +		return -EOPNOTSUPP;

The cmd->type check is a little confusing here, I think we could
re-order the series and add this check when we have the CMDQV type.
Alternatively, we could keep this in place and add the driver-specific
vcmdq_alloc op calls when it's added/available for Tegra CMDQV while
stubbing out the rest of this function accordingly.

> +	if (!cmd->addr || !cmd->length)
> +		return -EINVAL;
> +	if (check_add_overflow(cmd->addr, cmd->length - 1, &end))
> +		return -EOVERFLOW;
> +
> +	max_npages = DIV_ROUND_UP(cmd->length, PAGE_SIZE);
> +	pages = kcalloc(max_npages, sizeof(*pages), GFP_KERNEL);
> +	if (!pages)
> +		return -ENOMEM;
> +
> +	viommu = iommufd_get_viommu(ucmd, cmd->viommu_id);
> +	if (IS_ERR(viommu)) {
> +		rc = PTR_ERR(viommu);
> +		goto out_free;
> +	}
> +
> +	if (!viommu->ops || !viommu->ops->vcmdq_alloc) {
> +		rc = -EOPNOTSUPP;
> +		goto out_put_viommu;
> +	}
> +
> +	/* Quick test on the base address */
> +	if (!iommu_iova_to_phys(viommu->hwpt->common.domain, cmd->addr)) {
> +		rc = -ENXIO;
> +		goto out_put_viommu;
> +	}
> +
> +	/* The underlying physical pages must be pinned in the IOAS */
> +	rc = iopt_pin_pages(&viommu->hwpt->ioas->iopt, cmd->addr, cmd->length,
> +			    pages, 0);
> +	if (rc)
> +		goto out_put_viommu;
> +
> +	/* Validate if the underlying physical pages are contiguous */
> +	for (i = 1; i < max_npages && pages[i]; i++) {
> +		if (page_to_pfn(pages[i]) == page_to_pfn(pages[i - 1]) + 1)
> +			continue;
> +		rc = -EFAULT;
> +		goto out_unpin;
> +	}
> +
> +	vcmdq = viommu->ops->vcmdq_alloc(viommu, cmd->type, cmd->index,
> +					 cmd->addr, cmd->length);
> +	if (IS_ERR(vcmdq)) {
> +		rc = PTR_ERR(vcmdq);
> +		goto out_unpin;
> +	}
> +
> +	vcmdq->viommu = viommu;
> +	refcount_inc(&viommu->obj.users);
> +	vcmdq->addr = cmd->addr;
> +	vcmdq->ictx = ucmd->ictx;
> +	vcmdq->length = cmd->length;
> +	cmd->out_vcmdq_id = vcmdq->obj.id;
> +	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
> +	if (rc)
> +		iommufd_object_abort_and_destroy(ucmd->ictx, &vcmdq->obj);
> +	else
> +		iommufd_object_finalize(ucmd->ictx, &vcmdq->obj);
> +	goto out_put_viommu;
> +
> +out_unpin:
> +	iopt_unpin_pages(&viommu->hwpt->ioas->iopt, cmd->addr, cmd->length);
> +out_put_viommu:
> +	iommufd_put_object(ucmd->ictx, &viommu->obj);
> +out_free:
> +	kfree(pages);
> +	return rc;
> +}
> -- 
> 2.43.0
> 
