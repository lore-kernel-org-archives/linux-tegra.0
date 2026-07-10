Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F4A3B6C09
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718225; cv=none; b=qERl0ViSAq5F58c10uxJT/KkpuBR9c6FIIV8j1pO8xYzZyAswo0di7S5A0WaKszMFrCawDsLOSnx302w/uCODRbmO6ST5/AemItYDGI/zygBCQpOamrmylXd1S4D4yb8jQkLOVW6/LGvhkaSjhcTDLhJ27JvIvnz3pJoAQi/5gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718225; c=relaxed/simple;
	bh=5KPNhmwijDAsBGeZ64JTaNX2be8iS/2XlIFbwRyt0OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXw7BIkq7EwLWASD33y2UHFuuTpZxM3hoyGB/G36BLCw1d6JSZ8tvtUmN/pGm8QrSyRxSlH0O2f2i6GsNh9CSVpyG1JNWSMerVKxEonz72ADIf0oPmyFMP/fEeVjmJUaBPT7JjrbV8U9uqETNnwgUdNwys2GfcP4sw0VffIPawY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=SgDacOjA; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="SgDacOjA"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e7632b193so88544385a.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 14:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783718222; x=1784323022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Izor2xUYDxPFma+uXVb9laI9dziDM9wo4fE46zQgxzc=;
        b=SgDacOjAIkCIF2eE6l1ER17CCRuUKfjT8uODBFFXwu3bSkeYGzMXVYwIoiqlTRYYOM
         IcNQm3DTEahbDBRCPDlNEV+URdQqfK6VV/gcu4p1VryFShAelxh7nn6JADJKrc+DzJdS
         heRUf6dhEkqRWnbO+VNS07ts3DDoepUG0a26WhqN7VvSUN36HRTu4PHaCXOiqLlOaHoY
         gn0F60i4oPSjPuptZu6Cgt27Ytp8v8XGwZO6ZM6uZx3Z3HgBC01wXeLbs1FmgTHyM2bT
         aVYuwimWW1e9gTRuv7Ru0LBX4XP7s5kPwDT/Hr1HDYZLAZahvcqI+5n6QsObjKBkUf4/
         cIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718222; x=1784323022;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Izor2xUYDxPFma+uXVb9laI9dziDM9wo4fE46zQgxzc=;
        b=conNbtbV7gSMYAkMs+l3Hm37UJzNBkgIgVYvNyYf7Ao/1T8KdRK+QAOvgHba8mm85Z
         EeMnZrbze9yFYfYHVEEtKpmN0vjOHazkbhZLc7dslKAivp4LwZwOTJyueRyzzqwh8RGm
         6TR5JH6ESpSQ/NV9MnBClIDPh9HZNId9Ume6AyW3XG3gsWm8G73zv2AwDqdWk+7pJdsM
         U2fvuhu21M8DNdgFI9ege3opvyLZsp0rtZ0Rj1ETb4ep+iDV7wB2Rs6+ShxY2fE2+zb0
         qgOHoG45g2C4Ixsn8V2GOMHluMCRuRvUEqB7+HFqV4oKFEsjrhxcfdlSkAAJFb7veixm
         Ie3A==
X-Forwarded-Encrypted: i=1; AHgh+RqSfoWIy6J1tqerxMIQwC3V6p06vR3IG53ZRxHqa1h9HVFf6AXh8fB0x/SNDBKZ2RqzdqRNbL7Nd54zFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyIBqZbVqgM36bLfM7c91T9EoY/vms+f2zOfduTZWx0gMySzen
	mhNj45rD2kYprjgz++A44iTW0d5zlYsjbLpbJEsz7LpXU8/QVRcp6dNNN0yW6a2+u2I=
X-Gm-Gg: AfdE7cm5WBZMXuoMLzpNgaIEKgJzAR+GQ+7tiLW3mz95ixHpBuiFtI/fWCMdAzK8GaI
	i8wKr9VV3WPtSiGW3Sstn5LbrFWQOLkAaJKtICA1tmelRbi1yoKrUaWyJIhMhA1Z6r0LckwTg8Z
	wd48XVfv9Fwjqa/DCRknD3jSaLQDtdXbdhPagj4M+cJzkCj0p0IatnojqIvQb5qU/gbn5RAUQTd
	CirvxZGN/BqREAUaYVntEOIvrZLukhnUMs3R3fduRP88HYx6J9mUiWwcUHrEJhO2IVKLT6mWcTL
	8ZkxDugjGRipBEdQPf6Pu+ZGoohzDruy6qIoEOWBq5He64z2yfZ/QZclknrUY0ga1uMHEtDRa6R
	W1ZIGGXhSgNN4I5xXHOf4roe+AUs6wd0boaCF1NO6PWjEjaYUz29c+OIWwCMi7FDigAt2Q1a3p4
	gtwFguzEIm09B5cgNzNX+4oX12LTQmMypVNiRmpsLr0rvixi1UBYpNn27oEIpnvw7f8aEC
X-Received: by 2002:a05:620a:2691:b0:92e:72a4:f290 with SMTP id af79cd13be357-92ef2b3518cmr83584585a.19.1783718217777;
        Fri, 10 Jul 2026 14:16:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd80fe218sm49983646d6.33.2026.07.10.14.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:16:57 -0700 (PDT)
Date: Fri, 10 Jul 2026 17:16:51 -0400
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
	Naoya Horiguchi <nao.horiguchi@gmail.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
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
Subject: Re: [PATCH v2 11/33] mm/rmap: rename anon_vma_interval_tree_*() to
 anon_rmap_tree_*()
Message-ID: <alFhQ71-WGGHo1sJ@gourry-fedora-PF4VCD3F>
References: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
 <20260710-b4-pre-scalable-cow-v2-11-2a5aa403d977@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-b4-pre-scalable-cow-v2-11-2a5aa403d977@kernel.org>

On Fri, Jul 10, 2026 at 09:16:52PM +0100, Lorenzo Stoakes wrote:
> To be consistent with the newly renamed mapping_rmap_tree_*(), rename the
> anon_vma_interval_tree_*() helpers to anon_rmap_tree_*().
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Nice.

Reviewed-by: Gregory Price <gourry@gourry.net>

