Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F06146AEE0
	for <linux-tegra@vger.kernel.org>; Tue, 30 Jun 2026 15:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834921; cv=none; b=JThaN0Sa7B1+S3Llc0RSthSBl+EdqvhApyU6tLim2Ts5A5iI5x1fwiWlqZAFdx4580etbh8/T9MqEE09dLbQrcBIJwE65ZsHpktTc+PyRRKLfkSl/iZhFtz4DC7XRmPnfN8awthe5nGI5Q0NBaRO23r0Vb8se9auF3ouv4cmknM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834921; c=relaxed/simple;
	bh=q/CdBZIJ6A6qBJyymYNRI6oVTAoCPywZ7vcualAVIBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9PKZvwPuK9327aTMIugPYnbquhK4EsE6HqDs51Tr9t8LgOJ0YUTu7IhAPluph2RvaJDpL7vKhC7f+kYe/+7M1XaOj8sKN+KTRKMF9ps6LOz4gYMd7fyiAof2mHs9onE/3rzS/duE/IfH6fh3uJIRmtHe0UbbOKuvsdMnwv9XsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=hAXgfuyB; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="hAXgfuyB"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51a0188b92fso48610621cf.3
        for <linux-tegra@vger.kernel.org>; Tue, 30 Jun 2026 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782834918; x=1783439718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BHpENWZilS5aqo8aP9kraE35F/fs2tmonTK7cFttpS4=;
        b=hAXgfuyBmNSRLBE9y2YF+F07dfSGqHp1xa4sOxR62JYnFeKn0O8SVUpt0MG/md/bBA
         JctoHB5oCxWZ0Vqte8bR8RSDqbwrPbLPyAVhB0DByHbOdA2IOjZEXwL28LDk2LiqVjrv
         z7cG0BHGgqC45FdoWw1cu4SJuJyQa88fRtGXXXfw7jyqkOqfCXplQUZeMMFCZELfo79Z
         1rk+m2RY+h+2uqsjj4YAZSp59JxW4a4ytdwsdrD3N7DKSKtyf+EXlgO8ty+/hiKhPyOz
         5gPFlMDUP1DBAOlIJqYE17f25yvB/zUT9IPprAkfMavu6WBQtA17ghH9sjittg5ZdSha
         jlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782834918; x=1783439718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHpENWZilS5aqo8aP9kraE35F/fs2tmonTK7cFttpS4=;
        b=H0grxj1L5KSx61dyYQHp7BBucfxQP7jv7lBGhCqmO3BQRa2V6RXeXLqLxWtXmNLiFM
         9cHkVPqdLgkgxOPybPVauymCsUQUtSot9/0381lF85hbePrk4LBsdHTH+l1qioEl8baP
         5jrZQtebVAPNIpwKSAZSYvgdT1dduSKrgtKAOyk4jgRZoMKIXXTiApg03eJ/MWzPTzHN
         4vM0TODTvPeyINUftY7HVTVcFNOL3cJk3BrOIliHmrMlJDzArq8t7JB4uTdf4lICLTOl
         dbh011xKv+OeBe95BNO6wAjQfl80Qaoos9MW4pRVs5P54YEBT7Bc/LLnxqFsUUqCp44V
         Ontg==
X-Forwarded-Encrypted: i=1; AFNElJ/AQP71JkSp6jkmNpy9eM3M5k1jIiAnzpBOB8rr/nwQcprUN0zE9sjb7K/S6oH8XjgRFlJeMG8KCtQf9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5eA42H9QImSxRWjtJ71vs9cEqkMRfVAr5NDyQW8FAIDGwQuvK
	YwSYWuDYDVbTzw142uWLBbqulGyV/Hf3CHoGGDQay+X6edNAIMEeaRXO0tTABjDbLs4=
X-Gm-Gg: AfdE7cnby18rAmupfUd0thvd21iAzsnd0QRMtGAz+XkxLXYHSWw3wfRF7gaK87R335/
	tcuvvuQ7omZTkq3yiEfW/IjQ8BxIbBnoE07f9AD5JCgyCSGsQEHyKdK/q6Jt0ixGdptdoppJmYt
	btGbnSDxZgwgxNs3Hi/f/rpM+DPkOMP8ur739SgxgSZZLBA68G8oxb/7BSbxg5a4vXuYL3SbrBd
	ua6h6+IqTp4jW5qeLv5HudL5m8Eubu4UzBV7sSjKh5B8EG/Mc5t74YnulbxvfqXTd+MkvfcDlD+
	z4RirHo6zVTdTM+gzaVB3q0kFcVoDh42bmhaeP+B88tF5Hc/2ZFdawWLUIO7nYpTYH9yxpkyIL0
	dtkbdjldDi91Bw4oLEFO+LGYAzc4vYMCU01Fs+PxTHbQdrNaDHNDQPOu57XTHZOvAmlzA9UVF5A
	93aHnHp39NWDQfvSW2nbU0/Bhv0I7f7d3W2csodwvtsZ7ZjHDwhctnKu4RbCq4zF3hzTgJ
X-Received: by 2002:a05:622a:586:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51c10911601mr53620781cf.61.1782834918282;
        Tue, 30 Jun 2026 08:55:18 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c1080d149sm23102481cf.1.2026.06.30.08.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:55:17 -0700 (PDT)
Date: Tue, 30 Jun 2026 11:55:12 -0400
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
Subject: Re: [PATCH 09/30] mm/rmap: parameterise anon_vma_interval_tree_*()
 by anon_vma
Message-ID: <akPm4FlwTj0FsZU9@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <1c1df7b905ef340cbf2effef769a4e770a8e0eb1.1782735110.git.ljs@kernel.org>
 <akPk5o_gHD1SxX_0@gourry-fedora-PF4VCD3F>
 <akPlUrNWzl1ZPw1S@lucifer>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akPlUrNWzl1ZPw1S@lucifer>

On Tue, Jun 30, 2026 at 04:49:45PM +0100, Lorenzo Stoakes wrote:
> On Tue, Jun 30, 2026 at 11:46:46AM -0400, Gregory Price wrote:
> > On Mon, Jun 29, 2026 at 01:23:20PM +0100, Lorenzo Stoakes wrote:
> > > Similar to what we did with mapping_interval_tree*(), let's declare
> > > anon_vma_interval_tree*() in terms of anon_vma rather than rb_root_cached.
> > >
> > > In each case the rb tree referenced is &anon_vma->rb_root, so just pass
> > > anon_vma and the functions can figure this out themselves.
> > >
> > > Additionally, rename 'node' to 'avc', 'index' to 'pgoff_start', and 'last'
> > > to 'pgoff_last' to make clear what is being passed.
> > >
> >
> > would it be possible to split the pure rename changes out from the
> > changed function declarations?  It's hard to pick out this as something
> > that needs to be looked at as more than just a %s/x/y/
> 
> Hmmm do I have to? :P 

I mean, no :]

> I mean sure I can on a respin potentially, but it is a
> pretty trivial change? Just mechnically as above.
> 

And yeah certainly not worth a respin.  Just learning some of the
friction points of reviewing as I spend a little more time doing it
every day.

~Gregory
