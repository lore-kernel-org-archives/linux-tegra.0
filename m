Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A0D2D0C75
	for <linux-tegra@vger.kernel.org>; Thu,  2 Oct 2025 08:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759392001; cv=none; b=rf4reSR1Q1uVYAwLP5KOGLvyPZ0+lw4L2Y2woM3fjQwHNRdELjvhjrokMTl6oGudtFR+4mLZNDFA+/6AlePEsBUEoY2VadtpfOKrXSLSUs8WWuh2SRx61Iz1mS9T7P0xaDhze++c3A7Z7e2GSBouYjNzRVPaob6E7LzN4Ppj9gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759392001; c=relaxed/simple;
	bh=twdF5Ghf90omLm8FmG8vqty38VLg0uYT52OZEV9+SEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3bohxW6RdCe98QcJosEIdMCxck1LnQ5SbnfgBmaKG7D1m3q8fKejsI7BfjQ5ISeYKK9vD93IGVNnEBEPvpPyP/pEVQlYlBAUCRx/kUjLMNW61WxB1qCT2rvZHy2hdjP6VJYtNHpgNIpbe+5HEQzpQS7OdQVmpf07VmlOp292sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=geW0bfhD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="geW0bfhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759391999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=twdF5Ghf90omLm8FmG8vqty38VLg0uYT52OZEV9+SEc=;
	b=geW0bfhD0jXboRg7zA3B5VQX8dYiXvo/f4bk4VrntYbDbQq1/kdpHBU/hLfmi0RORD/3ue
	dqTO5VnjhlMImAKcUnuPu0QdUo1bDcTrkWxvbMj9BgbVIbVTJAZtWQA3Mr0+nIo7He49Bi
	6RczjXXZ2sjzzNLQ7TpT+yQphsBb/5U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-cfNjygNbNbO9dS50-i9_Fg-1; Thu, 02 Oct 2025 03:59:57 -0400
X-MC-Unique: cfNjygNbNbO9dS50-i9_Fg-1
X-Mimecast-MFC-AGG-ID: cfNjygNbNbO9dS50-i9_Fg_1759391996
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3f7b5c27d41so628041f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 02 Oct 2025 00:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759391996; x=1759996796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twdF5Ghf90omLm8FmG8vqty38VLg0uYT52OZEV9+SEc=;
        b=ATnS44ZRljlub4/qxt/uUjt0s0pN2NJq96x7QLUkLrIK+J8fV0OeTOZemQgINuXp4Y
         i0oyWjOHxb+KuDnhtQC6CZK5ZWwqPDiqelwL/hDi7nvXbT8RzDh+V14npCEJkytfRSou
         B1+hZyeHtV1+Rku+TsS68Dsw1xX6R8CYkuXDGmaKkwEkwmmsC28z5Ug9MdMQA30EUSX6
         A/2OgU7+NoZI7Vn7gejIg+A1C4U0u4E9kw0l3IzpRJQaDs9oZouip5GqhuGS3OuQnPvj
         +w+bFOsq3ggcYUh4pRYKrpj7SIpGirRwMU8metG5kJ1aSQKxiUtoQfb4CumeGdAFQiZm
         ApEg==
X-Forwarded-Encrypted: i=1; AJvYcCVURBfR46SEIta/T6h+/mPhdvkuo6OJ/VVQV5gza6k77vLw0/rs9kwIUKFCsSfW0dRpyXcYDnz0hUNw9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkX/21GnGVK93i/DpXkPGmS+tsStc1PG4m4CT8847TSsihw16o
	OgX4S6Wwqn6Lwzjrl51B2L6m0ZYQEXQfaVemr+zLxAF+BbVfKY3IKQdu6XPolDOpKHhKMeDHcpE
	+IJVipuU/vAkG8XXv10p3FOh6gwS3DHeCjVcbuu2Ox5YutowtevM5FR5dZjGvR9lZ
X-Gm-Gg: ASbGncsdpt2muIA/dTtwjTLOFXRWRyjbs+E+Y3xOtgRg86lvyFFKrgEH5FfwosN1Qaf
	FU05trqafjZhOhOt17VThNGzDKQMpeWwc8yZSn4+slnL4703TPqECmuD9VovQOj9y+NDQiDVkoe
	YOZbjm1a0XIWSyoSyLqnQyUEBUzdb2n1r30gFOcAMWSJCPNtOSlxorQJAZBtjYcc1bSI0M6PYmD
	M0dGS/DezTb9GcZBQYwUXshnm8TK8hh1WbYnu1G6G3BDiMVZ048n+wnu9+AOhGBuLPl0VQKdN7g
	wjAgAR1jD5lCfWoxU5g+hw==
X-Received: by 2002:a5d:5f48:0:b0:3e7:617f:8458 with SMTP id ffacd0b85a97d-4255d2ca82cmr1522912f8f.24.1759391996223;
        Thu, 02 Oct 2025 00:59:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqvfeqwKeBIWk9I362srSwTFSWrOClY9YoEOQMVFqHTivLzqDGGJkfLFwQp6Kk579V7lD3LQ==
X-Received: by 2002:a5d:5f48:0:b0:3e7:617f:8458 with SMTP id ffacd0b85a97d-4255d2ca82cmr1522879f8f.24.1759391995724;
        Thu, 02 Oct 2025 00:59:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9719sm2540317f8f.31.2025.10.02.00.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 00:59:55 -0700 (PDT)
Date: Thu, 2 Oct 2025 09:59:54 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: John Stultz <jstultz@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH 4/9] dma-buf: heaps: Add debugfs support
Message-ID: <20251002-cute-loud-eel-67f9a0@houat>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-5-thierry.reding@gmail.com>
 <CANDhNCoM4RFX-QccF7xT=+-tduGj9OZ_8SgrTVyRucMwyVc73Q@mail.gmail.com>
 <e6twhwxi55eesb7xirei7wezzb77qjiji2mccgqlziisjzl3q5@3ny5e6lbgebz>
 <CANDhNCrO21O_URa1iHuroOoG-g61DL7uvECTwVxiuitCTi=i4g@mail.gmail.com>
 <sb76bsg5d45r5qgq4zy3svbh42ydkk4vrh6a7vh73eibvqbfjd@3r4exdhogde6>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="wnfwjjw7bbsf5d2u"
Content-Disposition: inline
In-Reply-To: <sb76bsg5d45r5qgq4zy3svbh42ydkk4vrh6a7vh73eibvqbfjd@3r4exdhogde6>


--wnfwjjw7bbsf5d2u
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/9] dma-buf: heaps: Add debugfs support
MIME-Version: 1.0

On Thu, Sep 04, 2025 at 02:04:05PM +0200, Thierry Reding wrote:
> On Wed, Sep 03, 2025 at 11:48:38AM -0700, John Stultz wrote:
> > On Wed, Sep 3, 2025 at 8:38=E2=80=AFAM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> > >
> > > On Tue, Sep 02, 2025 at 03:37:45PM -0700, John Stultz wrote:
> > > > On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.redi=
ng@gmail.com> wrote:
> > > > >
> > > > > From: Thierry Reding <treding@nvidia.com>
> > > > >
> > > > > Add a callback to struct dma_heap_ops that heap providers can imp=
lement
> > > > > to show information about the state of the heap in debugfs. A top=
-level
> > > > > directory named "dma_heap" is created in debugfs and individual f=
iles
> > > > > will be named after the heaps.
> > > > >
> > > >
> > > > I know its debugfs, but this feels a little loosey-goosey as an uAP=
I.
> > >
> > > Well, the whole point of debugfs is that it's not really an ABI. Noth=
ing
> > > should ever rely on the presence of these files.
> > >
> > > > Is there any expected format for the show function?
> > > >
> > > > What would other dmabuf heaps ideally export via this interface?
> > >
> > > I've thought about this a bit and I'm not sure it makes sense to
> > > standardize on this. I think on one hand having a list of buffers
> > > exported by the dma-buf heap is probably the lowest common denominato=
r,
> > > but then there might be a bunch of other things that are very heap-
> > > specific that some heap might want to export.
> > >
> > > > Is there some consistent dma_heap-ish concept for it to justify it
> > > > being under a dma_heap directory, and not just an independent debug=
fs
> > > > file for the driver implementing the dmabuf heap?
> > >
> > > Well, I think just the fact that it's a dma-heap would qualify its
> > > corresponding debugfs to be in a well-known location. We could of cou=
rse
> > > pick some arbitrary location, but that's just a recipe for chaos beca=
use
> > > then everybody puts these whereever they want. There's really no
> > > standard place for driver-specific debugfs files to go, so putting it
> > > into some "subsystem"-specific directory seems like the better option.
> >=20
> > Ok, I guess I was thinking if the files are organizationally cohesive
> > to be under the dma-heap directory, they ought to have some
> > consistency between them.
>=20
> As far as I can tell there's not even enough information in a dma-heap
> to add any common debugfs snippets. As I mentioned earlier, a list of
> buffers allocated from a dma-heap is about the only generic piece of
> information that I can think of, but we don't track these buffers in a
> generic way. None of the existing heaps do so either seem to be
> interested in this either.
>=20
> It's also not like it's very useful information most of the time, it's
> mainly in this driver so that it can be inspected at runtime to see what
> the allocation pattern looks like at various stages and maybe help tune
> the division into chunks.

It is somewhat useful when we're talking about cgroup though :)

I think the buffer tracking / debugging mechanism itself is redundant
with what dmem/memcg would provide, so we probably want to just enable
dmem (probably?) here?

Of course, it doesn't help with additional heap specific debugging
information, so this patch might still have value.

Maxime

--wnfwjjw7bbsf5d2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN4w+gAKCRAnX84Zoj2+
drPIAXwN+Pi8yzwK6HH6eGaV4PuBhOENbMJ5om+Sbvf7UIv1i3YsGC9zQ5e+WgxM
4TB85TUBgMDvDSgCCaar57VP6ejj5nEexJYbycU0O7aIS8YHI8OUUt+RA2Us7hS/
M7QuNSDL9Q==
=wm+r
-----END PGP SIGNATURE-----

--wnfwjjw7bbsf5d2u--

