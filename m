Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373574;
	b=pZ67A+JfXxAggcbRrC9UwHaVY7lVqJ7WPsXpZcZZpZfuII8G9/r2CBF9txnBksXF4HjI
	 7nLdz1Kt3J952O0cvX1bBMRUrB1Li3hVVr+jOxJEOmxqbzYgjmk8fUo8khoTmk/u/sUAY
	 vBHSHSqXasMsizd2vaVf7GqQC95OnFHNQ3JA74NaOdvQQU4+L2Bu5ocLZbVh6VG+fpjJ6
	 5fmdrBwWVHSEIdmi6Yjzx/1xwmxTYhMiMegzSRSF6fj/imrhRtsrwGS+DMe0rhGQOwt1Q
	 6DxGT9xYh/eHg9M1PjoBWr1GYA1KlOwi7nfdD0DiwSC/tuNhBYvVwc30qFULPCs0ncg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373574;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PsVKPZVc44PCZoORE4idM922fiRfq5VdfwUd07YqWDk=;
	b=Pwu5Pi4kTirJPmbVNeN6Uy/ttvyWx3J9hqIM/6nBw5vdSpixvPYt9IYZL1P6KHcGiWUP
	 8nuRnuQMFi/2v1Aab4JJiFpNssI1PxfUxj2hSfH+ZPqLiz5SJVBnwW99CYCDBB4J8yxZ2
	 gZqj/C4tN5gXlHYZIFl/i18KW0uWVt/jbNaCoAd0B69BdhznQf2+liB5aOhZ/LMdyyeqy
	 VYIjpVmbCtSXOfacF1AIDFn5/qLB1AkcQtUOTpE8m1Zsh+beyycTd7/jKKia+BX/oM4Z+
	 k7d2vADJDRCDcJH2jIwf/msnJLhZSBjXt5yJN4SWgzDpegKtx+zoorgYfyiYSsL7TeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Bte/lvtN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F798606A32D;
	Fri, 30 Oct 2026 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bte/lvtN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766AD1F0093A;
	Fri, 30 Oct 2026 15:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793373574;
	bh=PsVKPZVc44PCZoORE4idM922fiRfq5VdfwUd07YqWDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bte/lvtNF6Us/1b7jCHDJ/mv+bBnE8JPEMoq1dA4UWpcc+qRawb68Z+G8S3A39QsS
	 hDYiMpIgUeJ1tiT655OIgVe9SVckgg5bg4XqkX/WFVJY+tz8OPLhAwkav9InmUJ8xs
	 d5qnMYvYPFuMl6XteASq47T7pAhec2QeXsuCXEqFKd648i3Y9eC8KQkKJ53rEG8qxX
	 vHHjDvdba3GaMtISZl7JYMqV5vZycgGg6jwSitKz2VPbYvPqOlkkMkWG3RZQkNqhvc
	 uMKk4+deh0FkRktOmsQmwq7Q9jGto1HncEET+BVuGljgUAYRBbxUnCKSFlQJep9bbj
	 FG0BsOBOS+dUA==
Date: Fri, 30 Oct 2026 16:19:30 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 01/11] drm: Add MIPI DBI bus support
Message-ID: <auS1aG5y3nmnDkVu@houat>
References: <20261029152909.234584-1-clamor95@gmail.com>
 <20261029152909.234584-2-clamor95@gmail.com>
 <auRjGM7briuvXDEg@houat>
 <CAPVz0n2=sgbzBfvhGOoRFXeOzKDvs9en7QD0pHc31r5GzgCsKA@mail.gmail.com>
 <auRoaHUqMO4BRQlk@houat>
 <CAPVz0n3K74CZemDzVVymmjU_5GUGE9FsEKk555-AJfG0jek_hg@mail.gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="omsmhv7zumr2gj46"
Content-Disposition: inline
In-Reply-To: <CAPVz0n3K74CZemDzVVymmjU_5GUGE9FsEKk555-AJfG0jek_hg@mail.gmail.com>


--omsmhv7zumr2gj46
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 01/11] drm: Add MIPI DBI bus support
MIME-Version: 1.0

On Fri, Oct 30, 2026 at 12:02:52PM +0200, Svyatoslav Ryhel wrote:
> =D0=BF=D1=82, 30 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11=
:51 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Fri, Oct 30, 2026 at 11:42:12AM +0200, Svyatoslav Ryhel wrote:
> > > =D0=BF=D1=82, 30 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 11:29 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Thu, Oct 29, 2026 at 05:28:59PM +0200, Svyatoslav Ryhel wrote:
> > > > > From: Mikko Perttunen <mperttunen@nvidia.com>
> > > > >
> > > > > The MIPI DBI bus allows modeling DBI hosts and peripherals using =
the Linux
> > > > > driver model. DBI hosts are registered by their respective driver=
s. During
> > > > > registration, DBI peripherals are created from the device tree no=
des
> > > > > provided by the host.
> > > > >
> > > > > DBI hosts expose operations that can be used by peripheral driver=
s to
> > > > > access associated devices.
> > > > >
> > > > > The original code was authored by Mikko Perttunen; I have aligned=
 it with
> > > > > the existing MIPI DSI implementation.
> > > > >
> > > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > >
> > > > The SoB situation isn't right here. The author is allegedly Mikko
> > > > Perttunen, but you don't have their SoB, and yours isn't there eith=
er.
> > >
> > > This is up to Mikko to decide what to do.
> >
> > Not only, no. When you're sending a patch you must add yours too.
> >
>=20
> > > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>=20
> My CO dev and SoB are both present. Mikko will say their word and I
> will update accordingly in v6

Oh, right... I'm sorry.

Maxime

--omsmhv7zumr2gj46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCauS1gQAKCRAnX84Zoj2+
dimXAYD/kqhnWNp/fGtGmf02koLLAQSBfFjU7YQFTgtxn7ZE1915cNwji0VZhZ5U
PUt5uAYBf1EDORnUBqbBxbSSuSfnz1QobM7lQT6wiW+bZhw6bAea7gPY0866McMg
o1D52FAX9g==
=A4YB
-----END PGP SIGNATURE-----

--omsmhv7zumr2gj46--
