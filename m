Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FCA291155
	for <linux-tegra@vger.kernel.org>; Mon, 28 Apr 2025 17:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861340; cv=none; b=VfGxJoGNcf/vr6SAG+sUkcdyR+12P85f4LM1E7LNA/JR/Wel67M/sSEWuzDv4SU1cz8t6R8go92YITitcjqna5wU/WmsocRwFxuKaFilAWnXRwrjEK/nytWqkwq2wfIztD49+YO7fLcActkOSOwhVcEUbnBh/uZ88lxNnmJWoeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861340; c=relaxed/simple;
	bh=hvj8x3HVmp9P+1p1D0eDo1pbK3RjBLaMP05027S3Y0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kt3hQcQ57pAdPi8fQVnWBVhLY/pjVw8ou5hNHIndXdbIs9RXAjXOHk9HEgWTm3XSim0TVLMwcVHEIaBanS52fn5/Z4varY8xMHPT28gR2+8YAf555e/EGSId2YP62pA5ot1XN4wq0/Iqx1mp/ilFMmyOvTzi7/mTxPnfKrKHQ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S5JB1327; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S5JB1327"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2240aad70f2so15665ad.0
        for <linux-tegra@vger.kernel.org>; Mon, 28 Apr 2025 10:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745861338; x=1746466138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l0r7+wCllJmaKxCe01hHV/d2aOrZfvhrAsuNMyHCgYc=;
        b=S5JB1327JpJxaMmLXm5NYrTJfpPRRsFYe8t1MsMX+g9eo/hWOYhsJFIDjGpiGZJ+Tw
         Z5dOGM/O/RADOG5X2JnhKBjkp0dsG9DGbAVqPHVHkFZhJKwtYegN9ReqK7kU9QZG75tu
         83RGNj8AxSp5xemBFUBeylMeuO8FbMzw8SHAvfNleUz2CUA1uSXsco4Bzli/va3N77Rm
         vCAxyo2xUHI2E9OwLe3x8Fd5KSIhnoqYslZAxFrLq1qFxEZ0sVXl2vZ5EQWdB2lrqMuf
         dGTNrcUACF9khh3UA/XeSQrMsh5hPyPrlP/HUceBlX7dOJmj0WR06R5K/OpdcPmqx7KQ
         uXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861338; x=1746466138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0r7+wCllJmaKxCe01hHV/d2aOrZfvhrAsuNMyHCgYc=;
        b=f9YX8JcsM0orMiIimRXaRp5nhaSiooacKp9DYMoqYX9tfd1laDulRgrJk436zvsTYv
         VY/eHGdqQCEqJQCAN0aSmbpaeSh/Q6UT1/z6MshVn4HEgzH6TVZ/o25uwcHUKeOZbDt4
         gRHr73/HCXr+sBWgbHGIKRAQt/DS/DhN8n694GV/tzz0x0hawqXASqk3zYCSa0rxMzw3
         Poui6pxaQP78HDjGimxbgMP7KR8wc3UMfBYEXfbDsis9lB4tgoTiwJSuPcHL4gz/uJqK
         CKIe/lclBfuGhuqjpRD2UB5IYhnwGqqcr19yFATD7IpXNDt2FscYGBTfEZDR/iLo0t8T
         KNFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOo+HHqN5tG2tnAuPYP60PGixkRg9pwlXa+QoVv/b4Ndq6I5j0gHQv8T9WCon89UsyKsk5sthL40HMdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yytnx7KzYYystEyrQWbUJkxxmCy7oBs/YcaG2p14DLngWG0Ii0e
	sWD07nKM+6YOLMiwOw2gaXotv8AY3n18Pvzi5uvlk3FHbV85IUjr3ClgtzlYug==
X-Gm-Gg: ASbGnctj5s9q6pQ5BC8Jv7rISnUuElEXeM6WZSmf104rrmwdkuTPnMvZOHuj4QZhLvX
	gDoPC7P2uDzddMwnwW8TwirJj0gW4VmY9PUU8B+KQ7gIpfT/mfzEWOgQWmXTCguSEunD6LknniS
	xjRO7eJdz1+VvK54PmwDP0tETSrYYRLLURF+uSuDXdCBNG41eV905BbIOQOFYy7+YOwxZ4KdWii
	YDfYUIh1EnS1kBktAPWZUar44dQPEd45qFoW49ZX35gISqlxj1YMJ7Clo7iFrrblfMCk4UN5J9W
	PlHaCBrdoS/ryueFHeNdz1J+3incOQ3quCJhH1QcTYNs4M3oW5M/Rr5+jFc8LByx6ukfkfk/
X-Google-Smtp-Source: AGHT+IFvvbXqVLW7M7K4eTP2s1tq5nZj/xJsE94cw7osWMiH1XhKOhdmN98bqT0YcPcDS66bSCITtg==
X-Received: by 2002:a17:902:ea01:b0:21f:2ded:bfa0 with SMTP id d9443c01a7336-22de586f035mr708455ad.25.1745861337961;
        Mon, 28 Apr 2025 10:28:57 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef061bccsm9296497a91.18.2025.04.28.10.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:28:57 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:28:46 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, jgg@nvidia.com,
	kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 02/22] iommu: Pass in a driver-level user data
 structure to viommu_alloc op
Message-ID: <aA-6zlZNQ6NsrUqw@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <f985e2802a50b5867c9d4d3182ae7b4944a989c5.1745646960.git.nicolinc@nvidia.com>
 <e569c927-65ff-4c0f-8922-45e404fefc5e@linux.intel.com>
 <aA+4mRrGuUnpG/dB@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA+4mRrGuUnpG/dB@Asurada-Nvidia>

On Mon, Apr 28, 2025 at 10:19:21AM -0700, Nicolin Chen wrote:
> On Sun, Apr 27, 2025 at 02:31:54PM +0800, Baolu Lu wrote:
> > On 4/26/25 13:57, Nicolin Chen wrote:
> > > The new type of vIOMMU for tegra241-cmdqv needs to pass in a driver-level
> > > data structure from user space via iommufd, so add a user_data to the op.
> > > 
> > > Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> > > Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> > 
> > It would be better to add some words explaining what kind of user data
> > can be passed when allocating a vIOMMU object and the reason why this
> > might be necessary.
> > 
> > Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> 
> Sure. Will do something like this:
> 
> The new type of vIOMMU for tegra241-cmdqv allows user space VM to use one
> of its virtual command queue HW resources exclusively. This requires user
> space to mmap the corresponding MMIO page from kernel space for direct HW
> control.
> 
> To forward the mmap info (vm_pgoff and size), iommufd should add a driver
> specific data structure to the IOMMUFD_CMD_VIOMMU_ALLOC ioctl, for driver
> to output the info (during the allocation) back to user space.
> 
> Similar to the existing ioctls and their IOMMU handlers, add a user_data
> to viommu_alloc op to bridge between iommufd and drivers.
> 

Ack, with this change (addressing Lu's nit).

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> Thanks
> Nicolin
