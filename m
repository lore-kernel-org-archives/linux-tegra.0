Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6E2382F26
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778259515; cv=none; b=ESzT101arHJnQDJFEydLcmWW2xKyxk/oTfpSR4GVLIeSgP5z7TpUJIf0pToqrCvQGC7s2mkltjTiVRQwuqoUygUWa9nNl3ZuLUsELrfVlkG6N5uwQXe1g7a3mEax37Or4elaCpMRLzYUuqop55L28br1qWD6F8vPD+SrvMzd5bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778259515; c=relaxed/simple;
	bh=TXzKoWrdKyhBoDCUbFaxZvqjmPvY5sPeHYgWnhJ8hfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ep8xEbnA9ACjqXFgUrq4324WfEYL4Fl9HKA2aBVL9ddQd1Sn20HqgzL6QW5g66E3nX+vTZQgeOoJXNGLvP8Lbu6TER70V4KN5JEhDVU4ys5ezzeCi65QBBMVekopEHOZSUabFo6d7H84fFQLDrtZi0TMMtFa26d0aCQ20bHCHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TZK+RY1e; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TZK+RY1e"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso685ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778259513; x=1778864313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U4Q1eWfw8uO06O3f0d5ochR+epxjNtDwxTshSdkC+mc=;
        b=TZK+RY1ekxjk8NjoHIrhzZiXl9Vj6tRYz2tZk87WtPRCLcTwUK1DLIsd7K3QMs+XQR
         BZ54izjp+8Ydx8J1vEwHzCEmYYPFCELGiWMvAR5wzZcRUEPKNM290eVZtZo5FCzSFKTf
         1Od5Z8VIcCwKqSus2g+yZLpb9hq4bWwI4qvGzTyWhxIgSSEvsLgUUZ1Mt2XnU2qo0Q27
         KZBrnbuz9cqbxbyunn4QmxODA2pyLNYGzCcIsLZJNRkwNeZCGKVncA7Pt8mIBhYMQYUs
         T00XSn/D1csDU7YEclKYpocvzOO9omONlZ0hn+YJU3L79DnnuRAX2bJbFBqIFRAfy2BL
         gWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778259513; x=1778864313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4Q1eWfw8uO06O3f0d5ochR+epxjNtDwxTshSdkC+mc=;
        b=ks2GAiRBdWbZKK29Y8c53GeEbEUXyijNBDjs9uSVn4gDHhLz9Qf6pHem7FhFLqNkEu
         yYA/Djx5KlNCOo4xF5g+AvuO5vc78wHToET5O6zlp2y+ecGrGQzOON7sg40qGy92uLAE
         mELZW8P1uf31QRHodGNqPU2K5FbmxTIASNEou8ECzcopDBcKH7RcHAHnUnG6oMS8y5WH
         JTijEO13oTONKuYpTJ9/nRxmNnoVYNiLm3EY4oCz/odlANEFncZtsHBKKvuAsxc2FUGL
         vSsxKsxD+R19R3dXgakve1t2vn8UO4YCMV9ySISHTArElbqtEjCbheOlJLkx2JXFc9R8
         l/rA==
X-Forwarded-Encrypted: i=1; AFNElJ98L26Lk0Ncc1nFEwMRKxCjq5WeNQJm+P+L7o4SGz39cG6kOvHhwPODy0YeUIXVSqcQ0LTiKye/pw2G7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMVm8C6jD+n7FOPRXs9vnA7Q7G8Kvj2Wc5Pylb6MfG/ZIgGPdI
	0nW4WIxHN7y4REkjfOmU5fMLmVuDAFveP3KloZJWtWIbjQg2PmTQIS6gijVyW4hJFg==
X-Gm-Gg: Acq92OGV4ZQvxspZjS184FWcQPfgjWRQdCh3lZlmmUt+Hxw7XAGJ0qnyEnf+dvSETlQ
	ggPe6vTPGeBe+ZtrQ44V596YK3EwZTFeBvQIeJrLw7qICCs5F3toRu7PmbsJM0cN2c3WPBzlGgV
	zef4G7J3TRCONQB9eNd9UUQbNnf6W7YAo7tWcEVE9PkGwruv0HnBB50ORhBMksxqcSvF4EcNfKx
	on6I1pJAf4wWCittjhMuMjDCWkEQxHfJpynaKE+sNarJeBYDC/CQ0bHgVUWL6K7Qr4uymc2IazY
	KoaLO6L4bNTpLHjY6JJeWVkJ3/oULnpJB6DN5eOcY1502EjnWRXWw/psgoDDuNWHBqvMMeTbMpN
	qUS6qiaEjQDLWr3J3H31sR0jr65lzfvKccLluztIhdboqdSuZs5xh4LHD6ZNKjP5mSDvCsdnzU8
	WfXP1bkSlqXXyY9oLoWBhOttq3Tz1Q5O6OlHzg41Cd8pk6r6SQTAnDrNkRTz68D3dk55i1
X-Received: by 2002:a17:902:da87:b0:2ba:f71:57a8 with SMTP id d9443c01a7336-2bae9e663eamr3999045ad.10.1778259512872;
        Fri, 08 May 2026 09:58:32 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2700dsm29924885ad.2.2026.05.08.09.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:58:31 -0700 (PDT)
Date: Fri, 8 May 2026 16:58:25 +0000
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
Subject: Re: [PATCH 2/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq
 selection functions
Message-ID: <af4WMaG8sSJeNkb2@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <2-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <af2VIXhI0ryEbWn7@google.com>
 <20260508155432.GE9254@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508155432.GE9254@nvidia.com>

On Fri, May 08, 2026 at 12:54:32PM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 07:47:45AM +0000, Pranjal Shrivastava wrote:
> > On Fri, May 01, 2026 at 11:29:11AM -0300, Jason Gunthorpe wrote:
> > > Start removing the use of struct arm_smmu_cmdq_ent, starting at the
> > > lower levels of the call chain. Change the functions that determine what
> > > cmdq to issue the batch to into using struct arm_smmu_cmd directly.
> > > 
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 47 ++++++++++++-------
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  8 ++--
> > >  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  8 ++--
> > >  3 files changed, 38 insertions(+), 25 deletions(-)
> > 
> > [...]
> > 
> > >  	index = cmds->num * CMDQ_ENT_DWORDS;
> > > -	if (unlikely(arm_smmu_cmdq_build_cmd(&cmds->cmds[index], cmd))) {
> > > -		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
> > > -			 cmd->opcode);
> > > -		return;
> > > -	}
> > > -
> > > +	memcpy(&cmds->cmds[index], cmd.data, sizeof(cmd.data));
> > >  	cmds->num++;
> > >  }
> > 
> > The memcpy is a temporary step and goes way in Patch 4.
> 
> To be clear patch 4 still has the memcpy:
> 
> -	index = cmds->num * CMDQ_ENT_DWORDS;
> -	memcpy(&cmds->cmds[index], cmd.data, sizeof(cmd.data));
> -	cmds->num++;
> +	cmds->cmds[cmds->num++] = cmd;
>                            ^^^^^^^^^^^
> 
> The compiler just builds it.
> 
> The flow evolution is:
> 
> Now:
>  struct arm_smmu_cmdq_ent (stack) -> arm_smmu_cmdq_build_cmd (batch) -> memcpy (queue)
> Here:
>  struct arm_smmu_cmdq_ent (stack) -> arm_smmu_cmdq_build_cmd (stack) -> memcpy (batch) -> memcpy (queue)
> Done:
>  struct arm_smmu_cmd (stack) -> memcpy (batch) -> memcpy (queue)
> 
> So the net result is the same before/after this series, we just carry
> an extra stack copy till the last patch.

Right that makes sense. N

Thanks,
Praan
