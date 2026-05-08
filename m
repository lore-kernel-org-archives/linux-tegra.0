Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131503D565E
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240023; cv=none; b=JhmDqlWk41PFLfEyzxpk2ZO90bflddk63zNVe/3XzQ4W8P61h2VNU00KeRSDbY6zMuIYXBjk5qHFKEFIHXu66UR/U3ta2NQWI135z6kjqPeeTbbBD3LrUysljHrPqZZS/cCO+v3tH5ivjPXr1dckQGqDoPsGxyyjZSxB+BS+EOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240023; c=relaxed/simple;
	bh=/8zJOScllfY27di+rf/OBgDiO9wjXvpqeL1239cUesc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nhoox/TMPr4Bce5tVAybZ87RILRp1UXBOGBfFXUPR4oXoyI8FXKTEyuOZ5fh9pe806edgexOYtd1zmKL4BL1e2/1AbPsUxRQ4BL7HNGro17g9aFVJnjYG2hVbexbEsED8e7MBwIQYrzqkLPzTuJhDR7ejv1EhxCP6fEgGhGwXXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t9JE1jGS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t9JE1jGS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba180a022dso73675ad.1
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 04:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778240020; x=1778844820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HLt/hxOkl7aSPqpAf1bFw2IFuOfV/t7jCK+Ije+pMc=;
        b=t9JE1jGSiSD7BKunEdELZtMTCKGgyi6FRBltf2qOKK5TUkXFeKCTlJ8tuiSOFXWJ4P
         aDkA0vj0R83wSVz3qDUcNp1egJFuJSJNV4JQrHSMn7jVdr8rgFERk9WqsIZO1FpLsDvt
         cIeCgkH8ERcjnA/xvhhsVfwjiIAca7h0GpjM0m+IJmy0hGlg0lrYSfa12m5Gp+i0P26V
         DfV8zKTE/q/nu3Qzn3le6pQ+8ScvEaK/LfBR1+4E6dC7F4dUyIMOueHkXaioovrFBIsU
         v/QOFh3IKCjQEhZfsZ0nPTDLekNEP3X2g+4ef9q3jQRrMQiDY0r242EUZrri1eaI/wiQ
         MkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240020; x=1778844820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HLt/hxOkl7aSPqpAf1bFw2IFuOfV/t7jCK+Ije+pMc=;
        b=gVTxB6yTa3miiMD3FHxo5IsRODBGiPu+0SZHzBxPWlV4O4qc7BCn5VuJd83zNa8WDh
         R/6h1hpjMVMtqGMHVOsxyuhbrPxFarQIApaOFKIR8Yt5nDmDDZtow12RCLD4MjpKo4ee
         UvrA2ejMBl6txOg8Tp1rIHbSo60RLEnYytYBtDB5DelRjYCd1B/crFSWsjIvaoqyJJj1
         dS1/TnlkVxDP/ATcYqBhxgx/FiSRTGOPAcfU9y8s7IFJGzBh+ajWu2GSCop3+splU4wH
         2eraJzzo4Td67b0QOy6tfpPESAmS/ErLrFq+rIAeIz3lZBTDCs0OBpbQXjQrRcRT499p
         zkuA==
X-Forwarded-Encrypted: i=1; AFNElJ+QFUhIJu+E/n/IkW/IaQmKueDpe93dHQXt/dl6sB3KGwLfmtkpVj+ZS1unHkFLh+qMNaQhU4cLBDFYmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp26AefBLeqtEMqK6BQ0a3XY0atu8/bN1zkRBqs3DwtXSFa17h
	no2dwoWko7Qe8lsgmdhX8vxD4Xlp8q7ifHSnTqCLz09AfHSvOFMcht9Kqvq9tJAY/A==
X-Gm-Gg: Acq92OGTsEgivRNYTMzzbj8lU1wIr5oMyPhN9Jtfj4h2C7CFPj2Vul329RQsdCIL2WC
	zmrayO60UVs//4LASLO79AZcVXufaL6Az7UZnvwx6iz4mzB65tZwW6P0bpw/ucJP1S+sEyYoAAD
	DP32/DqBNQwUQeRHOqYCKe27jjfZi56xhvkCM581uMT/qj3Jl8DTEmkBtfbTkkJSMID4V0IvHRu
	Hf2xUUENGssEqEhJjRHqQhyQwgRkBO39kkaWftptd9RtCBkxZdRNaF+Cx7F4EPCVeQeNZ9TpTX9
	QFOyYIEPuOBL0QZFrbMEsGG2XwIo75tOpFX+r4TA9Wj/gCpKe1dbv7InhktYytfihMU54lcGER/
	0hfX40Iep/iDlF5AKBQuPPca34L9wnyKOZx/Fsj2gpNrFSZPrfC9O4GCxlKw1atN0Ak1iqDhSR2
	CYdQq3Mlsl7+qGexutsF3mEMaL1U4cdrUoyCZQU1cwN54CMe30h46aeNVxD/18AGx0nx+m
X-Received: by 2002:a17:903:2c9:b0:2ba:30f:33e0 with SMTP id d9443c01a7336-2bae9e99284mr2894105ad.20.1778240019615;
        Fri, 08 May 2026 04:33:39 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36c10sm14982546b3a.25.2026.05.08.04.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:33:39 -0700 (PDT)
Date: Fri, 8 May 2026 11:33:32 +0000
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
Subject: Re: [PATCH 6/9] iommu/arm-smmu-v3: Directly encode simple commands
Message-ID: <af3KDBt8vhClSKEF@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <6-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:15AM -0300, Jason Gunthorpe wrote:
> Add make functions to build commands for
> 
>  CMDQ_OP_TLBI_EL2_ALL
>  CMDQ_OP_TLBI_NSNH_ALL
>  CMDQ_OP_CFGI_ALL
>  CMDQ_OP_PREFETCH_CFG
>  CMDQ_OP_CFGI_STE
>  CMDQ_OP_CFGI_CD
>  CMDQ_OP_RESUME
>  CMDQ_OP_PRI_RESP
> 
> Convert all of these call sites to use the make function instead of
> going through arm_smmu_cmdq_build_cmd(). Use a #define so the general
> pattern is always:
> 
>    arm_smmu_cmdq_issue_cmd(smmu, arm_smmu_make_cmd_XX(..));
> 
> Add arm_smmu_cmdq_batch_add_cmd() which takes struct arm_smmu_cmd
> directly to match the new flow.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 213 +++++++-------------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 109 +++++++---
>  2 files changed, 151 insertions(+), 171 deletions(-)
>

[----- >8 ------]

>  
> -static int __arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> -				     struct arm_smmu_cmd *cmd,
> -				     bool sync)
> +static int arm_smmu_cmdq_issue_cmd_p(struct arm_smmu_device *smmu,
> +				     struct arm_smmu_cmd *cmd, bool sync)

Nit: I'm not sure why we need to rename this? We can still define the 
rest of the helpers like:

#define arm_smmu_cmdq_issue_cmd(smmu, cmd)                      \
	({                                                      \
		struct arm_smmu_cmd __cmd = cmd;                \
		__arm_smmu_cmdq_issue_cmd(smmu, &__cmd, false); \
	})

>  {
>  	return arm_smmu_cmdq_issue_cmdlist(
>  		smmu, arm_smmu_get_cmdq(smmu, cmd), cmd, 1, sync);
>  }
>  
> -static int arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> -				   struct arm_smmu_cmd *cmd)
> -{
> -	return __arm_smmu_cmdq_issue_cmd(smmu, cmd, false);
> -}
> +#define arm_smmu_cmdq_issue_cmd(smmu, cmd)                      \
> +	({                                                      \
> +		struct arm_smmu_cmd __cmd = cmd;                \
> +		arm_smmu_cmdq_issue_cmd_p(smmu, &__cmd, false); \
> +	})
> 
> -static int arm_smmu_cmdq_issue_cmd_with_sync(struct arm_smmu_device *smmu,
> -					     struct arm_smmu_cmd *cmd)
> -{
> -	return __arm_smmu_cmdq_issue_cmd(smmu, cmd, true);
> -}
> +#define arm_smmu_cmdq_issue_cmd_with_sync(smmu, cmd)           \
> +	({                                                     \
> +		struct arm_smmu_cmd __cmd = cmd;               \
> +		arm_smmu_cmdq_issue_cmd_p(smmu, &__cmd, true); \
> +	})
>  
>  static void arm_smmu_cmdq_batch_init_cmd(struct arm_smmu_device *smmu,
>  					 struct arm_smmu_cmdq_batch *cmds,
> @@ -962,14 +924,41 @@ static void arm_smmu_cmdq_batch_init(struct arm_smmu_device *smmu,
>  	arm_smmu_cmdq_batch_init_cmd(smmu, cmds, &cmd);
>  }
>  
> +static void arm_smmu_cmdq_batch_add_cmd_p(struct arm_smmu_device *smmu,
> +					  struct arm_smmu_cmdq_batch *cmds,
> +					  struct arm_smmu_cmd *cmd)

Nit: Same here, why not  __arm_smmu_cmdq_batch_add_cmd? I understand
that _p just means we'll aceept ptr.. but the name's kinda wonky.

> +{
> +	bool force_sync = (cmds->num == CMDQ_BATCH_ENTRIES - 1) &&
> +			  (smmu->options & ARM_SMMU_OPT_CMDQ_FORCE_SYNC);
> +	bool unsupported_cmd;
> +
> +	unsupported_cmd = !arm_smmu_cmdq_supports_cmd(cmds->cmdq, cmd);
> +	if (force_sync || unsupported_cmd) {
> +		arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
> +					    cmds->num, true);
> +		arm_smmu_cmdq_batch_init_cmd(smmu, cmds, cmd);
> +	}
> +
> +	if (cmds->num == CMDQ_BATCH_ENTRIES) {
> +		arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
> +					    cmds->num, false);
> +		arm_smmu_cmdq_batch_init_cmd(smmu, cmds, cmd);
> +	}
> +
> +	cmds->cmds[cmds->num++] = *cmd;
> +}
> +
> +#define arm_smmu_cmdq_batch_add_cmd(smmu, cmds, cmd)               \
> +	({                                                         \
> +		struct arm_smmu_cmd __cmd = cmd;                   \
> +		arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, &__cmd); \
> +	})
> +
>

[----- >8 -----]

>  
>  static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
> @@ -3464,7 +3405,7 @@ static void arm_smmu_inv_flush_iotlb_tag(struct arm_smmu_inv *inv)
>  
>  	cmd.opcode = inv->nsize_opcode;
>  	arm_smmu_cmdq_build_cmd(&hw_cmd, &cmd);
> -	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, &hw_cmd);
> +	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, hw_cmd);

Nit: are we passing it by value here? This would be a 16-byte stack
copy? As with the macro expansion this looks like:

{
	struct arm_smmu_cmd __cmd = hw_cmd; // <-- Redundant 16-byte copy
	arm_smmu_cmdq_issue_cmd_p(inv->smmu, &__cmd, true);
}

Why not use arm_smmu_cmdq_issue_cmd_p(inv->smmu, &hw_cmd, true) ?
Although, I see this is eventually cleaned up in Patch 9.

>  }
>  
>  /* Should be installed after arm_smmu_install_ste_for_dev() */
> @@ -4827,8 +4768,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  {
>  	int ret;
>  	u32 reg, enables;
> -	struct arm_smmu_cmdq_ent ent;

Ah, we remove this unitialized thing here. I guess we should still init
it in the previous patch for consistency.

[---- >8 ----]

>  #define CMDQ_RESUME_0_RESP_TERM		0UL
>  #define CMDQ_RESUME_0_RESP_RETRY	1UL
>  #define CMDQ_RESUME_0_RESP_ABORT	2UL
> @@ -475,6 +481,77 @@ enum arm_smmu_cmdq_opcode {
>  	CMDQ_OP_CMD_SYNC = 0x46,
>  };
>  
> +static inline struct arm_smmu_cmd
> +arm_smmu_make_cmd_op(enum arm_smmu_cmdq_opcode op)
> +{
> +	struct arm_smmu_cmd cmd = {};
> +
> +	cmd.data[0] = FIELD_PREP(CMDQ_0_OP, op);
> +	return cmd;
> +}
> +
> +static inline struct arm_smmu_cmd arm_smmu_make_cmd_cfgi_all(void)
> +{
> +	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(CMDQ_OP_CFGI_ALL);
> +
> +	cmd.data[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);

Maybe this is a good opportunity to define "31"? We already have a 
similar definition for TLBI: #define CMDQ_TLBI_RANGE_NUM_MAX 31

Perhaps we could have: #define CMDQ_CFGI_RANGE_ALL 31

With the above nits:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
