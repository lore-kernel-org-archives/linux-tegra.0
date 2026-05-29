Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0C6349AEA
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 00:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780016379; cv=none; b=laz6c52CfAIkAgFxOeEWIuPTBYWTKGf19kHkR9ggapkZfjvdXtfNHVfxCW+J6BVp2Di61c89Q43LiXU+4lHccSY65yUfAYLK8Z7IkZcNponOEnTV+Im6MiR4JMR9pMdt/tdzCO+0wVsAbQ99oHVPZujKUJPfrYQzVuTSQbd+whM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780016379; c=relaxed/simple;
	bh=Dkas1iK2Ba2wQu/7/v+v06OiX4DNgNdf6buX7x/57o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWwVIJJYlaNMjAf1mnb7I28UPjlmZEx/jZHjEVKB8hhy4eP2wxlZPLR+mU+Joqs4q0wbydK3aBNmD/Uba+RnymhTx/SBfVR0VNkpJg9ejSf6PLenOYBlIYdfvK5AqjmAtd0KdXjGFO8TKzQ68lBQk8zf7Tko/RgRJ7zy9VaWPbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kPVDixQQ; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kPVDixQQ"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9102e90bcbeso1353753885a.1
        for <linux-tegra@vger.kernel.org>; Thu, 28 May 2026 17:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780016377; x=1780621177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2tFoYpzfMUAkB3JpfkER88CdCEd7iFUbwdJ47mVqnAQ=;
        b=kPVDixQQIst4tVsJPM37pa5UDNZMOOsTVmOgRhY/AmoJ70YslBRaxNRsWGwXXSzcSW
         2ZuyzCqY/cnq0xvIIh5X/RjKj4xGAClRm4ppswo/kSmwhNjdBkpZWCQlbYsIrHWO0WAX
         zk2ndJkfNNAk7/4GIArP4x7ujU6aYhRpCItSd2/IZOENgEoo2TJNy6nd24uMCWTnFIHS
         k7jBNRvEMXm/JNLqrt4iJoCLsED/N8c5mnQ7RT+BZJAkQd1PYVX/1v7qFyVh4ndtZlpQ
         PRMXCQvRq4DSsEh3zqHF3tUO6CEY0s+R6da6QWbZYwdHL8rXENRKJKCy+gjZl6yhRlmY
         b8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780016377; x=1780621177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tFoYpzfMUAkB3JpfkER88CdCEd7iFUbwdJ47mVqnAQ=;
        b=B42MPiQPzYlBg1Z+t7+avf5y7TPRUkyVK4n0k4buA4SpzCQ0ueCq4j0uzyRzwBhsMG
         gTYU6RasBm/8FoVYwX7RL6TZ+5tJN+MwKot4BF9XlnzVO7byyq0ARt8bXQmGmyWu0YOt
         5WOYC8Rz+IW5l+HWtuDQtW/OPClxCvjJbkkQvK84imtrWZY0zx5256PTpy3+E6R2xRIo
         QmjPPi8/6SGh0QaXKNH/LCCxnZiKkF4PTUyA3vBd9yXF1uOtdJGI7pO9+oE75vkFzY+j
         dJqWgxsxT7U2BQqLnPuUHDNOWHlq5U09SYQa88zIn7f42ksYhgQFdaRK8osheRBl79vH
         OLsg==
X-Forwarded-Encrypted: i=1; AFNElJ8IUhIt29D9OXoOWfA2c6bpuJaX7QEhQUmk9yEo6iqBenNJ9K1zNOhC/y+oogpdDiHt93hlsP3SfYe15A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqz2hJ1xAGGF/zWL8bK+YUnbNU0qe6ts0AmcNZ/nhNip+6wXcy
	tQB9SwT2QIX9ZUbzZbzsE3EcRtYdwSWwC9h8pG7iMbZWwEcUb5U5tasmvis6rm8yVJU=
X-Gm-Gg: Acq92OGWsOiQuKFIYlvvZKwGsGRQ0xAVxGEXyDAv0jaOkFHBKLnKJkNm3sckSszUqtA
	kDFLQRnDMlAQKv0vXtZvcJS32SMk0ip7tLw5eE4FgGAzOFhlSgDyavkiHDjla+Deh8HhxwQL4ep
	89hZGBTSwBL6pmqewQEyJz763+GmxZlvZGyD+iKZwIbRpvxzRgK8LUg0DRkeSsVIGmWXeAM/g+J
	KpixdTy0V0S3Et3R5iZV/MWzD2y3Hmo/RbACU+uOzPLuJIYM5eBTVzdyeEnane06/L71ycYHMc+
	dAqOK9W11MnKj63d5KGQE1j7MGtGhmNQuhba3YlRefuv4loObJE6fxVH1EhjY604z0cMLIaz2Sg
	vVCSfZTUuzALuUE+sipGxJvGadjVDX1SfjMLb/KTs6ai0xozRmMB9Xs1gJ8mz98wbF3ImqW3GhO
	OD8VjzNYoaUDv9IwNYeQ9gBQh3LiKkim6nr/W8TD/sYs1Uf9h9UxIJwZd0q9lGJwdQnYXNd3ULi
	0D4M9pJqHG3skBu
X-Received: by 2002:a05:620a:6cc6:b0:914:aa0d:aa87 with SMTP id af79cd13be357-9152fd2d425mr108562785a.23.1780016376749;
        Thu, 28 May 2026 17:59:36 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91530135f92sm52883085a.47.2026.05.28.17.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 17:59:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wSlZV-0000000HBjx-3ea1;
	Thu, 28 May 2026 21:59:33 -0300
Date: Thu, 28 May 2026 21:59:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] iommu/arm-smmu-v3: Issue CFGI/TLBI twice on Tegra264
Message-ID: <20260529005933.GQ2487554@ziepe.ca>
References: <20260528101617.4068249-1-amhetre@nvidia.com>
 <20260528101617.4068249-3-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528101617.4068249-3-amhetre@nvidia.com>

On Thu, May 28, 2026 at 10:16:17AM +0000, Ashish Mhetre wrote:
> Apply the workaround for Tegra264 erratum by issuing every CFGI/TLBI
> command twice on affected SMMU instances, with CMD_SYNC after each.
> The erratum requires this exact sequencing:
> 
>     TLBI/CFGI ... CMD_SYNC TLBI/CFGI ... CMD_SYNC
> 
> To get this sequence with minimal surgery, hook the workaround into
> arm_smmu_cmdq_issue_cmdlist(). Rename the original function to
> __arm_smmu_cmdq_issue_cmdlist() and add a thin wrapper that, on
> affected SMMUs and when @sync is true, re-issues the same cmdlist a
> second time.
> 
> A new arm_smmu_cmd_needs_tlbi_twice() helper classifies which opcodes
> need the doubling: CFGI_* and TLBI_*.
> 
> For batches that exceed CMDQ_BATCH_ENTRIES commands,
> arm_smmu_cmdq_batch_add_cmd_p() normally flushes the full buffer with
> sync=false, deferring the SYNC to the eventual batch_submit(). On
> affected SMMUs this would leave the first chunk's commands issued
> only once, since the WAR hook in arm_smmu_cmdq_issue_cmdlist() only
> fires on synced submissions. Force a SYNC on the capacity rollover
> when the buffer carries CFGI/TLBI commands so every flushed chunk is
> correctly doubled.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 66 +++++++++++++++++++--
>  1 file changed, 61 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
