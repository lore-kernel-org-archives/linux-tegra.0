Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31132371CE2
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778228856; cv=none; b=J5/EpuDm6zRQHFMaE3eVZEPhOhqq+NTcK+LVYMU2l/xt/8EpfbeoFv70iXc7McZZ0GU/uyXBZrwpy3IrFm7w50XfFadfVkG4DZC9K2OXGaaCAfENrBZWboAZJC6/7E4F93dO1e8yD0vYAi+A18MrZ34WvnD8bR87iVBZVcald4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778228856; c=relaxed/simple;
	bh=TPaZ33vKz8ckmmfqhsRhAsbf/FyT1EBhjrMlFwobtPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKU5jK6TXLWrnM+4fEcsIuC7DBazrok/ZFLmLNbigHsCYB4Wpbcl/qqGrcMahca3FepvITJIL0hvMkCcFAjpOm2UCfRoFQodizEcZUDbPoI4wQasvi3oKcuuPma3jvAihU0JJ6VeeLIIo7k/p+R+Wjt2cF6VkZgMpmeseOp1W8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OYnxdLfb; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OYnxdLfb"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so58235ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 01:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778228853; x=1778833653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TI/RPl3Hg34kw3CTOvuA/w8S/bd5TVv8Y9GL2bltAt8=;
        b=OYnxdLfbfH/Cs0hdopbLFrewxkrNX82saozS4H2GLMQ3KZjlHHs81sVUe7QI91j344
         V3eA427ipjvDdQ+w6P3QAh5UM5TSNOodELJXlKCNQLMhXyI1quk6Bx1IaMJ7j8eisb1S
         K4gLOIf4SYvPQrVTyOMkawTXMM5QyWf2CH2p3oGa7qgnyT5mSGdJODlhAPxz5A5RGmkL
         /NHhbDRDum4V944bCHjq74xXfqL4KEVpB2sM6bHIXLcLpZjqlqRbbmfHVwo+pzXTwWtJ
         m3Q0WK+KwDX9Vxzv9EzP6tQ/zWF09gYLdALqFObWtHVIhnx+6WGbN+I68a6ZncZryQTN
         n8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778228853; x=1778833653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TI/RPl3Hg34kw3CTOvuA/w8S/bd5TVv8Y9GL2bltAt8=;
        b=SmWs7yksX4gY39CTr8Wlmb74X9lp2lRNruxIw/d+Vr2iM+rPMflxh1DTHg4IBKiVpu
         1h1e/PG1VbuMzbSdDMFqQt7roWRRby3hgujk4RMuOgp2e4Dke6FwLbNt3+awgQsCnKZn
         iX17GFBbhtr3UdbAtMkMGAQxVxqPx8BZFibIIap4NE//957hfGp7lIhgDsXaN7AMJc72
         iqLKuL+bP8XYpA39sE/yTZkBMTT3AOfqvUJ4jGiVmaqbyRVn7XIoJYM5+JcRg54j2gua
         SvbkHi20SPYN2kiBvTR61uqvxinOnz/8lQEYxZBoVVaXjj4Hvxb+DKSdwy7o2gPk4eUN
         oJpA==
X-Forwarded-Encrypted: i=1; AFNElJ8oWmzOkiwsiR8yHqsg6hOyjxxTIrfLM/CeJaX7xOXfcrytRMkQigkI2guHvrJrS+XkI4erdQCF8nmGiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/TX1tpe6Ho8MHUDkgkwgf3pkRZfETp/w7EJkQKSgt12cNpLXZ
	SbZJYn+x1kip4BrSn3/dqrI0s7RK9ojERxAF+iIh3VuR4g+P9h+lcUCWCWMoBtjRZA==
X-Gm-Gg: Acq92OHOYgrm3SiPPPUssR+vg5qAIbOu08eOIWt5d+FZvx5H07/1hyOWNHFh0fdoiGj
	a3KpEgyDU0IAN98baqiOXCxJ3YHRk2nJPVZyFmYaGG04f6GrqZrqM3x4J/pZYZf0rG+GB//Egjf
	eGTIzBQvhrawgSVjc9Pw7ovIsgL1rW8OX0MvmhCwTDmqTyeHWrx5yQoT1O7IdcfAYFjAqSYZ+EK
	Cq5uRK5YL+gyz7JFfoEvzzNpkK5KIffIWBFV+FPRXzLga+udXSbtzPL2xMn7BczpGasvyMHbAJZ
	ClcYGU67ZjfyNIJJ+dYM/zzCVeGbJ9fJqOjOJ3DkgkyxKNQ1zNX+tOA7sQsn/1cqK/wBvgA5r75
	8O2K8wqzIz3I3/4h7TPRS8IKQEHDtxwNEtkJDUsikARD6cPDqXBiGAgfj/kEGFxvjfv8dqpiMnX
	QAs0Ocz3fK3oPLx21cQxE0yQYGC0/gNVqIsacjSuj1OgmoQkubS7Gnwvt7BikKAd7A/C6T
X-Received: by 2002:a17:903:94d:b0:2ba:3b89:c3a5 with SMTP id d9443c01a7336-2bae9e68555mr3019705ad.12.1778228852902;
        Fri, 08 May 2026 01:27:32 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eac3afsm14480765ad.71.2026.05.08.01.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:27:32 -0700 (PDT)
Date: Fri, 8 May 2026 08:27:26 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 3/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq
 submission functions
Message-ID: <af2ebtfgOPzJMXFK@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <3-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:12AM -0300, Jason Gunthorpe wrote:
> Continue removing struct arm_smmu_cmdq_ent in favour of the HW based
> struct arm_smmu_cmd. Switch the lower level issue commands to work on
> the native struct by lifting arm_smmu_cmdq_build_cmd() into all the
> callers.
> 
> Following patches will revise each of the arm_smmu_cmdq_build_cmd()
> call sites to replace it with the HW struct.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 53 ++++++++++++---------
>  1 file changed, 30 insertions(+), 23 deletions(-)
> 

[----- >8 ------]

>  /* Should be installed after arm_smmu_install_ste_for_dev() */
> @@ -4823,7 +4826,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  {
>  	int ret;
>  	u32 reg, enables;
> -	struct arm_smmu_cmdq_ent cmd;
> +	struct arm_smmu_cmdq_ent ent;

This shouldn't be uninitialized, we only seem to be setting ent.opcode
later in the function. Since arm_smmu_cmdq_build_cmd reads other fields
of ent to build the cmd, we are potentially sending stack garbage in ent

At all other places we're correctly initializing ent. So, I believe only
in device_reset we must change it to struct arm_smmu_cmdq_ent ent = {};

> +	struct arm_smmu_cmd cmd;
>  
>  	/* Clear CR0 and sync (disables SMMU and queue processing) */
>  	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
> @@ -4870,16 +4874,19 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  	}
>  
>  	/* Invalidate any cached configuration */
> -	cmd.opcode = CMDQ_OP_CFGI_ALL;
> +	ent.opcode = CMDQ_OP_CFGI_ALL;
> +	arm_smmu_cmdq_build_cmd(cmd.data, &ent);
>  	arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  
>  	/* Invalidate any stale TLB entries */
>  	if (smmu->features & ARM_SMMU_FEAT_HYP) {
> -		cmd.opcode = CMDQ_OP_TLBI_EL2_ALL;
> +		ent.opcode = CMDQ_OP_TLBI_EL2_ALL;
> +		arm_smmu_cmdq_build_cmd(cmd.data, &ent);
>  		arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  	}
>  
> -	cmd.opcode = CMDQ_OP_TLBI_NSNH_ALL;
> +	ent.opcode = CMDQ_OP_TLBI_NSNH_ALL;
> +	arm_smmu_cmdq_build_cmd(cmd.data, &ent);
>  	arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  
>  	/* Event queue */

With ent initialization in device_reset addressed. 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
