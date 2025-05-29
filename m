Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3159423183E
	for <linux-tegra@vger.kernel.org>; Thu, 29 May 2025 20:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748551585; cv=none; b=rw5NWqG+06gfawbmNlNp8wsBqQeJlQ4wviofLqQnB9yUP8gPV9sET3zK0MaO1uUXb33kpDPrJPjm02QQzVyLpULdHaJ0dsyvzTwcjtKt8neHL7zkULjyhuEg2Ggf/fFD7w/riOrqq9V1x2lYxssQVMpKykNlxPDa1ZxASrtPYwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748551585; c=relaxed/simple;
	bh=/6z1v/qNBfUFOoxicD1V48QdZQfp4IVH4S3L1yiqKHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6f3tKNj9IDGaL1OvkLsMYxXDt+aOVGL++rH0yHlNxOit1V+QMOuZEEhw9pbzyMGPFjpC2+OBp3OsHHJp1eSSl2UYfh19XRcOiYH+70GUCT8D65Sw1VQmtQzWyHZLlGAFkhHUl52dsYxtp5h8vA4ssEuFSLR/cIDfyiOtmzBlPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XIvqNns9; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XIvqNns9"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-311d27eb8bdso858889a91.0
        for <linux-tegra@vger.kernel.org>; Thu, 29 May 2025 13:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748551581; x=1749156381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=;
        b=XIvqNns9ls/HGWvWQNu791RDA+NMA/YEPxyggEhVbL2i+z4BXfGCTpY52IwPgra9FR
         d1nN6q5UEyqlfXLtzpmbgCycsZqlJS77ZGVQwjxfqRRxYz8/iduVhtR4rR+75I0Boa2M
         GbIfASXNfsS8lh1k49srFIfuXeZy439ELQVnqPpABa8uTRERxvt5T3mkBvWyChbub969
         KecqPD0gn/3PPWUqnQ8g3HIUuWYlICf833vlxY4RUNnTo4nMLlizX5sSP0GG9y++98P3
         ocnHf7RM5v0M4SuEeJtuf6crf48EKIjY8EUO8ks+d0MjXoKoH79KiLc5SPN3uwPD70In
         LVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748551581; x=1749156381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=;
        b=hXKi/Dv8QLBetTy8lHlXSlo89uX9MrlJbGJBOOTSICvox0rq051cUxIfqZu/TPKnT/
         ZCFZeWLRNRF6o3JCqXyCrswUB3KSgNjeEbyt/OaEsOedrzYYJlNWxg2nrlF2RvBOg/ji
         TikA2Gfp6zc4LZ5tEHzMb0Pv97yNCrI4TDfqMnpui6x0mEK7CgZxxqUOeBLw5ScGlZuS
         V/Kpky7AYicEh6AJQrP7x3BcGskIcfEza49u7O1tIunWB6x7HGs5X8iTUIeFj6qHvQR3
         NogRtGVNZnNQrcSm47HsIGsA3u0wFPgyo/vzMGcJupXlZdi4OXJ2lkYCMRYNrD2ppUpg
         Kbdw==
X-Forwarded-Encrypted: i=1; AJvYcCWUvEFtwcvAsV9bLTnWuZhrI6iJ+oaECibUsOOvbjK789ODHL38uQ9Vs7PVrVG6XZeHwwW6pZNod1ZJNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEkoj7d5cjlAx2/riTdj1QmDLtu+hLEftGxHAOVcPSgwSgZYr0
	j4nC5dJzFKujyOAuMUlR8BZDE17eZcVW86QNXtcXOogIHGwbft3I2tMhOVAne279TFs=
X-Gm-Gg: ASbGncstn2VURWVVYxQLmN7S5B1euzYcJFWNcJe8AoVUPaDcgpaECEqmMsT+8EnOMFj
	m/kQU4g7cEZ8KEujFLio/Pp/AJe8x8y2kTyy0F+jIO1Qd3qBGJIn9p70ozmvl9Z5pW0ws7JBKfr
	z4hJfe+BU6B6Uvpj8ursZKdC6hhhaOI/yC2OmF/0MPnf7sszVwJcN6H4MFes0k0yAwx8G8/uN4P
	82nyuLv0+2AuyBoYC8Romb2qSYyQYFWCp7Hw0NrDiV/H2DVKxIAs9Oxkli0PqjTNh/Ec07usibg
	YdQp90x/7rWNhv1CGXCH3lD4dhl+Q/aGJBQvE12rDexusO5lt4TE5ttypHdsiUBsVSD4eA==
X-Google-Smtp-Source: AGHT+IEO8HwssTrnrLL8DGNfi7UDT2JfkJIUURFRStahz0gCmflYidew8g3m8w3QvBPF+GZDsBP2sw==
X-Received: by 2002:a17:90b:1d89:b0:311:f99e:7f51 with SMTP id 98e67ed59e1d1-312415329famr1432137a91.18.1748551581341;
        Thu, 29 May 2025 13:46:21 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd9486sm16245345ad.67.2025.05.29.13.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:46:20 -0700 (PDT)
Date: Thu, 29 May 2025 13:46:17 -0700
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 3/7] iommu: Remove ops.pgsize_bitmap from drivers that
 don't use it
Message-ID: <aDjHmR7ZVTbsSITO@tjeznach.ba.rivosinc.com>
References: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>

On Tue, Apr 29, 2025 at 11:34:13AM -0300, Jason Gunthorpe wrote:
> These drivers all set the domain->pgsize_bitmap in their
> domain_alloc_paging() functions, so the ops value is never used. Delete
> it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/apple-dart.c       | 1 -
>  drivers/iommu/intel/iommu.c      | 1 -
>  drivers/iommu/iommufd/selftest.c | 1 -
>  drivers/iommu/riscv/iommu.c      | 1 -
>  drivers/iommu/virtio-iommu.c     | 6 ++----
>  5 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index bb57092ca90110..2d0d31ba28860a 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1533,7 +1533,6 @@ static void riscv_iommu_release_device(struct device *dev)
>  }
>  
>  static const struct iommu_ops riscv_iommu_ops = {
> -	.pgsize_bitmap = SZ_4K,
>  	.of_xlate = riscv_iommu_of_xlate,
>  	.identity_domain = &riscv_iommu_identity_domain,
>  	.blocked_domain = &riscv_iommu_blocking_domain,

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com> # for RISC-V

Sorry for the delayed response.
- Tomasz
