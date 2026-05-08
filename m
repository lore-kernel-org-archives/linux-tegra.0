Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1DA3DCD99
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778248850; cv=none; b=FiWnszJQABOJweNpcgShL4Bct7D86R9gSF4jyhLaATXoJ0+eQUPHVEmio6NIW61aJWKCK+vX72esjuSxcGiTEmbiCSVWutPUz21Vowq4EYXakhlWi3Fggd33j8yHgxGvqGQHvGoG/pjCBhp1sb3Vb0MYx6PCmeWsMHrzkd7ddvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778248850; c=relaxed/simple;
	bh=iqJu+r0ruvrFT+na7AA+zYV2nNkMq2VB8UiCghLRSWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfGtzPm/woniGxDDpwa2ov3El/ccvW0K3LPaUpwrId6LKmKzri5QLdYpzhCqVZBIp7TzOURuCzIs3jYcAWihbUlnJDsQ91pak1GWUk4+aQl5HU/ZQ8YVJwuqtNkQ837BkWNoOZeCHelJVn1lVIqlHsSatVL8DdViriyIzht7bfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D+icVMJd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D+icVMJd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba180a022dso87955ad.1
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 07:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778248847; x=1778853647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg6wbnYU6IxqikudtR5uG+CUKtmNxQwde8y0MusXhEI=;
        b=D+icVMJdmXYAXM2vAiSy4iOxJ1IACBVXaPP/Olc/rFUwAnwZy1vF7gR9/1gyUZhk8f
         g/KZCnXzd4gYiz/8aVw8VDk4Cpp7Yza2EzSko/IR+I9FmfiP0yYwHDDA88jffP+g8cD6
         iyqUkIE3AIlurKDs0EITplyCiqc8FSFc6hcUuMEBLv4KRE1pHVf8nQqBPctAGkJpp6BS
         1kNU+/wg3ToUmdmGbcODsz1RfwbOXyrgCt9da5zHW9+BsF4xzdDm+7qWpAQb5iNdVb44
         CoXEpVW9Y3O+ffDV7suyZGnGe9GGaHnEto8PQmYrcYTRpwO7+g0NOG235I3WE4c61xq+
         gYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778248847; x=1778853647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rg6wbnYU6IxqikudtR5uG+CUKtmNxQwde8y0MusXhEI=;
        b=LoJoDsckrVlYQsxnkEa5MXzwsqSK8KoJoOsDetyQkj5pJZiNZNfHQWKCif1TWI2PBg
         aI90/tZJF8mdcuOp5XG/DCTQ2aqFZV2BEISaIaTrEyUKS+vuffUizC/8PUY3vUwhVaEf
         HnMSFZ8QcKVk+A/03PPh8J24a69WRRgrfm6mHlKWooL13m7ZsIgT5YRFNqNzGu0o+D2B
         Il/Zlxye5rQd7xdJ2iGbhtHv7RxBAsudB5Mk3o7Fbjic0FI3/O5AaqMGnq93N+/JcnbQ
         QVUbcwZOVx/dKlZ+Vzz6nWlQTasDolgl4p8NZFK1LKtRQdCCjih6jKi8Gg6bXANP7A2y
         0KXA==
X-Forwarded-Encrypted: i=1; AFNElJ+4wh0vTmyLBsEbplqvRma0vOTfWG0qB8ppwfxLxKOIVCJ6MtfbL/WT0STv9cbdcsrVXprmIMb7RYragg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy7FSIgpPOaXx8T3coKUoBOHCGxG8/2Jqbxx2B5Fo8hoODZaEj
	2yuW1B+hL2XhiDixYto9lBjwQurTrx1wORxallYQnHwpaWrZLbjaI0hkeVAJlDWALQ==
X-Gm-Gg: Acq92OFAVd/tAOZ3ICZxyU2HeoQdGOH7C7yizhUisj9ODKsOBDpPKX1YuWFtkTa18hn
	xXUm4a8lAWiI/Z9A3fgiGi0qzuRkTM3eaCBB7+cK/ndGq0dnkSPzuqEarKix3LscTg83NQ+Jtry
	k/wX5BxxZcGvxcVErl41TX9hIJpuVG//SqdwpZeO4RxCrOedUjvSZ4zu8FaUh5wK0XHlDcLbYQ2
	LXs67Or7SDLxEzGRTIWDfHHf92pbJxM5C7XRhCfNmLKofQZrRgx4bedAdZ4PrvF8djF/vAiNBtv
	ZUDqhiEGQu+Fly8Dl3Vq/Vt15mW+7K5KW/stiSl6CIio24ZTHuJnP9Fov3kUH0oq4E/3rQD/AHs
	XO6B0LopMklvHmf1yqX5fT1qp4S6ewZDopUGKz/QdGz1BSTLsVPntudwtya61geyI3/2pF5HDJ5
	GnkOqCMWABpNpAJqsT/T8v3ZStuzND94bANMfq7E4mwyHfnonladsI+C+AgOLOwjlS73Yk
X-Received: by 2002:a17:902:fc87:b0:2b0:5c88:51e1 with SMTP id d9443c01a7336-2bae9e67750mr3727515ad.14.1778248845874;
        Fri, 08 May 2026 07:00:45 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm24217865ad.28.2026.05.08.07.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:00:45 -0700 (PDT)
Date: Fri, 8 May 2026 14:00:39 +0000
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
Subject: Re: [PATCH 9/9] iommu/arm-smmu-v3: Directly encode TLBI commands
Message-ID: <af3shx9ETdSzwPhq@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <9-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:18AM -0300, Jason Gunthorpe wrote:
> TLBI is more complicated than all the other commands because the
> invalidation loop builds a template command from the struct
> arm_smmu_inv which is then expanded into many TLBI commands for the
> invalidation.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
