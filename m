Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617FE50AC2D
	for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2026 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858665; cv=none; b=l/g38sUz8u+EGf4+4ArGih3IyOFKhxqbAiShfNHYX4q+lmt8mLTteVW8zE20lhYCyicuyhz6jHg8lGiIhGBx0DdtyhUH1vaNCfR+ZIJYmGNWiB+N17D08vOpswP1jK8MhSkT2+UE+Umt80Nt2MjqhExF9nD5Mgi1c5iE5sDrstA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858665; c=relaxed/simple;
	bh=PvXsmkWYs08Fb6emr0vNeygHcdGIKgZy2QeAteTTf+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHIj40+zrMMDxS69gju333vhFmnRG/kWrCANbSTq1symgQ8GgS17vhM5TgYs5+keGKs3xdJbbqQQ3yvKRIXpzDHb9kE3fa+wVPjk7Zjn6h7wzY4gsU9dUtBmrIkkiydrN37pYH888YJp3J2vzgqc44Q1g3PN9z/zs67GmMlqKas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=od9zMfWD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="od9zMfWD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so44140795e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 08 Sep 2026 02:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788858660; x=1789463460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jO5c4Bt3ZAdytp/EWde+NVli4TynjxjjAsIpB98Fp84=;
        b=od9zMfWDcF4OHQCHDnTSp+IxWBh7YcrsnqnYcySKIEcmm/ceS5PK+Ald4WsDAMQGca
         JtStGdPNa4jsxYXMI/49ZgEEFYt9UcWI8IyRBsO3AybC/oohRQiO3QSxj3hPa2MT3HmE
         jG815bbsxFI0fkVFJ6+wGUaARnLJaKxSfY22sakMY30hoTw9lRCpmnZd9jHdxlPxrk9a
         IhrRS2O3xf1/jf1vWiD+7YlOF/bR52YD3FZlFwsuobxev0U4c3rqbs0WfcZmcYym8q6G
         JzkgBiT4ugQ/LjmCIyf9fuaf6Rc5IxypahVG3fBdT3jSyDWYo8B9u4GFtEseJ8rKv28I
         CGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858660; x=1789463460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jO5c4Bt3ZAdytp/EWde+NVli4TynjxjjAsIpB98Fp84=;
        b=Tr1ygXHPKLFjfiZDW9CiVXKNds6ZTWo5IuhVKwoJiy26JjnVzszlrCx+9pn8XAAMIt
         aGFDlqRsdFtzaghF1MUTb8fv/olP+imhYrMZMCA9oh8VatGV/uhiE2dzo/eQRVnWWr80
         ESPfBHvrXm+Lo+BjbYp4toFhV5h6p9Ovgh2MuNiOAUkGZrVALn8GcvW/JG5llfLbZScy
         lSSZWhuiUCX0WDhTogo3uAluQI09f0whYR25N1y70RuSYmKcsGzWVeIpCBkzfy1AoCW1
         aEENQ0m7IxSDJWIFk6x431XT3El7veMg5maB+ctVH9MB1/sj/qsUuQ8biCLDrGhB+6Hh
         jgJQ==
X-Forwarded-Encrypted: i=1; AKwUvByVTe/egztoCdrdkxxWU1ljkON4QRLLlztpFnDSvm+j/p7qBGrgQRBNyefTyt3gSAubT2z+8X7yYLDTtg==@vger.kernel.org
X-Gm-Message-State: AFuF++kLvfMnan8myiGQ3cXS8o4/xSLQwAsW9bJmaq6XZtZy2v2VqRwk
	TmKaip/ZKaekgcFnzy/A2kWe2LaZVdjxrqvUfgFxDBckn3wBDd1rH+IXPuYhTlXTIw==
X-Gm-Gg: AYBFou3wk5hP0Ee9dP12zUiOQy0fOf3DDp7BxAdkeeiGTixXzLIdKYDJQkTJlX1Boqn
	YcRPilI5rlRW9t2e4OZdQF413Uc7xsIzanv7sUueG3NCgqxUsbmrGbyAZpqtsXX68AlyHmwWRpx
	i1/EWINuBgq/e4BK1/SX0jhDWb6t5lTQ5Ay9ydWzMN8HzjaZTOhW18ZWeGsLi/ya4CzGTa1U+Y6
	kDcHBSdVr7yqxt5YpmMoRPgd1sNLzp7pQsDITr570ISLiVID/kh86cZdl2igLQ7SN194K4wwkR8
	+yrnlBqex+yrPlsxpRgzQlMhB9mvKekvlfSMvUOI2VujeB+wC6zhZL7ZQSCKzhx2kME0pNxYZ/w
	s8oKU6zaYZ/AAZwC17bptU/kSotV3NaeGiF/HBlG1D0SCZTN8LfFJ+hfDjBMlfbCm9BKCb3aviv
	ANsnOq+WMHmE7UpobWNW4KS+ltUzO5gV/RJ3U9MqU/Coj3SClgk9bhD5QqiNxEDt+/bMhZ+Ya+M
	1HmgKl7ci8SzKAyJmqbuXovmsYMOWNZq8uxLQv2p5o=
X-Received: by 2002:a05:600c:1549:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-49cf81f47e6mr290181665e9.6.1788858659472;
        Tue, 08 Sep 2026 02:10:59 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm279081265e9.4.2026.09.08.02.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:10:58 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:10:55 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chun Ng <chunn@nvidia.com>, Mark Rutland <mark.rutland@arm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-mm@kvack.org,
	iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org,
	linux-trace-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 00/12] dma-buf: heaps: Add support for Tegra VPR
Message-ID: <ap_RH4ZDE3XI0rng@google.com>
References: <20260904-tegra-vpr-v6-0-79042cfa8de5@nvidia.com>
 <apquUWgrD9C2jWQ0@willie-the-truck>
 <ap_HzwVp-6aOKEbJ@orome>
 <ap_OFQepcu26g88u@google.com>
 <ap_QJG8EevX98SXa@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_QJG8EevX98SXa@orome>

On Tue, Sep 08, 2026 at 11:08:26AM +0200, Thierry Reding wrote:
> On Tue, Sep 08, 2026 at 09:57:57AM +0100, Vincent Donnefort wrote:
> > On Tue, Sep 08, 2026 at 10:39:17AM +0200, Thierry Reding wrote:
> > > On Fri, Sep 04, 2026 at 12:41:05PM +0100, Will Deacon wrote:
> > > > Hi Thierry,
> > > > 
> > > > On Fri, Sep 04, 2026 at 12:44:51PM +0200, Thierry Reding wrote:
> > > > > This series adds support for the video protection region (VPR) used on
> > > > > Tegra SoC devices. It's a special region of memory that is protected
> > > > > from accesses by the CPU and used to store DRM protected content (both
> > > > > decrypted stream data as well as decoded video frames).
> > > > > 
> > > > > Patches 1 through 3 add DT binding documentation for the VPR and add the
> > > > > VPR to the list of memory-region items for display, host1x and NVDEC.
> > > > > 
> > > > > The set_direct_map_*_noflush() functions that will be used later in this
> > > > > series are exported in patch 4 so that the drivers that use them can be
> > > > > built as a module.
> > > > > 
> > > > > Patch 5 adds bitmap_allocate(), which is like bitmap_allocate_region()
> > > > > but works on sizes that are not a power of two.
> > > > > 
> > > > > The of_node_to_nid() function is exported in patch 6 because it is used
> > > > > in a later patch adding a driver that can be built as a module.
> > > > > 
> > > > > Patch 7 introduces new APIs needed by the Tegra VPR implementation that
> > > > > allow memory to be allocated at a fixed offset within a CMA area. Tegra
> > > > > VPR needs this in order to implement its own allocator on top of CMA to
> > > > > meet the strict hardware requirements. This replaces the dynamic CMA
> > > > > area creation patch from earlier versions.
> > > > 
> > > > Did you get a chance to see how this could work with Vincent's series:
> > > > 
> > > > https://lore.kernel.org/r/20260902104712.2399797-1-vdonnefort@google.com
> > > > 
> > > > ? I think that should remove your reliance on can_set_direct_map() and
> > > > mean that you can retain block mappings for most of the linear mapping.
> > > 
> > > I'm not sure if it would help all that much. Yes, if we mark the VPR
> > > region as LLMAP (or PTE_MAP, whichever it ends up being), it should make
> > > the checks for can_set_direct_map() redundant. However, from what I can
> > > tell, Vincent's series still forces page-granularity on these regions,
> > > so it won't retain block mappings at all for them.
> > > 
> > > The block mappings can be retained for the non-VPR memory, so that's
> > > nice. It also reduces the amount of external prerequisites, but I had
> > > kind of hoped that we could go one step further and keep block mappings
> > > even for the VPR memory if the region happened to be a multiple of the
> > > block size.
> > > 
> > > The recent addition of page count to the set_direct_map_*() functions
> > > helps reduce the amount of checks that need to be run, so maybe there's
> > > not too much to be gained from removing whole block mappings at once
> > > from the linear map.
> > > 
> > > Thierry
> > 
> > I should be able to add PMD_SIZE mapping support to the series. That was
> > actually my original idea as we can easily force the CMA allocation granule to
> > be PMD_SIZE too.
> > 
> > I didn't implement it as I thought there were not much interest in the end (and
> > also as contiguous.c is always using PAGE_SIZE granularity).
> > 
> > But now as I have implemented a specific pool (and do not use contiguous.c as
> > originally planned), if you believe it is important for the VPR driver, let me
> > see if I can extend the support in a V2.
> 
> I don't think it needs to be part of a v2 and can be a follow-up. It
> should be transparent from an API point of view and merely be an
> optimisation for that specific case.
> 
> Eventually it'd be nice to have, though it might also be worth checking
> what the actually gains are.
> 
> Thierry

Ack. I'll keep it as is then and we will see later how to extend it, if it is
necessary.

-- 
Vincent
