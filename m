Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E257335C1A6
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778232381; cv=none; b=mDipqVRXoSM4WwKfacUm3ODSG3M6Yf3TIwQARztqrqgWvY4SD1ErXxHReweLomavMx7oPVDNMVcVnoPtW/ahob+oFZVxIyUh+9e7KQw1cFWQpCm2kppFFMnMFN5ojMcf3Yos+lxCqal1b/I3qcgwTVIeO0KFxdi3FmkxluWsYQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778232381; c=relaxed/simple;
	bh=a69fVEIS2hcYnXuKu1po3P5vB5uzlgae97LtTNj3uDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CePB1uERtEChfMExQk+MzHkJeJZyuNmDUFgWs/M+zOjkviGAtBztxiaGTehHtDaK08/ZSSBx8ShFwT9dHecfRGm5wdHeZY5r496lg34YBgX1BLyUB7fuJ+6W7nwhD8MMUJlv+1rJm3NRkye+6Q0awheawlP5opWle9WPHFG0vpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DLqfU+65; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DLqfU+65"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b46da8c48eso68985ad.1
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778232379; x=1778837179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Z6CQ3IeyoNCQzM4n8QUnxz+E0eb5nkL31cz1hZskRQ=;
        b=DLqfU+65kNhfeLZqWUQyCtgOiqBPHkzCzMKxXH0GleD3dQUlqUcZAEeyxxyJh2wl7b
         d7HDJ0/E3khMfS5x8cz318+EFL1JEtlWnhJI0pXj+poTbmb7/RWeaJE9tOvxxfbkk38A
         ZRWpmAutJ8VP4hhb5f6ir95uzcnw3e6E8V4x2VsoVtSHWsy1QjFrxIwfFGI/z0u0z/H5
         XvmVic75ikj8zRn3v6dUkgJvX6IpzFv8NPNG+7qIHbSFuNGiK9rq2MegDgEx3ejN9wG+
         PqkP6DCsRVc3dyu8rbd5i6WFEpFGdgIivZztIBI1nopNTqUT2Z7gEyMtgh451quqj6Uh
         6Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778232379; x=1778837179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Z6CQ3IeyoNCQzM4n8QUnxz+E0eb5nkL31cz1hZskRQ=;
        b=X2tdrbX1L/+SFnIuwVhdsWzNxo00PnrSiyw5Q/GdaeAMEVn2sOe1x/x80yOh77u75X
         8id3fQrJ7G4mNAz0DGZyOvsWhrpRy8S6OB9zZWlvxfa5ABeWegVKcJUdZ5/cmRdx6hqH
         WAkSFRqXUuOMJa8S7GsYBl8bGhoxyRxy5S6AzBQwDOgyjvIptC/6ZmpNdbI0XnM/66C2
         STjxgPxFBjCt++NTZCKgMaEPcDy8WW4LBomSyjQZysx0gqW8Yu8K/dD630vlOrhYMXxF
         prqDP/bypZ/3vr6j/vWjSNf0dmibNIruDIkqgVY+OQcSMNPUUJIb4Dck0jNinWAQ9EgA
         Ui0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/4fCC+Ym68ZcmFdo7ZALFxUnm26PikVBtezkz29tDSybmJt9MLFumB1IXLW+tllHOOJRrtYrf3ZhYTOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRXP+joj2KYPi/Fm8cx+ihD2xfqsPPxDZd3tJ+K+t/VA34hFFV
	w/kJjXwrvxl9WXT/sMcrtOjGQ5mMuDGrg6owUNvVX+QS7JRvtJQvGiZmpKH7SLhdQA==
X-Gm-Gg: Acq92OFDxs94aneOXCYGRl+hUPuZYsrweuO3kbLyubVphzyc96cqcYhkkSH99Tf5+n2
	DhXQCz1mDCrALl4Qgnmbc4oR6gfx3N83iH5mDFtA/mCH0ZYnUbArznF55LwfPOUpUEs35z+tz7s
	et/syv+vfDOMKQdotSdysI5y6exKP1KcyFKAATE/qzRnp17zu+QUL3Vj+plyV3sgO5GDREsasur
	ci3PNbK+HmilzwcQWBly6z0TRr746Zr7KwShg6wSSHJDgOCLAdUtgziQFFz00PPECdgUw9S+8Bg
	MdLxphldiXdZ3aBvKM6LroLTQBUaHmUP1RSCiyET7TaDVaa6+CbrZB4vHJ7nYLjfzKVOZDaGWzB
	hjrggwtQa7gEyI8wAWSwDz4RlR4CjP4mMZFqYa31Vvbq3FPMPn0X26eyrWr0S/8WKED8ST/iKZ1
	SPRoPxMgR8IakaqEsLbKiWDy5dbUAeTlA7NSXYf1F4w4kqRTUdN36+HjDi0tBksLSesw5j
X-Received: by 2002:a17:903:22ce:b0:2b4:641a:6b7c with SMTP id d9443c01a7336-2baee828aaemr2177755ad.13.1778232378829;
        Fri, 08 May 2026 02:26:18 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm14866545ad.72.2026.05.08.02.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:26:18 -0700 (PDT)
Date: Fri, 8 May 2026 09:26:11 +0000
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
Subject: Re: [PATCH 4/9] iommu/arm-smmu-v3: Convert arm_smmu_cmdq_batch cmds
 to struct arm_smmu_cmd
Message-ID: <af2sM-NtNvzCpvyg@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <4-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:13AM -0300, Jason Gunthorpe wrote:
> Convert the batch's type to also get the remaining helper functions to
> use the new type and complete replacing naked u64s with the new struct.
> 
> The low-level queue_write()/queue_read()/queue_remove_raw() functions
> remain u64-based since they are shared by event and PRI queues which
> have different entry sizes.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com

Thanks
