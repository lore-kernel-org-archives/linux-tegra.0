Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1423BBA0D
	for <linux-tegra@vger.kernel.org>; Mon, 10 Aug 2026 23:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786406107; cv=pass; b=u0gfJpJ+r1wHHVU+1x+OYm1QEaN4U8zUA846YutRHQp9VulBtSorYphDc6M4mslrvm2ai7MD5gikt/n5oYDeeV7T9mQP1ka6k78cBY7U5gjfbHHjfgihOTlHU8L4WHH2NED+yhdbd83gWF9J9vA1B38F+Tds1Rd9yE1euXjN3UM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786406107; c=relaxed/simple;
	bh=JHfanZgIA8mK03STIk1FeUn57Mhb7JG9av6AGKnMHws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pk9QIq6S64B5bugnyFOy2xELl4MiNUEMRf/hG8P0GpHtkCC2IpFyXGI3YoWszPKav/duWMvjiqG40g+pHtynlkrp17vw9cp3BSAD6Y+VyEPu5kwTOX7tcwPtbifOev4CumQCc/9vcO9Yx3JpvbbyD/aLZm2Lma5c67LaCT+ZyIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OjX7BtsK; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OjX7BtsK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4996e2575dbso28295e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 10 Aug 2026 16:55:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786406104; cv=none;
        d=google.com; s=arc-20260327;
        b=F8/Vq0S3mYZo2ASm9HR3uQPd4kJhhSIde8jByfQcnV9sNTkhujqiY1tTcSzS2kQVoh
         UCpNxGJf9KFp3Bh4kq0CXg1O2DXrqGjurYFHDGxA/7LiA/ovkCikW014rkPtGCuMZiWe
         dosOIsef+nEDGjnstgYqGChQHkVfBdB5vYsSDy4cR+Qamg5nUcR8TyJKPJspvDnSqMam
         ub43aXYmMsUxA2U6+pmjZab/qApbaa9avM4tOQpUdFGY6Wk1yCzujoSTQ9qQ5xNrJNOD
         SB+Y2guH0FRBHAxCGkFK/fH0He38p13Jkhx0k/KmC+vuUh7ygNfYSaVt48lI9xNAEnK2
         Ue+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JHfanZgIA8mK03STIk1FeUn57Mhb7JG9av6AGKnMHws=;
        fh=SRXNV/RlyLBOSTa7T7QUOZuTWqj0O0uvt8owRgqpor8=;
        b=Oqw9yXFX6MpyDVSRk66UcVwil2uecLIe6KxZ5RpFZofS9MJg275XvAX4JuwPJAnTaA
         shrQyG6Y88FoPi3ysvY5TCjHSH3AXgVq17RXVmZE2y9zP1tS5FttxBNqrsNjZzBSXgW0
         /lLTj7qiYAfBlOHJCAo1y6H31Vend0Cz/ljM0ZNBYT6eiG6bicbqnBz2KdJXMOKMdUiM
         /sxN8W+KpDHuq9KnFUTXnCO2uRzhJhUeQUs/U0XAi0xwoR0Ls2IDWZas3QLsXC153ggn
         DQL0lhg543jThkPmz6QlJmjefaDJGPGGUez8wUcSE/N3QwwvJ7ZU1GuP097XnmjshZSv
         Tq3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786406104; x=1787010904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JHfanZgIA8mK03STIk1FeUn57Mhb7JG9av6AGKnMHws=;
        b=OjX7BtsKwY60pVyVrTrrHI0fU61YegsIQzJMRGtAP01JyYgK10M6TgPwvpwx8ZmZaV
         o5+SR6uCIrSKHTFsCz2CQFhd+NW7C+KHGFZ0cdG6hT0eSzV83VSuDNBckbZrnqPiC0AD
         +/lwRtqp0GugZQhCdn2wqatnbVJGqG48jaE4aRvjYu3ZobU6AlSzKuvxhG4mc7mhTH/X
         6n/Y0iE4FKNaxvPb9bLDX8zTDcpSRkg112Kt4eE1uCAtJdXBMUePj1pJ26vfzIAZxQ+r
         QN9ZelHXB07crWb69eZLO6ZV94Ahc5EAnloqCf2G1CUeLUDaA+8lRNRtO2Ed5L8wYaiF
         r9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786406104; x=1787010904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHfanZgIA8mK03STIk1FeUn57Mhb7JG9av6AGKnMHws=;
        b=MerufohTmCg5C6p5B1CKiVaVczCNKEAgl5nR0oxJ2CTxZf78jf6REyj+QVSusLuC7+
         32QV1dCwv9zQ0rz/raDhi0l5kUP99KaTD7sgG/cZhyBCdqptrBBOQJX5GTxFGAxA/E0w
         H2B7v5O59Q4pxQo5aBj6k9LjyoMOI3sLYiB40JUA+yvhB7JnIWL1iiRXEZmbx7XZaA51
         WaP9szMOBRKs5E+0htq8bc9Ds/9YogQgLLko+fRWq+ylNbTs1X9VXH3qn8oJOZ2xO0de
         DYvKUKi3iwtyYtDtuuN1PFbPGLEww3S3A+8/N1xoFQnynN9Rd27endM8UUUYRNoJR0d2
         cuAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtrdGBgAmLtrAGZDfHmsWW7FWVg+KhDOTM9oap0wvs0cblRLzCbdtJAl/u5YQTicFfEl27QHh23a35rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD+uyAQ5B1QlAn49LZRwMXAo/22Wm0R8In1W+q9yC4mU3y/P/f
	hLRPnM/gmc00/eJbD2imPasu1Ux5iFwGQMuiFy9uoA9TM3JJmP8QsX7NGxEtDE17uiH3fWX2V8X
	ZX4qdHQQbcMHfJjFhBfE2qiNoKcpvHIpbEUp21dsP
X-Gm-Gg: AR+sD133PSfnO48e6oU5rOvElyL8vWSExE41q1FuqyC5SkddbMEBK6orQU29ra3BRB6
	anC/glq4L9kn18RP2mB5MTT7aRqhv3pBXsIDXc4aDKNQm+83zt+ma2BXLrdciDy8ehAy4k/a4Mt
	L9IDAxPR2JfJEFIwCfdMDW+dLdS3/d6ZPBPosAAnMg1OcSc2KH9E6JmmZ02IKaYtcq+IYkU1vtF
	AcMizIijzUmCu0fajweBf5PbIEDaMR05TkgiRVmdTNYtVOTGHIKXZ6Ktcgd/bM9IUSzgJ+k5Ndl
	bd1csQoNWLBmauzXzoFyva05s6lWlexi+4Ywym6pIoD7KM/l8x+FRkJ2u0OAvKRFd5RMV5eDGFA
	=
X-Received: by 2002:a05:600d:108:20b0:495:4593:616c with SMTP id
 5b1f17b1804b1-49975c21896mr314355e9.1.1786406103959; Mon, 10 Aug 2026
 16:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
 <20260701-tegra-vpr-v3-6-d80f7b871bb4@nvidia.com> <CABdmKX2i_vxs3EgJgydEbXoTxqWe9g9pj=hqPKuwf0ge0SjZuQ@mail.gmail.com>
 <anSyU_-zArFch-an@orome>
In-Reply-To: <anSyU_-zArFch-an@orome>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 10 Aug 2026 16:54:51 -0700
X-Gm-Features: AUfX_mwf0uw3dVpzklPu-Nif3rg3tPQMirUP9IgK_6gn-zY2Jt3_SUQapkz0Yvg
Message-ID: <CABdmKX2Hn0cDw_aFW7Xr9v5mr=WvfhhTXgX7tpRaMMGstYp4=g@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] mm/cma: Allow dynamically creating CMA areas
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Russell King <linux@armlinux.org.uk>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org, 
	linux-trace-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 9:21=E2=80=AFAM Thierry Reding <thierry.reding@kerne=
l.org> wrote:
>
> On Wed, Jul 08, 2026 at 04:49:31PM -0700, T.J. Mercier wrote:
> > On Wed, Jul 1, 2026 at 9:09=E2=80=AFAM Thierry Reding <thierry.reding@k=
ernel.org> wrote:
> > >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > There is no technical reason why there should be a limited number of =
CMA
> > > regions, so extract some code into helpers and use them to create ext=
ra
> > > functions (cma_create() and cma_free()) that allow creating and freei=
ng,
> > > respectively, CMA regions dynamically at runtime.
> > >
> > > The static array of CMA areas cannot be replaced by dynamically creat=
ed
> > > areas because for many of them, allocation must not fail and some cas=
es
> > > may need to initialize them before the slab allocator is even availab=
le.
> > > To account for this, keep these "early" areas in a separate list and
> > > track the dynamic areas in a separate list.
>
> Huh... going over this thread again I could've sworn that I had replied
> to this before, but I can't find any evidence of any reply.
>
> > Hi, It looks like you'll also need to update the CMA dma-buf heap's
> > add_cma_heaps init function so that it adds all the CMA areas, not
> > just the early ones.
>
> I would actually rather not do that. The case that we need this for is
> creating a special purpose dma-buf heap that's composed of multiple CMA
> areas. These areas must not be used by anyone else. Exposing these to
> the CMA dma-buf heap would allow anyone to allocate from individual
> chunks and throw off the accounting that we need to do in order to keep
> the protected memory from working correctly.
>
> Besides, given the dynamic nature of this means that the CMA dma-buf
> heap might already have probed when these dynamic CMA areas are added.
> So we would either need to have some way of notifying the CMA dma-buf
> heap of newly created areas or we might end up with an incomplete set
> of registered heaps.
>
> If you really insist, I could look into this, but I think it's actually
> a nice feature that the CMA dma-buf heap only registers these "early"
> areas and exposes them.
>
> Thierry

No problem, thanks for responding. I see there is now discussion about
subdividing a single CMA area for this, and that seems like it could
end up simpler in terms of the CMA code for this series. So I'm
supportive of that idea.
