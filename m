Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43F437CD3C
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 18:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783709754; cv=none; b=WaFzezWBdNAa80zil7/aEwVUhtbQ+zHtDQF7OUgEoxg3oUZayd//HZYOQPbgh0h+xjm0bWEy9QEHHPm5/CVw9Mwp42oxtkk47q0Yz6NDUZrRa3AzfeGHBdvHu2rVPr8jQT+Xs+4upbpJCt7tEQw2v7PjfxdCio7g+FIZi4D2a+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783709754; c=relaxed/simple;
	bh=q8904xmXb7eGsUOPUyRn/bldwzD5EC9W3Q3lWVe9IXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knAcEgwUKl4j88q1YkqeVC08wYEir6t1Uctl4v3SSChfCIdCt/FmG+nQsGCDbUGv4aqEnBF+nlPBS2RwTUHsEY2tQAeRU2lFy3OdWlOjp1koY1m/oe1r+eJmb7YSiaOmfZZ6FCKXjbpHVAhf2zH93/hBdKgc8vLeajILY/b9ms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Yhly8uhG; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Yhly8uhG"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51bfad59921so7789471cf.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 11:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783709751; x=1784314551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=35hzoYcsWEd72Qin3ApbTs4xBItRwQ29eotWM9K9y9M=;
        b=Yhly8uhGT89tGzsRZKNcVob0pT7yRQoxGy0RKNn3CbUvZ/JH/Qi2LsH43Kb//xn50R
         ehvTugXKAFISISXHjE7URfqBu1A/mwBWOjL+jJUi56tdUOEUacPtX8/mQqg9uTqcpuxI
         3yayXi1K5M0zWEftVG8re3Ig9SBYw3jC9mIsBITQ6C15G7U2PnTEfKnz5KiDPjEZIo0/
         HhJN6wW5BSziQn+/Kh06uIIGmp0eTnYJAK5symbjLlteBXReUVxO/eNQqnIi8nkSo6RK
         L7CrJlNQmHeqgusP5ERJeu5YCgpYyteBiUpoy4JvEmzJcwvV5FSWjOvAGhDEFnfRDVQX
         zI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783709751; x=1784314551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35hzoYcsWEd72Qin3ApbTs4xBItRwQ29eotWM9K9y9M=;
        b=DVMi8EpPLVwVpuW58Jt5pkQwC1cwhh3vstRx1Q0ZCKWmWCcw4tPrxewpoBpbcrbmMP
         wgoPgN0bPb44kWlv53BVMoBxIukplBMxmnRcBpD4WeeRje5SnIY7Rv8bQfGhcumrFKlD
         6AVSJitDtkC3LqjE7JBDwhnLQl2bWYrSrx9c+GP7D5KYDmkJRSq4BVPYeVR8skvi/O+K
         xmEZDN4IXv2FdFkeEpJTl+hXuao4LEKgRKDuuUZs9tqDN+LV1WcatzRRZZZH0UNDg+k7
         +BiZaDlRqn/ZUO9vRqAM6ZPAWElj/kF3RgW6M/fNRmD/UdCE5/xodbd6ad+PTE/LeWqF
         oPLw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4Tmqj5Jc+NOCdDi5DKEtjwNMqklED7vZphpFVBJ5Xhgx0vXwq2zYVrSSBoAIP6LUyO2XWHhsL6xhw+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyindDJo1YxtkC8dRZIxwX5C6+Xl5mDehiQdXWh+O184M7FMbcb
	KDtqO3u04FFBKp6yQkwQGRbWlt3Ag0ut/svlqHGW+fmYeFonlVP9DQmxl0jfv9CiIMY=
X-Gm-Gg: AfdE7cncqJkwP586kdV1yM7bhKZdGxxYkQlfBRAzIdZcdln3SuolrLTmAhJcodUuOwO
	C7YOu2338kkJ7nh+5VhclZcJz2odO+Fw0rjfoqv/FpcrcKEMRZDPt0PoU4Q1tkxj2pIX7qTcY2g
	EPgBPeLqi0ycMD5//v5kFqH+LN/7OZGSuN5NqSAWte1JdoF4tCWBXz/HMlx0lJ2qMkgZ9BtZ7MM
	6S/egSGAbKfZhy3lLFLq9n4tE/tzsVKs6kBw5Rv71fLgw9xhNSZB7gD3ONves2i+b/avqBeq4az
	a9pR9BCyjbZGPMFmUX+NsH2GO+n1c9ML6uLFhEWNE/fdHnxewMkU2VM95LOf0BgowwpBFwy5XPg
	xrc4JE4ADlAa11rCIr6wMCs4QL47jVTBdC49LfPPpNjsdZ4dvJ0FFeAaKdJhdedSf4B/VO/U7Qj
	84/LghnDb8GtmfuqZXCyLXI5yIXtky9Xa3xwLmjMhgYWEaMiShiEI5RyGGjMsj5hwurMFQ
X-Received: by 2002:ac8:6112:0:b0:51a:f94e:ce51 with SMTP id d75a77b69052e-51cbf1fb386mr1548881cf.50.1783709750657;
        Fri, 10 Jul 2026 11:55:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caace31a4sm22925021cf.12.2026.07.10.11.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:55:50 -0700 (PDT)
Date: Fri, 10 Jul 2026 14:55:45 -0400
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
Subject: Re: [PATCH 06/30] mm/rmap: parameterise vma_interval_tree_*() by
 address_space
Message-ID: <alFAMZNiJvxNpzGF@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <43050b10b53cdfc3627440e6b14ae2a9730b2a5c.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43050b10b53cdfc3627440e6b14ae2a9730b2a5c.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:17PM +0100, Lorenzo Stoakes wrote:
> The file-backed mapping interval tree functions vma_interval_tree_*()
> accept a raw rb_root_cached pointer to determine the tree in which they are
> operating.
> 
> However, in each case, this is always associated with an address_space data
> type.
> 
> So simply pass a pointer to that instead to simplify the code, and more
> clearly differentiate between these operations and those concerning
> anonymous mappings.
> 
> While we're here, make the generated interval tree functions static as they
> do not need to be used externally (any previously existing external users
> have now been removed).
> 
> We also rename VMA parameters from 'node' to 'vma' as calling this a node
> is simply confusing, update the input index types to pgoff_t since they
> reference page offsets and rename the parameters to pgoff_start and
> pgoff_last.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

nice

Reviewed-by: Gregory Price <gourry@gourry.net>

