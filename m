Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28723330305
	for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2026 20:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784319526; cv=none; b=p/hjGOLr7+sYtMYltSyA25eJzdBXrWs57vWhSTobg1QQu9pJkwgnHszlHi3TwRaY5T1n8r8oucwU/QMPVFqFOwNG4yL5W44NWWt+vzEWofFcTZ7+1CT9XJUFVmGHZPUulkY1h+pNCuI6XcaEe4D8nYS61OJU7gR3yOWCk+a39D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784319526; c=relaxed/simple;
	bh=1KkC74yltJoF9gY0gEzVV2Thr+ROcbYh/YgRoBkt59w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fam+OHa5my4MfAHKwFhMs9YserunBBSvGQ9R/i0sDEhT/7NA/VyYQSobOz1XLdBL3HAaecaRLvtGD/Zsliy5ayPqH4URCnRNH7AGepfretwEc3z93AIUEMhGc7OZHUfHZhzAlIoe5N7Fybu1L9BpB/FbqG7dhwNylzi6usJGjEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Tu1E0Yjj; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Tu1E0Yjj"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c1372f84dso47164831cf.2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2026 13:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784319523; x=1784924323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OyZcoDYsLDOa3jljtF+USnQN0n2vX9UR7xfVNnqT1/U=;
        b=Tu1E0Yjj0KQUO0FfWB82ctbvjJV3baxBltt1sjy94zuJj5+0lZZP7kbefhF8vzUMR4
         jo0Qim1fK5mGiapHuV/Br4PsG0DPbEY3hNWmzruoJvX8/waAMiYRcShx9LvLhBkCmDQn
         365vxyJl4zk+lcjdu0XA3isqo6gFCIE23Cv/ZqRxXswqkCkrK/AgWKqtLa2jniiMTKYp
         kCQ8lBDs3bfj18LozWL+AYqOlx/UooPNNmuA3EaEdMo+NYmaCMTERqojzEU9LMvI3dsu
         pbbgPh+xRxinP/AlL4BnnSA5yxJyGkJpkIai7tH4vlA+F6wE7b4ZRuhfo3L3ArtDHVHJ
         cDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784319523; x=1784924323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OyZcoDYsLDOa3jljtF+USnQN0n2vX9UR7xfVNnqT1/U=;
        b=Fg3C4FFZVmR0+rt4uBu/Jj3Cd7Tj8yjOQDVT1HvPujIhX7k+WRdEwqyjEKyZ6xbFb1
         sIRVW+iosuk7Q8GiMouaLhAPhjAPwrItuF9Y4td/CFcY4SJRBuBvPtH7U2Qqx9rZp3nG
         VMSM7G5s2d55mqakneq9jIM1nUubU52ZdV7x1bg9GS2Q/IR+/gDGeR0U3xxN0j5YjM1I
         MedQvOG3/MEGxOPCORRr7yx9qFA7cV1UttM4aefrYQyOS4oJW/I8rpxKwkuGMvdFJdEL
         W1QJUtx2uwN5OkLjrz9vLrnN7a0w9XEiz9bt8fsvOwHlevYpCsWYX+TLHHMGZDfXp5dL
         iLRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8AOoLnukvKuZJlL8t4ASFN6ERNxhxtgn3zjmOV1HC5RS6H7rko1cnIO0Q4VhBd1ocjVmc5BY4pqtHYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztjU9oi82RSUwFSwRWxsDHZPMG8q5abxARUvc2b9C/zGNqajfR
	gmYg0yyM1/cyfG6/Z12AnN0qwdD3t3AW5D7NNfAhnpbwe70Mcf4XeQ0v3/Cj6Uc37/s=
X-Gm-Gg: AfdE7cmzjtWw9Zd72QBFOsEfhw6RhLLYM5WIUYzpyhtbWdPiU2DiF+3Qin1rVHNs4n5
	taNI8IVo3U69hofbUxj1Tq/+i0KQgREaS5pxeQ3WG9iTPEpSn88/e+FtWLFrhaYiG0Pqk6q8Rny
	kPe3a2a1kh5PIhz3vTXAsIpKrcY9cU0HOSxyzILCVWFAW6tiwAnerJWSZMs5GQjZeQv9wiJfMUs
	R7Q1tlNWmhMMpFUiDEL/enL9UQLIHNPqRoi55Tg0/ADzPLuf4k7XbW+9pCX+GLOmHEceYEPdN5o
	iMDRV/d1Kf1F91qFKyPuBmifOynJmSM9EMGvKjWL5PiX+2PDdEK0TTZ+884bt1oVHoLOYFmWiYa
	swpUKJiJmCIhe4B8sr9YmT1gsV8uqFgnxqivqalNhdhBkSoZ4sw==
X-Received: by 2002:a05:622a:249:b0:51a:8a47:b578 with SMTP id d75a77b69052e-5213b72b769mr40771701cf.38.1784319523028;
        Fri, 17 Jul 2026 13:18:43 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-521502b9d5bsm19993871cf.31.2026.07.17.13.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:18:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wkp17-000000052o2-3RvD;
	Fri, 17 Jul 2026 17:18:41 -0300
Date: Fri, 17 Jul 2026 17:18:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 2/3] iommu/arm-smmu-v3: Introduce CFGI/TLBI-repeat
 workaround infrastructure
Message-ID: <20260717201841.GC701389@ziepe.ca>
References: <20260714104202.1664187-1-amhetre@nvidia.com>
 <20260714104202.1664187-3-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714104202.1664187-3-amhetre@nvidia.com>

On Tue, Jul 14, 2026 at 10:42:01AM +0000, Ashish Mhetre wrote:
> Tegra264 SMMU instances need every CFGI/TLBI command sequence issued
> twice, with the second issue executing only after the first issue's
> CMD_SYNC has completed:
> 
>     TLBI/CFGI ... CMD_SYNC TLBI/CFGI ... CMD_SYNC
> 
> ATC_INV is not affected and must never be doubled.
> 
> Add arm_smmu_erratum_repeat_tlbi_cfgi_key and an
> arm_smmu_erratum_cmd_needs_repeating() helper that gates on the static
> key first and then range-checks the opcode (CFGI_STE .. ATC_INV), so
> subsequent changes wiring the workaround into the CMDQ submission and
> iommufd batching paths can share a single predicate.
> 
> Rename the existing arm_smmu_cmdq_issue_cmdlist() to
> __arm_smmu_cmdq_issue_cmdlist() and add a thin wrapper that re-issues
> the same cmdlist a second time when the predicate fires. Register the
> new condition with arm_smmu_cmdq_batch_force_sync() and add
> arm_vsmmu_can_batch_cmd() so iommufd batches split at every "needs
> repeating" transition.
> 
> No callers enable the static key yet, so there is no functional change.
> A subsequent change will enable the key on affected instances.
> 
> Suggested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 14 ++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 57 +++++++++++++++++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  1 +
>  3 files changed, 67 insertions(+), 5 deletions(-)

Because the VM has access to VCMDQ/etc it can issue commands directly
(maybe not on this chip, but as a general comment), thus invalidation
errata need to be made visible to the VM and we need to expect the VM
will generate invalidations to properly deal with any errata.

Ie I'd expect the VM to see a "nvidia,tegra264-smmu" compatible string
to activate the errata fix.

If so then we will already get duplicated invalidations here and then
we will duplicate them again. That's not great.

On the other hand if you want to emulate a generic and actually
functional SMMU device that has nothing like VCMDQ/etc then you must
do something like this in this patch.

I was imagining a general direction that we would expose the errata
information to the guest and the guest would have to deal with it.

Given this is the opposite I wonder if we want to do it. It does make
sense for a chip that probably doesn't have vCMDQ and I don't think
qemu can even create a DT description to trigger the errata anyhow.

But it starts to become confusing down the road if we decide other
invalidation errata (like the CONT must be RIL thing) must be delt
with by the guest.

So.. Maybe add a comment why this one is different, or maybe just
disable FEAT_NESTING if there isn't a use case?

Otherwise the rest is fine

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
