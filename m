Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889083939B6
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145568; cv=none; b=iDPJNCQlgPWnAxquxeQoAnPXPWLuIfBuIspx+Gk55ku/96wfiZdiLhlCw6P3WC7bUXYANHa4QxkDyQsYn09ceBqG5hUVFVusi2v7d053nuKbNOMkGt4PKrg29QqKImPgqEU7v3EZ1an0F/Z97Z4jvdcYaThDuE4Nmz9hP4UcRq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145568; c=relaxed/simple;
	bh=EZaHkIGeRa8Cqf7NOtrBHdoqBmjyas3YmU01n1qoVnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBmSnj4dnuL33nM37YyjB0OdFJfVcAzytlEL03vguP97om/IBQ0SFGj67ls705JKWICz2el5VO9jDASUVS0kGbDPICyw9AxiFJeWNHxt+k3hRPzzgmFuFB/TrYw3qAcToa4VEz7YZaolSQG9c78IVKidmnQgOnBDkhIFhHj12eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QZe6fiEQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QZe6fiEQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso72965e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 02:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145560; x=1778750360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/1NONxnec+n06CLcBCODwxosB4SRQUb5g6JkJE9QSFI=;
        b=QZe6fiEQFC8nEzvRSpnvqBpqtuI6f//cw2MhXFZMMjUB7HI/QR30j7qllqoySvrq5O
         yifAB5Od2vVp44bse3OmfDWqGLjeQQB4kROsJGh+7L8aicNfRB8/SEILurZRTyfxxB7b
         hCDzrnA76b0xyBiL6QFlttC5X/cktuny3rqzq6CuKaZr/tcVgbcHFi6KaQYb9Uw0TVOc
         HyQkAAL/zBdAKozWiiSNaI1rBMoO7HDOKVQmKzKn2O7L2Guh00ZIo1FY3n+Nx9zK62Rp
         As312uT/wflrFNcEMpI9Jrbi3UbtcYIDGjqBdCfiCHOIJN3mr9jopaRv1NL2R4mKG9Pq
         Y9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145560; x=1778750360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1NONxnec+n06CLcBCODwxosB4SRQUb5g6JkJE9QSFI=;
        b=jDpgXPOPS5oKmpWZxi4SEjzhpNSNIFH6IhoJS80lQ8+GcYMnWhZCmaPje4FJn/dEnl
         Yqk/NpzQnGWZH/N8fkaU+q/Zmmq5x/O/2t5UwuCxKALOdbGn21ypcq4AIhFNI80ZCE9+
         yuM4ttVGXkV288ecltNfp5KuABW4LWxXE2lBI9/EhMDwLBTfWYCD/HUlKw5xplJWCaJz
         NAudZ4wuMIPXec/31SH63hTnDXKpQziBzYYQDa0vTQgOdFH20CuVCAQOGLM3XKqLvLcS
         c1eZq/eJh08lgyL5I9CKs9jcLRWlWhhpfEH9zt9q7nDNmo1Jtfsv29N/2uEKjjm0Y3Nu
         cdhA==
X-Forwarded-Encrypted: i=1; AFNElJ+PX7oaIJvx0nuiKgrtKVNsQspnt2adfJOAEPzWhvXI7hVb2nR5a2kVssJzNfVzRvN/TxhpZofRxP9pNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZONQr91c/+p/aSPgrUvNjhekOQwAbJm4PfQSgh1nZFX0AG8LN
	rDfr7GXMGy0sLFP45+enTyIZJRZHydIWdI8Tz5IesRYTdDChtiXZyZjfx3BeXSOIfg==
X-Gm-Gg: AeBDievUuifOOfMDqGJmHmnc+XrfN1l4BpSfMyYxCCHmEkrffyF4WfsyBMf2oWErTQn
	7bCoPaW/dcunUBoqB5zuz02mJOTiEv4cKf8qzkGHylHwHMOIZ9PqxX08iqGtOgizV/cBfNCE5Vi
	s9r87cQ0IEVBnRXabjwPmWEiqi27BnVX5jQgt2wRGQwaiqbGw2yKh1WNg1p99al6Mio0O5nOJpJ
	VWH4w1m6Bvky1ukfHo3uX0EuG776aTDLivcbHCgnuG1xI5DAHs/v9rMT9VF6zVZYQ+gGc9HHP9R
	KnHplxafDXmmXs53BDLhfA7Tg7L/MhcAp3ewWYLYSVXb2URmbxOD1czchA2q2nW7MgqVERxjGjB
	w9qhfOVXr7LJ3RZ3AYhKdkCfEcz3w+yU4QKgvOdw7ExawnjFMrdTmtKWFuGhiIlQV4zQgTW+Q7e
	HNuwvGeDWF5cfVohcEU9ATYQ0VX2ew+J9dXNKRBPONBqEJiVNy5c4VR0+fXk5PFaCgs4WvBxHmx
	HWB1YkR18puXF9h
X-Received: by 2002:a05:600d:844a:10b0:48a:5d95:d33e with SMTP id 5b1f17b1804b1-48e5d45d196mr626835e9.6.1778145559566;
        Thu, 07 May 2026 02:19:19 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-450524831cdsm20663750f8f.5.2026.05.07.02.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:19:18 -0700 (PDT)
Date: Thu, 7 May 2026 09:19:14 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH 1/9] iommu/arm-smmu-v3: Add struct arm_smmu_cmd to
 represent the HW format command
Message-ID: <afxZEgun2BjHJ-WJ@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <1-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:10AM -0300, Jason Gunthorpe wrote:
> Like STE/CD, add a wrapper struct around the u64 array to represent the
> already FIELD_PREP'd command data. Unlike the STE/CD this is a u64
> because the command submission path will have the swap to le64.
> 
> This makes the API clearer when a u64 is referring to a formatted
> command and makes the following changes easier to follow.
> 
> Move the command constants out of the struct and into an enum alongside
> the rest of the constants defining the HW format so the entire HW format
> is self contained and independent of struct arm_smmu_cmdq_ent.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 48 ++++++++++++---------
>  1 file changed, 28 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index ef42df4753ec4d..092179f689e9f1 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -390,6 +390,10 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
>  
>  #define CMDQ_PROD_OWNED_FLAG		Q_OVERFLOW_FLAG
>  
> +struct arm_smmu_cmd {
> +	u64 data[CMDQ_ENT_DWORDS];
> +};
> +
>  /*
>   * This is used to size the command queue and therefore must be at least
>   * BITS_PER_LONG so that the valid_map works correctly (it relies on the
> @@ -426,6 +430,8 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
>  #define CMDQ_ATC_1_SIZE			GENMASK_ULL(5, 0)
>  #define CMDQ_ATC_1_ADDR_MASK		GENMASK_ULL(63, 12)
>  
> +#define ATC_INV_SIZE_ALL 52
> +
>  #define CMDQ_PRI_0_SSID			GENMASK_ULL(31, 12)
>  #define CMDQ_PRI_0_SID			GENMASK_ULL(63, 32)
>  #define CMDQ_PRI_1_GRPID		GENMASK_ULL(8, 0)
> @@ -447,6 +453,28 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
>  #define CMDQ_SYNC_0_MSIDATA		GENMASK_ULL(63, 32)
>  #define CMDQ_SYNC_1_MSIADDR_MASK	GENMASK_ULL(51, 2)
>  
> +enum arm_smmu_cmdq_opcode {
> +	CMDQ_OP_PREFETCH_CFG = 0x1,
> +	CMDQ_OP_CFGI_STE = 0x3,
> +	CMDQ_OP_CFGI_ALL = 0x4,
> +	CMDQ_OP_CFGI_CD = 0x5,
> +	CMDQ_OP_CFGI_CD_ALL = 0x6,
> +	CMDQ_OP_TLBI_NH_ALL = 0x10,
> +	CMDQ_OP_TLBI_NH_ASID = 0x11,
> +	CMDQ_OP_TLBI_NH_VA = 0x12,
> +	CMDQ_OP_TLBI_NH_VAA = 0x13,
> +	CMDQ_OP_TLBI_EL2_ALL = 0x20,
> +	CMDQ_OP_TLBI_EL2_ASID = 0x21,
> +	CMDQ_OP_TLBI_EL2_VA = 0x22,
> +	CMDQ_OP_TLBI_S12_VMALL = 0x28,
> +	CMDQ_OP_TLBI_S2_IPA = 0x2a,
> +	CMDQ_OP_TLBI_NSNH_ALL = 0x30,
> +	CMDQ_OP_ATC_INV = 0x40,
> +	CMDQ_OP_PRI_RESP = 0x41,
> +	CMDQ_OP_RESUME = 0x44,
> +	CMDQ_OP_CMD_SYNC = 0x46,
> +};
> +
>  /* Event queue */
>  #define EVTQ_ENT_SZ_SHIFT		5
>  #define EVTQ_ENT_DWORDS			((1 << EVTQ_ENT_SZ_SHIFT) >> 3)
> @@ -520,15 +548,10 @@ struct arm_smmu_cmdq_ent {
>  
>  	/* Command-specific fields */
>  	union {
> -		#define CMDQ_OP_PREFETCH_CFG	0x1
>  		struct {
>  			u32			sid;
>  		} prefetch;
>  
> -		#define CMDQ_OP_CFGI_STE	0x3
> -		#define CMDQ_OP_CFGI_ALL	0x4
> -		#define CMDQ_OP_CFGI_CD		0x5
> -		#define CMDQ_OP_CFGI_CD_ALL	0x6
>  		struct {
>  			u32			sid;
>  			u32			ssid;
> @@ -538,16 +561,6 @@ struct arm_smmu_cmdq_ent {
>  			};
>  		} cfgi;
>  
> -		#define CMDQ_OP_TLBI_NH_ALL     0x10
> -		#define CMDQ_OP_TLBI_NH_ASID	0x11
> -		#define CMDQ_OP_TLBI_NH_VA	0x12
> -		#define CMDQ_OP_TLBI_NH_VAA	0x13
> -		#define CMDQ_OP_TLBI_EL2_ALL	0x20
> -		#define CMDQ_OP_TLBI_EL2_ASID	0x21
> -		#define CMDQ_OP_TLBI_EL2_VA	0x22
> -		#define CMDQ_OP_TLBI_S12_VMALL	0x28
> -		#define CMDQ_OP_TLBI_S2_IPA	0x2a
> -		#define CMDQ_OP_TLBI_NSNH_ALL	0x30
>  		struct {
>  			u8			num;
>  			u8			scale;
> @@ -559,8 +572,6 @@ struct arm_smmu_cmdq_ent {
>  			u64			addr;
>  		} tlbi;
>  
> -		#define CMDQ_OP_ATC_INV		0x40
> -		#define ATC_INV_SIZE_ALL	52
>  		struct {
>  			u32			sid;
>  			u32			ssid;
> @@ -569,7 +580,6 @@ struct arm_smmu_cmdq_ent {
>  			bool			global;
>  		} atc;
>  
> -		#define CMDQ_OP_PRI_RESP	0x41
>  		struct {
>  			u32			sid;
>  			u32			ssid;
> @@ -577,14 +587,12 @@ struct arm_smmu_cmdq_ent {
>  			enum pri_resp		resp;
>  		} pri;
>  
> -		#define CMDQ_OP_RESUME		0x44
>  		struct {
>  			u32			sid;
>  			u16			stag;
>  			u8			resp;
>  		} resume;
>  
> -		#define CMDQ_OP_CMD_SYNC	0x46
>  		struct {
>  			u64			msiaddr;
>  		} sync;
> -- 
> 2.43.0
> 
