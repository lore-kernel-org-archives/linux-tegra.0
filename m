Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499923D565B
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 20:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778270986; cv=none; b=gsGW5S8bkIMYaClW7sNOps/WptYDtKYlgMHBgodrtttC2bYU5uwKUae+54fQBe70n3qvaWGEhRY223+A0P1dhAJPGnqySK//a+1J8cxjb7p1zgULixjvZFnH/JxBAhh9mra94mGOJBbvWWidrhmjLdMV2iQdeG2RiT0XQI1wvSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778270986; c=relaxed/simple;
	bh=kOkgadq14suwO8KmR+859hipwhbCqWCtsBjZKpFyOnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1Mx7lq0KAMpVI6ieBYqDrMdvmTmwcSfhUT/vKxMsjElnln2XneXyX3K9vZ9maVdH5qHPT895w6LjEFjyWCDArgjl0nv7LqIA29/ytXwcZ9B/GQ1RDcH7iBhP8woGalaZDd1Nszw6Sv2a8qq4ERAqUm5Nv0rwC8Jc4+cjE3xcCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HUxdqF2o; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HUxdqF2o"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so35ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 13:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778270983; x=1778875783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zu32dzAdarKxbcjgwX2AWV9AveqcvXYvabaFeB6Rgag=;
        b=HUxdqF2owS/V5fay4EPpKzgJLUWxNlxo2Mwc0bpGevk63x8hXIhRbDqVgCIGGdEUPE
         LxmmGyMeG4F5EWppLarQI3HVYqQDYQrOrvNuS+JP5eHGQ0JHWwOX+Ng44WrTYtNlGGWC
         Fe2u3HLp6YhKjKhHgp67Lh0VbWtGfLfGv/GC4MiNIUXoGZd0zyTCu2n1YK7hjFShCtGY
         1JI9O3bunPYxPXlAQRqEI0OA8CV1sVt3zG6y60Qbnmap4qaN7lKPx6wA/H1YiyrPjM8R
         LXiy+fBKp0dgqci+NroCEmNov+K851RZGEXIIzHmzWUrNUxwoy3ANl0WFeuKaH8ZlC8J
         Zd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778270983; x=1778875783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zu32dzAdarKxbcjgwX2AWV9AveqcvXYvabaFeB6Rgag=;
        b=qeUAC3vf32BOXphwsVMKb9jLPFUb5ZLCqCQ/f4oXz4LiaDa8HpHEmxkvkjKhZ+c6bJ
         XDnX6kejpkxHtRQAi9e/PTljByCFRAmxLJAwUYN54//VEyeGePz9p4SGtsvqwt6Zlnmn
         VhKRmwOYHsaHRIP29ro+H4Pqj+DTltNWKGdJZSmLgqkd7vEvw5QOcva83Xu++Ino1E5P
         qLb4CR7ZWHiIGekUKnGS3fPQeAl/OPzKgVigwapuhXYHlLyfICvhiHJ0KGrqga1Q4sdT
         3RXJ/FS1PGxmA0NBGsN2bbDvvjMQ1UOoNfRw1+ZhFfwouRQvtRDHcDwQdmoIedFYK2YR
         imow==
X-Forwarded-Encrypted: i=1; AFNElJ9FBXVF0Uvqd3iP8ck7AhAsxKymfE8nqm6nGy/t3WM5NMheCFBayCw0SVGOVLNNq37sqmoaD/B8FEN5GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykZc14dAd1nZR7Ggx2JodE8vTB9G36KsRsRc3Q1lWh31+mRK2p
	/OQaUbZb1M5dY49wgn/LIZIff8ou48ksf7SpDu/xBKF5vnC0Cm9YuCx8D7yct7Vatg==
X-Gm-Gg: Acq92OGMEYaw74kADs1st3fmtyfermzHqG8PrC13fALzm+SGm2RpcLJoej4dTi1/M9Z
	8n0KsivIJeMBAt/u5LYcf0knajQBdEMlt0NuAzNw4yZDati3PpzYLmk+WYkv1acmZFOk4dtQNfm
	GdwDEtpp2egaa61vZHdF9NkVf8kE7FZrQzGUwXhX96rLKy4eGSla5yQzwQsrONm+97wdHlZpjq0
	np8Ca99ur3Wm71nRUW6lVVGroDVGA3fTEdJuFJIAhsa+ruf0s5MzN/BrnOTUfcW3Fe468gaNcI3
	d2UaExW4+ZWkPgvHq4NwlGSVHioNvN1zW+X0zPpGowUV0kFsKrlxNiCmnNQfcUbOoBMoEQ4Rfph
	LL6t+06jBivpXG/nOwB6AYs2SyHIJ4dlr+YpAfmUtcCyqU196VgBZDF8XA/jwzHgsAFAcJwycc0
	51CfGHlfEUlp+j7nxkDqOgxaRyassYnzlgQgi8iyWhMmqusEAJt7O0U8d52Eu4AAXwLCyv
X-Received: by 2002:a17:902:cecd:b0:2ae:45cc:aeb6 with SMTP id d9443c01a7336-2bc74753517mr653625ad.6.1778270980413;
        Fri, 08 May 2026 13:09:40 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35ba2sm33602775ad.50.2026.05.08.13.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:09:40 -0700 (PDT)
Date: Fri, 8 May 2026 20:09:33 +0000
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
Message-ID: <af5C_ax1a3LbtL1Q@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <6-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <af3KDBt8vhClSKEF@google.com>
 <20260508173736.GH9254@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508173736.GH9254@nvidia.com>

On Fri, May 08, 2026 at 02:37:36PM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 11:33:32AM +0000, Pranjal Shrivastava wrote:
> 
> > > -static int __arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> > > -				     struct arm_smmu_cmd *cmd,
> > > -				     bool sync)
> > > +static int arm_smmu_cmdq_issue_cmd_p(struct arm_smmu_device *smmu,
> > > +				     struct arm_smmu_cmd *cmd, bool sync)
> > 
> > Nit: I'm not sure why we need to rename this? We can still define the 
> > rest of the helpers like:
> 
> I made it have the same naming system as this:
> 

I know lol, I just meant why are we prefering  "_p" names. No strong 
feelings here though.

> > > +static void arm_smmu_cmdq_batch_add_cmd_p(struct arm_smmu_device *smmu,
> > > +					  struct arm_smmu_cmdq_batch *cmds,
> > > +					  struct arm_smmu_cmd *cmd)
> > 
> > Nit: Same here, why not  __arm_smmu_cmdq_batch_add_cmd? I understand
> > that _p just means we'll aceept ptr.. but the name's kinda wonky.
> 
> Which becomes a fairly widly used public entry point, so I didn't want
> to have the __
> 
> Though there is no external user of arm_smmu_cmdq_issue_cmd_p()
> 

It's just that we're calling "arm_smmu_cmdq_batch_add_cmd_p" at one
place and using `arm_smmu_make_cmd_<cmd_name>` at the other. It makes
one think what's "_p" in issue_cmd, only to realize "_p: pointer variant

I guess I didn't like the new _p ones but I guess it's fine. Happy to
leave it at your discretion.

> > >  static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
> > > @@ -3464,7 +3405,7 @@ static void arm_smmu_inv_flush_iotlb_tag(struct arm_smmu_inv *inv)
> > >  
> > >  	cmd.opcode = inv->nsize_opcode;
> > >  	arm_smmu_cmdq_build_cmd(&hw_cmd, &cmd);
> > > -	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, &hw_cmd);
> > > +	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, hw_cmd);
> > 
> > Nit: are we passing it by value here? This would be a 16-byte stack
> > copy? As with the macro expansion this looks like:
> > 
> > {
> > 	struct arm_smmu_cmd __cmd = hw_cmd; // <-- Redundant 16-byte copy
> > 	arm_smmu_cmdq_issue_cmd_p(inv->smmu, &__cmd, true);
> > }
> > 
> > Why not use arm_smmu_cmdq_issue_cmd_p(inv->smmu, &hw_cmd, true) ?
> > Although, I see this is eventually cleaned up in Patch 9.
> 
> Because it is eventually cleaned up in patch 9 :) The point was not to
> change this logic in this patch.

Yea, just trying to call it out for a situation if this series gets
merged in 2 parts. Not suggesting this would happen but helps to know
for bisection etc too..

But I understand the point on keeping the intermediate diff clean.
Always learning :)

> 
> > > +static inline struct arm_smmu_cmd arm_smmu_make_cmd_cfgi_all(void)
> > > +{
> > > +	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(CMDQ_OP_CFGI_ALL);
> > > +
> > > +	cmd.data[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
> > 
> > Maybe this is a good opportunity to define "31"? We already have a 
> > similar definition for TLBI: #define CMDQ_TLBI_RANGE_NUM_MAX 31
> 
> I went with how the spec was written. The CMD_CFGI_ALL has its own section
> with a direct encoding of 31 in that position, no field name.
> 
> While CMD_CFGI_STE_RANGE has the same op code and names that spot
> "range" and it would be a NUM_MAX, we don't use STE_RANGE..
> 
> I'm inclined to leave it for someone who adds STE_RANGE..
> 

Alright. We'll wait for someone to add it with STE_RANGE.

Praan
