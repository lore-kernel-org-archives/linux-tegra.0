Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A693D27E1A7
	for <linux-tegra@vger.kernel.org>; Mon, 28 Apr 2025 17:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862643; cv=none; b=AFo5qdZrQGAV4JaauMDLQzXebL/2/NEapEvk9HpERXX14pRCq+jPrM5GJ7gOZvNPLuZsUsRqiNG76kYjna1JeDm4nPGMSjiEkxjxiMDm7Ii5WjoYdu2kpx5I+gr5Dwlc90DCiexFWSAKi7pDyfRPJeFXuo4yqhG9IMUDdkyV4os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862643; c=relaxed/simple;
	bh=OvAf2T+pBvdBVQKKD1SCkOQm7K3cKaRnrNfz9b6U1KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LeCNdtq89y3EyHCVOoIABmxPfYYMQwQ534Bn+YwBjvy9jQxbLY5jt+oBbOywtCq3R3ui0UGWSbn9GYPDNOvl9dqeFkY6YSxSRmkwplxncnO8PjL3w9zQD1G302XNApSpLM5nlseXn0FU0PBV+5pPQuIajPL6dGW9X36nammykxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OmgDpqQa; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OmgDpqQa"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2264c9d0295so22125ad.0
        for <linux-tegra@vger.kernel.org>; Mon, 28 Apr 2025 10:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745862640; x=1746467440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mEMzzefTttNVGmGGFEF+tVQHWP3i8v0cb/h12OtES4=;
        b=OmgDpqQaWfXDEzR3D7bT9oowtk+dIIu88v5Sm176ctaEOfVPp5XjFau3YloJfgx/yi
         ag35CLiMNd1ci5DOIZ0lzudQiz2AMDieklzrbqAXwNTZaQx3d8SPhQ5797Z/82Ozvy1i
         Rvm2mlPBqF9sr/ZuI1PjU5Yb7mB8xZu9UOBXxXBfNWi2pwFopCxGwbI9wMv90wtnzDYN
         bYvKtPTfaAkBM+9egcrBNABC21SGVtlQxKSWNfUnuYD4F2ixB2IVUW15VmZiu22WONRe
         s6bT81o6Slgb3IlwSUxOc+sjL8Ou4NcQWQix1N0ONy3nQcERXK+Zq+veif3VsWzGAjtt
         XDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862640; x=1746467440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mEMzzefTttNVGmGGFEF+tVQHWP3i8v0cb/h12OtES4=;
        b=sg/QtwvfGkec8LQMha6X39cqtOFYayyZT5hPNwsAym4e5a47a3sCmiysN6BV89K/8j
         oFUiVPVUBnYD5pedv62GAhfqHmmsnOUKQzDpAcIG+UaJ/68YFJiVwM9AUPYNrojTKtmg
         huhqFK3p+Vzqw26ANgPSVbaLt7zwWGgRoH+6Y4ofLOkq8ENAeNQXLEkPX1bZhMM8leqb
         cSE8Rud/zfaXwjqAZ1bA7KQg6YkNBKdwoBtnyN0PoQ0XRaN5EES05pJj3r1HqZ0pumjD
         qRQFaIL2C7G+pn9/xL8f+/GjTQB2mdnWcRlIEPqNQQ1vPEJ7PHvtQCXSyeC3rd6yJteJ
         o5bg==
X-Forwarded-Encrypted: i=1; AJvYcCUuVNYpqAGTvmYmmw4L9EDv/2WKMIKT67FrInu14dxSRFh9AecTdBE2cAOWBbb96UpeFp4Jr/k3jPaleQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNPUiqnEPTb09YeMHOQwpSunWGZ/VBMjIo8nlIQNwrKD9AHlrE
	J1rQkgFFwawLfvCdrobJsyZKl2edjWnYur57pvjcyWUMAVtvwqDuuuj3KjnKQw==
X-Gm-Gg: ASbGncsY4U6HK24/XcePQ0zdRDmbj6BA5eVmAalo7MDgk6auMyJSfF1rEDRHGsWZZ4n
	NPN3kKxs/tgkhQ2g/XOVvHgpgLH4Uf4xAxEwXx2zhehhZ9VtHgQk0D9oynwDAe6HsKYmtUF837r
	XImLtMkQwpkL4Z6SZcXmKGxkGfqlz3cFduND9/CN33+1kVSWgpAibpdhFOWSSCG9uVgA4txkIzr
	b9EwIIaVZhM9wmS567bdtCmDHjp/L47GRVNJDfgPEVnlB/8/sWnROHrffQK0u400Q/9ccYgsRFQ
	ATsPa9UdLnLvXLFhZgAwMBJnC7Oalj4rCT9XBCzONdaIPZwXO4x5YiLlGIIFAkR5Dtbl+8AQ
X-Google-Smtp-Source: AGHT+IFdvGjCZd8WihYpKKAdbavzVYWBtSaBNCLX1v9EIv3lNKixiHNvn3PMdFhA2dEanqkbNONo4w==
X-Received: by 2002:a17:902:ebce:b0:229:1de5:e8c9 with SMTP id d9443c01a7336-22de6ebc37cmr33095ad.13.1745862639534;
        Mon, 28 Apr 2025 10:50:39 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db9b02sm85788765ad.56.2025.04.28.10.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:50:39 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:50:28 +0000
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
Message-ID: <aA-_5FQK0uZPdGVA@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <ca032e90c0241fe0653023fcb655185dba763f5f.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca032e90c0241fe0653023fcb655185dba763f5f.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:57:59PM -0700, Nicolin Chen wrote:
> Similar to the iommu_copy_struct_from_user helper receiving data from the
> user space, add an iommu_copy_struct_to_user helper to report output data
> back to the user space data pointer.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index ba7add27e9a0..634ff647888d 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -562,6 +562,46 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
>  	return 0;
>  }
>  
> +/**
> + * __iommu_copy_struct_to_user - Report iommu driver specific user space data
> + * @dst_data: Pointer to a struct iommu_user_data for user space data location
> + * @src_data: Pointer to an iommu driver specific user data that is defined in
> + *            include/uapi/linux/iommufd.h
> + * @data_type: The data type of the @dst_data. Must match with @src_data.type
								   ^
Nit: Must match with @dst_data type.

> + * @data_len: Length of current user data structure, i.e. sizeof(struct _src)
> + * @min_len: Initial length of user data structure for backward compatibility.
> + *           This should be offsetofend using the last member in the user data
> + *           struct that was initially added to include/uapi/linux/iommufd.h
> + */
> +static inline int
> +__iommu_copy_struct_to_user(const struct iommu_user_data *dst_data,
> +			    void *src_data, unsigned int data_type,
> +			    size_t data_len, size_t min_len)
> +{
> +	if (WARN_ON(!dst_data || !src_data))
> +		return -EINVAL;
> +	if (dst_data->type != data_type)
> +		return -EINVAL;
> +	if (dst_data->len < min_len || data_len < dst_data->len)
> +		return -EINVAL;
> +	return copy_struct_to_user(dst_data->uptr, dst_data->len, src_data,
> +				   data_len, NULL);
> +}
> +
> +/**
> + * iommu_copy_struct_to_user - Report iommu driver specific user space data
> + * @user_data: Pointer to a struct iommu_user_data for user space data location
> + * @ksrc: Pointer to an iommu driver specific user data that is defined in
> + *        include/uapi/linux/iommufd.h
> + * @data_type: The data type of the @ksrc. Must match with @user_data->type
> + * @min_last: The last member of the data structure @ksrc points in the initial
> + *            version.
> + * Return 0 for success, otherwise -error.
> + */
> +#define iommu_copy_struct_to_user(user_data, ksrc, data_type, min_last)        \
> +	__iommu_copy_struct_to_user(user_data, ksrc, data_type, sizeof(*ksrc), \
> +				    offsetofend(typeof(*ksrc), min_last))
> +
>  /**
>   * struct iommu_ops - iommu ops and capabilities
>   * @capable: check capability

With the above nit.
Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 
