Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46E427CB06
	for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915295; cv=none; b=PBTo1W9A3XJnHTbBskCkOExvlnTQozv3KoJx7pLQaE6agLkwaO9z9NSp48QoPf2g3SzQQuoaI0jTrELFHEudKSvrwQnZMId/8idU7iOcIbPt5/wNDnzmsAtaApwyvBHEgb84S0tZBu3EyowZfR2KVc6dbFlyIEKC8ESUZcCD6zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915295; c=relaxed/simple;
	bh=1FsywMQHT6aCTH/4QijjV+e4uu/3MJPm0YGRHU38ci8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0GrN0abyCfKL1krBJBMK1L+AeCfNNAN1fuCeEw4F8Lwe3jZFugj7BqOeg7W7uFC17SeqbiEwHeou13mYH0Pe8e+nZ4lOT9JedR3waYa6uod7G2jKSJypcRkFOHAPxEXeg7iie9zZCN6YsiTetLoHhU1u5rlvkzjZ+1gGjJFvQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XiJ8FYkW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XiJ8FYkW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2242ac37caeso52575ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 01:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745915293; x=1746520093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D5QKxnLZKN15CjETYE0cz5F8y62z+3Lyd2c2OfhrGOQ=;
        b=XiJ8FYkWjiPglKhfyBJ5prckcaI3Oa4QLpYgaC039SrK9qp9Jr9TccEMyia82CHt70
         a5xfZ/lh3c3l40eIxHIBkOstUioBe4oGiLrevvU7ZQPk2UVr6cijRKI12swS64jjhI9e
         I0GEFmeoIeUYsf0udTcxkW7/y4CdTTsmibDzvBeHuvn5hPTUdcOoa87zNc5YxD68Nmno
         gybrcdpv7WjLxOYMP3LWlP/8et6GfwsEF8BLmhflDrJT6FUSEazYPCUfX5SU3QtLf4H3
         oAoivNXqrEmsr/EOOqCSsg6G8HZ8aNnFAiTE+pWPzGOZUg+WvhCn44r2lvHJRqeYNxb/
         bhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915293; x=1746520093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5QKxnLZKN15CjETYE0cz5F8y62z+3Lyd2c2OfhrGOQ=;
        b=DNNfoUXUhRSLxYiEnlhP2iS7e/pDIRLkFW8QIvkcAY5AQb50z7Q1IwQZKrJdSUEvaQ
         nNYldbrACV6/ILpUe3gqgvlfGJxTOimmNtlM3zWGbPy9/wxNcPqbTFGfcTxSEFk8nDCc
         ZTN4fZJtcw8DnMWBW9a9GPm0018xObmDAlTe0vXlqyQ4/LTR7jiWk5Dom/BPlIcFbz+B
         qYIu5n+qr16bGmg3EDCNYAJr2AltNJcz+oo5YMNG4gX0/Wqnowa1N0cuVuZeZB1P6aT0
         RLryauZ3DvAf8UEOqbaZcEDcpquuxQSRot0CTQsLDw4mBP9oQDsdeXHVlgWjjGzK+O8J
         S8mg==
X-Forwarded-Encrypted: i=1; AJvYcCX43Aha4WHPV2VLFxnYOHqvxTX8HWbfBEpZNBdUX+sw6bEaUTmKUAVkXkcXovffs16AgHnf1zIT4DZWzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkt+sRrqbX855qyJb5EX/GrxWSAhEXw4tfupOMFzcJe2dMeyMW
	ZVjCmGJg1sMqOq9djhf7cPqLT0ifZbYOpWSax7X6g3AvPhAXzgg4PtorCCSoww==
X-Gm-Gg: ASbGncuP/diZV0JgWmDPT12R9uDZURKamuQHYKzpcG1KNfFqTOHZH+yHl5ruhmYmO2U
	wLB8IdGRCY52rm9i0bBgNt8JFlDKFkn9wiUuF9F+1u5moXqKp1uRr+ivoIz2KRUCv34RJvukgAz
	keLbyS3b9wEyFgq2dLiwa5oD8mNT2YcseZZ13aZFgOwKgfrT46OvAcdNP82x7/6gN5FOn0MbKxz
	8WBpARLpZwOFvfCZMDD8A1NLLn7Rt4c1mswMkrpOhqM5RJCJni163Uq8sLH48u7cRB5us8MIS/O
	8tW/SIkkBn3gWIxTySy7brtAiNRnDbvylEthYvbdl5h/Unsso43up2bi+8mZItQ85VXK/tox
X-Google-Smtp-Source: AGHT+IEBLTjQEPi6T2MilTT/Y6yv+CY2P+m49PsmJxyrcH4D1FATZ6uG7LkMVqt9dbTXi33w3gHvEg==
X-Received: by 2002:a17:902:f643:b0:223:f479:3860 with SMTP id d9443c01a7336-22de6de05c5mr2640355ad.18.1745915292715;
        Tue, 29 Apr 2025 01:28:12 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a995edsm9628409b3a.130.2025.04.29.01.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:28:12 -0700 (PDT)
Date: Tue, 29 Apr 2025 08:28:01 +0000
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
Message-ID: <aBCNkcLp6XZpjYYT@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
 <aA_0TV0RkVOHk7Qj@google.com>
 <aBAEuP9962XweHPc@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBAEuP9962XweHPc@Asurada-Nvidia>

On Mon, Apr 28, 2025 at 03:44:08PM -0700, Nicolin Chen wrote:
> On Mon, Apr 28, 2025 at 09:34:05PM +0000, Pranjal Shrivastava wrote:
> > On Fri, Apr 25, 2025 at 10:58:05PM -0700, Nicolin Chen wrote:
> > > @@ -501,6 +504,9 @@ static const struct iommufd_object_ops iommufd_object_ops[] = {
> > >  	[IOMMUFD_OBJ_IOAS] = {
> > >  		.destroy = iommufd_ioas_destroy,
> > >  	},
> > > +	[IOMMUFD_OBJ_VCMDQ] = {
> > > +		.destroy = iommufd_vcmdq_destroy,
> > > +	},
> > >  	[IOMMUFD_OBJ_VDEVICE] = {
> > >  		.destroy = iommufd_vdevice_destroy,
> > >  	},
> > 
> > When do we expect the VMM to use this ioctl? While it's spawning a new
> > VM?
> 
> When guest OS clears the VCMDQ's base address register, or when
> guest OS reboots or shuts down.
> 

Ack. So, basically any write to VCMDQ_BASE is trapped?

> > IIUC, one vintf can have multiple lvcmdqs and looking at the series
> > it looks like the vcmdq_alloc allocates a single lvcmdq. Is the plan to
> > dedicate one lvcmdq to per VM? Which means VMs can share a vintf?
> 
> VINTF is a vSMMU instance per SMMU. Each VINTF can have multiple
> LVCMDQs. Each vCMDQ is allocated per IOMMUFD_CMD_VCMDQ_ALLOC. In
> other word, VM can issue multiple IOMMUFD_CMD_VCMDQ_ALLOC calls
> for each VTINF/vSMMU.
> 

Ack. I'm just wondering why would a single VM want more than one vCMDQ
per vSMMU?

> > Or do we plan to trap access to trap the access everytime the VM
> > accesses an lvcmdq base register?
> 
> Yes. That's the only place the VMM can trap. All other register
> accesses are going to the HW directly without trappings.
> 

Got it.

> > > diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> > > index a65153458a26..02a111710ffe 100644
> > > --- a/drivers/iommu/iommufd/viommu.c
> > > +++ b/drivers/iommu/iommufd/viommu.c
> > > @@ -170,3 +170,97 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
> > >  	iommufd_put_object(ucmd->ictx, &viommu->obj);
> > >  	return rc;
> > >  }
> > > +
> > > +void iommufd_vcmdq_destroy(struct iommufd_object *obj)
> > > +{
> > > +	struct iommufd_vcmdq *vcmdq =
> > > +		container_of(obj, struct iommufd_vcmdq, obj);
> > > +	struct iommufd_viommu *viommu = vcmdq->viommu;
> > > +
> > > +	if (viommu->ops->vcmdq_destroy)
> > > +		viommu->ops->vcmdq_destroy(vcmdq);
> > > +	iopt_unpin_pages(&viommu->hwpt->ioas->iopt, vcmdq->addr, vcmdq->length);
> > > +	refcount_dec(&viommu->obj.users);
> > > +}
> > > +
> > > +int iommufd_vcmdq_alloc_ioctl(struct iommufd_ucmd *ucmd)
> > > +{
> > > +	struct iommu_vcmdq_alloc *cmd = ucmd->cmd;
> > > +	struct iommufd_viommu *viommu;
> > > +	struct iommufd_vcmdq *vcmdq;
> > > +	struct page **pages;
> > > +	int max_npages, i;
> > > +	dma_addr_t end;
> > > +	int rc;
> > > +
> > > +	if (cmd->flags || cmd->type == IOMMU_VCMDQ_TYPE_DEFAULT)
> > > +		return -EOPNOTSUPP;
> > 
> > The cmd->type check is a little confusing here, I think we could
> > re-order the series and add this check when we have the CMDQV type.
> 
> This is the patch that introduces the IOMMU_VCMDQ_TYPE_DEFAULT.
> So, it's natural we check it here. The thing is that we have to
> introduce something to fill the enum iommu_vcmdq_type, so that
> it wouldn't be empty.
> 
> An unsupported DEFAULT type is what we have for vIOMMU/vEVENTQ
> also.
> 
> A driver patch should define its own type along with the driver
> patch. And it's what this series does. I think it's pretty clear?
> 

Alright. Agreed.

> > Alternatively, we could keep this in place and
> [..]
> > add the driver-specific
> > vcmdq_alloc op calls when it's added/available for Tegra CMDQV while
> > stubbing out the rest of this function accordingly.
> 
> Why?
> 
> The vcmdq_alloc op is already introduced in the prior patch. It
> is cleaner to keep all core code in one patch. And then another
> tegra patch to add driver type and its support.
> 

Alright.

> Thanks
> Nicolin

Thanks,
Praan
