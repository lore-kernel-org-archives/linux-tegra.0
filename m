Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236D83B95EB
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145720; cv=none; b=IjzmN2F9hx9mKWBpqMzxgTsPFKrC/V2LHLpTZPJXcm0TCiXHZXwoWG8Jp+csPrps7r4WOn7OcQbdRcu6bY6oYkxthkZn3qjnEeuYI3/AnbWWxL+SIH2J5tQHaGyJBlRilYQeOUD6D1RY6Hwq6eaDw8ZiKqKuO9QY5V/Z5A98DJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145720; c=relaxed/simple;
	bh=Y+2uaDuH043UZZOsd5GAUdfC443ZMhzc9LRqy42EnQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWD666s+Gzt1oddbwZ46BzCzMXj96GNOQYMQsoUb4Prdrx/1PEefMsH8xXM3G66rAQyKQF+49MAl4NFc9fm27DXLn4b2PDJviwd6tKrUi8I3PHHbRNpRBNJJVyDbhQ1g+BksN5hb8M48KHbzdDEwZB8eDyIYjh7f4wOPMbGKLVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cZCLpkAu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cZCLpkAu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so65235e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 02:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145713; x=1778750513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p6/FxwSPka5p8DLF5a7pAUL11onK6T+zgOvQ6IlI4aw=;
        b=cZCLpkAuQMzznhN+GbpaLXgg2x4KEaBEqTn54ojfxtBVRIzv609buJ6N8JtW0rQcZ+
         pelbYcNweoJHcMBgj7WcQOz+rcWIFbTY0YPvgAdY7PSd7zE9sf6wN2+4lU89FFfQ6eT3
         pJH2h7o8HfOACJBCtq57c78QEFMm9Iyeh5zHrv01lERZf5sGRRo4/e17U8NS0auD/Jyh
         hR9I+ycgU+uybR9egAKQSJaATde4jpDnbjPg1SaSmTfP4wRON5upXbeNPwwqwcBRVBsC
         HQ5dV/8/tIfEp6ke2kJwdaQ379XoQUsahONnYdypQFtlxQ8vLquj1XHDQG7QsoFzYJ3J
         9D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145713; x=1778750513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6/FxwSPka5p8DLF5a7pAUL11onK6T+zgOvQ6IlI4aw=;
        b=Rfie8ICiMQeA/6u/PPXl4a5WGRWtF+dThMqaoYemOelJRld1EHPnMh0JdGi0Ci3CPY
         PAwHiMu3Idc7dT06gTQ0R8N6dHgd8GWehWtQTXRZTWGi4j7bdg0k43K7+q3zUHQp3LPD
         3DsXwc+DX9/jXo4iOTIREBMERfWeYAUwDjroww0/+A/EL3LzMtSgoMeseQRBjCmAHa67
         LDQua0L6mbeOgjm0KxzoEF23d4/KGZpUivOJZhMEAlmwlWadzE+3qK47zK6C7WwXHSD1
         DEHdpaCo1Za9DgfN2E7PtxF2qbBP6WXTPpm9PQsoZdMY9qvDesghHHSclaj8TQQOWmGw
         3MQg==
X-Forwarded-Encrypted: i=1; AFNElJ+KWE3AynFuSXj3w7yz2MK/Oa1wj5sYR181b/WdxPFg4SSQ3mlkjiHWlUVnMj/pZlNNfQepvQ8nY2I/0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0JDB1QOVWeMjE8XoqKDRybc7x2iAQCMPtmcowTYgd9YH2h8wP
	G5PvfKo9ARqy8vQe2bnZ95LkOXg99S1+09KAqGczVJCKg/Z+qHx+Uf2sPdXWUHpXUg==
X-Gm-Gg: AeBDieu8qpzDAUS5D8eJtmrxaA7j5Wgk67sgX1JXGtm0THjlAwR3sSQ7uNNqPMuRO2Y
	mL76R0/8Bp15D5SQbLubH3ux9qtn95Drfqik+usE39jQ6TLhiP8VmMjqb/oOjqD27Wze8v0oShH
	NtR57dOybl1pfQQCQhLEwZpaEZOOTNE4lzOA9J765Ped0gxZwcDZdiK6sGmKI8M/D6D9JYPhsh6
	PLGkth51X7rNFJZLcNH8NneO2r1jujZmVdVz3lU7t+9izBR8bUNWxTws213pDjO6R/2IDZQUhp/
	pMYKDUjx3Eg1VKNv6YGBaMLk2G156RCk66/DR+hkotSNgmPCOYgua0xArk2tUCK13H2KCfSIBE8
	+HX+4FEylI9NVqfVzSB8LdPxfLHE4cv0uvRk12/TBbEKmg8+wdc75olWXi4fBbZgti4awtSlFTk
	OcepyNnWEv0Dcq4tsssAaCMMdBTP8UYM0Ie2kIN5qjG73OwT8kgVHT1x+3cgkcwLvEAOIWExTPu
	N4GBg==
X-Received: by 2002:a05:600d:8450:10b0:489:1ace:d0d3 with SMTP id 5b1f17b1804b1-48e52d0a34fmr1539495e9.3.1778145712369;
        Thu, 07 May 2026 02:21:52 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960973sm18969938f8f.30.2026.05.07.02.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:21:51 -0700 (PDT)
Date: Thu, 7 May 2026 09:21:48 +0000
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
Subject: Re: [PATCH 3/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq
 submission functions
Message-ID: <afxZrBaz0YZ9XF2u@google.com>
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

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 53 ++++++++++++---------
>  1 file changed, 30 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 5cdeaec890592f..67d23e9c54804e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -921,31 +921,23 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  }
>  
>  static int __arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> -				     struct arm_smmu_cmdq_ent *ent,
> +				     struct arm_smmu_cmd *cmd,
>  				     bool sync)
>  {
> -	struct arm_smmu_cmd cmd;
> -
> -	if (unlikely(arm_smmu_cmdq_build_cmd(cmd.data, ent))) {
> -		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
> -			 ent->opcode);
> -		return -EINVAL;
> -	}
> -
>  	return arm_smmu_cmdq_issue_cmdlist(
> -		smmu, arm_smmu_get_cmdq(smmu, &cmd), cmd.data, 1, sync);
> +		smmu, arm_smmu_get_cmdq(smmu, cmd), cmd->data, 1, sync);
>  }
>  
>  static int arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> -				   struct arm_smmu_cmdq_ent *ent)
> +				   struct arm_smmu_cmd *cmd)
>  {
> -	return __arm_smmu_cmdq_issue_cmd(smmu, ent, false);
> +	return __arm_smmu_cmdq_issue_cmd(smmu, cmd, false);
>  }
>  
>  static int arm_smmu_cmdq_issue_cmd_with_sync(struct arm_smmu_device *smmu,
> -					     struct arm_smmu_cmdq_ent *ent)
> +					     struct arm_smmu_cmd *cmd)
>  {
> -	return __arm_smmu_cmdq_issue_cmd(smmu, ent, true);
> +	return __arm_smmu_cmdq_issue_cmd(smmu, cmd, true);
>  }
>  
>  static void arm_smmu_cmdq_batch_init_cmd(struct arm_smmu_device *smmu,
> @@ -1013,6 +1005,7 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
>  	struct arm_smmu_cmdq_ent cmd = {0};
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
>  	int sid = master->streams[0].id;
> +	struct arm_smmu_cmd hw_cmd;
>  
>  	if (WARN_ON(!master->stall_enabled))
>  		return;
> @@ -1032,7 +1025,9 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
>  		break;
>  	}
>  
> -	arm_smmu_cmdq_issue_cmd(master->smmu, &cmd);
> +	arm_smmu_cmdq_build_cmd(hw_cmd.data, &cmd);
> +	arm_smmu_cmdq_issue_cmd(master->smmu, &hw_cmd);
> +
>  	/*
>  	 * Don't send a SYNC, it doesn't do anything for RESUME or PRI_RESP.
>  	 * RESUME consumption guarantees that the stalled transaction will be
> @@ -1861,14 +1856,16 @@ static void arm_smmu_ste_writer_sync_entry(struct arm_smmu_entry_writer *writer)
>  {
>  	struct arm_smmu_ste_writer *ste_writer =
>  		container_of(writer, struct arm_smmu_ste_writer, writer);
> -	struct arm_smmu_cmdq_ent cmd = {
> +	struct arm_smmu_cmdq_ent ent = {
>  		.opcode	= CMDQ_OP_CFGI_STE,
>  		.cfgi	= {
>  			.sid	= ste_writer->sid,
>  			.leaf	= true,
>  		},
>  	};
> +	struct arm_smmu_cmd cmd;
>  
> +	arm_smmu_cmdq_build_cmd(cmd.data, &ent);
>  	arm_smmu_cmdq_issue_cmd_with_sync(writer->master->smmu, &cmd);
>  }
>  
> @@ -1896,11 +1893,13 @@ static void arm_smmu_write_ste(struct arm_smmu_master *master, u32 sid,
>  	/* It's likely that we'll want to use the new STE soon */
>  	if (!(smmu->options & ARM_SMMU_OPT_SKIP_PREFETCH)) {
>  		struct arm_smmu_cmdq_ent
> -			prefetch_cmd = { .opcode = CMDQ_OP_PREFETCH_CFG,
> +			prefetch_ent = { .opcode = CMDQ_OP_PREFETCH_CFG,
>  					 .prefetch = {
>  						 .sid = sid,
>  					 } };
> +		struct arm_smmu_cmd prefetch_cmd;
>  
> +		arm_smmu_cmdq_build_cmd(prefetch_cmd.data, &prefetch_ent);
>  		arm_smmu_cmdq_issue_cmd(smmu, &prefetch_cmd);
>  	}
>  }
> @@ -2328,7 +2327,7 @@ static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
>  		 evt[1] & PRIQ_1_ADDR_MASK);
>  
>  	if (last) {
> -		struct arm_smmu_cmdq_ent cmd = {
> +		struct arm_smmu_cmdq_ent ent = {
>  			.opcode			= CMDQ_OP_PRI_RESP,
>  			.substream_valid	= ssv,
>  			.pri			= {
> @@ -2338,7 +2337,9 @@ static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
>  				.resp	= PRI_RESP_DENY,
>  			},
>  		};
> +		struct arm_smmu_cmd cmd;
>  
> +		arm_smmu_cmdq_build_cmd(cmd.data, &ent);
>  		arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>  	}
>  }
> @@ -3446,6 +3447,7 @@ arm_smmu_install_new_domain_invs(struct arm_smmu_attach_state *state)
>  static void arm_smmu_inv_flush_iotlb_tag(struct arm_smmu_inv *inv)
>  {
>  	struct arm_smmu_cmdq_ent cmd = {};
> +	struct arm_smmu_cmd hw_cmd;
>  
>  	switch (inv->type) {
>  	case INV_TYPE_S1_ASID:
> @@ -3460,7 +3462,8 @@ static void arm_smmu_inv_flush_iotlb_tag(struct arm_smmu_inv *inv)
>  	}
>  
>  	cmd.opcode = inv->nsize_opcode;
> -	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, &cmd);
> +	arm_smmu_cmdq_build_cmd(hw_cmd.data, &cmd);
> +	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, &hw_cmd);
>  }
>  
>  /* Should be installed after arm_smmu_install_ste_for_dev() */
> @@ -4823,7 +4826,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  {
>  	int ret;
>  	u32 reg, enables;
> -	struct arm_smmu_cmdq_ent cmd;
> +	struct arm_smmu_cmdq_ent ent;
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
> -- 
> 2.43.0
> 
