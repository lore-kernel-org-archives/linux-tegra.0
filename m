Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579C33E8688
	for <linux-tegra@vger.kernel.org>; Tue,  7 Jul 2026 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441614; cv=none; b=OUaCJHYNiAWiRpGE6lQWjb4pM7zvMUyxbMcl+uPQkt33oxnFtwRTFNzMoeaWom2EY9dUkFgf74p7BWijy4HB6vyBoQibQq92aWg3XzR0Gbi7LV3Q+bYCqAAnu+4qbyaZqNggIuxATfvPo/hP3Wkra28455YgXnsBBWMfCK2yNaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441614; c=relaxed/simple;
	bh=YNUiKnsVmS0YnEoi5UBidfFcsIdy4Lv/4umM1P9hbyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8dELdD56G0hRCJGrxXkjVb9sedQAV6rN6eVMfEaF4mfq3w4Jtq0QxXKZ+Axo78/tPHg27AnuGdzsoAY3tn/uxr0ElVAn2/nFUt7xymfqBniBFlrgLCzs2EEKmKjtPAB0o3Do7yPShLqnRUYr8tawYi/YcBNK8oDPliIHakG1pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=u9XK5Da4; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="u9XK5Da4"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e5d6f35c1so379773485a.0
        for <linux-tegra@vger.kernel.org>; Tue, 07 Jul 2026 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783441611; x=1784046411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pPJvCom7n6xLJkZnxYC/ipfbqNHo6N+N3CeZviAw0k=;
        b=u9XK5Da4IKO5YCa7r9wRdeAZRbdN+BblJr6cMTVoKzAXJiBI2XpI+81GYJqI3wwNEf
         ltCrKtUyPdrgJVwskmyo7KsshDiCu2+FHddX7vy/fhe2g1z+PvsiOcCNBcCnsMWcu8lp
         +CiD2I7O8xxySLq/J64ifb9NGk1cJqsvti9BUmDXr/ReF8IhV0x3gmjIus6+hcPzgAZz
         MyDClWncjmMN6+RT262effEyciC7qzg74LLcJJ47ODH+lqgBpNwOTFZx8749gZk+5bxg
         8+zmp+HJAccni27zzrj/r1tFAj3Bf/qyhoMbmkJb9EazJVlrQxigXnRAkGfYol/geJ7e
         2xBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783441611; x=1784046411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pPJvCom7n6xLJkZnxYC/ipfbqNHo6N+N3CeZviAw0k=;
        b=DMtM5YhK959whxK89ShS/OVKDa/8nHwUsbEXfWBhBkxf/HwotbMczc4OXAY5GABjUp
         9HgLmgpKWkM7kXWM7/cnpeVxqKN1JciGoVQMlMdqfkEUGO2LL7jN6sYYfPWQ7NsBmpc7
         TeZvAl1X2OBfP6TS7F4KrFYlTFj5CqdRi49/e7tVSWTMfIX20GqxAzoJo1jvMeiYg8/Y
         3NDDVg5S0Mmjog35aPNxaytsQ6oMDRNHAmzCaE3rRMRBsmMmqiEOwYtaMlQwqVASHWGV
         ZZEU8x1OG0rt0ffhgkS4H03NTHFz9c4ryeBGsqTvUSUh/MiJkBTIP5lqLx+qf+f8dJ+N
         FyqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqFGR46YnT37N419/Eq0TfVcu5oL8cIg9S0jq2aTgoEyELWpiOxoBHdkyAgOdDhCV8LL1ysvGGViVtQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWBeTkZzaB1q4sd31My0S0etTNwO7rSyF2x3KCD0E9JF2VccME
	efgNUIKqsz1x69QZOYXWHb3yEQy0yoBJk8RSli0LsM21lKMuuORCd55QMCjOsZxKcMw=
X-Gm-Gg: AfdE7cluUKRyU0CFF07jsW/MHz6vMwT5MAuIhyC2biuCSyop30uWLDro4JUHjwrfkZk
	7h1eXEWY5ZknYZEfRYkklzdAAu0QwN36gL5WVuaQ12bfZbapQVk9kWSJ3jAbpT+a/JAlO3yFHNz
	W/1anf1N5tRmGr/Qzjm3f/Jy77hk4UsTmv8Wl9OhCgOZeIJRTy/VApb2SjPBm8ABQgBmVIASWVB
	rjFKsxesb9wgQbl/t7cedwJSYyzfeiMSASgayWuo2LyuolD2DC/POJMmvMeFhq9lbQgW2vnqGmP
	7pW9XYaNzKa/+MN25ex5VNtd5U5nIKeYUyW5rsjX7zf5ndV91IIIJiyVUYpyGMVO7YXSJCeeuWC
	xetrsAaT5BZxCHJAZdmO7ROC0ktxkfzIi5MQDZFJQluXdzQZ5OM36sEFGPAbyb7EqrP0AZ/Q1/k
	mOc1waI4aqDtLWw12ucQ4230cDKKeSLMSj+QWIS/Vvhm0jhIDQdhzKvFxgSHpBIlZ7K/zeiBJ8/
	UicqBY=
X-Received: by 2002:a05:620a:a807:b0:92e:c118:18b9 with SMTP id af79cd13be357-92ec1181fa1mr324497185a.88.1783441610850;
        Tue, 07 Jul 2026 09:26:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ba41fesm1231337385a.17.2026.07.07.09.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:26:49 -0700 (PDT)
Date: Tue, 7 Jul 2026 12:26:43 -0400
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
Subject: Re: [PATCH 12/30] mm/vma: clean up anon_vma_compatible()
Message-ID: <ak0owyNkHX6mw4pe@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <5a7a07bd2a774989849b0fea84f758059ed914df.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a7a07bd2a774989849b0fea84f758059ed914df.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:23PM +0100, Lorenzo Stoakes wrote:
> Break up the existing very large conditional, add comments and use
> vma_[start/end]_pgoff() to make clearer what we're doing here.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>
