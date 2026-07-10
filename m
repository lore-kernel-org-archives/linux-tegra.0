Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55E35F16B
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 19:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711568; cv=none; b=F+kbpOtyYFCA4ZY7TCDWbsDMK4tASlRBTihCL8O8QyIKIxzda2kChG+dfDvaU4NlT7/9nqOO+zZeJDxMiQ99493yuUL3lVAWYTizXfLhw+1m+MOo7eBKVoI/6f2Pw+0b6OMmwQPmoa+oHHgU5LcC35iDXJQMykJGSdgKdjUCzA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711568; c=relaxed/simple;
	bh=QOojT1E2vhWM7tSRUHih+fCOI5zTfyzCTjJ63JRhM4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jxzdmgpe5UTxqVjGZdv2VUQZ67uLkIlqa2gBQKPw3wIwCp2rlT0gJKfgdi7+8gK//tcf7mb0GkeGXX3R0WKgZLZtIQKMjwEdMPchPmDV5q9JJ4YWzkSR/JvsBmxHpaws5nJHfvTyMJOL0FtYhFQ2RngAwPm9Vn1gEXHQ1XQLsbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=dbm+yKTe; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="dbm+yKTe"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e55b62640so65489385a.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 12:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783711565; x=1784316365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHwFumUUjp1dZn3azv3jRxV2z4/4b2Y11BxxEMyANyA=;
        b=dbm+yKTeJMcBsc/CYkcTAQ4TIaGcuSrF3MF8158c1/hSDk31EH/NClDCmOcYl88b3+
         hXK2sJzbsspq3YRmQe/WvOsgPfE3Qzw5eyC/EKH6hSvkj/mG9cOY7C4On4sX5yfxN23N
         IIZT62bWwMkkXTTwstqxKOhh8SSCO4kYe+3dI0dJ/f0zNPLVc0f/SCNfGd7jQQdwLW8y
         BbAHzwTvJM0kOtacFFyDuHKqRY4VG9oFO8eAMNtw/Gb2mSJuYiE890oQvrnVkH2rMIL/
         9/oLWYzMWVDHe+7TRYQoM0jPmN3lg+xFcC9eeEkkAzAAR19IeCxBEu5izY1fuWnQK5w2
         rTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783711565; x=1784316365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHwFumUUjp1dZn3azv3jRxV2z4/4b2Y11BxxEMyANyA=;
        b=tDe87IJfVkF7kIOsmEj7G8SI/pvXWaNEYR9dJ/80L6giFpt0h/lg92TJJDw3mek+gy
         wEOO+37I//ouvDHfFeWzqsg0BDX+r589uqAOMssA41soSkKK6DJ/vKvyPBShHoB4XZSK
         NTdLxLcwQP8ta4aEOgd4cri1sl1zKnMHWtlU1mtOWKc5d4iVbhJbPntn/cjRS4/Ws/Vr
         BH6G3I6veZHVugql+ImDrqzs0MF5UKYfr/QQJlCYa0BpXlqb0jIeihJyfe0U5lCcP41a
         s9lUBhXdBwemEULtKpK4oysHfjsCTOx1OseW5ULn3TF/K0sbGrTOL+orrYyyC5vXMgrC
         8SRg==
X-Forwarded-Encrypted: i=1; AHgh+RrxH3vHyFA+TvkYVBg3WDf3gEbrxaVaAzVzXfzJw2CiEGUo2jpDowaz/8y2EUBr6DCQFlO7hZPFQigPeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNb3o8jvMpnZ20SNj0MeEUIXPvhhJ28ro3vy6JztFDgdWTNe2p
	OGP83FOL0RWaf5kfbFNIL0iRlw0q6gkdGDrKPmnJNnIGirKYacPiokkhufdDL3qrRpQ=
X-Gm-Gg: AfdE7ckLe1aNjEPqFFaFxLyrelDzVwXxHTsRlSwOqMb8jE4JBb+/VMuPn+4sCqba7cU
	hPfe0xmf6oX8ctNYaNU2K54+ISgvbTNHDix8hdvLbylcjqfv7R6agfDxOAOGUzvLXaemhBJYLYZ
	VkUkRMiYKgXBHwhfQwwccwRkHlQkQEwON9i8aJGtedsLpjoKt0ktsHJ++nyVH3HTl5R/Pe1tr6E
	JL2UWM+th8ohiiIeZ2A7DZOez9utMbwiPs9uziu1xfWTz4MS32k5yHqdPGKEs207laqsQBnWO0D
	im5drvynOC3C+wcu1P6U7366T7wD8SszOh2sE6TOUkH51TBpoYPqQgTN2wb38KFQJkxkb2HQqCH
	5ILP/zPexkv0Qao3c0VbYBrCzJxEwt0jAmffBY20uWwDSp2VqcYrXapMCvFsG+7bT7jKGGN03S1
	x7flRIn2z4o3AaH0giIvsk9OFLDKSoPtxRCTuQ/XLuhRk+VwxtmNgHjp2d/Nt/PJQ/2bWjwD2HX
	9vxmlM=
X-Received: by 2002:a05:620a:2993:b0:915:8502:f7f6 with SMTP id af79cd13be357-92ef2b575e8mr66564685a.35.1783711565033;
        Fri, 10 Jul 2026 12:26:05 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d37540sm265182485a.38.2026.07.10.12.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:26:04 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:25:59 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Dan Williams <djbw@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Matthew Wilcox <willy@infradead.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>, Hugh Dickins <hughd@google.com>,
	Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
	linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-mm@kvack.org, iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	damon@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH 27/30] mm/vma: correct incorrect vma.h inclusion
Message-ID: <alFHR3fg8K1-SITK@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <22d0f4e3fe11f6fd1312734e242d008267ad142c.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22d0f4e3fe11f6fd1312734e242d008267ad142c.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:38PM +0100, Lorenzo Stoakes wrote:
> The only files which should be including vma.h are the implementation files
> for the core VMA logic - vma.c, vma_init.c, and vma_exec.c.
> 
> This is in order to allow for userland testing of core VMA logic. In this
> cases, vma_internal.h and vma.h are included, providing both the
> dependencies upon which the core VMA logic requires and its declarations.
> 
> Userland testable VMA logic is achieved by having separate vma_internal.h
> implementations for userland and kernel.
> 
> Callers other than the core VMA implementation should include internal.h
> instead. This header does not need to include vma_internal.h as it only
> contains the vma.h declarations, for which the includes already present
> suffice.
> 
> Update code to reflect this, update comments to reflect the fact there are
> 3 VMA implementation files and document things more clearly.
> 
> While we're here, slightly improve the language of the comment describing
> vma_exec.c.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>

> +/*
> + * To allow for userland testing we place internal dependencies in
> + * vma_internal.h and external VMA API declarations in vma.h.
> + */
...
> +/*
> + * To allow for userland testing we place internal dependencies in
> + * vma_internal.h and external VMA API declarations in vma.h.
> + */
...
> +/*
> + * To allow for userland testing we place internal dependencies in
> + * vma_internal.h and external VMA API declarations in vma.h.
> + */

Do you actually need 3 copies of this comment or just one copy in
vma_internal.h?
