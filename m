Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3733C10E9
	for <linux-tegra@vger.kernel.org>; Wed,  2 Jul 2025 00:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751415281; cv=none; b=gfD+zVAvQozpfpCD+iSb+gcfcEWwgblxkpF5Bv3A9K+mR1i4pb4o8XXIsrXhmsrp5fDq4/Q7AJQdT1kC7n2CKTV6BZtfZp9oPurTg3Et9qdR5aiv7FDT3UyAaho7SxmVbzWaRMcyCfzI58d7O0JIdrWoW1Bw4mzFp4uP40TbW3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751415281; c=relaxed/simple;
	bh=269QJMUMdHzfHuz4jq/gGMWfgE3bohbbwQ/J8DDsB00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6z/2wwatD5ERb52dUefwzqxtbHIzk5dV98HZ+mqKoiiPMMZtxwcLI6psdcVORxVrjU7RPDvfSpalrrZKKUWWkmsUerQNEnzD6r6JdR0GTBVALlVmu3et9/gpGwpKFNjj8OdO4O4HPNT2jAliMKs0f0GxFBnSI4n2DEysEnjpYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cxzn6tqP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cxzn6tqP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235e389599fso364445ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jul 2025 17:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751415277; x=1752020077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yWta2RBHdNOuAiG72RgunT5XM70BX2r3Pve9teJEvWA=;
        b=Cxzn6tqPvRE9UvbZT/57SywjenE6nqLEHezJYHok7YZh0Wvy/3AwmhujdyMZG3yefM
         TkBJAZMSc0LVc+0OLFFr6NqehXZ5mPtdMhoBW++WQI5/a2N5xIpIWjFv5R9svGBOatmv
         f/CQyvTb19Y4VP65NJPTv5ki0dndcb8NOP9Idf59aC1fHpQgGG/QkUTcpiLBV/fCr4RF
         j6iHlsJAbbnwl7NCqbVPGZSwLQU4Q1SxO0UBKgVOlg+Utf+xIiCtVs4f4Sg6DHrUaXCr
         ju7ahl+omqInUz9QA3ThFC9aOB6DxQcvfsnWq8KSfKu0/XANKcBWJ7x0OGMLnZN333Me
         0PGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751415277; x=1752020077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWta2RBHdNOuAiG72RgunT5XM70BX2r3Pve9teJEvWA=;
        b=G7xauFbHyaASjDpqpLIt7Y2/Azhxjpc+XR3+tqwOb+v5qRKv7pMjvuA2EvKCJwMaLz
         bgA1LhnzxG7N/pkuMA957XmhsJ0BPKzX3SGrPxjjuKZtZfeKF5LoD5YtfFV2GTFO2t2O
         t6Z+0BSaGk2mbOOZG3NugNM0wBP7EGbfe539Mz8mXu3SxlASuq5CY6m/lwrKCAy99nuY
         I/NwCjUAOX1i1il3zsDu7SMLFTqqbImUeUJp3qmG2v6Kzv18kp0LaPf9sdaPfwOrPHwB
         bUwDN+ApCq6vBx7ec7T6G4xVVaM00Fmb+ulGQutNBJjtZ63TqQbEmG8UuYLauabTdB7P
         0nZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvrCCHlKBQB1r9aay/k9X1MCosDP0RCV07HnYcQOQdmXqo+j/lvHGo1aDy557H9S1+j0CAL1fxh9Eucw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhFQby3jcS+d8iO9iwMBRPd8hX7fTM4XOZ31395oX4QeOkX7UQ
	bpb/mFyBId3DWNSX3JpjyQoOU4OvxZYDR7V7QMvSZUWARqjx2mgbNpzGDMom4z2E5g==
X-Gm-Gg: ASbGncvY3IyTRk3nuP2Un8u5WJC8GUNupdnwmHZ8xmuBQUEKZwS4FppGFjl05PTjjzH
	ebkvZupNSQivodFVNg9aQ1X1rYTD6udxH/9B7OGr/imK8nn/p8A7BJkAQT1c0ehMtNazBjzq3jX
	Vd6vAZlwj/T7+ddEe2lKBfG3q4BM7b5unxYAXswJvytzVtL+rRUdZXqrm/8sXiDWDa7Rlx0Cocu
	QdObTUgeJQJybJAyNoeZGNEyUw+65nlbbmBcy8364e5Fk9hEfss3nfvq2BJZDnTQQHMHi2gf9Xe
	DXS7U0RsREKyRWkC5VVF58QrYV/6Q3I5YgWnIrtGHs6upZkm4soXfjqqC9N8rJ/n5VLdh7GL/66
	VYLMah6dihN5MblWaLQqp
X-Google-Smtp-Source: AGHT+IGvJMG8/hp+2Ct3jUaU9SAz7W5inwlVAS3AX7hVe0NTLM1n/six7+4FqNJbQ+qt9+fMTBDOTg==
X-Received: by 2002:a17:902:f70b:b0:234:bca7:2934 with SMTP id d9443c01a7336-23c5fef098cmr4092395ad.6.1751415277107;
        Tue, 01 Jul 2025 17:14:37 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b7986sm121732375ad.164.2025.07.01.17.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 17:14:36 -0700 (PDT)
Date: Wed, 2 Jul 2025 00:14:28 +0000
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
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aGR55PUBnwb8qT8U@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <539ee2ec112162abdba511574e2205a77b425059.1750966133.git.nicolinc@nvidia.com>
 <aGQGm1-i4M75b9Qp@google.com>
 <aGQ6KCI9OZEwHdxS@Asurada-Nvidia>
 <aGQ_F7Qx3scbbA-J@google.com>
 <aGRDtYRXFLoT+PrI@Asurada-Nvidia>
 <aGRIctg4T6cQECx4@google.com>
 <aGRcPSwaJkTeUrMx@Asurada-Nvidia>
 <aGRmaOORg-YDfncY@google.com>
 <aGRozoIDIlgl9H9x@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGRozoIDIlgl9H9x@Asurada-Nvidia>

On Tue, Jul 01, 2025 at 04:01:34PM -0700, Nicolin Chen wrote:
> On Tue, Jul 01, 2025 at 10:51:20PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Jul 01, 2025 at 03:07:57PM -0700, Nicolin Chen wrote:
> > > On Tue, Jul 01, 2025 at 08:43:30PM +0000, Pranjal Shrivastava wrote:
> > > > On Tue, Jul 01, 2025 at 01:23:17PM -0700, Nicolin Chen wrote:
> > > > > Or perhaps calling them "non-accelerated commands" would be nicer.
> > > > 
> > > > Uhh okay, so there'll be a separate driver in the VM issuing invalidation
> > > > commands directly to the CMDQV thus we don't see any of it's part here?
> > > 
> > > That's how it works. VM must run a guest-level VCMDQ driver that
> > > separates accelerated and non-accelerated commands as it already
> > > does:
> > > 
> > >     accelerated commands => VCMDQ (HW)
> > > non-accelerated commands => SMMU CMDQ (SW) =iommufd=> SMMU CMDQ (HW)
> > > 
> > 
> > Right exactly what got me confused. I was assuming the same CMDQV driver
> > would run in the Guest kernel but seems like there's another driver for
> > the Guest that's not in tree yet or maybe is a purely user-space thing?
> 
> It's the same tegra241-cmdqv.c in the kernel, which is already
> a part of mainline Linux. Both host and guest run the same copy
> of software. The host kernel just has the user VINTF part (via
> iommufd) additional to what the guest already has.
> 
> > And the weird part was that "invalidation" commands are accelerated but
> > we use the .cache_invalidate viommu op for `non-invalidation` commands.
> > But I guess what you meant there could be non-accelerated invalidation 
> > commands (maybe something stage 2 TLBIs?) which would go through the 
> > .cache_invalidate op, right?
> 
> I am talking about this:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c?h=v6.16-rc4#n305
> 
> Those commands returned "false" will be issued to smmu->cmdq in a
> guest VM, which will be trapped by VMM as a standard SMMU nesting
> and will be further forwarded via iommufd to the host kernel that
> will invoke this cache_invalidate op in the arm-smmu-v3 driver.
> 
> Those commands returned "true" will be issued to vcmdq->cmdq that
> is HW-accelerated queue (setup by VMM via iommufd's hw_queue/mmap).


Right, this brings me back to my original understanding, the arm-smmu-v3
driver checks for "supported commands" and figures out which queue shall
they be issued to.. now there are commands which are "non-invalidation"
commands which are non-acclerated like CMD_PRI_RESP, which would be
issued through the trap => .cache_invalidate path. 

Thus, coming back to the two initial points:

1) Issuing "non-invalidation" commands through .cache_invalidate could
   be confusing, I'm not asking to change the op name here, but if we
   plan to label it, let's label them as "Trapped commands" OR
   "non-accelerated" commands as you suggested.

2) The "FIXME" confusion: The comment in arm_vsmmu_cache_invalidate
   mentions we'd like to "fix" the issuing of commands through the main
   cmdq and instead like to group by "type", if that "type" is the queue
   type (which I assume it is because IOMMU_TYPE has to be arm-smmu-v3),
   what do we plan to do differently there, given that the op is only
   for trapped commands *have* to go through the main CMDQ?

   If we were planning to do something based on the queue type, I was
   hoping for it to be addressed in this series as we've introduced the
   Tegra CMDQ type. 

That's all I wanted to say, sorry for if this was confusing.

> 
> Nicolin

Thanks,
Praan
