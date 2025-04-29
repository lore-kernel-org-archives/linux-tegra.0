Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A49261362
	for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 21:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963279; cv=none; b=ogtW6Y4DpmT2sfqLBPd4qG9vR6gc6jxXYx7EMsuRep/DoOmwv7MmBMJbmE3QvJEQcmNAsEdRfOXMcb7ww78+JjeNxDO3qgk4yO5BknOl5Mann6QqVY+fzd2UTCcToMJHThMLtg7OjoFyuA7v/KBINoek+kin+enpnVgzP0pkzMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963279; c=relaxed/simple;
	bh=Duhnxo2adP6UJYufvvUxQ7vXQx/l15K0ZRqltJQCe/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrfL06bloiV3mScTAqMNnGxCyU0kkj038fnajbkvBjIYtOE3u0wiaYzsrPAsB6BGZIcwPSGOIRAbmrOey/Jovi6L/00kc6Xji4Zv35e9Cc8fX6hF1LnRThaXNqpBjC6xe7e9QFGJ2DgWvl33P6lSOzwNo9mfq4FhQisWXnxLvuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=trYtiYsA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="trYtiYsA"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2264c9d0295so240035ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 14:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745963277; x=1746568077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCmXc+ODhBacc+4C2xK0F/Ie+nOBoW/7aTrNsgbeX88=;
        b=trYtiYsATtd5QlG2zV2Dp2Wyuiupe3QasFaawn3Zfs+RWQ0QLopNnqsX77q9nkgb9/
         bTzByT+phmQ8myaIpaaMpq9jXFXM1odtbH+CZvdxZrLGBvYg5T/mQW2c3Aduo2q7PYFt
         fzxQCG2zoNfvdx7D1eGVCNZH9v5ssE1OzaX4U3C2MFv8rxGbo3B7Otv38Q1F9fgZl3M7
         nKh7fOIToKCrgTMOTRtdVryzFF6Xib6iSgzE50qXCmYodwJiIhHQP9YCz5P3yh/NYcv4
         JOP8NNfiDeVOJYHU0XYxK8CYknqp9apwLsuG433HbbInW7p1N81QVYDAg9FUgMyKEGzc
         ds7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963277; x=1746568077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCmXc+ODhBacc+4C2xK0F/Ie+nOBoW/7aTrNsgbeX88=;
        b=DsZd0Di2ce4u+WFp9ICRP1M2AMbNKZD6UeLivVMoReXEbTiapsVROJhaEDHHIaAaOp
         HqIfHfU9MU37rFDufwF8PiGYvaZD2WSDjsd+V3YuY5xj45sPBMGXuvRdreTC3xefsjXM
         nTrlUGvM0U7b3/dMGTgjah0CGbmuhjgYy+FNjrJnxs9p/OS1stNDtc4MEjJOBfMiKZo+
         syDqPiFM0/+qAyl347OJZ0efnTh/eN6Uh2r7D2t4HnLnwlo2wvR82r2EzO6O76e/8rrG
         nykn+npSkdcICJsAe/pXwaTSSekYcfmpcGKQkfajkvGvXcoR/bEH/azyBPc0y6Bek1qU
         +VFA==
X-Forwarded-Encrypted: i=1; AJvYcCWxKWapi72xwmYYmQApv8NqoBFqIrSWkU7/eBP6WmX7K0EbYTqZUBdZTwOMwAoR/FZx5wrUIEuq19Oe5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMmQtBxicWG2ngZfR2MiPxOOzuNyHMql3FtbbOl4qgpJDbpnl/
	Lb1dVOpRSHDk9MNwaq44dvx9bpddlhqPrE0xDoOqy0IqhSyQvML+9G+3Xkr5mQ==
X-Gm-Gg: ASbGncvUmDkjUW/j6X/vznuPIvRdot/jHJsuOV88BMI5t7J2khnl0YUxRcj5gPkMZPk
	t/KlE1UhLSDzdph9qFlMMaupfI30KDk8WqTj++q2lLQXRBFRp0me2dkXkRDF1hJVm72eF1favSl
	r1FVVsXAiBQwcxPjtIp+y3VHL+C0H10cAjYJszxI6kY8WzZeZnINs+n5MxJKErcYtAYj7Bs57YU
	lrUJQzQZM14G3nK21d6xr+TRWiaiN97XdfpoYZsjVnr1c2tUs84iGiAgdCJhFPt51oKDgKhKXae
	1z6XC7PJcFCwiyZcskCprTPZ48qZg3lpunyE9sm7U7K59skfdwp2gXHQfoooImv4E76K22SH
X-Google-Smtp-Source: AGHT+IFMqCAjaX52HtimqP3RondUOuNsl/Pw968hKtIW8LO6HydfSjoFrb+e/I5aVwqY3qXA13e21w==
X-Received: by 2002:a17:902:f649:b0:216:7aaa:4c5f with SMTP id d9443c01a7336-22df53e42e4mr308665ad.3.1745963277038;
        Tue, 29 Apr 2025 14:47:57 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a119ffsm32042a91.21.2025.04.29.14.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:47:56 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:47:46 +0000
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
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 18/22] iommu/tegra241-cmdqv: Use request_threaded_irq
Message-ID: <aBFJAhpnPoUh-wQC@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <fb97e2407ebad5240f3981bbf4121a75ccd1ea57.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb97e2407ebad5240f3981bbf4121a75ccd1ea57.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:58:13PM -0700, Nicolin Chen wrote:
> A vIRQ can be reported only from a threaded IRQ context. Change to use
> to request_threaded_irq to support that.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Acked-by: Pranjal Shrivastava <praan@google.com>

> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index dd7d030d2e89..ba029f7d24ce 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -824,8 +824,9 @@ __tegra241_cmdqv_probe(struct arm_smmu_device *smmu, struct resource *res,
>  	cmdqv->dev = smmu->impl_dev;
>  
>  	if (cmdqv->irq > 0) {
> -		ret = request_irq(irq, tegra241_cmdqv_isr, 0, "tegra241-cmdqv",
> -				  cmdqv);
> +		ret = request_threaded_irq(irq, NULL, tegra241_cmdqv_isr,
> +					   IRQF_ONESHOT, "tegra241-cmdqv",
> +					   cmdqv);
>  		if (ret) {
>  			dev_err(cmdqv->dev, "failed to request irq (%d): %d\n",
>  				cmdqv->irq, ret);
> -- 
> 2.43.0
> 
