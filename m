Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287413976BE
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 20:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783714811; cv=none; b=OG/7fSTrtPtQt8zSZIJM+rW9fGLg8wBU/jZf5r/X4S+SAXKy5X6aUcS5w2spUj/XVfsyiIfmLh+hiNgo9g08+QKTHgE+s9KT5RAQQBBBlzyD40HW5jnBh2oU+4JA+SlNpw97ounxn4QASRwprHkx6A7wN25b1RwSYtQ14aUKni8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783714811; c=relaxed/simple;
	bh=hY0ihDWAncS8x5azfJXUc95BFne8Ovg7UFiz7I6gZN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtnUklmv/JAR/6exXnOl99JHEJrKFHv/NYkr4DrmNNnt3P2L4RZr1IxpPYbqukxwCVHIv7Gr7KaYeDZAcwuFlYGqWK+XhYWF3IL09289MfR8QsPxz0SfKy/iwtY6F35lryqafjJIYjLF/SKgP5YWbrQeE6lRIyu3cPGlE7ly7qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=eG8GGm8p; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="eG8GGm8p"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c2149571dso11631771cf.3
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 13:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783714809; x=1784319609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Atx/vDG1sDwzZEMAHR3NGh72ccSeLTTbFrhohwZH8Yk=;
        b=eG8GGm8pzq8y5sg5O6s1TBGHdiGK9ZJuqN+eRFnswMDz0mlx8zq8wU9EkHINUeYBMQ
         lxBTYmXel2QtocI2ASnbOWl1rTW1avzZRfWNLCB5fdsIXsiB17wblBsudoekqZEg3N1N
         FwxpvrqA1BFMUzbtA3amT4HSpYw4DRovmlZUdBhevSvdPIJyX1WWUz/4VIvQMzMaDpBB
         4VjUSHV8NEsPa2Q2r5PNGIs5WKgms0hrXn17gw+HWv06iBp9ZaQgoh9erfmVFnLHMEbc
         9JueLoDfadHWJaQZt+0WLmeVyRBPT4y8PvvhU/5AV5s6wkIum5Nm9/wqA0paoFCKuctk
         +z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783714809; x=1784319609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Atx/vDG1sDwzZEMAHR3NGh72ccSeLTTbFrhohwZH8Yk=;
        b=QJpzZz1lcSWKCRfa8m4bZyz9ZVyJ/WIU6UrFWEPXrDN9zwQeXCYXYywel0sPmaxA0A
         fmtkzhC+0mNpo6XaNEFqZIeo3a8zdeqyOqPHm7Tqg/g6ZaYyjYgPxzFLtTYbO30dcho7
         KKKRdh9+x1wngaxu0cNOcT92HMNrAxcDJeU9mnDZqZ0qRuRn3v+SyQR8i+Qqp8STKT2X
         Yot0aTxXz2k0otRPyc0BB94bRkcpkkN25wksuMnycalA++RtPlmYMBX+l4JR44WvolVv
         LItXMReSeLtf7zKoWnRO1Uqx1Y2OU/Ur1tUtAhrf34VapUHk67NP4oh49+ER8dW/NE7c
         lRdA==
X-Forwarded-Encrypted: i=1; AHgh+RrqG7YDnSLk9lryk0/16Kx+tDRz8vPCcGbfMsbFHWmcUPpqOM5Z5AoRhnUwGzJ8yLkqDLYPY18/zbO/BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrEUtrknNKCAzXn1YQgTsWRa+H2VhZVNwsCuwdZyzlZLMU4dl3
	9Aqj0GdXK0D9PDeXl4tTmsPpLzQbrKWxmjFPH+RLtYITSEdLTFJBzR6OpxVfTb5FVj8=
X-Gm-Gg: AfdE7cng4Up+/ZqQON+WQjCFQNrLdVAW4ioCKFPi+HJvAxnnkr+XSWpep0uTxrywh82
	TtAKFYBGI3VGyX7RGqStnUC2y2KHjp0nq4NbRB1G/BT7U6iLy7PZYJhTf9U+EtYJC81FZHWXj8K
	9pr2FhXX0agBw0bwiD2wKltrtnZg7vCpLe5iy1XeD92+sHtD5Suf9g7A0wuLKV5sUXS/0PqDLZ4
	5hGKexvyMhfXQZ94nva8rpiPurTwnskWB1MPsT2KqsE4Gx82D/H2LvuHoSgzq89t2eAgo3RrpkX
	9i1Zb3bLtgCnGcLIUjWIL9W/ojJlV2OIT34TDznO1n+fwrXBg7yl7bN8q2jKfRdu5XrVzi0ODJv
	j0Ec9QntWF1RBGdN+qfdBuXW20EeqHXKCnhmveYLdledCPTkp9ebkEjm1fCZyCURMQkrzSoMrjN
	yrR9G2WaBadKlHcZczZloKEMhW4rxKlDKJ4qsM/nzG2GxxurLvp3zHB2RMVbr4cNJdqFSK
X-Received: by 2002:ac8:7c56:0:b0:51c:1291:911c with SMTP id d75a77b69052e-51cbf0e0649mr5096251cf.14.1783714804352;
        Fri, 10 Jul 2026 13:20:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e10f4sm49427896d6.1.2026.07.10.13.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 13:20:03 -0700 (PDT)
Date: Fri, 10 Jul 2026 16:19:58 -0400
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
Subject: Re: [PATCH 29/30] tools/testing/vma: default VMA flag bits to 64-bit
Message-ID: <alFT7lx8F04rN01D@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <27cd07f6dd862d92410cf9db03f7c11e5f66854d.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27cd07f6dd862d92410cf9db03f7c11e5f66854d.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:40PM +0100, Lorenzo Stoakes wrote:
> With all of the sanitisers turned on, setting the VMA flag bits depth to
> 128 by default results in overly long build times.
> 
> Reduce this to 64 - we can always manipulate these later for testing of
> larger bitmaps as needed.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Seems like this causes instrumented inlining to go crazy.

static inline void bitmap_or(...) {
	if (small_const_nbits(nbits))
		*dst = *src1 | *src2;
	else
		__bitmap_or(dst, src1, src2, nbits);
	        ^^^^ this branch is being hit ^^^^
}

tl;dr: __bitmap_or() gets emitted and then the sanitizers have to
instrument a ton of inlined functions instead of the compiler simply
injecting a couple 'or' instructions.

if you wanted to keep the coverage you could do something like

# These can be varied to test different sizes.
NUM_VMA_FLAG_BITS ?= 64
NUM_MM_FLAG_BITS  ?= 64
CFLAGS += -DNUM_VMA_FLAG_BITS=$(NUM_VMA_FLAG_BITS) -DNUM_MM_FLAG_BITS=$(NUM_MM_FLAG_BITS)

w/ 

make NUM_VMA_FLAG_BITS=128

would let you still test the branch but not by default.

anyway:

Reviewed-by: Gregory Price <gourry@gourry.net>

~Gregory
