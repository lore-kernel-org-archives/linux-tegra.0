Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E991DED7C
	for <linux-tegra@vger.kernel.org>; Wed,  4 Jun 2025 19:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749064049; cv=none; b=tCR6UDqLstAv7XYm+T482kKFhI++Y373+1Lyodb+lgiT/xHWdnxY5AFH52m2df3Hvi9JrjRjlcSevIPHlGXKv3TsBE+Xr3bQTovlfIPFJlQJBZHhKiF6hzBieG5Yd5pO9l8WXdcOspLAb/kMKJllXc/heFVnpcELlOLy1g3jpRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749064049; c=relaxed/simple;
	bh=xuR+iSiEc9fgmg6eICgOrNs8j588oMDceBJUZM6KnSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2MMNBO5TbYSnGuuEFdN3zRD2GLLXWqzk9MPRzEX8pj0PJbfK5O1pQRcoplmIpHKEa/yQXQWOc5gyJkpnavI3H63BEmK8QalAZO54CPbn1iqrCF8zc+hoVxRgWvXnvNi6dKRtFUVj/7VeezQcYVADX5tXsUZ1QXcnS80K+0kU2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hr4amvg3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hr4amvg3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749064046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BDcwOgJcnxKoI9Ga21N4ZTVJAG6d9pqMLjrmq7B0SZQ=;
	b=hr4amvg3MhdsgDeuuibYfCJd83kXzF2oARH3YsFLn9QycH/pjXf2baAiKDZmUejdxziSk9
	oess4ZZa/vEOCnPeoYm4JI/2FNTEQutq09VGX5KzT6ix0LYRqXAEsRTMx0d/SIP/9EkyAe
	iCc38CU2jZZ3RuvtVF4VKdAdzApbr8c=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-_-9jXP0jPpaKV-7hlx97pQ-1; Wed, 04 Jun 2025 15:07:25 -0400
X-MC-Unique: _-9jXP0jPpaKV-7hlx97pQ-1
X-Mimecast-MFC-AGG-ID: _-9jXP0jPpaKV-7hlx97pQ_1749064045
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so36419285a.3
        for <linux-tegra@vger.kernel.org>; Wed, 04 Jun 2025 12:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749064045; x=1749668845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDcwOgJcnxKoI9Ga21N4ZTVJAG6d9pqMLjrmq7B0SZQ=;
        b=K44c8da91XQv9EsJQJVEAOdV6OFlOaJ1PbWpo5Nv/XvLotwA+H2Q/S5Mu7YaGMTrIB
         MEQcmpxjWECySagEkFD5vtXwo8pbkLF5IHTMWXN228Wj2GBfC+iyScHbYGlrHBdtU7B5
         072EGr5gu6436znLNAiPo+kFmwiOq33MchqsnQJqjZQ850L5X7T+bfv3ZipXMp9otq3k
         LzqdywIw8LOm70rkgZOQKJ9b271fylZiLOyE/i+rcmgBtemBGBpgDWOVte6T/VLV6r0r
         Saev+uJCWZ8iK6jTqELYNXJ5agRDJ5/oelVVtCYHUN4j4zEHvZLDpdH4kIrdv2Ndje0O
         gOIg==
X-Forwarded-Encrypted: i=1; AJvYcCX/rvJCOK0Ak2frcE3Hfe9Y8jS7O4r0e5ojoAzgWxjbliF4cjkw7WSAFGQ9uUm/OccFVpO5VHOJORM1mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsHM3YzL2DkE4jMiZJy0+1zHU/C/z5+xKkGS1Nq30g/XJp2h/i
	4gWgJW6cKa+4l9Nvsqd0omKeRv2ZM3njxHn/MaFhnb/9sjmBI7u5owsj8+ThaWx569mDOkDi9cm
	2pdufe2YEu+t5ZLQN93+OC4ti26m9eIxmrPAUN+SSA2AnyS8lOOzsqA89grZAb53U
X-Gm-Gg: ASbGncu5ETuQShdCQVVljrlShyPKsrI1MVkILq6e+ioKV4M5pP8plkQ3VXkA66WnIG8
	8Fh/Xlnvyb+5uV9Hjf2uCf9/HQO3rrvAs7oeam1a/VL49kOBeZOrBiyENDk4p+tFsoqb+bnrNgr
	DuOxIfEuAYpWMeWT0ckkPpt6717Domj4ixABcz1ZaodxOZvpwhtXfD6z2EUwueBFzZxPQc4SsMt
	iuG+2+9iyg9uhW6RU6ZQwDrueFPi1wHZ6CCDV0DQ2g69QnZ0oHa0PAT9A/JiSUjujyJZfoYeaXN
	G93BTdpUS8J/FFqR7s2HDuiuq9tD2dR/XodGyqTZ
X-Received: by 2002:a05:620a:318c:b0:7d0:a511:3fab with SMTP id af79cd13be357-7d21988b7ebmr626683985a.21.1749064044749;
        Wed, 04 Jun 2025 12:07:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq/1wCy12sAvReQmIFAcfWv0YoxgYU7pWp9MBMGwc4L5cCHAlpE29zQqh42VKwrN6fkfeIpQ==
X-Received: by 2002:a05:620a:318c:b0:7d0:a511:3fab with SMTP id af79cd13be357-7d21988b7ebmr626677985a.21.1749064044133;
        Wed, 04 Jun 2025 12:07:24 -0700 (PDT)
Received: from localhost (ip70-163-223-251.ph.ph.cox.net. [70.163.223.251])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a1a76cdsm1079620985a.97.2025.06.04.12.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 12:07:23 -0700 (PDT)
Date: Wed, 4 Jun 2025 12:07:22 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Joerg Roedel <jroedel@suse.de>, patches@lists.linux.dev
Subject: Re: [PATCH rc] iommu/terga: Fix incorrect size calculation
Message-ID: <iwix6xmwcg3bcenfdu7t3vp5dc4c6nu5orzytb5tu5abkorsro@5hoo7b5p6zwv>
References: <0-v1-da7b8b3d57eb+ce-iommu_terga_sizeof_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-da7b8b3d57eb+ce-iommu_terga_sizeof_jgg@nvidia.com>

On Tue, Jun 03, 2025 at 04:14:45PM -0300, Jason Gunthorpe wrote:
> This driver uses a mixture of ways to get the size of a PTE,
> tegra_smmu_set_pde() did it as sizeof(*pd) which became wrong when pd
> switched to a struct tegra_pd.
> 
> Switch pd back to a u32* in tegra_smmu_set_pde() so the sizeof(*pd)
> returns 4.
> 
> Fixes: 50568f87d1e2 ("iommu/terga: Do not use struct page as the handle for as->pd memory")
> Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Closes: https://lore.kernel.org/all/62e7f7fe-6200-4e4f-ad42-d58ad272baa6@tecnico.ulisboa.pt/
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/tegra-smmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 61897d50162dd7..e58fe9d8b9e77e 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -559,11 +559,11 @@ static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
>  {
>  	unsigned int pd_index = iova_pd_index(iova);
>  	struct tegra_smmu *smmu = as->smmu;
> -	struct tegra_pd *pd = as->pd;
> +	u32 *pd = &as->pd->val[pd_index];
>  	unsigned long offset = pd_index * sizeof(*pd);
>  
>  	/* Set the page directory entry first */
> -	pd->val[pd_index] = value;
> +	*pd = value;
>  
>  	/* The flush the page directory entry from caches */
>  	dma_sync_single_range_for_device(smmu->dev, as->pd_dma, offset,
> 
> base-commit: 7d4dfa6140f75b67f8eff3ae6ebc9937be94c4d3
> -- 
> 2.43.0
> 

The tiniest of nits with the typo in the summary of terga vs tegra,
but other than that.

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

