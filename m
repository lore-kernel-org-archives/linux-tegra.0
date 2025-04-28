Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18092951DC
	for <linux-tegra@vger.kernel.org>; Mon, 28 Apr 2025 18:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745866606; cv=none; b=AZ/m89+Wihv7agnPywWwVtgwKGLGyEEBg+b9ArCU4liGwCBvbqEkjtOFNa6AFDg11YlLOrrE5iHVlBJFVnz3RCoMmSivueNY7L7X3Yk+XNn68XndpEpjWXnu76ySOjPcwmku68fbXfyccd7I7a7RU4yGujzO5xTSTgo1j0TOE54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745866606; c=relaxed/simple;
	bh=OFEc8MAiX9TeMfChiyb/QiYaNmOIEMhcKoAsH046gjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQyq4/Gghs9qa7WTdJmvMEjEY9pDL0mo7brp8Vyp/uEpv2lgkRgRSSKwvKiCehajrgxnGEdfTQy2mbrzBYPH2WYShQPENYFf/RnvcpzCloHG4hMhkQJQ/Yo6rVJjcA3zKaWeHPyBPBSVbxJ0vdiUZX86R5WqCJUvf0nGTGvolJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=05ZTyijT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="05ZTyijT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2240aad70f2so34975ad.0
        for <linux-tegra@vger.kernel.org>; Mon, 28 Apr 2025 11:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745866603; x=1746471403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gUeOpwsZ3bAk2qBL8+dBV7f0gHVviZTQa3DepiItlZA=;
        b=05ZTyijThZcTRXxbuLmt/233GJXoJB37HSECYx1is9sR5Yqq02YDUVj/rj6OMLtNus
         qOKEJpqriP1B/ovIYYNxSz3+2I/hBtfgymqrWUfVeHdSr/XowQprs48oyHu1WwucRj2l
         orrXD+Knqcebg78KB2021k30O6dUUPfzFPjn3ORpnX3cCiu+uKJtQulTEvd0D5J8r1lG
         zMhzQ4rQEabmYKITZqbnmj4AdnRyEmbw2UKKSqtjgXX3E+a0wt6ebqQRUXdqmNOvSYbH
         dp1pMMbD9oLUOhxRNoV+EAFMJxOyBwkPAuXTq7EW+SPW2cMUmgUyMX196A3L2kSa6Oqu
         AYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745866603; x=1746471403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUeOpwsZ3bAk2qBL8+dBV7f0gHVviZTQa3DepiItlZA=;
        b=TNQnOcL3a5PIvB0QpN7lJDRl+GLaLrzr9WbUVM8qR8j/tzcCdT9o2ELl0zsmm/k9SJ
         mKn0GC2yhJdwFx943Dn7I+JuP5D2BfVWuyQy336yw3VKxHA4g/hjrEvdQnd1mYlYMFmP
         Gb2EVEx0SCpxbHw51MiUpzy/WevWbbgNE1kpts8LaE/TuPJZolkr0PIzF4/D8sCwkoWA
         dRW08TiM70aBpBs/3E7igtOoEiXN1WQ6XUw7b1JFfNIcCu5FHJIwLau7TOyfeQswu+Jk
         PQ0h6N5IvoUtY257uL4rw+lMtqaBOyzIVJRmp2EbytJZyH6kYFmL8HsfLz8T1MhvIeqE
         41XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaODVFohwDd/PlnAb8+omjwcMlkzNmA+jLWLjoUtBTM5Hwiu0Kwmq/NyJL15o9NimIMRVf9vrbcjny1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLPq8RWtYcPKGURBzaBpfeLKWnA6wyeXNhySWcEGwIhUB6W5TY
	NeE03IMgf926zH06qojtMCIbs7kN87tw3F/iE3T6zhsFXNtR9PCu43hai4S1Ug==
X-Gm-Gg: ASbGncs1BXrGSBk12Gt5k7xe8CW8n2jjavh2oqGVuJGjQMBBpRZENPl0JZgJV5Up4Wu
	0Gopo0Hlle/2H+cbMPavOeFNk9+THrTSZsnkrDwEZViQgc+AWzxJzDMycX/dZ6CbhbdYbNA/ZBI
	voNlJae4XAplJdFJTbdz2N0+QbekBjlD9cx5jHS9ckPexwLNHnm92xd49rKsuzv5wLRaAQLOTmM
	vvASD/4Hdl8+EIMXnXbyB1rU9d0mtxcOMb+Pk7yuK6xMt5xghiNfdLJPW/jIG4ehn6EYYl60r5l
	B6OgI/MqU7w0U4UZkJgL8QN4j/ivMiknZKYMq/Lfu32d69igAB1CeuEpCmdgvP8+APJNT59Q
X-Google-Smtp-Source: AGHT+IEn9NdqisiZUEFudVyDLIBAx0JrxSAXK9s59PU8BubuekqQOaQAsWfs78yrsnFIaEMxYjdNjg==
X-Received: by 2002:a17:903:2447:b0:223:5182:6246 with SMTP id d9443c01a7336-22de6ecc0acmr313105ad.23.1745866602737;
        Mon, 28 Apr 2025 11:56:42 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm86915695ad.76.2025.04.28.11.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 11:56:42 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:56:31 +0000
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
Subject: Re: [PATCH v2 06/22] iommufd/selftest: Support user_data in
 mock_viommu_alloc
Message-ID: <aA_PX5k_haI3RwoN@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <786cd49df9fb437790b7dba53165e4316747913b.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <786cd49df9fb437790b7dba53165e4316747913b.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:58:01PM -0700, Nicolin Chen wrote:
> Add a simple user_data for an input-to-output loopback test.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_test.h | 13 +++++++++++++
>  drivers/iommu/iommufd/selftest.c     | 19 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
> index 1cd7e8394129..fbf9ecb35a13 100644
> --- a/drivers/iommu/iommufd/iommufd_test.h
> +++ b/drivers/iommu/iommufd/iommufd_test.h
> @@ -227,6 +227,19 @@ struct iommu_hwpt_invalidate_selftest {
>  
>  #define IOMMU_VIOMMU_TYPE_SELFTEST 0xdeadbeef
>  
> +/**
> + * struct iommu_viommu_selftest - vIOMMU data for Mock driver
> + *                                (IOMMU_VIOMMU_TYPE_SELFTEST)
> + * @in_data: Input random data from user space
> + * @out_data: Output data (matching @in_data) to user space
> + *
> + * Simply set @out_data=@in_data for a loopback test
> + */
> +struct iommu_viommu_selftest {
> +	__u32 in_data;
> +	__u32 out_data;
> +};
> +
>  /* Should not be equal to any defined value in enum iommu_viommu_invalidate_data_type */
>  #define IOMMU_VIOMMU_INVALIDATE_DATA_SELFTEST 0xdeadbeef
>  #define IOMMU_VIOMMU_INVALIDATE_DATA_SELFTEST_INVALID 0xdadbeef
> diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
> index 8b8ba4fb91cd..b04bd2fbc53d 100644
> --- a/drivers/iommu/iommufd/selftest.c
> +++ b/drivers/iommu/iommufd/selftest.c
> @@ -740,16 +740,35 @@ mock_viommu_alloc(struct device *dev, struct iommu_domain *domain,
>  {
>  	struct mock_iommu_device *mock_iommu =
>  		iommu_get_iommu_dev(dev, struct mock_iommu_device, iommu_dev);
> +	struct iommu_viommu_selftest data;
>  	struct mock_viommu *mock_viommu;
> +	int rc;
>  
>  	if (viommu_type != IOMMU_VIOMMU_TYPE_SELFTEST)
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> +	if (user_data) {
> +		rc = iommu_copy_struct_from_user(
> +			&data, user_data, IOMMU_VIOMMU_TYPE_SELFTEST, out_data);
> +		if (rc)
> +			return ERR_PTR(rc);
> +	}
> +
>  	mock_viommu = iommufd_viommu_alloc(ictx, struct mock_viommu, core,
>  					   &mock_viommu_ops);
>  	if (IS_ERR(mock_viommu))
>  		return ERR_CAST(mock_viommu);
>  
> +	if (user_data) {
> +		data.out_data = data.in_data;
> +		rc = iommu_copy_struct_to_user(
> +			user_data, &data, IOMMU_VIOMMU_TYPE_SELFTEST, out_data);
> +		if (rc) {
> +			iommufd_struct_destroy(ictx, mock_viommu, core);
> +			return ERR_PTR(rc);
> +		}
> +	}
> +
>  	refcount_inc(&mock_iommu->users);
>  	return &mock_viommu->core;
>  }

Builds fine for me.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 
