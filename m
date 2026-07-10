Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2997A38E8CC
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 21:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717447; cv=none; b=kRBZlqU3hsUwKPAzJMjiImL1u06QKM/J7ORHFIghfB3LXgqo2c12Mvydy+NFrfPXf3zglaNeF0wazHYZblIKPesP8veg8bGSgsabVbtwUUu6wPtlBSkAQXnTqAGen+4XX2TVhnuKojrDsg+/p3TRZvxJGhJVx3jGEDgaC78ulOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717447; c=relaxed/simple;
	bh=2Gu7794NM37tAeRC1T+cOMES75vIKzE7urqHPy3L3qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQbqiU1ntMCBPl1RWx49c3LEGryhSmdC/7w6cD2/XR5AEh9PwRvYORk4nXtDEKAu/QdWuSnrFQXoBDUR16BPoVawH9AkVXToQshhvoR9E+0iuJJEoyjTOeALni0WzSB4NiXxQgMVmIgX6PASdRJP0G0Asq9FVfUFfuRDDAmvk28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=GAAEi2MX; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="GAAEi2MX"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8f0d6853360so11230256d6.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 14:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783717444; x=1784322244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OhI7UcJVN9EaMSo9cM31eWAmb7Tf3pcvHFHtAkV4RLE=;
        b=GAAEi2MXoK+d/7/XAlFH+uiwIvxElpqz2dxEJAvsZNqfRI6/N79PCLifDgfeMUcqvt
         HexRjEpY/PfBP4oFj8HmYN45Gt2i2+DXm3nPp9nhWA5E/HyTGZygY/6km0Vrug3RPrVo
         l/ANztGVwLHIbt9x0+eBiitMuUIVcvOIREK4ruHnXQbfVPld5OVItIr+rsiHS4Q6k7Q0
         mMf8R06eb0qTuCS8QMBVMDNLbhvgdv/XTS4GWFw+yFPBpS8QOI93/aLd8xoOpa4pcffX
         ELNnFOC13AucrZb4Lz+pnfgIdgXUxAiq7NvnP/Sg97BHoymUuKpsob1sY+lQEbqbOFUF
         hVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717444; x=1784322244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhI7UcJVN9EaMSo9cM31eWAmb7Tf3pcvHFHtAkV4RLE=;
        b=fa1XZ03qSLlGTLOf0q2wKNRmoNHkK4g3Xq+fPiwU8aOi1ghppIxbTTCtey3my8UyaO
         2wG4mgAGFm+FstMOQOPlHIU0rZ/mewRZRkKDi6zdANiPyM+FRCnJ4IRWcKktcQL5zwOX
         TZCsYKexW5wfRRndVvk8zRv4czYmknV4UjispNG3pg5gmrMp/yBiFxPKbTeaM1ZKMOrI
         tK3sleKMULm8TtEZlRfEwHZxvD21iplKsRKcVuO6NfvFlmAM2hnrJsJOutWhwXuCAkWW
         de6FqxlxWFUYSvtVgCi67Nq2e8zIYJITxYoXRXwS3fJSwAOTSKdUwMCS23jcS6mJWXmH
         fsAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpT+p5kULf1EeQHYZD8ln9K6gSD/u6HVNCeYOba/MMNt/QDCOBtfwCe5RfeioQID3nlbRlvoxf4vg/6aA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd1NNv63+FzyuFqwiL0OLOuhARJZ83yMxbE3c1L1uPlfqdqdnl
	YqYrY+4CgfF589lWVYxXFCYMo3tN/WDBYx2aFBDvk7J9iytqx/vAfWEgBwbAo8CgpHw=
X-Gm-Gg: AfdE7cn65LD1/ZqeSrViQI2gCN/9v5C2Lg0EOsWeTsNB57xXPB2oT0/SZRat4cv6tvt
	skxuXSx5rfP2KJa+FK0U9c224TGI6VYIsBK84xlMQ61xy8l6/sZTgtQRDYhn3fawI8J/YeuO0bJ
	cIkmK7I38MfRI9KHf6A8VCPsiwYtwvlzfxgUFssNLhUZFgBlxRGaUVraALdU/QpVkpsmLaou64a
	3uUVtjoK+GMiikXBWh6zkBquo5zuYAtHNIyxYwZ/o71nLv9bFWODxBa7uOxJTcRLhmLrCkaMshu
	Amtnt7iU0nHsovIFHc6vqhfCCumuxs5v2M3w1AcbsRiaZZnE+Nt3dDzrqy8Jm5vj6XNHklPRdIZ
	pMvANoteAVukfz4fANzKl6r52iMdpKnVMAk0z/TjqAg5mDQHRAZHC/NbX2MwvYQwhLeay7C5+vZ
	Wgbg0EamWbFI5K+ZLvKYKoFylt12/66J3JZrYBpsdBcuVTRopOv9cncOY0rSBICrB30Zka
X-Received: by 2002:a05:6214:3bc7:b0:8ea:10f8:ae87 with SMTP id 6a1803df08f44-903fe450f77mr10485176d6.11.1783717444207;
        Fri, 10 Jul 2026 14:04:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50df5e2sm50655596d6.4.2026.07.10.14.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:04:03 -0700 (PDT)
Date: Fri, 10 Jul 2026 17:03:58 -0400
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
Message-ID: <alFePgFUR52GgBS7@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <22d0f4e3fe11f6fd1312734e242d008267ad142c.1782735110.git.ljs@kernel.org>
 <alFHR3fg8K1-SITK@gourry-fedora-PF4VCD3F>
 <alFJUfaGHVnKd-Nb@lucifer>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alFJUfaGHVnKd-Nb@lucifer>

On Fri, Jul 10, 2026 at 08:35:43PM +0100, Lorenzo Stoakes wrote:
> >
> > Do you actually need 3 copies of this comment or just one copy in
> > vma_internal.h?
> 
> I'd rather have it at a glance, it's a bit silly but C headers are silly :P
> 
> BTW you're kinda racing against time here as I'm on the verge of sending v2
> :P

:[ i don't refresh my inbox when i get hyperfocused and now i am sad
