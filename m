Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74117223328
	for <linux-tegra@vger.kernel.org>; Wed, 23 Jul 2025 18:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753297108; cv=none; b=rKzU1yOQUQto+Rv3Nkr1bzw0jnyfijKUuWz5+Wp1mQxFI0466DHeuD5QdiixumS6eVbLO39nuCNztoGwoE7CB3ND5HvLMi017+rSNcDHeJo2ZourZyazzZOS2BO7mOhyoGEaDiv19eXr6bEc2Oi9HV7ESr37ZlYi62C2+ywdKjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753297108; c=relaxed/simple;
	bh=mmzQsMhl6rfhBdXQys7xatXOBT6V9yF5g+naRmfEqMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKZcS5cp2gidMzl2yI1j6u8auGDSUeJpLqbOJKNmuxZm5V31K/L58O9aQoiCN6NCAum5NZgO1MinGQnI1ytRm1/Uvhs0qymkNobrlBwZsid0OYdZQeNSuApMHpJGvL+6HtAGjVgOb23A+I+MNwegSTq+CiQlf5HOU3Zd7HfaBlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EvHoQ0OK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EvHoQ0OK"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235e389599fso38455ad.0
        for <linux-tegra@vger.kernel.org>; Wed, 23 Jul 2025 11:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753297106; x=1753901906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgyxBCBooV+1URrR0k+S4ytxsHSs18Tgj8DW+tHKzAo=;
        b=EvHoQ0OK0Cda5iUy1S5gE5XhTRvQt+/qJjlvlF3UxMn6Y1JPn94Zl4/vZQGWMbQXav
         +kp7wNsbZYWVTK9V6UX8USy9aLNn8CIf+u4H6SEdoO0cJalYWPefEruszZ5oGppzdCdL
         1KNJSdYc3zq2kpYaLgU2LTTKlzKndWdi97m9jeDdIRCx94re5vAC1VdC3zW2ZARqOwmo
         EEgZ1w2Go+RGvCCHbuGrgdgtrHX7XlW+LqGnjX9bSZwySD8fdAHnr/B3EPDFiybnkPI6
         sUsGHbmrEJv8gIDo+PAd/h9KuC4bnuFVebeUXMyOsEjj4GImf7gdQAPbEeCISAtAaQey
         FIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753297106; x=1753901906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgyxBCBooV+1URrR0k+S4ytxsHSs18Tgj8DW+tHKzAo=;
        b=GKknb6FFHk736Jn8xOxwj+Oj1XTpS7RKZq4YdBL3KmaELcN1wTtnHAjYzZsWHDff2K
         pIyag0HiboH9AfR82+o6q4A5U2nfbkObKQmzHdTUWt6k1GJEtxeRik4KIwpJbzxDe9KP
         urcQ+Dg+HHa5mIep0F4Byng0gStQ00TFyVhMB0fBA0/F69W56V8E3DsfDDzDORKFiAiC
         QO/r8mKEhnN6WSPHhgR2iZEgcBQ9rKswOzKNGeWTLvnm0mGe0h5ocg7UMpmWPuGYq648
         OwrpbGLiZnZ5yEO5guKMacoOLiKzBq3H9ucWKaxzdQlWVsX4AtMzskmOHpHYUi76L4VM
         l+wA==
X-Forwarded-Encrypted: i=1; AJvYcCUF7ixnSWQdtUaH7T0lTYYnl2LsC9TlnWl5pHBoZMTA1WML4F5JAH734+tzW0UsFzbczUU0KRkY/MZloA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2sY00M7BkUga1xOfJO1zagJ6sbLBdlFdnzwW2DdJB4GJzUi0T
	vPW2kZmugVnALOPunBlbJeIW1WKFmNNu2u5zb6E4d4tsKtBT2Rura0SxP8KlRJ7lRA==
X-Gm-Gg: ASbGncuC69M3VCmLjWlEMs+0DuloB5J3mq2Twl5h7w2w1tLALfQeR8fSHTkpfLeaLTa
	Gt3RLChAaCPPJKD2gL3G/pVmcUuSsMMYZNvnK53A/jpvRU0Qp5tbVzTC6cQyLrH9LXoQQFHyMBR
	Dmm/5AmyYxCaHqU658iO/IJ/LnlhiYHtGHJB58FWIsLShKstejs9tCPQh8bxPq3i68u2sNx758Q
	hSvTgWWTB5dFRLg4kU08WK1iqcl+0BI1uejondTqn0Yau6OZ42ydiEqt2i+blV+4zYzBhnwoGrd
	ZMhBtndJMTtQXG2NJn7GVx84UCiDf15A6hPVXnTslABOfnzzD4wW6/xnZpbUZQRArOa/5sa3upz
	9f2Jw8MMeQj5oDR1yL28xVvOmu2KMz1wQr4C4+O7gAK1phFmDdD7giZbZ
X-Google-Smtp-Source: AGHT+IHUkgfjZ7uajnt2ygxd4BiWFzqlf8/UuEEurXoZ/+uZ0jw37E8kKbO1K9MhbyfBxy1R4DSPBQ==
X-Received: by 2002:a17:903:124f:b0:22e:1858:fc25 with SMTP id d9443c01a7336-23fa2ef97efmr184175ad.9.1753297105524;
        Wed, 23 Jul 2025 11:58:25 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbd66eecsm10238885b3a.142.2025.07.23.11.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 11:58:25 -0700 (PDT)
Date: Wed, 23 Jul 2025 18:58:20 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIEwzM7mKUI8-h9U@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>

On Wed, Jul 23, 2025 at 11:05:26AM -0700, Nicolin Chen wrote:
> On Wed, Jul 23, 2025 at 01:37:53PM +0000, Pranjal Shrivastava wrote:
> > On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> > > @@ -1273,6 +1279,10 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
> > >  	phys_addr_t page0_base;
> > >  	int ret;
> > >  
> > > +	/* Unsupported type was rejected in tegra241_cmdqv_get_vintf_size() */
> > > +	if (WARN_ON(vsmmu->core.type != IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV))
> > > +		return -EOPNOTSUPP;
> > > +
> > 
> > Nit: I don't think we'd expect a call to this if the vintf_size returned
> > 0? I see that in iommufd_viommu_alloc_ioctl, we already have a check:
> 
> It's added in the previous patch where I explained that this is
> to detect data corruption. When something like that happens, it
> would be often illogical.
> 

Right.. I got mis-led by the comment, my point is that if an
"unsupported type" was rejected in _get_vintf_size, we wouldn't be here
calling viommu_init since we error out based on the check in
iommufd_viommu_alloc_ioctl.. but yes, if there was some data corruption
that changed the viommu type between these calls, I guess it makes sense
to check and error out here.

> > And call ops->viommu_init only when the above isn't met. Thus,
> > if we still end up calling ops->viommu_init, shouldn't we BUG_ON() it?
> > I'd rather have the core code handle such things (since the driver is
> > simply implementing the ops) and BUG_ON() something that's terribly
> > wrong..
> 
> BUG_ON is discouraged following the coding style:
> https://docs.kernel.org/process/coding-style.html#use-warn-rather-than-bug
> 

Noted. Thanks.

> > I can't see any ops->viommu_init being called elsewhere atm, let me
> > know if there's a different path that I missed..
> 
> I see it as a precaution that should never get triggered. But in
> case that it happens, I don't want it to proceed further wasting
> precious HW resource given that this function allocates a VINTF.
> 

Agreed.

> Nicolin

Praan
