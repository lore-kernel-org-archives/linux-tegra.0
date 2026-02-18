Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8432C957
	for <linux-tegra@vger.kernel.org>; Wed, 18 Feb 2026 08:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404966; cv=none; b=H+9mEoIX/PTqph1g24fPWMyQ+f+yF6EYYmMkyI6IrIqGOOsrlXHrw2+2qHdXw+R/j3/cNb3pRd9egAtC+pc2hxLQjUmT6DQkNRLtIzBMQukUHArBdgW2+rXO3S8sAjlkhPPOTH3A6hYkcYNWZnIVycE5OUJdvWeBmplAqgOrohY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404966; c=relaxed/simple;
	bh=/9otZd25ocNn9HUDGmNAX0+CEXD0GlGASUVcWCKDTQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dmAQJQWnOBhsI0HLrP+M7iv0tcZVYH7Ce08RuMUuGF34sTq4zn34NDnQY6iE+E45tHL07rh0QtRDKhPiVR4Fub6M4aYfRpvtkEi5hHKS01nuXZQ5T5QENe9rFMCPZ1YR+qZzvV5adXxQytERHstlOb+DCkV+yIBrq0oN4Ex5m34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iu88IOTq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CwUdryx2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iu88IOTq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CwUdryx2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771404960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/9otZd25ocNn9HUDGmNAX0+CEXD0GlGASUVcWCKDTQI=;
	b=iu88IOTqwseahfv1cugh1veDlIyrCZaBuiQlj/KnUNKsdN/EcV4rzj+ijjV9k+K6xS0mcd
	l7N0Irtlvk639xXTcaNkyfsdaVzWopT+awIwhNxcOG7wNwpobw8KQAVV8zhRJqoFAn6658
	GoyKRZu7UPZB951dm4PPlEBb5mAAeak=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-WoJrtA3vOQSKV3f0zIkMCA-1; Wed, 18 Feb 2026 03:55:57 -0500
X-MC-Unique: WoJrtA3vOQSKV3f0zIkMCA-1
X-Mimecast-MFC-AGG-ID: WoJrtA3vOQSKV3f0zIkMCA_1771404956
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43766514653so3164140f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 18 Feb 2026 00:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771404956; x=1772009756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/9otZd25ocNn9HUDGmNAX0+CEXD0GlGASUVcWCKDTQI=;
        b=CwUdryx2NxMJK45zh1litSV6nuaJO+NimyF2MQ87vJOsJ/kb+YnMkhoz8gx9CNfkIv
         1lyBaF8AmvPFaqgHelNfudJIti7DstYEFf7yxjhymYKqdkpXO3fb3ovMrwTmrAnzj00J
         c2jpk8gjNaTdzgGmN44YLiadLkT1IOr7q7s83VAGqqobXohnMlFeZm1KBqhutjWeyFWU
         kZOrOiJGPcfwDQZ0fkHnKFqeAzY5U/ZV7S0e43kCznRkdnP4gNdsIPc/dhi+ClVjRg05
         H8rzUh4Gwli7OgiSkdEFw5OB6fk4aslcQ032CtbZeXO+DJX+1HXT/mARqn9DrAGP6EON
         yhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404956; x=1772009756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9otZd25ocNn9HUDGmNAX0+CEXD0GlGASUVcWCKDTQI=;
        b=JfdKqpOoC5CZxp9amt+0RFR/DIG4FQHs1FpN0Tj2RT5iqLtds12dBQxfJfTateCCQJ
         njDfzttAvenrlctK791ChUns2yZBxXe7aoBF+7WDHi64vv1AxjAETjPeZZX1aBtT0r6W
         F04IG+YQG1YnH0nSNl438EjZKfgTm7zGlotqtLSQqY4cXbxoX+X8jrxT2X1KKde+v2iq
         5uRx7uLtg2pLILcPOT/7d1sRfhodJlDPQkY7lqcfWxM7N3hUQlec062hSVWIZJAUUbe6
         jATZz2n6jyS6Hbbmw+q1XvwxtP0Env1BGajf12f/Myxwbds+J1OBZNf8Jpqs6ycCVm+k
         7hgA==
X-Forwarded-Encrypted: i=1; AJvYcCX8jyYGcT3t63o54oc6zjt1JBleSemLyEn0FvyAuE3qAYiO5VwnbjdSF1FKjEZkgpO4gXDkKZmsdnJUlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpfELRtzUKaT64+eW6fr0ltMBXcugF5mifHGsEl1e8rhJ+2635
	XCEcoxdEydoAnNaIGSoG8XC1gGHsbhL9HYXMOxfriQ04qIuIIxEHSdnjmo8gETBKptDZ1uRvr76
	13y1+PbItnIMSGNqhOqCA93XXwqAfo+XZbYsnPPV7MaRnEPHp//xD3XteenpRCEJ6
X-Gm-Gg: AZuq6aKMYc7HhpBCdVXlMk6cGoPlUt9zAL4i60jQRL80FWBMOwCyGv1BHWDRVMeLLtc
	xZdeLyjNwfENc6Pm9w71r24wS0lRdkDxSrS1m+NJ8LzgDb0CDz1kJv8PhJdQuQvY3HKqRvHHB7k
	2obJiay++uxIA/JRsFBdHynFSHeGqRa/UsVC3scMeUrW+phc5Qpq59yhJWvbK3HWD4/NAP3wstQ
	rnu+IWBfGT6ZMgdLvnPkiXpK/RY3C7s/c68i8F5az+BryroPPayOOwZBTtXDXJGgNZxPQSKXy29
	1u1BF13E96h7XJXoURxpwaoEzJXMesLr8FxWysWac702Q4Xwx8JUeZ/SYoWTSDQ6fQMZKb6aIQ=
	=
X-Received: by 2002:a05:6000:26cf:b0:435:95dc:b8ca with SMTP id ffacd0b85a97d-43958e4c9a0mr1686382f8f.40.1771404955705;
        Wed, 18 Feb 2026 00:55:55 -0800 (PST)
X-Received: by 2002:a05:6000:26cf:b0:435:95dc:b8ca with SMTP id ffacd0b85a97d-43958e4c9a0mr1686327f8f.40.1771404955056;
        Wed, 18 Feb 2026 00:55:55 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8209sm41853724f8f.30.2026.02.18.00.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:55:54 -0800 (PST)
Date: Wed, 18 Feb 2026 09:55:53 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
Message-ID: <20260218-lean-faithful-beaver-2efd77@houat>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-5-thierry.reding@kernel.org>
 <20260123-active-witty-rabbit-0fc5b9@houat>
 <aY3j57xvdOY09EwQ@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="sfzhuutowl7gwtka"
Content-Disposition: inline
In-Reply-To: <aY3j57xvdOY09EwQ@orome>


--sfzhuutowl7gwtka
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
MIME-Version: 1.0

On Thu, Feb 12, 2026 at 03:44:11PM +0100, Thierry Reding wrote:
> On Fri, Jan 23, 2026 at 02:25:16PM +0100, Maxime Ripard wrote:
> > On Thu, Jan 22, 2026 at 05:10:03PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > There is no technical reason why there should be a limited number of =
CMA
> > > regions, so extract some code into helpers and use them to create ext=
ra
> > > functions (cma_create() and cma_free()) that allow creating and freei=
ng,
> > > respectively, CMA regions dynamically at runtime.
> > >=20
> > > The static array of CMA areas cannot be replaced by dynamically creat=
ed
> > > areas because for many of them, allocation must not fail and some cas=
es
> > > may need to initialize them before the slab allocator is even availab=
le.
> > > To account for this, keep these "early" areas in a separate list and
> > > track the dynamic areas in a separate list.
> > >=20
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> >=20
> > AFAIU, this won't create a new cma heap when registering. This goes
> > against the recent work we did to create one for every cma region.
> >=20
> > I guess, since you have a driver that would explicitly handle that
> > region, we should create some kind of opt-out mechanism, but by default,
> > we should still create such a heap.
>=20
> It sounds like there's a bit of a conflict between what you want to
> achieve and what this series attempts to do.

It's not ongoing really, it's part of 6.19.

> The way I see it, the CMA code is more of a helper that gives you a
> specific functionality set. Exposing each CMA area as a heap that
> userspace can allocate from seems like a bad idea to me.
>
> Without knowing anything specific about a CMA area you don't know if it
> makes sense to expose it as a heap. Given that there is very little
> information associated with a CMA area there's only so much guessing
> that you can do. I think it'd be more sensible to make CMA areas opt-in
> to have a heap created for them rather than requiring opt-out. Exposing
> a heap publicly applies only to a (potentially) small subset of all CMA
> areas, albeit at the moment it may seem that that is what it's primarily
> used for.

Do you have any specific example in mind except for that driver?

So, the reason why we did that was, mostly, to allow proper cgroup
memory accounting through dmem. In order to enable it in DRM and v4l2,
it was agreed upon that we would switch the use of dma_alloc_* to rely
on the heaps instead, where the memory accounting is greatly simplified.

So we want any reserved memory region a device can allocate from to have
a heap.

So I do think we need the call to register a heap in rmem_cma_setup.

That being said...

> In fact, for this particular driver nobody must allocate from any of the
> CMA regions associated with the heap driver outside of that heap driver,
> simply because the heap driver maintains meta data about these CMA
> regions for things to work. If we allow access to it from anywhere,
> things are eventually going to explode.

=2E.. I also agree that having it in dma_contiguous_reserve() might be
overdoing it, and I assume it would solve the issue with your driver?

> > That being said, it's not clear to me why the heap driver uses CMA in
> > the first place.
>=20
> We use CMA as a way of reclaiming memory if needed. The heap that we
> create is meant to be resizable, so that when nothing uses the heap, the
> memory can be reused for other purposes. However, when memory is
> allocated from the heap, we need to reclaim that memory for the heap and
> relocate any buffers allocated from the region somewhere else. CMA does
> all of that for us, so it seemed like the logical choice for this.

Ack, thanks!
Maxime

--sfzhuutowl7gwtka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZV+lAAKCRAnX84Zoj2+
dlYJAYC4+jPKHkn42l5qLnxTY3EvbGxcZHDH6RVzs/0th5A4+2dTD8lM8sIBBgPj
qui+8ooBf0t6WS1apZEC3zF8JlGWCr77XkBnVp5ZaozpXhqmNBMCQy7tm7z3cF/c
XrmTT30Bzg==
=yW5/
-----END PGP SIGNATURE-----

--sfzhuutowl7gwtka--

