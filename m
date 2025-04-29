Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98D224E00F
	for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 18:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745949807; cv=none; b=f5G/K04AJ/K/X7+JWkcduxpwK3AT425qW0KabieLOrR675uRfKjF0M3jiue5gWCuc1lt1rmyOiE/SJunSxQARkMYnnoriaUaqe2r9GPFfzwPGy7gvtHXM+Kp5L5er8XYvw8V6JNYVfqIPcwgJ/wlnolgA6uTAbHu3Qg1CArJOyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745949807; c=relaxed/simple;
	bh=/jKxrEccc/rxDV9flEdrkcq0R1bjej/EwSVckgQxFcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIzxRr0eM+OSCKqA8bXwlNSC5IvpFxk+t+7ehBxRVauzJenuOqR090k3KRxCq0J/Hx7N7gbfoLdWjlXzH6CzhkY99J8D6Q0WQpzNaKtpPkOneGRSsuR6/WeJFiLjm28hp4X2V1+Z598HA/TASXSVK7SnBZsxpz+EHu1myYwCqhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XJyFIw0W; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XJyFIw0W"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2264c9d0295so199335ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745949805; x=1746554605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5gO38QVftzp7foJd8AqWRzdImXv3oAewp8XDWFfWfG4=;
        b=XJyFIw0WqXVVAB5105nnJ5HTLB/7M1krQYJt2wmsl61Cd9y0y7gQJ+hc266kTjRd98
         GA0dZUH8IPjFpB3xeQrXG8DlIKm2Bw9OCVzJKXC3xUC2sF9mKKgmHjkvGtoTaNHjcg+o
         gSN7JV2qfCr2sxAiJwbWozNlOYk41EazpNghNO+h1mbf55TfrJ8RNWzqPoGaMQV1LQpA
         FcEvAAErdi7el76+xtKu1MHu0Qa9UY/flgM19bDvr2zHJQc+FD7FqwUraTOX71XrE4NJ
         mOZF0ISLWI7ZXbywlj1Aq76hGnErag9DgkrRj//koa3ZvJvW50bCF6WxbfK+6kFnaeNq
         Yb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745949805; x=1746554605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gO38QVftzp7foJd8AqWRzdImXv3oAewp8XDWFfWfG4=;
        b=pi2MNFqCBs9pyd2ocbOZLFgjPB2WLLD2aPOkd7RPLpnY2oOWR9aEzHPY1tUbQZ0dnU
         Ep+zN5JqRxb85R48XjR54iHBt4ztwIsSBOpEna8bR0MI02eaYBRTz0nOnWEhkIGcyPD1
         wl5u7KMJY2IFAugqyXmbXeEdf99kI6pmEQfQRjH4YKqU7mq7K5ydC4mMPqQlKgMiRo1P
         j9aOBY4SDe3BFRYcajLrXh2wYke2enNdAoP98eWpZu2CEai0yS4BuK+jFe0QsoGALsKb
         8hL3kwMGyM4wvOKNLJay1UUPQaS1ZcfUAGD8mjLqagg+6lHsp2H0yMRhIhcnSUax1fMM
         3alQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQFEvqb0odNhGoIzvx3WqrTY0sVOLs6h6TZ4uppJw1icoNGwfEr6bAgdn5VckApBzO4Y9SGNF9fyxW3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaorI4BWyAguNBHjSmKZjxSaRVzhdApVPsuFae8hbq5C97enbu
	Mu57WTQ9LqonNbnL3qokxqduhOLQDgjtu8oWthyw767DA78AHFPY2grDGBJYQA==
X-Gm-Gg: ASbGncse8VFIE9Id50JjR2zSiyqZTAzUXnfi0ZG/1u9NwwYPhx95NozcVSrb3SwDEjD
	VphvsDd+g6dTAcRGwjKDcU1g4AXf+rv2kkWy1YC0CQxKL+Cgk8svbFfJ7gRrf4JaqvitIQfSGjz
	wdS7xhw2Wr0UmOiA23CAceAjQIirB+ps/N4+0MNMSPV45IlJNvUqGc2wyjL+fgk8083E+DP6N42
	Fb0AE8Gg6i/Xs6cciOc+SAH5Z9geQDC0rtk/vnSaByPJzS5b7cMpp5k0IDKyxNPD4pzepMPQJs4
	ArEP7u0ydKj1QUyhuI685QQED/ju+i3DritWB7q5wzrS+ltJyOXqG8q2pPH21qOaAILWbdO7
X-Google-Smtp-Source: AGHT+IHcbHv78LbKHTcjYARgVuVMIU3PlvzwcFa5Mynrm4iDVnN6pnPgBf3EmKTpPOmaL66ic8Z84Q==
X-Received: by 2002:a17:902:f60a:b0:215:9ab0:402 with SMTP id d9443c01a7336-22df40757bemr145535ad.18.1745949804669;
        Tue, 29 Apr 2025 11:03:24 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded711sm9272213a12.66.2025.04.29.11.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:03:24 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:03:13 +0000
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
Subject: Re: [PATCH v2 08/22] iommufd: Abstract iopt_pin_pages and
 iopt_unpin_pages helpers
Message-ID: <aBEUYdlCLcH70UlT@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <d44272c153e7596c3cef716044de3dc6c2a8254a.1745646960.git.nicolinc@nvidia.com>
 <aA_hm_AD4Xzm3qJZ@google.com>
 <aA/9TZq99TF+MRYv@Asurada-Nvidia>
 <aBAQdq0jeoCdKdsC@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBAQdq0jeoCdKdsC@Asurada-Nvidia>

On Mon, Apr 28, 2025 at 04:34:14PM -0700, Nicolin Chen wrote:
> On Mon, Apr 28, 2025 at 03:12:33PM -0700, Nicolin Chen wrote:
> > On Mon, Apr 28, 2025 at 08:14:19PM +0000, Pranjal Shrivastava wrote:
> > > On Fri, Apr 25, 2025 at 10:58:03PM -0700, Nicolin Chen wrote:
> > > > +	iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova) {
> > > > +		unsigned long last = min(last_iova, iopt_area_last_iova(area));
> > > > +		unsigned long last_index = iopt_area_iova_to_index(area, last);
> > > > +		unsigned long index =
> > > > +			iopt_area_iova_to_index(area, iter.cur_iova);
> > > > +
> > > > +		if (area->prevent_access ||
> > > 
> > > Nit:
> > > Shouldn't we return -EBUSY or something if (area->prevent_access == 1) ?
> > > IIUC, this just means that an unmap attempt is in progress, hence avoid
> > > accessing the area.
> > 
> > Maybe. But this is what it was. So we need a different patch to
> > change that.
> 
> Rereading the code. The prevent_access is set by an unmap(), which
> means there shouldn't be any pin() and rw() as the caller should
> finish unmap() first.
> 
> In the newer use case of vCMDQ, it's similar. If VMM is unmapping
> the stage-2 mapping, it shouldn't try to allocate a vCMDQ.
> 
> -EBUSY makes some sense, but -EINVAL could still stand.
> 
> So, I am leaving it as is, since this patch is just about moving
> the functions for sharing.

Ack. I don't have a strong preference too. This should be fine, we can
re-visit this if needed in the future.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> 
> Nicolin

Thanks!
