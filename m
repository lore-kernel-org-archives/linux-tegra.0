Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A596C3B992E
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 21:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718654; cv=none; b=LftKjj+u5KxkrnoWAx0nwJKThLrVku9pvkCOIyXGTnnPIn4MHHNOX/xNj4vvO/gvhXFQ8c83SAg1R+TDqMR/g2+fGPyi1mRN/RLiCdSXHFVi6uo8NncB4HutJfOnbBsssLTrVHTPNIPsVrxgRc3G7x84fbYFUAyVEwYoy7biymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718654; c=relaxed/simple;
	bh=Yv3pRZ4OX8PGYFLQCiz3pIFR252YmyQ+OnNGPLtq1u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hy8Mfqk1JKRyqImDm69EwwTOoBsGEmO/KFyjtzYBJJCw3ucMqpRJAvMNSYIcf3c2EZ70HW2jukCddaGi/uFiUmyOpAOlIGuRz70XlddOI/OCwYo7Dw3PskKN9AuilEcA5BlX4cfpLeYV3EZcnTPPSXP4Za01wyyf8dhAU5qN9xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FL0K6NB3; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="FL0K6NB3"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so11789996d6.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 14:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783718651; x=1784323451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hyoj4hjMSeCH2l8wiR4N5JqU7D2zu2bS+BNg0w05A5I=;
        b=FL0K6NB3hTo1xsdzE4NyALnsu64Ws+e+cSv71NFPTjSIJJhJ1lUMN+qQTXWyuIJWGm
         /m8gjRDZ8G9j7ziZ4jGbj32iS95QtRTsFqbZaJGDm6HyW9ScRB3knNPq6mVxEfTNXuGA
         lv2X/ccQX63tMmcZtGil1iChHRYYZuUY8SBq3xJprEVTwhW4fBN3mG2/WbEj1e/k/S75
         QCHF+djSBHVVuXnTdMXSV029iIL1Cezyv3VJT5Q5oi+D4MPA4bMUdpqFo9tJPO/CTgTA
         9yBqcMofZpygCKqEZ+FKogDFNfv421Lg6VfGw9fE+So36GtIL2zEzgJY+X1FeL2KjS7M
         EGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718651; x=1784323451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyoj4hjMSeCH2l8wiR4N5JqU7D2zu2bS+BNg0w05A5I=;
        b=WBbCa0TvLPthPdN/VIez+g1TrxKKc8OkGQOFJukVO09GhPF85yBZBqoUuuh1nRriNA
         LUS2WaPbRa62eaCAh/7kDmtEPW5xLnzMA/FS50APOxM9zUrCsutbxqYTH/ga6KGaSFSB
         7YIwsbHMb92cl5Wq8cwMYeaw+M8lr8It6f21IDoZHiAF6Jz/sbotHNaGb8BZ9FadT7QH
         O4vYer9lHhBffIB0sbH+k4PZlZVyfCR5WvXZnf61FxTluBO93iQDfcACMy2pcSmnU+gc
         tf0icDhDxCdf4k2LkWqhTYo+PjIMTbUap2N4Gvpii4tU8L+BPQX2TgOEU/UsnOGf1Fyp
         j9zQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/JtM/LDDg40blNuaz/cPQ6V6ketBLdPTOwoT2sJoH+aif8uXNJbSbsSx/ZLWmH2dOpa80RaIkKfBy2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkpOiGHbE7Ket+o83wtiiOf4XEFflFRkOWKpMw8kd+0VqgFFQA
	T1TwWIL/vl8ojXz4s7yjzThKub/tTnhCJpIoYbqZkCOjlEXHCtVTGENKdXNYBlyNGJ8=
X-Gm-Gg: AfdE7cl1/5opa2yIu6fPF6i28U2AZcxryW37XAYnRAoYwVFlWjG/qeZGnEkg46cXKFP
	GaQeiInO/hIZF03ILK5qPKoyeeOuYPWTwtSMmUgO8p+ri7Y6es3z/AGQZQmSsloLpMPNw+PX5RW
	lrF4aFHDD7O2hgDr3yfIl1ComJK6OAkdGlPo1RMzf4EO1u9zsuk3HQ7tTCqqsA+CIsQIwRy4oVc
	9z3ZmVrzP9BZsyW5P38fVrJg/KmDYjxxrikXN9/WE2k+i1fOoKIcr5rhnCzAjUyTOCS4KQwsR49
	laxFSCkJdWUwvppi27KjjmqQ09+wAoETCdQI0NziUTR2nY8bnRT5A60SJShxWaHVBVeyFw4RHCx
	cYYxaI2X5ND2Rse/PJ8BufhiIZ3iNz4yI8JNCLxFZ238aT0UmmQLpuikPfaMtfI+Qot3iw/Sbjv
	Lkx1qmUQSdoFlCVZvYAvMirTPV6YTAqJJ8XAwKqvqP+xHOasniZF/G5QorEhVAKSlDA3o3
X-Received: by 2002:a05:6214:5b10:b0:901:730f:5eab with SMTP id 6a1803df08f44-9040038208amr9843886d6.27.1783718650605;
        Fri, 10 Jul 2026 14:24:10 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd82e9d5csm50431486d6.41.2026.07.10.14.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:24:09 -0700 (PDT)
Date: Fri, 10 Jul 2026 17:24:03 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>,
	Lance Yang <lance.yang@linux.dev>, Pedro Falcato <pfalcato@suse.de>,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Dan Williams <djbw@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, damon@lists.linux.dev,
	iommu@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	kvm@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>
Subject: Re: [PATCH v2 22/33] mm/vma: introduce vma_assert_can_modify()
Message-ID: <alFi5J3-UQtvTzxV@gourry-fedora-PF4VCD3F>
References: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
 <20260710-b4-pre-scalable-cow-v2-22-2a5aa403d977@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-b4-pre-scalable-cow-v2-22-2a5aa403d977@kernel.org>

On Fri, Jul 10, 2026 at 09:17:03PM +0100, Lorenzo Stoakes wrote:
> vma_assert_write_locked() and vma_assert_attached() are useful for their
> own purposes, however VMA code absolutely does allow the modification of
> non-write locked VMAs if they are at that point detached (i.e. unreachable
> from anywhere).
> 
> It's therefore useful to be able to assert that a VMA is either
> detached (modification doesn't matter) or write locked (you're explicitly
> locked for modification).
> 
> Therefore introduce vma_assert_can_modify() for this purpose.
> 
> While we're here, make vma_is_attached() available generally - if
> !CONFIG_PER_VMA_LOCK, then there's no sense in which a VMA is
> detached (vma_mark_detached() is a noop), so have this default to true in
> this case.
> 
> Also update VMA userland tests to reflect this change, correcting the
> previously open-coded vma_assert_[attached,detached]() there.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>
