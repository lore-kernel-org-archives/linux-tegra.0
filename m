Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976036;
	b=2B4o19XsSLX21g0HCc+CjM3rPtX6m+gmOrQeS5Sb0g3rFuOTvOnu1gl9JDM3VoEEyZKR
	 KzJjWGYI6HUVEz0tnIRSL9ClxKUU13IpdCddsVOYLm3utYr5esNtnJEPORwBzGVKV/EsQ
	 vtW5a5XczJdTwavQ2Y018jl2Mw0H9kvAs7LJJltt2Ma/kGc8d6btfN3BZtzs+NG9XHHny
	 ezn80DinNeKT6+oFbD9pdqoxt0YEbJGPeyyZ5bhSRNKqMFyotiqUPlFsBE2ckkVtM+Xjb
	 gQ6uaU2WMq+S67AtyWB35K4qNlVUkPSHPoWElEsV59E2n7kItCfaciRk5uTk46VqCbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976036;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TzfTM5AdraPN37pUgPGW6Fkxv3WoGrosPaRZdWHYta8=;
	b=sW4jFdKOjeaU076aPlVAqsBY3ZF0+XE/SoCCUkqsZj0yO2dm76T5uTEaPwUfl4jNWMNv
	 2Xd9gmPhEZVBaThv3j8nUUOBfNorjgP2uMgbzlrVWbpg/R8yU+B/X7dXO12V1dZwGr4Oy
	 lQAduIbfq/LIeQ1wmCTa6HdidJjX5WxW5Y+0f7iwYBQNSivrDG23ueCh7O684xOO2ZrGD
	 /MNXoXO9JnjxW44WxOKyQolD1MzfUDW9aZxncd+PwysOaeEILOZY1k3K9qv8d8A4JB0Pz
	 7d3KOW+syk/sYZ/jRC03whxjj5ZKUVcqTI711cGh6mkKcGW43ey/yAfCEdShfFNMXdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bj8FSQFa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF6C606A326;
	Fri,  6 Nov 2026 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bj8FSQFa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B33B1F0089F;
	Fri,  6 Nov 2026 14:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793976035;
	bh=TzfTM5AdraPN37pUgPGW6Fkxv3WoGrosPaRZdWHYta8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bj8FSQFa9tt9djPAEdPco7tcbXPlLuIxWFz9YzTgl5toWzdVHwQ6wA8/ovi7PJZxf
	 k0Bda4fVxyUAVAkC+bo3xFhYHcgfy/oiHLif6mG+nH2198HUgXJQwWNAZncb/wfmTB
	 IOqUrGJ1/nbYx9X1QWfASw1G8oiVa4p+yt++vP6cwUSVXMMEeVJZ+5l9gQtaguJj6/
	 7fLs9ihsl8z//RnZRnwq1RFRB5llqNtXZxF3wTgARl725vNWjfmb+wKX3X7h33GMie
	 p63C/S+MIrW4UGiU3t4N6duCmR2DBHG5ft7Iocj19CZfe7RhPJpO+mW4cMR5qydgGL
	 PRpZwP5bqUzIA==
Date: Fri, 6 Nov 2026 15:40:33 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/10] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
Message-ID: <au3mloMMzQFPUept@orome>
References: <20261105140510.165165-1-clamor95@gmail.com>
 <20261105140510.165165-10-clamor95@gmail.com>
 <au3etybQlb5CtjBL@orome>
 <CAPVz0n3o5pc62eF6gv+PYmJh1KN1a5s=qmjxpNGJfxbCC4tqzQ@mail.gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kfrqhuv3iinace42"
Content-Disposition: inline
In-Reply-To: <CAPVz0n3o5pc62eF6gv+PYmJh1KN1a5s=qmjxpNGJfxbCC4tqzQ@mail.gmail.com>


--kfrqhuv3iinace42
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 09/10] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
MIME-Version: 1.0

On Fri, Nov 06, 2026 at 04:11:12PM +0200, Svyatoslav Ryhel wrote:
> =D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:=
08 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Thu, Nov 05, 2026 at 04:05:09PM +0200, Svyatoslav Ryhel wrote:
> > > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > > Tegra20/30 SoCs display controller.
> > >
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 ++++++++++++++++=
++
> > >  .../display/tegra/nvidia,tegra20-dc.yaml      |  22 ++++
> > >  2 files changed, 135 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/tegra/n=
vidia,tegra20-dbi.yaml
> > >
> > [...]
> > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-dc.yaml
> > > index 69be95afd5627..ffeb124905dbf 100644
> > > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-=
dc.yaml
> > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-=
dc.yaml
> > > @@ -79,6 +79,16 @@ properties:
> > >    rgb:
> > >      type: object
> > >
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +patternProperties:
> > > +  "^dbi@[0-1]$":
> > > +    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
> >
> > I think it might be better to group these under a separate dbi node at
> > the top-level, making it a sibling to the "rgb" node. If you add
> > #address-cells and #size-cells here, I think that means technically the
> > "rgb" is now in the same address space as those new dbi nodes and would
> > need its own "reg" property and such.
> >
>=20
> Only 1 DBI node per DC is available. Adding address/size cells means
> nothing for rgb.

If only one node is available, then "reg" isn't the right property.
"reg" indicates we're somehow addressing the child, which applies to all
children, so I don't think that would work here. A separate property
would make more sense in that case.

Thierry

--kfrqhuv3iinace42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrt5uEACgkQ3SOs138+
s6H+Dw/+PUL6GX70b6+irhCEh2iRRbjAJOb8hJcGzIyzIL2fKpegvQc+tmdtv70b
uysG6hT20hGq4wDtEX9wMD4zbqmM+/v6sHc0HtIR1sPF1uMU7aFFHneRLWxJkDGn
epIGbli+WuszdSdaAaHe+YdRbWXJ3xm7Jnh2ISTPbDCSyLylz29LfGH+f5Y50Th5
2Tczw+l8Lhesapoan0KwMmOCdAAB6ltNh1InVAaYXciYhS7SkcFWKfiPv5uWCJUh
eW2QgD29HT6pKaTDiac7M6OFQMQA6z7A9V4LSC630XrIj75b1wi86i06Xlc6y6Yt
y8jMBEXaMLlv1rKl5CH64hUjDFiD85Ws7Dmczc3Vgcz5apnwhmXT/r27tfDbTdCC
QZWluZjCpjqNosCPzwr0gC3RrMedFGz/hj5HbeldRnxzzDUDCFRj7mayGdzrcpQM
3ysLLhpxKAt/JuNp1wa12ZKPPqsKyrc5bmnno9YNc1TD4IaexNu/0BJl7NXCO7S6
zdBxWd8LfvON+7JT9gP5hBQVqB0a+4eEau3o6CblbYq9R6lsVplR7MtSQJZ7Iklo
yzJVCMoTNzE6Bp0BDxuS67f+3Ke7eI26p3tCpxTd6zzCH3vQMtTM1gw2aAnMF4zQ
KhsSwgXjQdnz7SYy4W+3iYB0BaokiSQReMgF4HWIxR+Tk63sFKU=
=GuOz
-----END PGP SIGNATURE-----

--kfrqhuv3iinace42--
