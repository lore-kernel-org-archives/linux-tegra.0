Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1602E27E1A7
	for <linux-tegra@vger.kernel.org>; Mon, 28 Apr 2025 17:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862759; cv=none; b=pMgg7+wirWSbbuIXbdZUlGKpLT/QUAE0f9GICBJ6qbz3jSY8biR73PFp9r4YnmtNCGsC8e4cvFAsuzblEGNOcMGndMSgb9Tn2W1RMx4sDaRuXeURAlGbQR+c6jhbnojAMJyn3bi5MOFKbRDws6dlYtULBUbws2CSJabToDxZXxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862759; c=relaxed/simple;
	bh=tlXItLWYzM0MSceJkd0MV2mZMr+DBkTlO0xigxKGaW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UxbpW28pIyniMgA/GYRn57O67Rd3VpJSToXkLQdcZ1/PVCbKe0acRZY+kbV683s1/NcOBJeLa5edqLZoTHHWmJTuORFTBxNJipYhw5tpnP949rFxj/3gcdVtozkCWPVfbAt3L03zXeIxw9HPjbulW857u7CV+hpQwl1+eAFHga8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=znVVWzsZ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="znVVWzsZ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2264c9d0295so23025ad.0
        for <linux-tegra@vger.kernel.org>; Mon, 28 Apr 2025 10:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745862757; x=1746467557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mXoy6sxPPZ/z2WrCrnWnxSxhkK1XoAbzd892zSPGLLk=;
        b=znVVWzsZkViwJ9KNktbWf0SVEF5noddR04XFaMmY94Zy2Xp2+D18rCgAGTGH1tVaqs
         TTyFi1VVrmWxZdr0LcmPaGtWFCemB5Vr4HzCt+SQOJbpsyeKqoQrkODdAXvAPgc6FcgI
         m8gf/hXk4Dm97gDdpRCGZMGEX4KlwN5Bc2SpDRh5aEfr2BDL+riD58djW1JpnFk5Xzp7
         uCDhmAH54yhLseams5OI7IDMQ2rQ9lO5eE6apAlkhTtzASG0t1ETlsqjNKHzpwxIk0U0
         +7K1gghkiN4zT5XsR3iE7fA/xJ0cgdcfnq7o+4ITt60LrvoNt5Y3znxW39c+OrVCGm/5
         5kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862757; x=1746467557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXoy6sxPPZ/z2WrCrnWnxSxhkK1XoAbzd892zSPGLLk=;
        b=QKwGvELHdFxMVIPh1mGwje61vhTMkAiF+aFxaHMi5y7/6GZ1isBa3l3PbKQ4w/JBF+
         B3nE0M+9IvGZqUjMvAmo/I0FoCMM5kpFaD/n75gVNyAXlqftW9m4WNcDPHpRkTATCG4n
         ySxIDvIxE1OtBPa/WxtDM3hi6vWmJARr6vl2Y/8Pp3zq03GbDvwUNBP/PfjvL7/PBB6Y
         Y07pzT+HfmUJ+6droz/qRAHYHVHAAPGX00t+3BtmuYG65A/vnOuDV7hi6pbc42VKMgHc
         /CZI1d6H4Fo+j3mJbehebMcDfeDeEZ/MTEpUavlHKMREuXF/KUjILBdPAUIVw50tycDC
         hfKw==
X-Forwarded-Encrypted: i=1; AJvYcCXYEFubI5PTu0VDtM4lw3p9DA5Pu/A0T0plYYnUf/GGutEePRPYE8hfSsDmHmHeoaIA4TR49/9t5VccRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD/vBZXyf6aSsAdgxtNMLyvwRlyh5k/FmHpwwk2gwezsfwRlUU
	nE4hrJY7nez0mPywzB4SOAGVgha4mu+nIQ/pmN43RNzy0CONBNJe+du7g9CfxA==
X-Gm-Gg: ASbGncs28QRNFd/GY1a9+eNINOjkCNwuKMtqXKp2eTlwTocayJ2BaaBMqPA7IAyekIl
	HJuSQRkC8KPyXXsSSdAFFCjWoNeo7Q/5yhNMEm5o+tiCTaGfkpt/HCoZP30rk4ZCT8XNKTEvuSM
	b53hKXiJVvp7TY0yQf7VQUoBUskhcbbpCszVIsqP9ENcUA2L9S9QxOIeUavh520iodBV2BFIGAC
	Wb+VTNHil4Lo49EjBt6GvnoYvsn5TC0RvHH6tEUezxpXv8mFvze8A9kKEp+3jsywoI5e8MtQVXx
	2mmlhqUYoEjTBOAtpPztMsO89ABHaKoyFBYWx7cexDlkbz8QgdHMrvJk8s0CHn32YyN+tTIy
X-Google-Smtp-Source: AGHT+IF7sSGBhp3GPgZs/6zIUASVzRs0/32vLn2f7+jmPw+exeJNlnbAKCbgqdOEVPuoFGNIT6O/Vw==
X-Received: by 2002:a17:903:1946:b0:216:7aaa:4c5f with SMTP id d9443c01a7336-22de6ebc2f6mr21395ad.3.1745862756998;
        Mon, 28 Apr 2025 10:52:36 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f77032f9sm7553154a12.15.2025.04.28.10.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:52:36 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:52:26 +0000
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
Subject: Re: [PATCH v2 03/22] iommufd/viommu: Allow driver-specific user data
 for a vIOMMU object
Message-ID: <aA_AWhJGFWwAzRUl@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7031ae5ab6f625e73dbd51b074c2ff8a9923c731.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7031ae5ab6f625e73dbd51b074c2ff8a9923c731.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:57:58PM -0700, Nicolin Chen wrote:
> The new type of vIOMMU for tegra241-cmdqv driver needs a driver-specific
> user data. So, add data_len/uptr to the iommu_viommu_alloc uAPI and pass
> it in via the viommu_alloc iommu op.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Acked-by: Pranjal Shrivastava <praan@google.com>

> ---
>  include/uapi/linux/iommufd.h   | 6 ++++++
>  drivers/iommu/iommufd/viommu.c | 8 +++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index f29b6c44655e..cc90299a08d9 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -965,6 +965,9 @@ enum iommu_viommu_type {
>   * @dev_id: The device's physical IOMMU will be used to back the virtual IOMMU
>   * @hwpt_id: ID of a nesting parent HWPT to associate to
>   * @out_viommu_id: Output virtual IOMMU ID for the allocated object
> + * @data_len: Length of the type specific data
> + * @__reserved: Must be 0
> + * @data_uptr: User pointer to an array of driver-specific virtual IOMMU data
>   *
>   * Allocate a virtual IOMMU object, representing the underlying physical IOMMU's
>   * virtualization support that is a security-isolated slice of the real IOMMU HW
> @@ -985,6 +988,9 @@ struct iommu_viommu_alloc {
>  	__u32 dev_id;
>  	__u32 hwpt_id;
>  	__u32 out_viommu_id;
> +	__u32 data_len;
> +	__u32 __reserved;
> +	__aligned_u64 data_uptr;
>  };
>  #define IOMMU_VIOMMU_ALLOC _IO(IOMMUFD_TYPE, IOMMUFD_CMD_VIOMMU_ALLOC)
>  
> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index fffa57063c60..a65153458a26 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -17,6 +17,11 @@ void iommufd_viommu_destroy(struct iommufd_object *obj)
>  int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  {
>  	struct iommu_viommu_alloc *cmd = ucmd->cmd;
> +	const struct iommu_user_data user_data = {
> +		.type = cmd->type,
> +		.uptr = u64_to_user_ptr(cmd->data_uptr),
> +		.len = cmd->data_len,
> +	};
>  	struct iommufd_hwpt_paging *hwpt_paging;
>  	struct iommufd_viommu *viommu;
>  	struct iommufd_device *idev;
> @@ -48,7 +53,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  	}
>  
>  	viommu = ops->viommu_alloc(idev->dev, hwpt_paging->common.domain,
> -				   ucmd->ictx, cmd->type, NULL);
> +				   ucmd->ictx, cmd->type,
> +				   user_data.len ? &user_data : NULL);
>  	if (IS_ERR(viommu)) {
>  		rc = PTR_ERR(viommu);
>  		goto out_put_hwpt;
> -- 
> 2.43.0
> 
