Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1036C3939CE
	for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2026 20:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784319584; cv=none; b=WZouTzdHVzesX+HbWmJnfYir8fItRmlXE531WjRIuOICQObkdNSvPqxMegxdScCliXgAS5XYehAWTL9iKsFjEFpTLrQOVYgReAIPOTJFtHqcqEzJnhqEqG64U8ZQ6Xa5CbEfZ8WaDKxt8GDLySkuIo59hBqTvcHsqMRVY0gTYtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784319584; c=relaxed/simple;
	bh=PbNViWUgj3WBUCT3/UpmOD/6P42BeZf6CSc/xOU4GB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diY0QgQACDJJkD5If7K8gsfpG58Lglw0VqgHddx/jrhd8xIsk3GDqCjNW2e2EVkMh8Sxy4Tfy6qmHNTQc/LL7mrmo95myILqiggeQaVXC93Ep5PoZaTvkUnjVNNWPJreQ+v64ralFVUoAL9Myo7sj95oRMWdj7Vl+88u7obaQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=nxDCdeL7; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="nxDCdeL7"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e5d6f35c1so681827585a.0
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2026 13:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784319579; x=1784924379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2hbpzf52w+esSVkF8QFMW+oo8Oyq13jDlcvDql6gbs=;
        b=nxDCdeL7I7YfexVFnMm/ygiGxhax4KwIP07v1eSNxhQ9V87DIaidreAITQGVEv+1cf
         QeIxWppl+iQPMLfI22sc38VcegAWgvY40n45JfMm9AiUBh7EQ8n3pNA/S+Y7ZHs8cbLP
         UXJtfxomJUJzzMG4R2OtaMkETa4A5DKpXHAG4SsAZ3BbCkCt3KmxkLAY1FzhbPHy5wj5
         2jtmN3uQ6UZPtTS089gq8dyp2mM1XTi3cXQLvkskJWnsNcdhdirz/PkZ84pW55tbcbZQ
         Q1w+t/4dBcNGUhwzFMbV8iPZI6HpiLZMF5Gix1+a0MJ/hQg0t97Gh5XzKEzXPsfnldQ4
         17qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784319579; x=1784924379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2hbpzf52w+esSVkF8QFMW+oo8Oyq13jDlcvDql6gbs=;
        b=E2tb0RLIKns9oE8b6oCwTbWN72sG9BgpH7yT7kVrjAbx/+6hSSn//luC2NubrEnFU9
         n9aGj1DI4ABDCIIxz+mUQNmEf6bibxLl4Pi4LcwpgaDWQJD9eg48MAPl0n4B84KQfDoy
         RygQ9tJcZdfNMsov212hnu2hH72OsHFpvpTTZW1TA1C8+zPD6urglp3YLRA9B4i+T1GQ
         TRIxD9/HpkuYtW2UbRUgeWbHMeuJ1XgfyLxWilIfiOw0WBfNzUqMpk+IaoeGd7A3h7o6
         N5RYYLFiG6qApiGVlzptdeBSFsvWZVeNpXB/5Qh2+z47VOIinVFY1GOYKilQbku7gsBV
         FnYg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0UrCIOkqWf4owvQseKGnBF6NA3p4NhFjoxXAvAvfTzWXDSxOMXx77aDUGkxah9gg8J22qJOk04lcpug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyAz1MmIbVcur3kDR4wphui/6pn8ENGEpykCrtUqhs0ZHMV/D0
	Dz2DrwTJNhWFobzDxNp0oz9K8McOxNy0RyaqCbyFuNfSW22m7DHpn89uq8PZV11o+OU=
X-Gm-Gg: AfdE7ckE7At22TR5tPotWcrtjXjJEgBscO4XyBlal/9jbAfPakrUWmkzOK2kK1spDLF
	b+7Byore3Jur7C9UA6XpZkvF1RdOHjH/kfm9b6SKcGHANJ0WHAhCPUdzbFlxcHqtC4E/zjXe+YZ
	cRpH9MrnCa39ftQI35F4Fk+0FHAeP5B1HBlt1llr6rhghBUd02zS2HTTyjps61K72cdiZvhlRL4
	pdkg08Pqdleck9zfhkROWtsOXplYB8H+p7OoIhH39hJBjy9OZJPE72DJOjbjMXNd6XhNp2FbXTo
	W2mGV3SuhGNNe6hWhffEe2x2I5k/nQpQdcY5uB42iIZfgciGbcosCLKV+qLuCF9mC/Ut5nMpTic
	prPYOQh0fDRKZsssQpVhHx5TyeGRxmRYLd8RnzDI3cV+hUuZjaQ==
X-Received: by 2002:a05:620a:4588:b0:92e:e2a4:9d40 with SMTP id af79cd13be357-930b3f4547cmr452740585a.27.1784319578518;
        Fri, 17 Jul 2026 13:19:38 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b542b300sm245589785a.26.2026.07.17.13.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:19:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wkp20-000000052xd-3lLn;
	Fri, 17 Jul 2026 17:19:36 -0300
Date: Fri, 17 Jul 2026 17:19:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 3/3] iommu/arm-smmu-v3: Enable CFGI/TLBI-repeat
 workaround on Tegra264
Message-ID: <20260717201936.GD701389@ziepe.ca>
References: <20260714104202.1664187-1-amhetre@nvidia.com>
 <20260714104202.1664187-4-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714104202.1664187-4-amhetre@nvidia.com>

On Tue, Jul 14, 2026 at 10:42:02AM +0000, Ashish Mhetre wrote:

> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5357,8 +5357,10 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  	if (of_dma_is_coherent(dev->of_node))
>  		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
>  
> -	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu"))
> +	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu")) {
>  		tegra_cmdqv_dt_probe(dev->of_node, smmu);
> +		static_branch_enable(&arm_smmu_erratum_repeat_tlbi_cfgi_key);
> +	}

It is a bit of a big hammer to not have the per-instance FEAT but it
probably doesn't matter

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
