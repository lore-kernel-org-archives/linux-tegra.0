Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0751E0B8A
	for <linux-tegra@vger.kernel.org>; Wed,  4 Sep 2024 18:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725475665; cv=none; b=NaxlPsVUoyGOm1wuQ+aT0QHAQ8jWMieNQDu9LW91lBphVoRymdK+N6fg7ICDYeWlW9ivG4w2Ds3EcwCZGbh0B8mIHcw9UuJqdi0Y2G0+n97v+CPREhT46XXgMbUmu6ynji0B/ipicc2HtFkkTCpQyvxzyUZ6mArbeTwWUxikszw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725475665; c=relaxed/simple;
	bh=lrU7LxXzdXDSjvIaXsqb/AJNQasjQbJedtLBCndRWuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIc00bFCkScfuZQHjLv3XRv6jb0JE8gRbrHu+TCRcuRGVFqDGdbEt60dVLDtjK3sBAtC3QntmQiyRBqjJ5KPEQFpsP0o4tVaAfJZmG02KZWZ+BWvqgH4mW5KQzRxThZ+5zLRtMoR7S61y8AuJlyqZSJ249J3JcMiXztpDKd1mHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k9NjGuah; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k9NjGuah"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374c84dcc90so767666f8f.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Sep 2024 11:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725475662; x=1726080462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J1sOTjbGiTfYU76/4hwnSdqVQONpdSXw33Cp+OKZCY0=;
        b=k9NjGuahw0+R8Df1vEomsCsAa6RYg+N/e4/asjcnkduz0ObOpSD2qfBb5L2fvI6O/I
         NJ4OdPDfFRt+d1yGXau6b8ZwEdKf2RsvrOE3yo5t+1u/TpGlJtvTuGCgRb+KwXE8Hfgy
         piUy69ShiQNBWn4j0gnKxEQ6CUwFlVclU2JxI3k4Je18L2scLZme7d1ElHIW+Z7f+gNu
         gcqW79qxJkAtbj4m2XjafgbBkA4yxxEto7gDGA+fWzOnX7I9DJD2IMeT3soHYtjwbIUk
         ysCxI7rs+bEUEHRTuDKuPuA274Xw4OyeUYK0KsiQ6aabCf74w1DPnz92vD+CYUqgENI9
         g5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475662; x=1726080462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1sOTjbGiTfYU76/4hwnSdqVQONpdSXw33Cp+OKZCY0=;
        b=Y3DOODADMnSXtu9a5RLZ+i6WUWv6JDl+7pclwTg1a+FrcPXte+qLn72TuT6GT38dBR
         BWvtqSR0MQt+q1wQbXFZ2ynmSis/A7brYikvWsS6Ue/iGSwf2VoWq6NY/JadC79xqV+w
         VZcg2ZJA6iTZtPqXfd3Xjy4IaVSEmWJkEbImh0a0bgFSj0OEw2KJmE/ezS6W0EY9B4et
         RRTGff22U5jbhGmg/Gbqzv2fyx1cQFrDX1WsB7n2OZQnRtPgPKj39BR3jo/oFxUglSrB
         2Akd5XB7klhEWFW16WjzfxDS2TVDSf6Nih9HMdB7rQXsCPzyqVRlZfsW/YRsR3EmU+Ll
         jOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR8FqOR2uiZ4agZo8WTRelfGt5bTLGUvlIB1FSa4lwPKecJsQ9QHAXOLJXvKIixwzPeevgmZH/DOv/RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAFsacHuk+zjMaut3t4/jwZ61XM37DDI2MKKqdMFAI3jfEht0r
	7oqgx5Gq9z0tPJDRl4Pu5NqbibwjNlNVghQhHbDcTCYBGrDutrevpAwg72t1wgY=
X-Google-Smtp-Source: AGHT+IGzsQvoCKOjO/Cylk1kBO1FW6E1WCBxsVExaX0lwhu5MvsqiKiSEIMSYAf/zuGdNl4iFjERJA==
X-Received: by 2002:adf:e411:0:b0:374:c17a:55b5 with SMTP id ffacd0b85a97d-3776f452f6bmr2098110f8f.14.1725475661701;
        Wed, 04 Sep 2024 11:47:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c4ae4850sm11061105f8f.61.2024.09.04.11.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:47:41 -0700 (PDT)
Date: Wed, 4 Sep 2024 21:47:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v14 08/10] iommu/arm-smmu-v3: Add in-kernel support for
 NVIDIA Tegra241 (Grace) CMDQV
Message-ID: <e8ab846f-e3ed-403e-af5b-492153a632ce@stanley.mountain>
References: <cover.1724970714.git.nicolinc@nvidia.com>
 <dce50490b2c10b7254fb36aa73ed7ffd812b283a.1724970714.git.nicolinc@nvidia.com>
 <38b6ed33-886f-4ec7-9196-1728f1d8c1b3@stanley.mountain>
 <Zth59xLYZ4skc4yb@Asurada-Nvidia>
 <fcf44982-166a-4a25-acd0-02a142e205d7@stanley.mountain>
 <ZtibUr0dRdAL7DjU@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtibUr0dRdAL7DjU@Asurada-Nvidia>

On Wed, Sep 04, 2024 at 10:39:30AM -0700, Nicolin Chen wrote:
> On Wed, Sep 04, 2024 at 08:12:19PM +0300, Dan Carpenter wrote:
>  
> > On Wed, Sep 04, 2024 at 08:17:11AM -0700, Nicolin Chen wrote:
> > > Hi Dan,
> > >
> > > On Wed, Sep 04, 2024 at 10:29:26AM +0300, Dan Carpenter wrote:
> > >
> > > > I was reviewing Smatch warnings:
> > > >
> > > >     drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:616 tegra241_cmdqv_init_vintf()
> > > >     error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
> > > >
> > > > The problem is that we're calling ida_alloc_max() where max is always zero.
> > > >
> > > > > +static int tegra241_cmdqv_init_vintf(struct tegra241_cmdqv *cmdqv, u16 max_idx,
> > > > > +                                  struct tegra241_vintf *vintf)
> > > > > +{
> > > > > +
> > > > > +     u16 idx;
> > > > > +     int ret;
> > > > > +
> > > > > +     ret = ida_alloc_max(&cmdqv->vintf_ids, max_idx, GFP_KERNEL);
> > > > > +     if (ret < 0)
> > > > > +             return ret;
> > > > > +     idx = ret;
> > > >
> > > > max_idx is always zero so idx is always zero.
> > >
> > > There is a followup series adding support for max[1, max_vintf].
> > > And I guess that would make Smatch happy. I'd personally prefer
> > > keep this by ignoring the Smatch warning. But if you think the
> > > common practice is to drop it and add back, I'd be okay with it.
> > >
> > 
> > I'm just reviewing static checker warnings so I don't know the back story...
> > How long are we going to have to wait for the follow on patchset?
> 
> There are a couple of dependencies we need to get merged first.
> So, it might take a few months I think.
> 
> Perhaps I can make a small patch by changing the ida_alloc_max
> in the common place here to iad_alloc_range(.., 1, max,..) in
> the caller of the followup series. Then the existing caller for
> vintf0 wouldn't need an ida_alloc().

Nah, forget about it.  We can wait for a few months.

regards,
dan carpenter

