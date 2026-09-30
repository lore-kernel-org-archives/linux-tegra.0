Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336A44C6535;
	Wed, 30 Sep 2026 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768812; cv=none; b=ZyInQPSSRl77sUSnmqFfRniYyCB4l197pJ7dNCovGN71yd+84BfGDBM9NGQKzArjQfDM3dwnE4SrpFdgy0nfU2b88V+ZpR/KhGycUqfEykI/5XsbeSsejCeqVNxCKtM4sRZSDHZORrPTKbiXtPkKCfZeqhyTHKw89DLrkHBBeBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768812; c=relaxed/simple;
	bh=P0il/OF4JOD+E/8fghEyXa3ysI6T1Udu5xTeGWfcTc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMOu5hM21ZO3FeKCVgrhYFNU6RvKCtGSEGx8MDyeyQsI91Ku3WOT1jh/lj+Yi5rjCv8UXwSd85iMkg2MUWkH2PrbbjhOPcSVfyR+36+/oAMmUXvEVUPAYytCK+YmzujrK6GbEdxVgfReDch9qO088nqO/VmFwMlX+ZmB60oHgW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/3baXKa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/3baXKa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C0E1F000FF;
	Wed, 30 Sep 2026 11:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790768809;
	bh=fQQR3Sedn/4GEK3kGumkEDw3u+uK8Ic1nZAeh9mKsWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e/3baXKayaU35m/wM86QI/6rhGaiCKn2uUhTZ5XrJF/Sxb6xKnytryacxdITO8fwm
	 p9LP0BTmbEpMR81m3A0zV+4NaChl9/s7NMoDMJW9aK8obfFm0rJolTm3Wdih8cF/8j
	 qUBZ2MpljIl+9WI2WsHFwd7QyGla1yVLRnV6T1RGLJdmZh7neqRXxWiBTy8+lYyFNL
	 4zQX0fKTPmKRG2uQnnoAndi46j38CPzCz2qfjx2CGBbJmIQx13nWLxTFgD6rj2/K4P
	 EuXLx+2on7T0GJ5hyI9+rP81GhxGga94SBatcSm56wYQOgXzqUCcEZwYszVzYj7dED
	 tYnYYWaTnUYGQ==
Date: Wed, 30 Sep 2026 13:46:46 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
Message-ID: <arz1wzEI_7e7ruKi@orome>
References: <20260930070535.47130-1-clamor95@gmail.com>
 <20260930070535.47130-4-clamor95@gmail.com>
 <UJZ22UtaS1GSRPlyAst1og@nvidia.com>
 <CAPVz0n2F8LBqFs2bJERmgvdNYgtt1OEVtK3++CP9y0gxW7gCGA@mail.gmail.com>
 <arzn-TNbOlqXqQgd@orome>
 <CAPVz0n33c_uwfhsSguEfFfJ3FV=26SPtNTEpHes9f5RjnPDA_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="shvfomyf5pmfxocz"
Content-Disposition: inline
In-Reply-To: <CAPVz0n33c_uwfhsSguEfFfJ3FV=26SPtNTEpHes9f5RjnPDA_w@mail.gmail.com>


--shvfomyf5pmfxocz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 01:56:40PM +0300, Svyatoslav Ryhel wrote:
> =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:50 Th=
ierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Wed, Sep 30, 2026 at 12:52:18PM +0300, Svyatoslav Ryhel wrote:
> > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:1=
9 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Wednesday, September 30, 2026 4:05=E2=80=AFPM Svyatoslav Ryhel w=
rote:
> > > > > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > > > > Tegra20/30 SoCs display controller.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++=
++++++
> > > > >  1 file changed, 138 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/display/teg=
ra/nvidia,tegra-8bit-cpu.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvid=
ia,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nv=
idia,tegra-8bit-cpu.yaml
> > > > > new file mode 100644
> > > > > index 0000000000000..f0dab608b2936
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a-8bit-cpu.yaml
> > > > > @@ -0,0 +1,138 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8b=
it-cpu.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > > > > +
> > > > > +maintainers:
> > > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > +
> > > > > +description: The display controller in Tegra20/30 SoCs features =
an
> > > > > +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> > > > > +  protocol and is referred to as '8-bit CPU'. Each display contr=
oller
> > > > > +  provides two such interfaces, which can be used to send MIPI D=
CS
> > > > > +  commands to initialize and control the panel while image data =
is
> > > > > +  transmitted via 16/18/24-line RGB.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: nvidia,tegra-8bit-cpu
> > > > > +
> > > > > +  dc-gpios:
> > > > > +    description: Data/command selection pin.
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  rw-gpios:
> > > > > +    description: Read/write pin.
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  cs-gpios:
> > > > > +    description: Chip select pin.
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  data-gpios:
> > > > > +    description: Specifies a set of 8 gpio pins used to transfer=
 data.
> > > > > +    minItems: 8
> > > > > +    maxItems: 8
> > > >
> > > > Based on my admittedly brief research, according to the TRM the dis=
play
> > > > controller can drive all of these pins - of which there are two fix=
ed
> > > > sets as you mention - directly. So we'd need to describe which inte=
rface
> > > > the display is connected to in DT, but not any GPIOs (which they re=
ally
> > > > aren't).
> > > >
> > >
> > > I am perfectly fine to not expose any gpios in the binding, if this is
> > > preferred. Only question, which method of interface checking would be
> > > preferred. I assume if primary then nothing, if secondary - boolean
> > > prop "nvidia,secondary"? Feel free to share your vision.
> >
> > The driver currently uses the GPIOs to program DBI commands, so I
> > suspect we do need some way of controlling those pins. Or is there a way
> > to have the display controller program the pins and send commands? That
> > would be much preferred because it would more accurately reflect the HW
> > design and possibly also simplify the driver because it doesn't need to
> > parse the GPIOs and then also not use the GPIO API to set the values.
> >
>=20
> From what I know, GPIOs must be used and freed after use. Sets of
> GPIOs are defined and remain fixed for primary and secondary
> interface.

So you're saying that we need the GPIO handling in the RGB/DBI driver to
prevent anyone else from using these GPIOs and potentially messing with
the DBI communication?

It feels like there should be a better mechanism for that than requiring
the DC driver to request all the GPIOs. Maybe these should be excluded
=66rom the range of valid GPIOs?

We can make sure that device tree isn't going to use these on a given
platform, but there's still the risk of users grabbing them via sysfs or
the chardev API.

> > As for selecting the interface to use, it could probably be just a
> > simple, single-cell value with two valid values. That's a bit clearer
> > than a boolean, because with a boolean you need to explicitly document
> > what happens when it is absent.
> >
>=20
> I can describe boolean too, but if you want set it like "nvidia,head".
> Fine by me.

Yeah, I'd prefer it to be explicit which mode of operation is selected.

Thierry

--shvfomyf5pmfxocz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq89qYACgkQ3SOs138+
s6GZug/9FX2usRvzpjMNZQfeZI8lOM98IeNavbs+u+U5NKG+j8zEub4U0sad1Fwb
KUYwDXqoEU+oA9gKih2kjlvJi1MoR4jDeJ4urov+ba036caCEiN/9aIfJI6uQv6N
W+pyZA60Las5PaGBraqWbL+gAwn7ezI9foXmm6owh0uuYzH5Niy5B3QiOYYVtuCY
L4Sw7riw9b1jlFlfrjBbnquQQArQQDQ+7i39qzsbIlA16BzvRitHMDEN5DY5QdgQ
vtrFnNZXGn/bPANx70jThF3FvsRg60S5itZqrFShGmNXvTqvDZ21Nz53PKQjnqAg
Zx2d2lEJULHfYk+/eFi6616ndUcI9iWNkyaHcYhD9egQ6xrEcQZfF2YkVWU3oYXW
qRj2H52nCEfqKopvFMenTU17qc3wiE1/p1L98q3N7/XmYQbwy/pRPxmR0AebfCCZ
uzryhIuXvson0Qs9zwslky7l13S81IFx7LinzK5rL/eqQRPXrzFb6fN06JzwL14K
FejbecdUFOksv86h1iQnZfRGM16ZuKawj5huMjv1pX3UMjxIX44BsstzlwGyvyKg
zUca4SGNOl5BNdPdHhkSjIGOGeH/5YVh6+FTARsYnwIeaZfcUXur43Vu9buaSkTk
jXmGtUp0yo/5Lm5WIhyNxK0g0cYheyNAviL8WY7GSoVCmNiLFAM=
=d5IT
-----END PGP SIGNATURE-----

--shvfomyf5pmfxocz--
