Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862C726B972
	for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963879; cv=none; b=N4jBj3gh5uaCQajbsKQDtNbGFWWzVX5c9UyctibPstC6fgQxRI8kcSCwA94XovOBUjEadpOJrvhFeuvzpp91ciT5t9AMfyF/Lb2/Cln9u0rzFUGSnVK85HI1HSF1EK8g90XF7sAMiVAWKk3ox7n+0VvC1++G5W99llntACQy/eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963879; c=relaxed/simple;
	bh=JxqDFFtO3S8kK/E3hLQE8+QiBq8AOwa6PH5SwIKxxXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rV+IMIQj5ZwYeIe/zbontuiBXee1fBxQpPFZLkJ8xnHFpP+Ay8yzHpsrITOQRw/dVFwXV4u5bbkpQLjFRhIRzdByV5CVnQOkqPy5FbHorgCEwvSYhKxKPrlnJIetU2nsVw5P2jI/fPuZInc4peIIlZ1e4Y7v5d7TxsMhRiY/ygQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wZT3EoE4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wZT3EoE4"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2242ac37caeso77495ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 14:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745963877; x=1746568677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dRuE0k+DaKR+dFrI7c28XxIZx1ZsULnIcimVdzgk9ZA=;
        b=wZT3EoE4rPLrBTlCZcgNY9PVZ77Jafl4mdpTyqOYGyHOPLctb/nfxWIZJW05bY8tY5
         ygALCnaBq9+RiCj3MTgBroMbA4lJBbLlmxAwxLfIlwnnISE/Bj0ZJRgbghg56hTjblyT
         XlP5AxI935dZz8+Dg2XPL6H4iCOhAs2JsSXfE+KBiJDFdxjsi8GX5RjYzvEGPzIvGKfX
         zLyINIrEtCwPjdPWFz8VAaJ5DMGSQR9Hw6yLCNCmtYZ4dhFX5H1LQdH7+9ftvC4C+5ph
         xFWSKmcbcfe9SsOG27NjO0HbhpMpEwsVRNOBJtmK80YgYQ0v7w9lZTWUF9bJc9VgXTpm
         luEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963877; x=1746568677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRuE0k+DaKR+dFrI7c28XxIZx1ZsULnIcimVdzgk9ZA=;
        b=EFa7YsI1ZRxsqth/5f7EH7Dmb58M/xcbi5D1LduEDuc2d6Ilzt6wZkcLwCp9dl6Q2A
         PYCnpJyu3MM4V/vFmiM3dCnqq2roH9nz0O30JxalsJCfbMNhzT6wOkG7ucmytfn6CRk7
         UnK0LGtMNxIhAe6LsXnac97dtsrycWr1Aj9/37men2NPFk5L0reEzBlZpUHpNI1uXQS3
         12fCEZKor8i+v7w9QJrvoPQ59GT/LBt+8rFYuG1xT7p3qmc3vTMPtAOCsVX6JHZv+m2c
         LhG3xSyJov/EOT7Lo6aRjD1VjRqCE9puK3Nc0TI4x4Q3Z4C1AHIt8gLXyhckX2lTHxWX
         PZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCX+LrrKg2fwcVR1Xf6PAzkjh2LqwL68c3bAwwA8fSBqUahQ8DQDV9sUbSxdSHr2mPgDW42Vmgh8WTKDtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxjPrxNCgL/TSOlSrpbk0cI5ZNLasMBYhesP8FGJ2H5nvPg5O1
	/4eyGs0USSGpxhZHBHFYqXthD2Za/ATUxpza35SiGNlJvbJIdMw11IV8QGOpkQ==
X-Gm-Gg: ASbGncuao3geA1aetCzCMTTkJPhmsai3vct6wtc9ML1z4Ee4lfhmE8+oHYCkDyIGPrO
	CU9Se0nE0+31i0bcb4Talnq5OT2vmKEwI6gP58iL/RIe7uKvFADPWHlraI8nJO1ihkT+GWfrS5U
	OEyZDmE9PE8B1hXpjHm2ST2VD72cl0xblXBxc6XaF4+VhG9JNdDD97msr9bnJveV3LSeMD2Kh8M
	X6Sw1kC31ET3J6UBwHtkWZE7T+9ZlxASfYgjxln9Q/EgeYOP4eGopmYXFihiYItFi/LdvbKqm1O
	B+L1mNLuYPHkfEv+0cyIwAbZJjPYlO6m60YRhGaX1C1T7TP15TiSDRWXCu8P8sbr6ez07t+pO7b
	k/FR3rmM=
X-Google-Smtp-Source: AGHT+IG2GQrBKEV0sAuQTzjtnWFNlTLvqHxPy8UFJFeAPu3X8NPH7IbodXwNU55E95G96pW683QFuA==
X-Received: by 2002:a17:902:d489:b0:220:c905:68a2 with SMTP id d9443c01a7336-22df53e1f95mr331695ad.5.1745963876294;
        Tue, 29 Apr 2025 14:57:56 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5104ec7sm107543895ad.175.2025.04.29.14.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:57:55 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:57:45 +0000
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
Subject: Re: [PATCH v2 13/22] iommufd: Add mmap interface
Message-ID: <aBFLWUvzvwtFXK5z@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
 <aBE1gUz9y415EuBQ@google.com>
 <aBE38GwvGBnpRNLc@google.com>
 <aBE47aySzDp2lsAz@Asurada-Nvidia>
 <aBE800DsAOOZ4ybv@google.com>
 <aBE/CD4Ilbydnmud@Asurada-Nvidia>
 <aBFGCxcTh54pecsk@google.com>
 <aBFIsYg+ITU8RvTT@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBFIsYg+ITU8RvTT@Asurada-Nvidia>

On Tue, Apr 29, 2025 at 02:46:25PM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 09:35:07PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Apr 29, 2025 at 02:05:12PM -0700, Nicolin Chen wrote:
> > > On Tue, Apr 29, 2025 at 08:55:47PM +0000, Pranjal Shrivastava wrote:
> > > > On Tue, Apr 29, 2025 at 01:39:09PM -0700, Nicolin Chen wrote:
> > > > > On Tue, Apr 29, 2025 at 08:34:56PM +0000, Pranjal Shrivastava wrote:
> > > > > > On Tue, Apr 29, 2025 at 08:24:33PM +0000, Pranjal Shrivastava wrote:
> > > > > > > On Fri, Apr 25, 2025 at 10:58:08PM -0700, Nicolin Chen wrote:
> > > > > > > > +	struct iommufd_mmap *immap;
> > > > > > > > +	int rc;
> > > > > > > > +
> > > > > > > > +	if (WARN_ON_ONCE(!immap_id))
> > > > > > > > +		return -EINVAL;
> > > > > > > > +	if (base & ~PAGE_MASK)
> > > > > > > > +		return -EINVAL;
> > > > > > > > +	if (!size || size & ~PAGE_MASK)
> > > > > > > > +		return -EINVAL;
> > > > > > > > +
> > > > > > > > +	immap = kzalloc(sizeof(*immap), GFP_KERNEL);
> > > > > > > > +	if (!immap)
> > > > > > > > +		return -ENOMEM;
> > > > > > > > +	immap->pfn_start = base >> PAGE_SHIFT;
> > > > > > > > +	immap->pfn_end = immap->pfn_start + (size >> PAGE_SHIFT) - 1;
> > > > > > > > +
> > > > > > > > +	rc = mtree_alloc_range(&ictx->mt_mmap, immap_id, immap, sizeof(immap),
> > > > > > > 
> > > > > > > I believe this should be sizeof(*immap) ?
> > > > > > 
> > > > > > Ugh, Sorry, shouldn't this be size >> PAGE_SHIFT (num_indices to alloc) ?
> > > > > 
> > > > > mtree_load() returns a "struct iommufd_map *" pointer.
> > > > 
> > > > I'm not talking about mtree_load. I meant mtree_alloc_range takes in a
> > > > "size" parameter, which is being passed as sizeof(imap) in this patch.
> > > > IIUC, the mtree_alloc_range, via mas_empty_area, gets a range that is
> > > > sufficient for the given "size". 
> > > > 
> > > > Now in this case, "size" would be the no. of pfns which are mmap-able.
> > > > By passing sizeof(immap), we're simply reserving sizeof(ptr) i.e. 8 pfns
> > > > for a 64-bit machine. Whereas we really, just want to reserve a range
> > > > for size >> PAGE_SHIFT pfns.
> > > 
> > > But we are not storing pfns but the immap pointer..
> > 
> > Ohh... so we are storing the raw pointer in the mtree.. I got confused
> > with the `LONG_MAX >> PAGE_SHIFT`.. Sorry about the confusion!
> 
> Yes. We want the pointer at mtree_load(). The pfn range is for
> validation after mtree_load(). And we are likely to stuff more
> bits into the immap structure for other verifications.

Ack. Got it.

> 
> Thanks
> Nicolin

Thanks
Praan
