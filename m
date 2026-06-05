Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F8A40E8E6
	for <linux-tegra@vger.kernel.org>; Fri,  5 Jun 2026 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668658; cv=none; b=cL6P3lwbnnDbDj2EzU0ljmZyUJGoE/dHzMKul7yOV33xyO0LiO9LqhSQxoEw1+4u+XC70O2yyHemkIysg9kRXecnNoUzaDp2PWdTKubs5/nmg+YIAiMESkB0y1p14Du4Y2YXnZ89HKza23ExlGlkVFcE88iaRF51h+AC4Jqzeqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668658; c=relaxed/simple;
	bh=W02qjvHYgDMmbpjNbp+lJoOTYJg9xT1q7z0bTk3ZHys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpTfJXJ0Sd5iUQkI0s6EDQKQCIGd36RctiDdyCdol5wxmjonlyp6XIbfiaO5qW3TQddjm+Xhr3PjddYG5/wcsBu8c7IdXwfnfGBtEYFsRs1b8Wj0cG4hbvybdf4tpo3ib4w/Wg62C3EVIhB4yKkiC/oGJMAfrCVycH0RhbGsvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WF2wUEBQ; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WF2wUEBQ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5178a42caa3so17599481cf.1
        for <linux-tegra@vger.kernel.org>; Fri, 05 Jun 2026 07:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780668656; x=1781273456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UR0H1P2VS3kaB3iZ1809TswMb1cbtGLR3JmcUIz3mWM=;
        b=WF2wUEBQzmDvMo+GebN6QYZLgOBnfJqLUDizbEqJ/iI8bPJwM6AZuZ1yrjIVSO+nXo
         3Q1DkBi/SJIHRxE2r+tlDRPQlswtm0eu/viMWFDbkim9JBc5U2ttl0acG7qbDXSYxy13
         U/nLkLIn1xm32vyM6q1va5lFf9hC90fw6ytpdPICXIpUozBim7IvszKjaNg/FJ/wa/lc
         auuw3hPDzpLvlqhQDihay5tBUn+ICp+uwWjZg6ow7ywYGeqabks/p6g4pSGt0a01bgFe
         b8kw5FBfT1Y/wlC3j/Oj9IcIv/KvnILwV+0eLQWP2JwqiTZ/6YUAuW3uoqBvo+DiWQuO
         4EBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780668656; x=1781273456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UR0H1P2VS3kaB3iZ1809TswMb1cbtGLR3JmcUIz3mWM=;
        b=T0LJu7qaxk0rNTjiomjQDmDJAF8GgUgUV7THRig4/PyLcNMrJRk7JyBXy1VjKjLDJr
         DjgBOKHWzbg/x7ZRnEdSwpG79tWJq6YF0Q4I2I+m6bMfm/wBmw6Ta6hf5NLqHOXC34cd
         MfesIyHZqVhB6SL1DNeUOTm5+lW6DYHW7DD8Soz36qf80uW8Y2PbCp9tMvjtZ7LPgrZe
         Ecb9SIpG0wtGBl1ppiQXV2n0utuhBy+YBSPefb3PZC3vI5eJwlEujjuznlG/xmM/Q9Y6
         MqkbxuqnSsKebGQjoGTIWbldB01m8pfUBLt3soM14SW9YOcy9SUAHPwrlW7uHsf46G6I
         Sgeg==
X-Forwarded-Encrypted: i=1; AFNElJ+OPQtOsoYhvakZ75USpJzPNH/ZAb5KRWknyHdMiIrSznZPY3tj/PIz1J3anLbliSO56NOYTEO4T7oNFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhv8BOQr9BBWRHt5IaG9ifML9coFcUUqPS0TvCSU7e0bWjwS8K
	XXgS4tTrQrNlzIkqugUpcMWxerVevCEF5Q3UNEUsnn7do9LRdLyMrc9RJAF+wU3kvQs=
X-Gm-Gg: Acq92OHAR3EFFtZiXn9HYqHuiuc+0OOLbvYBKLwdKiV3LV0NF2h55/mG3nvSAVOQmoo
	y0q8isB+LRuYsgECRi2HwHdSGMQVqZulJelpze7u6CzhJ4VV2DjQ9s0BrxoxDrZkIFCumR6wzes
	pUdTemZ8SbZgO0hwgzHYnIbpc7aP1GWUWIIim6lVthmXfSyT+rkJVYdy0cM35trjC62XT7+IOui
	rr2Wcnhll1eyUlNC4t0ynAmU7Z6vksEy8PtU1zJKABCKOxvrIk6ZknRNAyvlqBUAMUpI3dXWPAF
	r1Bjjl5Ty9D+tjm0sE0eMvYThEPsYod/V4tGZ+KA1GWzi6bgcM09rjULyV8MxOmJ/HyvfGBbtsd
	Swt2+fCUoAOI6k5hyiP1K+y9Tk79zz8k5JzPu8ef8JvgUZ8snDDpOtU3ZyvMzIfvCf7PMasYRzZ
	fuFd9ZwOwlx+iS9IyT9kTvhMdJnms3CjgwY/kf+ld4X2fF0vHfM2y27ct96JncsQaSL5ni6fE2y
	HeZjV85SAf7jfhB
X-Received: by 2002:a05:622a:244:b0:517:5f11:b353 with SMTP id d75a77b69052e-5179888c297mr31853621cf.41.1780668655956;
        Fri, 05 Jun 2026 07:10:55 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775e2e16dsm80797461cf.31.2026.06.05.07.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:10:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wVVG9-0000000BEgc-3cQ9;
	Fri, 05 Jun 2026 11:10:53 -0300
Date: Fri, 5 Jun 2026 11:10:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: Will Deacon <will@kernel.org>, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/arm-smmu-v3: Detect Tegra264 erratum
Message-ID: <20260605141053.GF2487554@ziepe.ca>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <20260601104845.995005-3-amhetre@nvidia.com>
 <ah85c4u011WNJQgE@willie-the-truck>
 <09a501ff-d1e8-4035-95c1-a6df9f0cb9d0@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09a501ff-d1e8-4035-95c1-a6df9f0cb9d0@nvidia.com>

On Fri, Jun 05, 2026 at 07:35:35PM +0530, Ashish Mhetre wrote:
> > > +{
> > > +     if (!(smmu->options & ARM_SMMU_OPT_TLBI_TWICE))
> > > +             return false;
> > Maybe we should make this a static key?
> 
> Okay. Shall I add just static key and remove option bit, or
> have static key alongside existing option bit such that
> static_branch_unlikely will precede the option bit check?

You'd have the static key and the options. Keep it simple, enable the
static key once if any driver probes to set TWICE. Check the key
before options to get the best code gen

But IDK if it is really worth it, there are already lots of branches
on the performance tlbi flow, and we didn't do this for other tlbi
affecting errata..

IDK if we really care about branches we should also be doing things
like disabling the range/non-range paths and ATC based on what is
actually in use..

Jason
