Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DD93ED5B5
	for <linux-tegra@vger.kernel.org>; Wed,  6 May 2026 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061066; cv=none; b=aUW86tDii15YrEw5Y3zpZxT/7fSfkl1vcfm02YNQG85KmHT9TTJHXDaM1LIKxFDogz7aKSUvpvkk5+jGzCYSJnWZp28AY+RmVeMldtvG9wFL/KZg0t4t/3uPA/Y8hE+/pAZ1Mwg0Dw1VTYExOJFb1tqBH/B823bFTXfQF9MXxTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061066; c=relaxed/simple;
	bh=vfrATgQHWoLdism2lue+ijTptYIlhESry+/AqSEnFWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fr0tTRMP8LpTLF8HOcxfilZyF2RlWeqqyo7EoT9IqSir2jcPq3TAT73nz1OZvFR0V4AXXEbQzxdQgJW5DFXzkKcOJID1IXhjRnvnRbcziHFPD82K+scMhz40FYsfJbfzmN/b+vSXP3szsQFpCAmKC6/7nEhGWLjoXsV2Ww7+v8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VaSODnhT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GpZ/frAN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VaSODnhT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GpZ/frAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778061062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vfrATgQHWoLdism2lue+ijTptYIlhESry+/AqSEnFWE=;
	b=VaSODnhTPaDyXnlJfUgHWCOJZ998M4B7vIy4m/P0I+xiJp8qbpO8BArJo34uJp3ToL3cVi
	kJ0CtjiwEW7Lxouh29EWyT89SVaASLzOUZewkDM8YmWeL+6ZdDybLomL8PWZ4nIazuAlF/
	E5VWB2B7n93IR5ilEFiZ3ipinLBXyuI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-_HT5egHzOI-2NP1rb5u7tQ-1; Wed, 06 May 2026 05:51:01 -0400
X-MC-Unique: _HT5egHzOI-2NP1rb5u7tQ-1
X-Mimecast-MFC-AGG-ID: _HT5egHzOI-2NP1rb5u7tQ_1778061060
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-44f65835b77so1432814f8f.2
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 02:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778061060; x=1778665860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfrATgQHWoLdism2lue+ijTptYIlhESry+/AqSEnFWE=;
        b=GpZ/frANu8fF7WKTCYKQ8un0TZtS6/X0KvQ8ZchUH6Sc9IKcsS5nquQggGCVme046G
         FyaK/1lD8o9pipiL585NnZr/ChEXgARLDGMzVkBDFKxxHiPpyubl5XdFNRSlThvhnbyw
         aeFhEK8YuKUxRRO1naSZ6tEkqVWF7ViXflgSdJhOX3GrYLTHkLpDGJX+t21mV1VqSyXs
         pTsDfStdU2v4ZtAcxpn3e6AFhDKe8qJpOeWuPxjvlS9Lzs/dBn66HvkNdQuA2HvtlRSA
         lVj8LZVqtoYxf1QuuHrcXDiLHKO8htS1wf4fA5DfFmcpMxSWqwJYb424sIKqhUcyMH/Z
         VTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778061060; x=1778665860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfrATgQHWoLdism2lue+ijTptYIlhESry+/AqSEnFWE=;
        b=cKI7B2DdhQWqaCrpi6Y2DPZwpGwH9hPpTG4LDCHoFwSpD99Mu7jgR0f+VWZGq6rWvc
         3NN005aVCbNH0Q3Dfs5rCgyqH6dbFHDdf4PPssB63+h1LZRjpg8otrSKKudVAui55jwr
         XBNtWTMDeOZtxu8bCPpXSP64ORkbUQVOlGi1UaTJR9HE86WPgscpVOog1opJuWT3zdaD
         KA6CM/dnI/vhN6+23E2KYYNvf+d6XYgLkKXdnvqsCyUloSKYF7WTDxFQ+17tBcqmM13T
         Y2/Af+RdbXnRkYj0mvZ9ocf6Qat1r9GCXFb6W6lhQqs/bbyFs2ielFKCOcZDSgvHUAY+
         ANzA==
X-Forwarded-Encrypted: i=1; AFNElJ/M8Jc6iMuikpTAl0CCuspQlYNE3at8JJvw9bKiu5W9tmPCUtrcXecGnAhHUC0Wg0honF8+nGpGfbOjmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf29raJJMY8Be2f+zMRRCfZ2A3EGrPgec04F83cEqKp9ucKlmU
	Qh3ha/v2OjxzVAhUukFTQ+a+DtpO9FsGxjayUpIwT6Y2h+d6ayOsDWOfxqA08hGQmipXryIlaCo
	go07f3cgqB1MxUpEbXZ5W/Ti9YEvbgXcyzKPma83vJjeXvf1iLkR3wtExirMUkoPC
X-Gm-Gg: AeBDievXOY/jS10CVgjmo2XIVjozqIy6NyJugoXOAz5kR1XnmRnFPU+j/7jLJhBUxsp
	YN98NS6ZUEdiH2n/LIOyRUxVrZix6r/6TGdyDOBIjV+4s9xT+Tr+bJfxgwvaeDt/OTk2Dr5iKGZ
	iUm/tsxL+oeTg8lw6MG4/+RiA+JQ++6cKy624Iyxvx3ckxb+y8uN+3io+vNazYKa+QFPiFRwHmn
	vCdfx8zRS2gQXJ78oo3aRDU+zT03gh0S01OiKSsztzpl/mSElhYLi/5ciFmRuqHPu5IKb+1JEEH
	RmFzTLaxSAiOMQj1IlFzYysr72/NIVrskeLEX+oSY+4E+9mrp+npaQ+9rGnVxqup4+lMAukr/pz
	/0YfJ00EW
X-Received: by 2002:a5d:5f83:0:b0:446:ef9a:8f41 with SMTP id ffacd0b85a97d-4515da970a0mr4473823f8f.40.1778061060052;
        Wed, 06 May 2026 02:51:00 -0700 (PDT)
X-Received: by 2002:a5d:5f83:0:b0:446:ef9a:8f41 with SMTP id ffacd0b85a97d-4515da970a0mr4473777f8f.40.1778061059498;
        Wed, 06 May 2026 02:50:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02abbsm10793056f8f.18.2026.05.06.02.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 02:50:58 -0700 (PDT)
Date: Wed, 6 May 2026 11:50:58 +0200
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
Subject: Re: [PATCH v2 06/10] dma-buf: heaps: Add support for Tegra VPR
Message-ID: <20260506-tentacled-unicorn-of-typhoon-cb4edb@houat>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-7-thierry.reding@kernel.org>
 <20260123-meteoric-butterfly-of-imagination-fd691f@houat>
 <aY3nov29aBGWw93Y@orome>
 <20260218-voracious-orchid-malamute-febce0@houat>
 <afJSQbArB8USb6mt@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="sztjivasnlwpybgk"
Content-Disposition: inline
In-Reply-To: <afJSQbArB8USb6mt@orome>


--sztjivasnlwpybgk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 06/10] dma-buf: heaps: Add support for Tegra VPR
MIME-Version: 1.0

Hi Thierry,

On Wed, Apr 29, 2026 at 08:49:58PM +0200, Thierry Reding wrote:
> On Wed, Feb 18, 2026 at 10:42:22AM +0100, Maxime Ripard wrote:
> > On Thu, Feb 12, 2026 at 03:50:09PM +0100, Thierry Reding wrote:
> > > On Fri, Jan 23, 2026 at 02:30:14PM +0100, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Thu, Jan 22, 2026 at 05:10:05PM +0100, Thierry Reding wrote:
> > > > > From: Thierry Reding <treding@nvidia.com>
> > > > >=20
> > > > > NVIDIA Tegra SoCs commonly define a Video-Protection-Region, whic=
h is a
> > > > > region of memory dedicated to content-protected video decode and
> > > > > playback. This memory cannot be accessed by the CPU and only cert=
ain
> > > > > hardware devices have access to it.
> > > > >=20
> > > > > Expose the VPR as a DMA heap so that applications and drivers can
> > > > > allocate buffers from this region for use-cases that require this=
 kind
> > > > > of protected memory.
> > > > >=20
> > > > > VPR has a few very critical peculiarities. First, it must be a si=
ngle
> > > > > contiguous region of memory (there is a single pair of registers =
that
> > > > > set the base address and size of the region), which is configured=
 by
> > > > > calling back into the secure monitor. The memory region also need=
s to
> > > > > quite large for some use-cases because it needs to fit multiple v=
ideo
> > > > > frames (8K video should be supported), so VPR sizes of ~2 GiB are
> > > > > expected. However, some devices cannot afford to reserve this amo=
unt
> > > > > of memory for a particular use-case, and therefore the VPR must be
> > > > > resizable.
> > > > >=20
> > > > > Unfortunately, resizing the VPR is slightly tricky because the GP=
U found
> > > > > on Tegra SoCs must be in reset during the VPR resize operation. T=
his is
> > > > > currently implemented by freezing all userspace processes and cal=
ling
> > > > > invoking the GPU's freeze() implementation, resizing and the thaw=
ing the
> > > > > GPU and userspace processes. This is quite heavy-handed, so event=
ually
> > > > > it might be better to implement thawing/freezing in the GPU drive=
r in
> > > > > such a way that they block accesses to the GPU so that the VPR re=
size
> > > > > operation can happen without suspending all userspace.
> > > > >=20
> > > > > In order to balance the memory usage versus the amount of resizin=
g that
> > > > > needs to happen, the VPR is divided into multiple chunks. Each ch=
unk is
> > > > > implemented as a CMA area that is completely allocated on first u=
se to
> > > > > guarantee the contiguity of the VPR. Once all buffers from a chun=
k have
> > > > > been freed, the CMA area is deallocated and the memory returned t=
o the
> > > > > system.
> > > > >=20
> > > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > >=20
> > > > Aside from the discussion on CMA, it doesn't look like the heap def=
ines
> > > > anywhere the attributes of the allocated buffers this heap provides.
> > >=20
> > > Attributes like what? Where would you expect the driver to define thi=
s?
> > > I don't see anything in struct drm_heap_export_info that sounds like
> > > what you expect, nor does the allocation ABI provide any means of
> > > reporting attributes.
> > >=20
> > > There's also not a whole lot to this, other than that the memory
> > > allocated by this can't be accessed by anything other than a select s=
et
> > > of devices. You can't have any CPU access to these buffers (the hardw=
are
> > > will refuse to let the CPU read from this memory) either, which is
> > > hinted at by the fact that no mmap() operations are allowed.
> > >=20
> > > Can you elaborate what you're looking for?
> >=20
> > Are the buffers you're getting when allocating cacheable? uncacheable?
> > mappable? physically or virtually contiguous? etc.
> >=20
> > See
> > https://docs.kernel.org/userspace-api/dma-buf-heaps.html#heaps
>=20
> The CPU doesn't have access to the contents of these buffers, so
> cacheable or uncacheable aren't really meaningful, but I guess they are
> unmappable in that sense. The buffers are physically contiguous, but I
> think "protected" is the right name for the heap since it most
> accurately describes what the purpose (and access pattern) is.

Yeah, that's what panthor has been using too:
https://lore.kernel.org/r/20260505140516.1372388-1-ketil.johnsen@arm.com

--sztjivasnlwpybgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCafsPAQAKCRAnX84Zoj2+
duZVAX4rZKstjm4yGIoK4/qxMtpVXLGWXrhCS66Fx3Nz2VUdigwaNxKdo0VUnHgz
6sVzgJsBfRq2AlW+F/stHpXM0fMsHUXere2S6tyHKPw8gwt6dAO5rXziaIeIl7HL
rUTTJPnxiQ==
=nQPK
-----END PGP SIGNATURE-----

--sztjivasnlwpybgk--

