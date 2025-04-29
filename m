Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63641F0E58
	for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 08:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915483; cv=none; b=m+XhF0M4J9uRuoxiIB150jl7Z654UfWcjtzHf/QSDI8JbYo/r1LZ/WNtwAp4IBzMSXTJn3ZQJsfB+OEybus9Q4BghaKTbo2SzxfEjt+yjCaSEK1EvOc2UT7k3L5bS/CMW+/MPSz2oMgvj7ja2gUYWyPofxZFECO23v8Uap5P+Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915483; c=relaxed/simple;
	bh=85qKaVraS+9MNdskLBxSjS9ktFkx0yQSDGXvIR/OvQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJ2kGIIiiESu7dlzIu7zgIk5NGZf/zZhwI1Venxd1uUyvbB/x5YVI1Owf3epMPbTE1U9yzgRkc6jHMcBIgOuyCEqXaGxKwxjtIRfu73azReXfQAGfKAT0Fht8VcJwo/akpBwV2de4bM2kPIWN5UvAN2ZMCVoD+DoRnH+0WY8+7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oAodT9uA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oAodT9uA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2242ac37caeso52815ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 01:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745915481; x=1746520281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TNi2KjTVYx94VsJLpl+aLzT0MDWDcyauEZBdUwqWejg=;
        b=oAodT9uAJPpRkgB3B/eY+TMN04Fr3Putxl7q1c9Y+evLoj9i/ms+hT5HWJDs1hTnOK
         d7wuMLxYD/czi7XXAIs+5pmHtC0hnxx1y7ekzhsOrYHXspWK5JDSm8bujYtOQCQCtbkH
         ap5kE5qJ4qsOjatA9vGFq+a6r52hqDc30+i8/EJ8Be3kEd4cDaQqDtFP8PszYpaOe6HZ
         cLf3ZMz2D3E1t04HD8iyhPcOoCCUa/G926U42LrA5DQ7CJbB0PV4Vz9j5y6WvWwQ+4Bh
         Xjs1lABiyE0wzToxARN4fCJLQ42WCqAwRTwVF31zt9jxP3EfB7LidjyQAmwW6wMQEpKD
         ZQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915481; x=1746520281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNi2KjTVYx94VsJLpl+aLzT0MDWDcyauEZBdUwqWejg=;
        b=C8l9J3lN60uQxfogBDvLAGDcBy2o9YjVIEr4kft8xe0/R1AVHbpHPBjAFicGZQhlP0
         zwhE5FjdmwctNJ6CApBdPulbykzzRvwsQRKvTNJntsmTFl1CAVbCIy9qOxotFx2GIF2k
         MMg6wzhD9GB4EzDmvMDMKm3Dow1/XaZ7QLOSujkgaEXorgVO+ymT4km1uQ0Sf8eaBycq
         QkuV6+Wg3B+4IIZMetq3T94Y3AyqGVHNepcZtsBDQkuBEgaXIA6NnPktYtVwctucyg7f
         J/o3MDvJouMk9HIpHJML/s0+cpfycCUrrYMEfXhT52xyfgzReHWO4aizipzpmadmhXxL
         YbbA==
X-Forwarded-Encrypted: i=1; AJvYcCUVnaV61JhpxdCa8pLAvbMbI04Fj/96Xw7RvsLNt5y2yLwg7AJ2MRyzsER1Bl1psiyJLtLuk8YAW8EblQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn1asBFAaPj1DLc2Xhn7Yp744L9dd5dM1K4Kwa146tehO9uiXn
	lqmdbYBXnadRLGbpcg9Y97Ch38sluXMQlmLrezlsZLd+OAjr41YRI4m4XBH7xg==
X-Gm-Gg: ASbGncs2rAvOhOtBzDq4GYaILTUymAGlrgApi2U/7GY8W3WYBJwF2jV05tfVJLDq255
	uEgRhrwaucy6sMaH10Yjr69NjkIUNUHJ5EAMPvSjR3UPfDkOEmHsEaabsls1kxedF/c3crVfDaF
	mzm+Macbr8MFtbIHK4+vQY+PlqcjPcWZpD8HpkNQmeb+bvr/4u/1/BGe4qpgX5L2jUpB2u8FDit
	JoflL+o0DNqKWYHzX6+Ni2n3iWQ6c8eFYQggs5dTz1na9kPBif7oB2QHOt8lWFSqtHk93psm2la
	U40G0RQ9vBq4lLuWP20hyW2Ir1Gx4fSdHhiU/2NVAYiauAikIJoWCb/bULPaKTaDF0r2g6Qj
X-Google-Smtp-Source: AGHT+IEuwEN6Vz0nl2aEx/jObUHE3H07L74jGS/5bsNXpJR+QacDK6nh9jI6VmQObGdH+OZv4saKuQ==
X-Received: by 2002:a17:903:1cd:b0:21f:465d:c588 with SMTP id d9443c01a7336-22de6c52c70mr2586365ad.14.1745915480493;
        Tue, 29 Apr 2025 01:31:20 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef124ce9sm10440195a91.34.2025.04.29.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:31:19 -0700 (PDT)
Date: Tue, 29 Apr 2025 08:31:08 +0000
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
Subject: Re: [PATCH v2 04/22] iommu: Add iommu_copy_struct_to_user helper
Message-ID: <aBCOTDDC8--age-V@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <ca032e90c0241fe0653023fcb655185dba763f5f.1745646960.git.nicolinc@nvidia.com>
 <aA-_5FQK0uZPdGVA@google.com>
 <aA/HN2CV+0UQ4S9j@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA/HN2CV+0UQ4S9j@Asurada-Nvidia>

On Mon, Apr 28, 2025 at 11:21:43AM -0700, Nicolin Chen wrote:
> On Mon, Apr 28, 2025 at 05:50:28PM +0000, Pranjal Shrivastava wrote:
> > On Fri, Apr 25, 2025 at 10:57:59PM -0700, Nicolin Chen wrote:
> > > Similar to the iommu_copy_struct_from_user helper receiving data from the
> > > user space, add an iommu_copy_struct_to_user helper to report output data
> > > back to the user space data pointer.
> > > 
> > > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > > ---
> > >  include/linux/iommu.h | 40 ++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 40 insertions(+)
> > > 
> > > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > > index ba7add27e9a0..634ff647888d 100644
> > > --- a/include/linux/iommu.h
> > > +++ b/include/linux/iommu.h
> > > @@ -562,6 +562,46 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
> > >  	return 0;
> > >  }
> > >  
> > > +/**
> > > + * __iommu_copy_struct_to_user - Report iommu driver specific user space data
> > > + * @dst_data: Pointer to a struct iommu_user_data for user space data location
> > > + * @src_data: Pointer to an iommu driver specific user data that is defined in
> > > + *            include/uapi/linux/iommufd.h
> > > + * @data_type: The data type of the @dst_data. Must match with @src_data.type
> > 								   ^
> > Nit: Must match with @dst_data type.
> 
> Oh, that's a copy-n-paste mistake. It should be:
>   * @data_type: The data type of the @src_data. Must match with @dst_data.type

Ack, yes that's what I meant!

> 
> Thanks!
> Nicolin

Thanks,
Praan
