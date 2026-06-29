Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7B37B023
	for <linux-tegra@vger.kernel.org>; Mon, 29 Jun 2026 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747623; cv=none; b=Wo0p0Mo8LViDe8htBD5654IDHSIDZbCd4B6nV1r69K6VwiWODZzQtCEf9ruwKoDdHYYAxvt7mzlQgkz+HndsInqoa1I7QCGpbpFzTIZa7EMMq6yEUfCygZ3gReRkpDm1Up/FoE1ff6PkfAgtGjPi4qzXF9kPbeuU55BJSqM1Zgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747623; c=relaxed/simple;
	bh=wTZ867cLvl3NEk7csUy7NtkIFljCREofjieQ4f4eY6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWNXQ/pOFtR2w90rPWwoBHjyQQAPbMCjYPZjYiC6Oz6PwU7DhI0f7TefRnjXj1v6sX7dynordomY79pOObQXojaNnHlriavCikpGjxM2spDu+aeALVeD/+jsljw4CtcEvRsWHiaYUv+YXcj3YqitnL8mDJlky4zvRNkChOxAZqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=rlI/CDK2; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="rlI/CDK2"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-519ff1c8b8bso41920371cf.3
        for <linux-tegra@vger.kernel.org>; Mon, 29 Jun 2026 08:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782747619; x=1783352419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VwgemlAWVZOfyfvrJ+7cyHmQGRLai3JgFnH6EFj5//k=;
        b=rlI/CDK2Me2Etlx0NUkaHtRU+6rVLYVzfsgo3i4Dopx/2QYpJJyxXzwr3cnt/dsnQi
         c7ypbUJWyZrOclOTOo6xuS2x8j6h+YbrMDDzO04dRP/9MZI9xlFOaRleW2eF4FKXc2oP
         1nhfYC3dofYj3kga3Ya0HWk6wBZo++TjajS3+6vEuC8oT/rb69G26r4OCj5ta+x+crBT
         WNhEhQy+v48nJMdFyK8CO3cb5bpxZ08fg57jYe7qPCx9Xcs3739pKT89IDi+3yaD2yCN
         aM+IejLgEjH9gnlRl0fCieJR2PcnGG96QNC64qauIdZ9x6GaO094v5hpKdyg7+5e84iQ
         C+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747619; x=1783352419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwgemlAWVZOfyfvrJ+7cyHmQGRLai3JgFnH6EFj5//k=;
        b=ETEs+e6qIhmjfPnsLk8lduVrMbl1CQnw4AKtw0R8purJaNyUtnS1xWZqhUm1PtamUm
         KaOn9HVDMC3pAdyqXu/2HiGmaHU0l2LOG6n5XyeWIqHDO6YbauwEPpw3YuJlNEU27mhb
         CLZ4YWvjdfCl7IsQQQBhB+QdC96M3CripGW8fB7al6ggpBbxbUhwBU1jMM8h4hLebu7R
         uPI5x4JY52lWTkKwErOVIWnhlvFGezRYTHlQFvV6JvGJT2y4V+kUiqcUwkuukVDBKfpJ
         OkvidZxr1cdNKTj4Qr9DXZePLOsxb6GUuAL0MHDuNgje5x1PzcbqZ/ofjbRuwoNydGZp
         eNlA==
X-Forwarded-Encrypted: i=1; AFNElJ+VxI94gCzsMPI/P8y+pONXKhLV/6kZ/iVbw6HPCnSafr93Tvex9tfJKfcf6O6x+bvEXbEeC1L9ApbdTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQie8I6iAviZhBmLjsJC0VV3LL0rI4hHMqYDZbWa05p1vSnoYd
	D3maVdj7winm4mFYI5w5DzsZ3zXennp0rRMxRKZDxazHHZALeH5mxh3jBXVqzaDcIEo=
X-Gm-Gg: AfdE7cmUo4zDHrf682bp8RS0Mzj8unIMa6kx9Mo8tKFpv1F0huWnxMantaKRyeePsUk
	Hjjqu9uc92ycFcQsL2B3Val8V0aG7a+aAOPzQLOLeseb9KFfmvwE3//7hxYSCaoObP227z9Atc/
	UhCvNtBUw7WtGNM4mWu4ERvmwFXvmxZY1cRsGEq+yVvxOkBdQWdkcXgktqi25j+Bh7xWLs2dwzU
	1WJPx8ZJaw/VqHnv0A6qGMnsdZsRagkMwnGaBu8/aMKPu8zdYp3kqGqg4/l4tS91hhsJdVajaJR
	4r2pctuUGBRq9oaGdFgiG4ik7FbWXW/9c3o96aKH6c6/twxTeFg5dajfr1daHiVc6tgDnjOhFZ5
	Mz9G0lVD5K+1aD88qcSFx62T7pqBl0xQAN5THX+RByy+SuuDtrozgf3xw1uMYDpX+YNOd3OePiN
	3/Ydf39M49+1PBsRiRR4zFyPlQjOKa2BIHWOjiDtkYxIyun0AaHVTh5THNL3vefPuqt18X
X-Received: by 2002:a05:622a:5987:b0:51b:f635:9aa1 with SMTP id d75a77b69052e-51bf6359eadmr68650541cf.48.1782747619393;
        Mon, 29 Jun 2026 08:40:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a876c888bsm78114501cf.9.2026.06.29.08.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:40:18 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:40:13 -0400
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
Subject: Re: [PATCH 03/30] tools/testing/vma: use vma_start_pgoff() in merge
 tests
Message-ID: <akKR3bFV7393yOUs@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <b501eca378b9d9734e83838102aadc9276590fba.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b501eca378b9d9734e83838102aadc9276590fba.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:14PM +0100, Lorenzo Stoakes wrote:
> Now we have the vma_start_pgoff() helper, update the merge tests to make
> use of it for consistency.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Question: Should we have primitive tests for vma_*_pgoff() since
the behavior changes depending on file/anon?

Nice to have the cleanup and clarity. Maybe worth asserting no
one ever breaks this.

for this patch though

Reviewed-by: Gregory Price <gourry@gourry.net>
