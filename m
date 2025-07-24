Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF8526E710
	for <linux-tegra@vger.kernel.org>; Thu, 24 Jul 2025 20:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753390558; cv=none; b=Q/64tzSFC95Lq6+vSaUi8Jr7SE0vFPNPLTyqNZ6AuZxjgpmf4FozMGg3XdkhpXI2YKdv7y201rtg8UUzJ7UEsY3NvooCaRf9G1BhkptJH6vw5twEGjGF3JG5f34POAQ+ONPtPmZO0Q/psZalheSxxls2Yv01oqcpMzc/AlaCO4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753390558; c=relaxed/simple;
	bh=WVnPqwTo77Pc+iMCvphoAqe39pYBfadoUM7KubCgV6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKq9klFJcOeA2agade4AM2+KtwJpi9W53TzTJyAezQbICNbRB+yYvDrQvaPWXS/imROFkDSrUVJEq4rtmoR26fxcf9Awe3ygctIbSx/twDNclE8ZxKogG+ys4hnn0mz2oE5QtHsRtcpKrU+RWU1xx/KI6hjaELvrbzPmdT8nneM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oYVeXrb8; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oYVeXrb8"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-237f18108d2so59775ad.0
        for <linux-tegra@vger.kernel.org>; Thu, 24 Jul 2025 13:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753390557; x=1753995357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gTENdrjrQjKdf4LTtk0rNbYwdganBE87alZpnHbaQAo=;
        b=oYVeXrb8EmuRNdoLKVZ5e+ykLOMT7cAlSwClCQ7cK+iby1h+K0At7cVQXY+umWrNOt
         uNjgxKL30L9WeZiFkVehDEH7iuNw9ac5HOT+gBjGykVojQ0fdTQ3zEnjG3ZA/HcMLdXs
         gv9x65YJ31YgOb3uU3ihW+3r3v0ZWv0BPVrZzaDSLVfOVHS+ub2bMVpwGhCbp3CEFC7r
         uFROO56qr116n1NBa9xLOUpjPD1jNJ3JLZEyq/sLzFua0A/RR2IY+b2o0Y+pblR8SN6b
         IATvngyKrHqenofvWQdIkI3qvILY7TrrTEoYTReyAN4O+yhQxVei5NhBmh7Qgpx3rcAL
         0daQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753390557; x=1753995357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTENdrjrQjKdf4LTtk0rNbYwdganBE87alZpnHbaQAo=;
        b=dMMGZY/RmQcalEYc/wRnqgwxltPDr3nh9TO/it7gekdsgC3N5tasDfr7CrYbS10N5I
         N/zdEsIaWbVTKHG/F1p5FFqFsESuAkCX/zgaT+MB3NnvfUsEYY3ohpL7ktz0/RtmPKzx
         ZJLjlQaqnu8wk3wg7pyNt8KQCQ0LkOwjFxb7ni2Lq1DEPZUuuQTqLay/K+FsGLwuF87l
         JCcF3umttppVuuKAnuFVGxYqGobgIYJeCFpzfTeZnESE0CRmseunwxqIm0HW0455HjoR
         K5DZfMz06b1zlec0YVuC/gH1h82aewNyEMPnBaQbUJG3GXNPzbSCxR83TTGh80oJ0s7l
         Wt/g==
X-Forwarded-Encrypted: i=1; AJvYcCXqOsfSYeFBtzQ7DzwX5/Jh1AYoriEeUExo0ECAo5wyvsbVKCudtNfw6AkVLnGvbvpOm8qAn8U7rgRN9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzetnfOUAlD7oCqceVAzv6osppusckDRSk7ueoczAp7XbDHmo3
	SkQdNmBA5rncKfo7fzNbaJLM3YoiQnVGEk809pr9PfKL7/hEQuVdJrhZ7eiOr0Ggiw==
X-Gm-Gg: ASbGnctYUHNxw5t1sZCyegqRCwoAXLm44W1RO6jcbZJ8h+ZG9BO+jyQy6kY+taX0B+C
	r2xtJYwzuFJpcZjuIyWww7JXQZTpghPhmpL5Ds9gm5uL1tz6HG0eLBUgj6yDv0QeQUtzrP9r6er
	jvbFDa8UOEau4WYTQ3tsrhXG3pNuMim19N/xfeRFI30fZy7fWxmniDxmDjCvUHtXH3UQfddFFFy
	Jkb8LWBGTobc+RDcxjkE0FvYrYP1GVHA323/J5eh68zhOiaOZKpDNeht5Bknz23YkdXb50vhYf2
	RGWh/r31iIR0odK7vezwsEVLWlT4hvkv1/32lebdE4/tiU/1MadByQizT9SCILN10xinPXV7J7b
	smY8ta+VUm+UiogidtCpj13U1gxBY0qorhRzfFdsEXCcwE82+/OWcZ7P+
X-Google-Smtp-Source: AGHT+IHAKLnuNj4dfO0gvzhHyjc+lG/rACu6++zv+Qt1qddir1QwuV7zgtdYIfUhlyrA+12IZWRoQw==
X-Received: by 2002:a17:902:ef48:b0:223:ff93:322f with SMTP id d9443c01a7336-23fada587f0mr920885ad.2.1753390556054;
        Thu, 24 Jul 2025 13:55:56 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475deafsm22232285ad.11.2025.07.24.13.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:55:55 -0700 (PDT)
Date: Thu, 24 Jul 2025 20:55:50 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIKd1owebUNQeN1-@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
 <aIEwzM7mKUI8-h9U@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIEwzM7mKUI8-h9U@google.com>

On Wed, Jul 23, 2025 at 06:58:20PM +0000, Pranjal Shrivastava wrote:
> On Wed, Jul 23, 2025 at 11:05:26AM -0700, Nicolin Chen wrote:
> > On Wed, Jul 23, 2025 at 01:37:53PM +0000, Pranjal Shrivastava wrote:
> > > On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> > > > @@ -1273,6 +1279,10 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
> > > >  	phys_addr_t page0_base;
> > > >  	int ret;
> > > >  
> > > > +	/* Unsupported type was rejected in tegra241_cmdqv_get_vintf_size() */

Sorry, if this wasn't clear in the previous comment. I meant this
comment must be updated, the "unsupported type" wasn't rejected in
vintf_size, rather the type got corrupted which brought us here. Had the
vintf_size rejected it, we wouldn't be calling the init op.

Thanks,
Praan

> > > > +	if (WARN_ON(vsmmu->core.type != IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV))
> > > > +		return -EOPNOTSUPP;
> > > > +
> > > 
> > > Nit: I don't think we'd expect a call to this if the vintf_size returned
> > > 0? I see that in iommufd_viommu_alloc_ioctl, we already have a check:
> > 
> > It's added in the previous patch where I explained that this is
> > to detect data corruption. When something like that happens, it
> > would be often illogical.
> > 
> 
> Right.. I got mis-led by the comment, my point is that if an
> "unsupported type" was rejected in _get_vintf_size, we wouldn't be here
> calling viommu_init since we error out based on the check in
> iommufd_viommu_alloc_ioctl.. but yes, if there was some data corruption
> that changed the viommu type between these calls, I guess it makes sense
> to check and error out here.
> 
> > > And call ops->viommu_init only when the above isn't met. Thus,
> > > if we still end up calling ops->viommu_init, shouldn't we BUG_ON() it?
> > > I'd rather have the core code handle such things (since the driver is
> > > simply implementing the ops) and BUG_ON() something that's terribly
> > > wrong..
> > 
> > BUG_ON is discouraged following the coding style:
> > https://docs.kernel.org/process/coding-style.html#use-warn-rather-than-bug
> > 
> 
> Noted. Thanks.
> 
> > > I can't see any ops->viommu_init being called elsewhere atm, let me
> > > know if there's a different path that I missed..
> > 
> > I see it as a precaution that should never get triggered. But in
> > case that it happens, I don't want it to proceed further wasting
> > precious HW resource given that this function allocates a VINTF.
> > 
> 
> Agreed.
> 
> > Nicolin
> 
> Praan
