Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE582CCC0;
	Thu,  4 Sep 2025 12:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756987453; cv=none; b=e0+TiU34xCAIs6VQcu0IpU5SnO37mijYOa42JQfR3SWkyzfSr18lfXXISCT8U55HjywEMhEGoM0akvPWrH5NXXRsL/uWe/AoBnD+Zen4IXutLqDAc4SaOTyi1paXH9DC7+uJhc2iPKRJDF/lPjOSfjPWnhCOfZPbVFsceoB/CdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756987453; c=relaxed/simple;
	bh=CYiE/pA9YF+I4gC3nqqr/NiV56Cz+ejODJOLdKJjvLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1W3Jd02kvfJB/ikX0BTMH8a6jhE/Uc93GAS2JIk6U48tXBHXGp+uBRvOYWRfvFOfdpMwDLsIBicJM/+I7oiUGz/LYfBAmzFpzXpgOq/qR/kX6z+d80/Gr7gHJ9LqNiHG793fomAYpQCIuSKmUns3SVOrfr3DTTpZWIGnjskGwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcymKmc0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcymKmc0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso6699075e9.3;
        Thu, 04 Sep 2025 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756987450; x=1757592250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CYiE/pA9YF+I4gC3nqqr/NiV56Cz+ejODJOLdKJjvLU=;
        b=BcymKmc08I09F2h3/HkPTc2tIywVZnvEDh9WzzBwzATFEoHVIUEOkTAHzEPoww6yRL
         EBDX54eSWT0crxdjH/iaTbeT83gTmn2t4MJHuF6l4g9l59kwhpk2T0VMktRk7VtEVer2
         es/Xgh0Fq2Fq9Jnjs/Ka0ke1XDw5KqdRT1IqI0Xdz7EwnROr4Fr68+UTPtD+lhkdRG5T
         hDj6dXa3urVQs1H3+KCCBIBnX/UcatSa/DGydV73eIVbvaxBTuKqr+rNlFChgKD1/S8d
         EDRYabkxUJmkpOUWp4UgxqbzEIEUiVOcok0ElIqxvixekJLi4Pul5p090V/c2LvUB+xm
         OoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756987450; x=1757592250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYiE/pA9YF+I4gC3nqqr/NiV56Cz+ejODJOLdKJjvLU=;
        b=P5EF0ewSOhagZx4O6oLTmAnPREuN9oPa0YwbW7qE5naYkXZf1z0tSxXkMEshuiUhNn
         z8mx50IrxUomWNnU3C/aUrIT+KMFWlrD9AnX4FbUPd4GXJsBiKJW6Dkgb03majkE9aEI
         MOAv4qi2MwWVCVNy7ujaRjisPOXZA7yTMbhWIRgOU9LTQp1lvjJ2Hfis7xq92d+fre9a
         s6dWXWt4pTu6xJXIwBlnGtW977Ps8XAZKqdMFl16rjn7uU7z0G8zWsDAidKC48gXdw1t
         E2hraxuFfCFvxxuUp4phCJVxhfu3F0DVfRI6NooH5J726sq1MxmJZEiqbuv08pJpxqcN
         CZwg==
X-Forwarded-Encrypted: i=1; AJvYcCU5t0UdB1ZNfDPokDEjeybrI3pcrtR/OZIc7JMMa7a9tKl6O28pGfmdT6oG69lm7vmxQaHBtfg0a/7sRsc=@vger.kernel.org, AJvYcCUCs06g7bPtahI+5ScZQ0qkuIKdemMsFjuW3lxR7zoEZXmGbV9AbvzSItNzUl8Du/4sD57s6PhHTFBJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwfKYYv5VNXpHDMK4YzJ0QboHp2DHlTckRKxxMR94zx14di25gf
	Zf430XQKgJKwfwPzNBQKBXNbfClDc7ejxx5h+Fg0p0trNpqI6ml7/nhP
X-Gm-Gg: ASbGnctE0Y1f5FthWceiW93wDD3j//6Y/mxjQJjRsYheRJ+GkN4VNTyaXhjfNkEo/fF
	P/nsUf3HFqNAt+37Yx9eQ0LGCLdbGgihgo3Ln/JwoBQA810WVQqDvn8KBdYEmkuJ11/T+ql/z2n
	KqRBiIKUhTY95VKEVh/SRI1L7O/V4NmW1Thjxoq6O0awKPHrud6n65FQFjC9o4Y+Knfq0kInz49
	QyBwP0OlpsxptIc9Ft/I20XqTMiz4lv/YDr+Xepf0WVtr2mk2zff4BVuc2Jst1jX2EfyALcwXbC
	qv3/X6C8qwZoi3ATuGCu+JljbNu0m64oHva5ES3Zv9BgyQfrmI2199i42YNSbdKbrcfi06REwDI
	Mahlla3HteCFIBINir8IEghxp4yyvYQbkfQp8JB02xF+EgAkSsiPH4WvCag83t2/4k6L8tfg56Y
	WgqL9BN1BYu8PIs+Ybgzigumk5W4g2Ig==
X-Google-Smtp-Source: AGHT+IGVHgAQ3rYyWGpANjjI/b4lpqEcMAsgs+SEt1MbrHmOvH15O1otXHYn+//vwM4FBU00m/l7Ow==
X-Received: by 2002:a05:600c:1c95:b0:45b:8abf:4583 with SMTP id 5b1f17b1804b1-45b8abf46edmr100558005e9.19.1756987449310;
        Thu, 04 Sep 2025 05:04:09 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45cb5693921sm79929805e9.0.2025.09.04.05.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 05:04:07 -0700 (PDT)
Date: Thu, 4 Sep 2025 14:04:05 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: John Stultz <jstultz@google.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 4/9] dma-buf: heaps: Add debugfs support
Message-ID: <sb76bsg5d45r5qgq4zy3svbh42ydkk4vrh6a7vh73eibvqbfjd@3r4exdhogde6>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-5-thierry.reding@gmail.com>
 <CANDhNCoM4RFX-QccF7xT=+-tduGj9OZ_8SgrTVyRucMwyVc73Q@mail.gmail.com>
 <e6twhwxi55eesb7xirei7wezzb77qjiji2mccgqlziisjzl3q5@3ny5e6lbgebz>
 <CANDhNCrO21O_URa1iHuroOoG-g61DL7uvECTwVxiuitCTi=i4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n7xt7eiet7j4nzny"
Content-Disposition: inline
In-Reply-To: <CANDhNCrO21O_URa1iHuroOoG-g61DL7uvECTwVxiuitCTi=i4g@mail.gmail.com>


--n7xt7eiet7j4nzny
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/9] dma-buf: heaps: Add debugfs support
MIME-Version: 1.0

On Wed, Sep 03, 2025 at 11:48:38AM -0700, John Stultz wrote:
> On Wed, Sep 3, 2025 at 8:38=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Tue, Sep 02, 2025 at 03:37:45PM -0700, John Stultz wrote:
> > > On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.reding=
@gmail.com> wrote:
> > > >
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > Add a callback to struct dma_heap_ops that heap providers can imple=
ment
> > > > to show information about the state of the heap in debugfs. A top-l=
evel
> > > > directory named "dma_heap" is created in debugfs and individual fil=
es
> > > > will be named after the heaps.
> > > >
> > >
> > > I know its debugfs, but this feels a little loosey-goosey as an uAPI.
> >
> > Well, the whole point of debugfs is that it's not really an ABI. Nothing
> > should ever rely on the presence of these files.
> >
> > > Is there any expected format for the show function?
> > >
> > > What would other dmabuf heaps ideally export via this interface?
> >
> > I've thought about this a bit and I'm not sure it makes sense to
> > standardize on this. I think on one hand having a list of buffers
> > exported by the dma-buf heap is probably the lowest common denominator,
> > but then there might be a bunch of other things that are very heap-
> > specific that some heap might want to export.
> >
> > > Is there some consistent dma_heap-ish concept for it to justify it
> > > being under a dma_heap directory, and not just an independent debugfs
> > > file for the driver implementing the dmabuf heap?
> >
> > Well, I think just the fact that it's a dma-heap would qualify its
> > corresponding debugfs to be in a well-known location. We could of course
> > pick some arbitrary location, but that's just a recipe for chaos because
> > then everybody puts these whereever they want. There's really no
> > standard place for driver-specific debugfs files to go, so putting it
> > into some "subsystem"-specific directory seems like the better option.
>=20
> Ok, I guess I was thinking if the files are organizationally cohesive
> to be under the dma-heap directory, they ought to have some
> consistency between them.

As far as I can tell there's not even enough information in a dma-heap
to add any common debugfs snippets. As I mentioned earlier, a list of
buffers allocated from a dma-heap is about the only generic piece of
information that I can think of, but we don't track these buffers in a
generic way. None of the existing heaps do so either seem to be
interested in this either.

It's also not like it's very useful information most of the time, it's
mainly in this driver so that it can be inspected at runtime to see what
the allocation pattern looks like at various stages and maybe help tune
the division into chunks.

Thierry

--n7xt7eiet7j4nzny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmi5gDMACgkQ3SOs138+
s6Fs+g//UOYEclDiMQaLHjmLrIy415HNAOvJ45jAQXSXODXhEWUoeeT6VpX4alVY
nX8oVWTi6ne/gxdb5ecijq0xe98suaGyb0ExszrPDOsykvikNhAMO8+hGNgfvnU4
L/lvQqTxM8wGz/D1A7z3CyhBipu8GNIYxlF64O9ejq22NqDZGLykvHupw8SubU4G
LQRHuwu39Yb2Hj+r8IMiSXCjWPHtelnA4HXM7hnURUkRNIKkoSp5g9UQJIlw84Y3
U+4zSs9x9IOUr2l35QMwJEq1R168TIAj6gm1G1eSKxGDlIc5DgU4Ei4QTmki+Qhj
hvToHncu1BTaA5YvpgcFKmgCD1jFX93fx2to90mPpWMonySn4EyL0wAqwycfUuC7
D4mKmRF+Dj5RGmrRATN2yZ+2l+N2GgCzJ9EoNNacTl0fFy14FHVwiqn6OVlrIMVl
+olxYn2Ta8T9EMnKrQquQtoEbFJT1mfXUfAlHFDGJocYgKrO+o1zpFzZtEGd92sZ
hpSs5qlYH7hLQaj7P2Pb29mfloQZ9XK3YSNcttTbnFU2dyEahlPvx/VJTCCQvNeY
g03SAA1priYhlLGKdaa19fDxICteA6dmc9Ba6ejSvKXLHejTFlLooK+hkSmufJIu
3DdzixdgWcOsgxrw2vvHlU0U5bPvKnfbiUJUL557Iwo9vw3KKHw=
=G6AW
-----END PGP SIGNATURE-----

--n7xt7eiet7j4nzny--
