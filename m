Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6FF28313D
	for <linux-tegra@vger.kernel.org>; Mon, 23 Jun 2025 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691646; cv=none; b=DQ61joJkybHQzGuMAMs1JDc96fcOcYDluPZkqIfQ53O2TNxFvwt6GmoPctfak85T52uMyLR0GQ0nHIqsGKwFy+3h8JX5v5geCIeBigHAouR5GFrBvELwRT7B/Lw5Aiy8z9w4K1+jAPxdtsldvqkytMbnI3kpE3snvdxFvBZI/ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691646; c=relaxed/simple;
	bh=T97FIRu7KTdXAKAuE2uiR/N85Qp0pQvg5x4paRRjBE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vr+++J6gstwyS7yjNeElarlcN33p2mk5v4OJ9TXAiweCkmufKM/IZ0OlaAq0+2hPwM52tIMt07wEwbvySvag8DUyN4MEw4pol/IZDTJmkK/tZtdhI8Scl7u9Mpw4tAF7sZ0yzbVAT5eIv6xhmqnf7f4oZZclV0GJUiKNIHHRe5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VKkhY7Ta; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VKkhY7Ta"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235e389599fso345365ad.0
        for <linux-tegra@vger.kernel.org>; Mon, 23 Jun 2025 08:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750691644; x=1751296444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQjNcvHYakrNgjIQGLE/wyS2yfZF4798fujbYGUPWpc=;
        b=VKkhY7Ta928BptYCHJVYvcLh5d5S42bzKA+iRJ+oEn0vaAOt9h0TsdKx0TVjsG5sH4
         Z4q93H89iMYgYf0aYTsAgCNfxEn9VdxmzIGv5nStyrSyPIKbxJo9juXqmMMNq7ECHFDx
         B8JomsblSvNpl/fEvJo6R4/YPa9gv3aZKDa1EMjVHvRE+O9+BIZhlH/xK/wIzNWS/YSZ
         u5O5ucng1O3F0A9odAfGrmPgdSFcRgmoE3vaSf9skQt3uezUoJ5cU1m8WFQM9WRytk3B
         +hYacxGBwtbMioE5B0mmYlJdkMqV/80MQguGEMxtequZg9ItcVJDvF+AGxR7FFvPz+ij
         jIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691644; x=1751296444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQjNcvHYakrNgjIQGLE/wyS2yfZF4798fujbYGUPWpc=;
        b=ueETOcuZYvIh2QDOkhkdxGSDYogJ8sDL0aRHlN0efHKt86VWllKDhOgGWEhSTpeDt6
         26TPkqqqzyPM/5sUEq47GB9j6Hd7k70ZgL97AfPuEuHchvfcqHQVxP+KdyqhS6HkEocy
         tC1BiN4+aKdWpaj6CW6CSm3p/zNvo2CK05lVay7vMNhooFKP6LCZF0dUyqfDS2AoZfz7
         GX6VQBC5k+Xlg+ajMCFaJoHvlt34sGF8bSVYderRHe3d1QrrA7nUgPCGaWqynpkxdepZ
         a1iLM14yvvN0ttyj49BdURj2i7lZwudQnkdDiG5poJcy49d9Kx92N6kBD6sCVhylQ5MV
         0zlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTRls5yJF6HZlZl67BF9tl06J6GQ6LGu+697U3aQW88YmDybSLZKtmfUt3JNsHlzA2jMV+w7ezdmdb4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9/vaME1XhNd9/iIWPKNuow4CaIqoNd6kTnpRbQ7wpz8pSP1dX
	z8YIZGluaAjjSmWDN5sKAJYyx0zuRbQY6ARQG3yF7a37qp4pV09u0jvc894bUkA46w==
X-Gm-Gg: ASbGncsRBMz/VIIVmV1r4K5L1nLCFuXmTNb3mVEZmDU87cMSwKIxgParERYupQWRNhq
	NCqt5bbyyiqcnYWMIBtwWEP4x5CBisX5hBIwRod0hOJ4AdxC+05ktQn96pOwNNWBOdfEpjVsJWP
	0a16wYT7Tmc6QOzViRBgQR8xV5ls1DQmazF2/OwmX5g31i7MV2FKYIGX3mOSkOJRLqVgSB1phiZ
	/EsBFqMGC4Z00ASRVwm26J63rkbknMa5qn2sfxSv3f6PZNaTWlW7w8u5/SGASdZu2ILEWpo9+Zm
	8n6qzU8ylVF1LhT7w0ei4yrmh2t/XDfjVVuhRzi8TGVIbChq81WLu1k2gXZ+u8LtoTilVSaAUPD
	v4W1DThzmFV8bRVhW3PGcH27n4xFlo7E=
X-Google-Smtp-Source: AGHT+IFjZuHSmjWz3mlyiiORGjulfaekm2TrngIFHZiE0ZqJkNGQDEFi3n1LBmgMIlW05C9z3Da4aQ==
X-Received: by 2002:a17:902:e951:b0:224:6c8:8d84 with SMTP id d9443c01a7336-237e478a96fmr4808555ad.4.1750691643222;
        Mon, 23 Jun 2025 08:14:03 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e6fbsm11004566a91.14.2025.06.23.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:14:02 -0700 (PDT)
Date: Mon, 23 Jun 2025 15:13:51 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, corbet@lwn.net,
	will@kernel.org, bagasdotme@gmail.com, robin.murphy@arm.com,
	joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
	jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
	nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
	mshavit@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 20/25] iommu/arm-smmu-v3-iommufd: Add hw_info to
 impl_ops
Message-ID: <aFlvLw0SHgYiA614@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>
 <aFP4zHIVT6epJeLb@google.com>
 <20250619185325.GB17127@nvidia.com>
 <aFTWQ4v6aZABpzeV@google.com>
 <aFZE+MhTOCvbkKbH@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFZE+MhTOCvbkKbH@nvidia.com>

On Fri, Jun 20, 2025 at 10:36:56PM -0700, Nicolin Chen wrote:
> On Fri, Jun 20, 2025 at 03:32:19AM +0000, Pranjal Shrivastava wrote:
> > My point is that in-case someone passed INTEL_VTD type, we would end up
> > calling impl_ops->hw_info and then the impl_ops->hw_info shall check for
> > the type to return -EOPNOTSUPP. Either we should clearly mention that
> > each impl_op implementing hw_info *must* add another type and check for
> > it
> 
> Let's add this:
> 
> @@ -721,6 +721,11 @@ struct arm_smmu_impl_ops {
>         int (*init_structures)(struct arm_smmu_device *smmu);
>         struct arm_smmu_cmdq *(*get_secondary_cmdq)(
>                 struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> +       /*
> +        * An implementation should define its own type other than the default
> +        * IOMMU_HW_INFO_TYPE_ARM_SMMUV3. And it must validate the input @type
> +        * to return its own structure.
> +        */
>         void *(*hw_info)(struct arm_smmu_device *smmu, u32 *length, u32 *type);
>         const size_t vsmmu_size;
>         const enum iommu_viommu_type vsmmu_type;
> 
> And I found that we could have another patch changing "u32 *type"
> to "enum iommufd_hw_info_flags *type" to avoid some duplications
> in the kdocs.
> 

Yea, that sounds good. Thanks!

> Thanks
> Nicolin
