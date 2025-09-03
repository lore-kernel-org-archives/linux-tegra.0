Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB53E28151C;
	Wed,  3 Sep 2025 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756913893; cv=none; b=qOllBEQuuQNCHBlxsziy4tpv6InLODrUgD/X0ZFNDya5mUQHGPUdPpd33Qtpsqd+X6sBK5NgafaB/Jkuz72zd/tGnknGtJ8d8qM57XJd31OlemxMJJRizi0hrXyjH4+Jsn9MnkmWzStDS2qnIYncR6xe8p8LeioRdy12KWH6m7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756913893; c=relaxed/simple;
	bh=VPbwCRLjCS0JlRjDhk1ZHzDpInRFzDVXs0glfOj9Nmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5aflz/MMbbbMRdFmcM0DcN41IMvxcVh+4I9vIUQWAy5RyQ/cgiHEKRk1BzFaPq07Z8T8XQiDFLTlKpE2+xWY1jLok6fW/H9ymPkGYi+iNIfPT2N5+5XARPV2aGmNyxTa1NUGrRAMD7uwaAJk1T6BbeiToetbwd81ETGxYziKzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DofudDW5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DofudDW5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b89147cfbso633465e9.3;
        Wed, 03 Sep 2025 08:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756913890; x=1757518690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VPbwCRLjCS0JlRjDhk1ZHzDpInRFzDVXs0glfOj9Nmk=;
        b=DofudDW52HX0q+5z13B4Q/PvnEMbULyTVLwUvsJP2PAV/yjfYlHCDRIgDX/bTtsL42
         LQerHgLGKc8EA2OE5B6g6DXxmkHs0Cpc83VE4DNTlFlJbb4GX5gd2lg+Orcg+7wnoofE
         2UkQcmRVAD0RBEww99covA9Npi8/e/XEa3v7o/Sv7SfA4m3iCELwuM7GrHaLNA3XV+Uc
         Mq5S6EhMUf7hUh2ozuwSht+E383etEWguqCUdIlQdjxkjglZ8WuClx69LZqhkjUfmxjz
         2CwzZc1IG3xhZL2ystWH/AGTt9EMLPRkNXA/gexQSLlApkUNNzMuGhvX797uL1A9x6lp
         f1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756913890; x=1757518690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPbwCRLjCS0JlRjDhk1ZHzDpInRFzDVXs0glfOj9Nmk=;
        b=VDhYPEO/7z0J7rKLmYprhmuAww31ZKJYP3C2h/VNi1MyIFM77da2PX/zAE2nPS4ryB
         GPkc4Ewxz/fFLnbTDPnJf2GEtBbAZE6qdjZEGISqSF0dimlBc3OTzsPIMUMDr9JwP6G3
         cjAZee8Yq0GIf+J/IPkrZomjWZQSi54Vh8ldkMjKWyBEGTI8uqaw5g1XEUXPvIL+wCqJ
         6nHNtF5T2rK2m9JMgnICGryWXkz+maK+7hm5Lp+F4ygvLBDh6iIA45g4LSjtJJFjH2qt
         WrovdBkeLBo5eZrhOToY5ZDja5cYwoKCxAtCNRoWcS0WEgZee9CLZzOmVbmjboS7HwKS
         05HA==
X-Forwarded-Encrypted: i=1; AJvYcCWyulWrLjVigKa52Etxs9qEQUfAABEwm3+SJNEnJTrheDFlUCC2EiRV/MZIOa8D+vHNDy9JNH/mWxtX@vger.kernel.org, AJvYcCXu2ZkEtqqrSKQ4jzgHUILZLbMLsLMUw1RVRPdmuBfOYY229lA70oRn+QM8+Rq+4LJKETERa/x1ILmUw/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcilK4VeKXNPasdznhi/J9C4lG8opIFDGuQilzcMsJ95koVZ1X
	vO2NEcmQqbJjSKqIu4KQHMsRnUGmCcm2aGZ9g2EtqeNKdLwbDvDnLilj
X-Gm-Gg: ASbGncvsxy/Gsyv3i1v6xIBNRMFiz0NDXpPCsjEQOxZUHNaXPetP/DPfD7pPVQIVQtS
	mUGND5HDlIurwGzfis/EeKoDTASM5AkxSJXklJUTlMLXrO+DGlBbVTZ10LiceB91oHAJhw04A2U
	xPaHgKV6/KILxvDBC4dG4i17Sbbvpx8qTyFUngomNuGziS3y/0KxZuY4FRt995PZKrSidtNFEZG
	+evBm4TMmJt/SpCwNUhRgI8rE06Od2iVTVM4nVGifckS2hIA85Y+OwYrTUL3tWEiDagso+VD44f
	+6ugrLyPlysnKgdJwvDH1lExMOe0sBVN8Ub2Ae2hOliCGUL3eeR0V06SK9i22/fffMfYzChF3Qq
	XdiohFRmIIbSv6/Z37BtHCsKHfvf9ggEjCcxPimD0lHXrGtvLCkvqfrcYAMG36InafBHMwSJcIi
	7/ekJBg1gZESLwr+x/DV4=
X-Google-Smtp-Source: AGHT+IFJMszbSGSF1PbWonv1NoW4j1E7tepFW666Fw1sEE/F4ZJzmOwpg3R8c/5zqgWpxpRXy3A2Sg==
X-Received: by 2002:a05:600c:4ec9:b0:45b:7ffa:1bf8 with SMTP id 5b1f17b1804b1-45b934f6a56mr68840825e9.23.1756913889833;
        Wed, 03 Sep 2025 08:38:09 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm59432145e9.16.2025.09.03.08.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:38:08 -0700 (PDT)
Date: Wed, 3 Sep 2025 17:38:06 +0200
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
Message-ID: <e6twhwxi55eesb7xirei7wezzb77qjiji2mccgqlziisjzl3q5@3ny5e6lbgebz>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-5-thierry.reding@gmail.com>
 <CANDhNCoM4RFX-QccF7xT=+-tduGj9OZ_8SgrTVyRucMwyVc73Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sulytsn4e2thgtl4"
Content-Disposition: inline
In-Reply-To: <CANDhNCoM4RFX-QccF7xT=+-tduGj9OZ_8SgrTVyRucMwyVc73Q@mail.gmail.com>


--sulytsn4e2thgtl4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/9] dma-buf: heaps: Add debugfs support
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 03:37:45PM -0700, John Stultz wrote:
> On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Add a callback to struct dma_heap_ops that heap providers can implement
> > to show information about the state of the heap in debugfs. A top-level
> > directory named "dma_heap" is created in debugfs and individual files
> > will be named after the heaps.
> >
>=20
> I know its debugfs, but this feels a little loosey-goosey as an uAPI.

Well, the whole point of debugfs is that it's not really an ABI. Nothing
should ever rely on the presence of these files.

> Is there any expected format for the show function?
>=20
> What would other dmabuf heaps ideally export via this interface?

I've thought about this a bit and I'm not sure it makes sense to
standardize on this. I think on one hand having a list of buffers
exported by the dma-buf heap is probably the lowest common denominator,
but then there might be a bunch of other things that are very heap-
specific that some heap might want to export.

> Is there some consistent dma_heap-ish concept for it to justify it
> being under a dma_heap directory, and not just an independent debugfs
> file for the driver implementing the dmabuf heap?

Well, I think just the fact that it's a dma-heap would qualify its
corresponding debugfs to be in a well-known location. We could of course
pick some arbitrary location, but that's just a recipe for chaos because
then everybody puts these whereever they want. There's really no
standard place for driver-specific debugfs files to go, so putting it
into some "subsystem"-specific directory seems like the better option.

Thierry

--sulytsn4e2thgtl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmi4YNsACgkQ3SOs138+
s6FLbg//VYHy8TOrGMpDWro/ULEXXUAldaCb7nmtSEpNIXvKqfV5j9D/dcMLpLtY
LC53YPVnMm9g5c6mZ0w7DfUU5q+qAwCe2mvhA+Fm3UaRF2jMKhD/5LG4rk7ELWsL
Xb3raJAlnNFO9AHgE7oEwGYjF8q94yEiAZHNO62j1kxJ00CpZCxyG2rie7iaTAMh
VToay43MFoIv9ulrESaonZk84vL4HzYJZIZXeIgjs+mS0BmFH5fxvCPerNuiG4gf
Z4N4cCDGWfJ+EYFuMZ3p2pbLivKlTqI3QdihV8BO13OMaADW7vmSPMdDzYSgQ/R9
KdwIIctBlRpiGYOJCPb83kZFsFXwU4Cvnfc3HJDTjwLwlbIrAFTlPnyhL9eWEeZD
oD4Jdnf/tHXH9tFJUEZ+cPA8mCHjMrnL3mTItfYILkvaGuZGRRdacy5fyICO0fbv
xB0k9rSgPfwlafKgaHj3wQD02D1qmGZqATxAVYXu/RT682hMAYX8JJS5ar64fQ35
esRjjoSdlzaVisao/gog2ThKdoPsThxcMXcM4nHHMfkd+wURKomTszYl8lZGew3Y
dzUR7jKgI/rPUUUpBD7D+cPzNy5p2JzoQMPoBtKMPOOq6tQ1BXYJgXZtfW8DO1T6
QgUM6P7kdw0Dce+0PdZOD3TvkpPucxyqZlLA13ZLCYeW8xZKwsk=
=6VMq
-----END PGP SIGNATURE-----

--sulytsn4e2thgtl4--
