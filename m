Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5D13B0ADE
	for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274349; cv=none; b=mt6rJvHcJBmMqEpOhI5VY4obZH4kLcBR01y2XGxzPIdPAtcpXxZWwgw4+rmChesTaVWh1U9HHqw0cha5pHpyW2obrSTJOCHR+k1Qwh2Aq32pB3Lg1uKE9s5S2t0fFoo9a5AEsgvY9uLsg392wqI48eEE5QBQQ7LoQcckPrIYWpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274349; c=relaxed/simple;
	bh=FrJqgy6FrT/pl2LwdfE16n9Z4H8vmvSWs8GmjvMR+jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bu2Xf/3/m6GFqK5UNnnHbXno0eNX6dDsmwVTAMpL+81aGedz3gvJGwzwiA+w2je0eobTi4UAb9Ev6GHYoAEDwnLXPTGZaYes5rK4sNWlYN1maquMUaI8ElAI33xIscy2OkIiIeYbIkRoIsc9pv+E9/naVaqrB8uZQs4k4cx0WDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OzcJ9XHe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OzcJ9XHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774274346;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEtCE3UFyC9EUSjcg5HmiHx+sSKd6jmOnMFqB60P6ro=;
	b=OzcJ9XHeV0VkLipiMui9/kGUOEIfDVWiMga7dfdn08v9AV33vxyflHlHd9DQrU0rZicfOq
	gJgHVN6u5iwf36/Zo/PS89wlLeF3UNmsRCh+LygmejOva2QgcWpz9p8S4at/Oy7DqZCGSL
	qjbkWC3/BGZvDuf8RxCxpT4xCyW6vbY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-rZXRbb80NVmcHesOevigDQ-1; Mon, 23 Mar 2026 09:59:05 -0400
X-MC-Unique: rZXRbb80NVmcHesOevigDQ-1
X-Mimecast-MFC-AGG-ID: rZXRbb80NVmcHesOevigDQ_1774274344
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-485375aa56eso25449295e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 06:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774274344; x=1774879144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEtCE3UFyC9EUSjcg5HmiHx+sSKd6jmOnMFqB60P6ro=;
        b=H0Zqu88KsZpd1MP1X9CD5yJOBb/69/6ZYyk/0GLGta8ttilAqV/JChmJ3d2+UxsDEZ
         vB1bB/VTOdEKCMdaa4djqRYqZjY2E3vOswuXl+Al9mriSsCHzz90b6lWNaLDeL177xYT
         W411aBpL2X5tocONSLaU3QZ/NcLaZ/PYQQSIoaKV8FtAP781dPGBFVmXnJcc4z0GeBnp
         nNr8kD52tlLTlhxlZ0UKcGqdrN23/7wuYQbQhSGubzs+ZRGgsd15g5kEBQ8VyUv5fO0u
         RZiqKRai3A0Qxoqf27BfpAkMTmLZxcDxElZQfSEeGH0ohg8NzbhuUrO67uazPY4FQq0I
         Hs1A==
X-Forwarded-Encrypted: i=1; AJvYcCXmTzl6rRX3Hrs28Mm3W/GuP9GJwJ1SZZJaF0djJZOD3xP6ncLzfZkCMCGzonOl6RXd+dLP+hCmCS71Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD/s5pURQpeXRKwvccLHBpeFWNXyKE1We5ReMJbnith654k3WO
	Iz0r+bRtxHVJ+QLO2GJxc7FtDw3jiWUXkaBG//3FLCUBhFuyOG/wVwduVb54b6jwQ42rvK02nfO
	m9tQ3eJBrIYVGcfwCtvQ0nrpLwFivr/aTjgEkEa9OJ4eFSUgvKKY/xfWYf323lUg/
X-Gm-Gg: ATEYQzxzDrg1XMcVzveXV5bnv//P/LpvpWV8YmdYmtJa9JZbD4vnMnddLkfuQYhToKO
	jq95h/knEt38ej1RjI0r/Yj94HNxIo6xMvGTQgz9uR0cWjFcfk30gveozhWrkuEtwSjIo7sqmN0
	lTPmBPTLphm33/BBotn/a1O4YgHGC9WUraPjimW4+kCiuLyy0Cj8DVFwOBXmSSXmyl/G86kEfQA
	hJSA3Mx9WSkRk6xl7LScaOs13hXUoM8Ekw43ZJGjNI8SxFBZUo1IyJ6mu5xRy0eKOIQI2vkjRvW
	zgbj+6lmaYy38y/DEmNGUh9MPGGw4+3LqHGQLuBWEcRxfrZ6cf28YsUs5OlT2o8Nry+UNE0dCgp
	i4Pey3zHoVUILTdiXercg7ex8YUkZDzU3Yu7BZb1MOAOOqgL95xQbFYD6oVaabJXloMyR1A==
X-Received: by 2002:a05:600c:4fc8:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-486fedbf2d4mr182477935e9.9.1774274343817;
        Mon, 23 Mar 2026 06:59:03 -0700 (PDT)
X-Received: by 2002:a05:600c:4fc8:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-486fedbf2d4mr182477085e9.9.1774274343151;
        Mon, 23 Mar 2026 06:59:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm416952505e9.0.2026.03.23.06.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:59:02 -0700 (PDT)
Message-ID: <772708e4-2878-41bc-b74e-8869bce7529c@redhat.com>
Date: Mon, 23 Mar 2026 14:58:59 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH 1/2] iommu/tegra241-cmdqv: Set supports_cmd op in
 tegra241_vcmdq_hw_init()
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, jgg@nvidia.com, kevin.tian@intel.com
Cc: joro@8bytes.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, skolothumtho@nvidia.com
References: <cover.1773361875.git.nicolinc@nvidia.com>
 <7988aa837f02e44c0f436bb236cba0573bd8974f.1773361875.git.nicolinc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <7988aa837f02e44c0f436bb236cba0573bd8974f.1773361875.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nicolin,

On 3/13/26 1:36 AM, Nicolin Chen wrote:
> vintf->hyp_own is finalized in tegra241_vintf_hw_init(). On the other hand,
> tegra241_vcmdq_alloc_smmu_cmdq() is called via an init_structures callback,
> which is earlier than tegra241_vintf_hw_init().
>
> This results in the supports_cmd op always being set to the guest function,
> although this doesn't break any functionality nor have some noticeable perf
> impact since non-invalidation commands are not issued in the perf sensitive
> context.
>
> Fix this by moving supports_cmd to tegra241_vcmdq_hw_init().
>
> After this change,
>  - For a guest kernel, this will be a status quo
>  - For a host kernel, non-invalidation commands will be issued to VCMDQ(s)
>
> Fixes: a9d40285bdef ("iommu/tegra241-cmdqv: Limit CMDs for VCMDQs of a guest owned VINTF")
> Reported-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Closes: https://lore.kernel.org/qemu-devel/CH3PR12MB754836BEE54E39B30C7210C0AB44A@CH3PR12MB7548.namprd12.prod.outlook.com/
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index 6fe5563eaf9eb..83f6e9f6c51d6 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -479,6 +479,10 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
>  	/* Reset VCMDQ */
>  	tegra241_vcmdq_hw_deinit(vcmdq);
>  
> +	/* vintf->hyp_own is a HW state finalized in tegra241_vintf_hw_init() */
> +	if (!vcmdq->vintf->hyp_own)
> +		vcmdq->cmdq.supports_cmd = tegra241_guest_vcmdq_supports_cmd;
> +
>  	/* Configure and enable VCMDQ */
>  	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
>  
> @@ -639,9 +643,6 @@ static int tegra241_vcmdq_alloc_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
>  	q->q_base = q->base_dma & VCMDQ_ADDR;
>  	q->q_base |= FIELD_PREP(VCMDQ_LOG2SIZE, q->llq.max_n_shift);
>  
> -	if (!vcmdq->vintf->hyp_own)
> -		cmdq->supports_cmd = tegra241_guest_vcmdq_supports_cmd;
> -
>  	return arm_smmu_cmdq_init(smmu, cmdq);
>  }
>  

