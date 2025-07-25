Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0B3253358
	for <linux-tegra@vger.kernel.org>; Fri, 25 Jul 2025 09:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753435122; cv=none; b=TR+HKusCLwlPdnlINZZ/kOIA0g5em5j0T4YHEKQJPQm6RVtsSfxQ2xd4muysvA+blhjFwWtZ4y7xCUmX3zP4zX6FC5VmEL0yJL6BklQ3sUSK4uBR94xZTgFINioJmI/2e588QPy0EcGAdjwd/YO7i3aHGdeVzzfNLXnKTxeSNOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753435122; c=relaxed/simple;
	bh=xpef2y2maBnIdrYwyhOyyrKOl5EEcqRqvsYz90m6gd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FClbnPFBm0IOGbHg/SralcLL5uIXb8Ug/mYyuWb6P5X60lFgtu6VcI2qvJUzmEn+yc0bFLYI4ucMpHVrCWe8HvJJFT4QAjwvAGpNN/cOr2qGiXuQ1SWdv3ecoERq29nuKJLw4xUvbD/Xy8j5cnb3VvbrHvDfEgjItQBOFAAD4MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A+PongbX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A+PongbX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4561b43de62so68325e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 25 Jul 2025 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753435119; x=1754039919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx1cvWLmG31uLnbCDZX1np35fkcLxkLr007ob70MLnA=;
        b=A+PongbX3p6F5vV3Y8nPX7NDUJis/U5Z6z/e2eCdkuIA2JJsEV6A0vNz41Yj/sw3WJ
         bi+ajPClBlc0mMuIf+aQtEO4FK+b/uGUrZ2qWZP6hKSX4WMGh/EtZcYwwURdnHiFIHK0
         wpNxp/NI4Rwtv5/NlAOfeHNFPC1zHiJz8waoRQ/cBwsPKt03fO6wAedz9AaUiWb+PtI6
         bRVIoutD9L/NTyJpRrvB2sHPsjE4tyxGEbxDYte2aYhXPOt22L61FgK2sWyk+DtY0bzs
         2244N0c1btwUPCRrAEhoesVbS7XATw6GoMC3rgyAB4q3UnHaXFuaObXH2fT156U92W3L
         /gwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753435119; x=1754039919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx1cvWLmG31uLnbCDZX1np35fkcLxkLr007ob70MLnA=;
        b=ky4GYeythlx/Utj9JHTNIBo38Ck+F+bVcbUQkgp64s6IjLyCD8eM8fRpsyq8JYNNTT
         K9mdxu1mwNdnPWzrs1ATWD51OpjQP+vt+MAlal78BBpEQ7e2Zv6pgVGeq7ZedKmBBP6C
         sT1Oi7IQo7dhZ6BqKgU92C35LBfeC+0f2DhMeCVEWWij4G7rOcZ2ITKogmj8/wEpOsi+
         1/nQbxnTgLCkrNycvouhqPSxjYG5Os8KKM9cZ3P3LbhP+vG6FDI47xVgCv7wiPiXCWzW
         2Nb9jUv+5INr6m3R84qKM5W427Qf+dFYFFxtAhnZ3xeLPx93aNrgPAtX9HusawXxhWOi
         ceWg==
X-Forwarded-Encrypted: i=1; AJvYcCXBuNmz7Xpdg9aOHdM39nUCLaIYUpYpElZrUTMH/BLnFt25k55Ht7ZAi5n8gdApiwdREEjp+t5HnaYyPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn2EEUOuB7LAkQx4rZd2cNwvsCQG7Ujx2js9hdwZBKaEHnPghV
	PbnwhYuGQo/nuBRHHiBLCS3iKPGAv9W/cOJboyFZwgCuB39foEAHoCYkPuaeRY9e/A==
X-Gm-Gg: ASbGncsjuDT0hvX4MTVKcAjP8jA1hXxrScjCH+Pj6htkPA46IcJ4FmsYtPCV8yOGJZV
	q2Y5psP8OJ1zjBpw4y45fmkJG2hM29QtDbkS+nuTNJJwVlNyfWlxeJ6UUXZJ5e+HWofZOJkrdCT
	gtPzKDqTgvPE5/pPsI5XVpqFOT5YZf4qtoTPnf1FEVR3VgiCYnzmSP4ADX1H2kGpmjHsegXF5Bp
	d+V+LmHnR3xXAnQmwggk+7YIKhWSkVc5fWTdh4ZdG6XbB/vJIpj0EhQXRWwurCjgJVPj+oQ/JwV
	d23xsLpVOJR+4oC0Z9WY3ojzgwqbicLNXJj8ehjmDD+awn/mvbMwAg1Aat7OAxqeFLZEu2mqsCh
	N33bb+Qns5Xtkxm/hWO3/bN6+zkIpjn+4aF+6/pN3t2P7x59fifvkKaNQsU+JHODZtxNP
X-Google-Smtp-Source: AGHT+IG/k0Q54xhpN2oIpbKY4vSeV5TCdZSBuTuoauwrucxpglZQHZulK/b5JzyYYm2oFY7AoMBuLw==
X-Received: by 2002:a05:600c:548b:b0:455:fb2e:95e9 with SMTP id 5b1f17b1804b1-458730cfd06mr1447805e9.6.1753435119066;
        Fri, 25 Jul 2025 02:18:39 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705c4dbdsm49065635e9.25.2025.07.25.02.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 02:18:38 -0700 (PDT)
Date: Fri, 25 Jul 2025 09:18:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Pranjal Shrivastava <praan@google.com>, jgg@nvidia.com, will@kernel.org,
	joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aINL66r_1NO3Nx-f@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
 <aIEwzM7mKUI8-h9U@google.com>
 <aIKd1owebUNQeN1-@google.com>
 <aIKqaGMMpsIuAVab@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIKqaGMMpsIuAVab@Asurada-Nvidia>

Hi Nicolin,

On Thu, Jul 24, 2025 at 02:49:28PM -0700, Nicolin Chen wrote:
> On Thu, Jul 24, 2025 at 08:55:50PM +0000, Pranjal Shrivastava wrote:
> > On Wed, Jul 23, 2025 at 06:58:20PM +0000, Pranjal Shrivastava wrote:
> > > On Wed, Jul 23, 2025 at 11:05:26AM -0700, Nicolin Chen wrote:
> > > > On Wed, Jul 23, 2025 at 01:37:53PM +0000, Pranjal Shrivastava wrote:
> > > > > On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> > > > > > @@ -1273,6 +1279,10 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
> > > > > >  	phys_addr_t page0_base;
> > > > > >  	int ret;
> > > > > >  
> > > > > > +	/* Unsupported type was rejected in tegra241_cmdqv_get_vintf_size() */
> > 
> > Sorry, if this wasn't clear in the previous comment. I meant this
> > comment must be updated, the "unsupported type" wasn't rejected in
> > vintf_size, rather the type got corrupted which brought us here.
> 
> Any unsupported type would be indeed rejected by the init op
> callback. There is nothing wrong with that statement.
> 
> It indicates that we shouldn't see an unsupported type here,
> unless some serious kernel bug like data corruption happens,
> which is implied by the WARN_ON itself.
> 
> > Had the
> > vintf_size rejected it, we wouldn't be calling the init op.
> 
> A data corruption could happen any time, not related to the
> init op. A concurrent buggy thread can overwrite the vIOMMU
> object when a write access to its adjacent memory overflows.

Can you please elaborate on that, as memory corruption can happen
any time event after the next check and there is no way to defend
against that?

Thanks,
Mostafa

> 
> Nicolin
