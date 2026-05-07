Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88DE3612EF
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145823; cv=none; b=Wo6a33u80AyjddOcW32pTakYW2xFinsUpo4uYknrDUK7oB22O6GdgNZ7IyPxZ6egfP7h5pNzv/8Yej+K2zvJjZxVfh0iX1zN9vXTlmvx8OnB82FVFzG2CMyf916EtZSzA2MtfT39Y+E90QXoNgLJQkUZ8u5LcFnTroa4fFjUEVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145823; c=relaxed/simple;
	bh=GYhQXGTJ7e96abjN4ZfwKko3/U++TfK7EJY7LY9hlJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+K7dkoVWxvZTuZog+vl35e/XNV9IlxZRJ3MHFgsNC3DSSsH6L6eu3033MmiJkE/xEEZ6kRqwD4XuioEUY5sj7rGM2jtCRAVm0YNyRupGKjAdmq/06S8b79dww5GPz6tnT5Um/9q0CBPng27cUklyak1xKkj3dMNMThlSTUrc84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KymPyh3F; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KymPyh3F"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48d1c670255so78005e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145819; x=1778750619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=13Lh/MJGuQyEFBuGKtOzxhjY59QJuViQArYZ+z8Orn8=;
        b=KymPyh3F/nNqVU9ILpMQreGTa5c79eYzn5dVFDukUMDxVCkAF8DnsY6BVt8N4f1cor
         E0YfTU20huonAnOhduq/FLI/KFgdqiF9f4v1mGlXnNi6FltIiGiUor7iz4FxeRwOgHum
         sWwr7wJgawYRfp9taYnHOiN6bXtIVzuzz1UtwrmzvU7vLx3rRqZBalmX4QY2OeyoLYqd
         Y+s+APWbj9DajZVNORVBtgv1Vd0pdTklARuFuyfXr11pLvKdSkhIUIz04pFDg6SY/Sui
         v0knChkoGR19XsGo/CCE/o0Z9dxbdAuUXiCMPumKnLcCfZHEmsmi42yFWrqQyaiuBSvK
         hNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145819; x=1778750619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13Lh/MJGuQyEFBuGKtOzxhjY59QJuViQArYZ+z8Orn8=;
        b=O39TpEtne2jwHJDANGIz7JAuTpQzxzNxoqK6wkcr4quiBRh7nMHBRUXMvu/Snrq1h2
         Kq2cPNTw/l37/mrV5THFD0eRAfeAsUnaCOk2J9gMIZr80N1CuVNDhNday2z7MM4h50zC
         fUAV0TgMs8P7O6hsGhtZYSCFG7+7pEVu5Ju8ZtD/nIgtPZltR4cI4PF1VxX6VH63+LbS
         89TASCt/NJn81aI7Xo/pzRs/MWvI1/yL38OJ+iN8mbBTlyKzu45+N17pi4D7Ct/L3K7Q
         1dtBP/NeD5npBAN8fDdwUDcQVQbw86ILKpxO5T4HfWSYxWBq16uYfWd/icBNh7Bd8AEX
         tzpA==
X-Forwarded-Encrypted: i=1; AFNElJ/V2WTyDYUFHLDiMjiE+zAgG4Q5YGmWI1pZsEjJ2CVGcwL4ziYywBfAWoymke6Ct22Ju2Gz+ogRHOSyKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj7AKVew6uo/lGp7X9g52t0/eFqQDEqm8cuiX+SmGMqToaI8x4
	Shbr5Mo1RxZ56kmRkKrN7CbnrH9YRDPGhX/Sadg+6sJWl74n/tQyqDso76lH2mq7fw==
X-Gm-Gg: AeBDietTqAr0gLxkX3Llv+5upS+BuPGt9vjKlK0vlt5cKSJME/QwrtpS2b51cYK/Xx/
	ZTkJLTngOfdo7ZZA4o1lBGOSOtkayE0sp7bjyHYhsoPFqUm8F4MMkS16J9sU7cAZF5dKg7KIiHF
	gtTRNFE/XKmHF/Iy04Law/N/y8DzZffMZK8BNoorGHD4zwyq6hHb6qPYGy5rjTF6wnvj/hnR59P
	iDcAZhcEFm0oJIr2GmprjkOvxW2YV11d+829Jz+e3u46wh4aJ4qctnCXSK2FT6S2vygx4H71Yyf
	vkDZVEZ9tvxh48rseR4N/StS7VMCQNpJCGRFLclp62geQgKpmQpgPt7Y5/cXw9bAo9Gare2xkaG
	vAvTZm99/Tih0BtHmRHp9ZxVV/4xU04VhjyuHyXJhEagXGGEl1VNi3tr4iZBk71dC6INqePf+tz
	AHcISivJMdKIW9p344ZIO/dMSIO0GLWLJWCMooVmCIS9gWP/pULzggfbZ8Vk93gkJR7o7vteyUE
	C9obg==
X-Received: by 2002:a05:600c:2284:b0:488:960f:60b8 with SMTP id 5b1f17b1804b1-48e5d64bc85mr781205e9.6.1778145818767;
        Thu, 07 May 2026 02:23:38 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5314b989sm36568205e9.30.2026.05.07.02.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:23:38 -0700 (PDT)
Date: Thu, 7 May 2026 09:23:34 +0000
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
Subject: Re: [PATCH 7/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_ATC_INV
Message-ID: <afxaFjFf2c5R6jAc@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <7-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:16AM -0300, Jason Gunthorpe wrote:
> Add a new command make function and convert all the places using
> ATC_INV.
> 
> Split out full invalidation to directly make the cmd instead of
> overloading size=0 to mean full invalidation.

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 59 ++++++++-------------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 27 +++++++---
>  2 files changed, 40 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index f9c25ca9a9e7b8..0cdf0752ff6d62 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -308,14 +308,6 @@ static int arm_smmu_cmdq_build_cmd(struct arm_smmu_cmd *cmd_out,
>  	case CMDQ_OP_TLBI_EL2_ASID:
>  		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
>  		break;
> -	case CMDQ_OP_ATC_INV:
> -		cmd[0] |= FIELD_PREP(CMDQ_0_SSV, ent->substream_valid);
> -		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_GLOBAL, ent->atc.global);
> -		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_SSID, ent->atc.ssid);
> -		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_SID, ent->atc.sid);
> -		cmd[1] |= FIELD_PREP(CMDQ_ATC_1_SIZE, ent->atc.size);
> -		cmd[1] |= ent->atc.addr & CMDQ_ATC_1_ADDR_MASK;
> -		break;
>  	case CMDQ_OP_CMD_SYNC:
>  		if (ent->sync.msiaddr) {
>  			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
> @@ -2371,9 +2363,8 @@ static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>  	return IRQ_WAKE_THREAD;
>  }
>  
> -static void
> -arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
> -			struct arm_smmu_cmdq_ent *cmd)
> +static struct arm_smmu_cmd
> +arm_smmu_atc_inv_to_cmd(u32 sid, int ssid, unsigned long iova, size_t size)
>  {
>  	size_t log2_span;
>  	size_t span_mask;
> @@ -2395,17 +2386,6 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
>  	 * This has the unpleasant side-effect of invalidating all PASID-tagged
>  	 * ATC entries within the address range.
>  	 */
> -	*cmd = (struct arm_smmu_cmdq_ent) {
> -		.opcode			= CMDQ_OP_ATC_INV,
> -		.substream_valid	= (ssid != IOMMU_NO_PASID),
> -		.atc.ssid		= ssid,
> -	};
> -
> -	if (!size) {
> -		cmd->atc.size = ATC_INV_SIZE_ALL;
> -		return;
> -	}
> -
>  	page_start	= iova >> inval_grain_shift;
>  	page_end	= (iova + size - 1) >> inval_grain_shift;
>  
> @@ -2434,24 +2414,25 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
>  
>  	page_start	&= ~span_mask;
>  
> -	cmd->atc.addr	= page_start << inval_grain_shift;
> -	cmd->atc.size	= log2_span;
> +	return arm_smmu_make_cmd_atc_inv(sid, ssid,
> +					 page_start << inval_grain_shift,
> +					 log2_span);
>  }
>  
>  static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
>  				   ioasid_t ssid)
>  {
>  	int i;
> -	struct arm_smmu_cmdq_ent cmd;
> +	struct arm_smmu_cmd cmd;
>  	struct arm_smmu_cmdq_batch cmds;
>  
> -	arm_smmu_atc_inv_to_cmd(ssid, 0, 0, &cmd);
> -
> -	arm_smmu_cmdq_batch_init(master->smmu, &cmds, &cmd);
> -	for (i = 0; i < master->num_streams; i++) {
> -		cmd.atc.sid = master->streams[i].id;
> -		arm_smmu_cmdq_batch_add(master->smmu, &cmds, &cmd);
> -	}
> +	cmd = arm_smmu_make_cmd_atc_inv_all(0, IOMMU_NO_PASID);
> +	arm_smmu_cmdq_batch_init_cmd(master->smmu, &cmds, &cmd);
> +	for (i = 0; i < master->num_streams; i++)
> +		arm_smmu_cmdq_batch_add_cmd(
> +			master->smmu, &cmds,
> +			arm_smmu_make_cmd_atc_inv_all(master->streams[i].id,
> +						      ssid));
>  
>  	return arm_smmu_cmdq_batch_submit(master->smmu, &cmds);
>  }
> @@ -2650,14 +2631,16 @@ static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
>  			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
>  			break;
>  		case INV_TYPE_ATS:
> -			arm_smmu_atc_inv_to_cmd(cur->ssid, iova, size, &cmd);
> -			cmd.atc.sid = cur->id;
> -			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
> +			arm_smmu_cmdq_batch_add_cmd(
> +				smmu, &cmds,
> +				arm_smmu_atc_inv_to_cmd(cur->id, cur->ssid,
> +							iova, size));
>  			break;
>  		case INV_TYPE_ATS_FULL:
> -			arm_smmu_atc_inv_to_cmd(IOMMU_NO_PASID, 0, 0, &cmd);
> -			cmd.atc.sid = cur->id;
> -			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
> +			arm_smmu_cmdq_batch_add_cmd(
> +				smmu, &cmds,
> +				arm_smmu_make_cmd_atc_inv_all(cur->id,
> +							      IOMMU_NO_PASID));
>  			break;
>  		default:
>  			WARN_ON_ONCE(1);
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 10b3d95d9ee660..194f73cabef5c9 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -552,6 +552,25 @@ static inline struct arm_smmu_cmd arm_smmu_make_cmd_pri_resp(u32 sid, u32 ssid,
>  	return cmd;
>  }
>  
> +static inline struct arm_smmu_cmd arm_smmu_make_cmd_atc_inv(u32 sid, u32 ssid,
> +							    u64 addr, u8 size)
> +{
> +	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(CMDQ_OP_ATC_INV);
> +
> +	cmd.data[0] |= FIELD_PREP(CMDQ_0_SSV, ssid != IOMMU_NO_PASID) |
> +		       FIELD_PREP(CMDQ_ATC_0_SSID, ssid) |
> +		       FIELD_PREP(CMDQ_ATC_0_SID, sid);
> +	cmd.data[1] |= FIELD_PREP(CMDQ_ATC_1_SIZE, size) |
> +		       (addr & CMDQ_ATC_1_ADDR_MASK);
> +	return cmd;
> +}
> +
> +static inline struct arm_smmu_cmd arm_smmu_make_cmd_atc_inv_all(u32 sid,
> +								u32 ssid)
> +{
> +	return arm_smmu_make_cmd_atc_inv(sid, ssid, 0, ATC_INV_SIZE_ALL);
> +}
> +
>  /* Event queue */
>  #define EVTQ_ENT_SZ_SHIFT		5
>  #define EVTQ_ENT_DWORDS			((1 << EVTQ_ENT_SZ_SHIFT) >> 3)
> @@ -630,14 +649,6 @@ struct arm_smmu_cmdq_ent {
>  			u64			addr;
>  		} tlbi;
>  
> -		struct {
> -			u32			sid;
> -			u32			ssid;
> -			u64			addr;
> -			u8			size;
> -			bool			global;
> -		} atc;
> -
>  		struct {
>  			u64			msiaddr;
>  		} sync;
> -- 
> 2.43.0
> 
