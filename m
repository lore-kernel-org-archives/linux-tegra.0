Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B898488DAF;
	Mon, 21 Sep 2026 12:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992621; cv=none; b=V1kOzRuh1x3pECSjJf1YXEtojjVi06KM0JB7Q7fjhNwiaSigzX1KBUmcYP4mBUDHpx7vUDKklglQl1shD8jTlKtGGGIasZ1bfbV31+uOAcPorLDqxlmhOYjIxwRxh8U0aAyDRACbW1nmv15IpJY0nf7YZkv2LOVY6HgaTn6V7Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992621; c=relaxed/simple;
	bh=FG6tH/Y8T9b0/2uVNUkAWRpyGeXjSLQD/gEba+dtlXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UL1iKedbE6OPJ6F0SO3vyTO6uCWD5jpDFWKCNmPKEl3PnvKeuF4MhQMTCADZvsoWRc2JMztiXCcDI1gOr75+NKDYMx/CXRuq24XnTUTcpkRiD6AZuBu7C8USDRruJKcTuE76ZzLcucpc8IeGZVFrFk0XQlZoFQsC0hdxMexMVRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOpaGtJ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOpaGtJ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE441F000FF;
	Mon, 21 Sep 2026 12:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789992619;
	bh=3uAtYTanQvdsf1B+VPerfl6h7vAqJMoph6hxUBqYX7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NOpaGtJ8d++Zjqk+UoXhakEjmOlnVQIsuHpbXfFYV7K8jr4hyOGCVgwc3IAF2ni5w
	 p1uvEkfp9voac0b7T8ihJV0NM2Q68FaNxdCAGlv/f+CLHPK45HP7IzejYj81Ylz2HJ
	 +QuWP1387BZap0C4UNLw1ceCBKNpcnPezEY5lbrThWRyOM/V0Phx4YqGxyGEc28xUH
	 oZlcD8tzG9DuLVRxOdQnCR879W9saNzv26PHUVOQvaFhKpXpga0d2EnYJ2nIghTC/y
	 twDPiKShfjwM90J4jSLynS47kyx0geFk9lM0oXqfT/xzzUqwL4OaH3pmkHFW2Yfcvj
	 +xaneJMo9qBRQ==
Date: Mon, 21 Sep 2026 14:10:17 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
	Matthias Fend <matthias.fend@emfend.at>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
Message-ID: <arEeG06MiZ_97uzH@orome>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
 <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
 <20260921073538.GA1466037@killaraus.ideasonboard.com>
 <arEVs0FDleyHeeLj@orome>
 <178999124332.1723501.13535584681937232110@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vnshuij5kqlf56wu"
Content-Disposition: inline
In-Reply-To: <178999124332.1723501.13535584681937232110@ping.linuxembedded.co.uk>


--vnshuij5kqlf56wu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
MIME-Version: 1.0

On Mon, Sep 21, 2026 at 12:47:23PM +0100, Kieran Bingham wrote:
> Quoting Thierry Reding (2026-09-21 12:33:54)
> > On Mon, Sep 21, 2026 at 10:35:38AM +0300, Laurent Pinchart wrote:
> > > On Mon, Sep 21, 2026 at 09:07:01AM +0200, Geert Uytterhoeven wrote:
> > > > On Mon, 21 Sept 2026 at 09:05, Geert Uytterhoeven wrote:
> > > > > On Fri, 18 Sept 2026 at 12:55, Kieran Bingham wrote:
> > > > > > Add a new dt-bindings/media/video-interface-devices.h header th=
at
> > > > > > initially supports the Orientation types and convert existing u=
sers
> > > > > > throughout the code base.
> > > > >
> > > > > Just noticed these are already in since commit 6ab5acfb8dd38729
> > > > > ("dt-bindings: media: Add macros for video interface devices") in
> > > > > media/master (next-20260903 and later)?
> > > > >
> > > > > > v3 collects tags, and fixes the typo, but drops all hunks that =
do not
> > > > >
> > > > > [...]
> > > > >
> > > > > > v2:
> > > > >
> > > > > Interesting changelog order ;-)
> > > > >
> > > > > [...]
> > > > >
> > > > > > v3:
> > > > >
> > > > > [...]
> > > > >
> > > > > > -v4:
> > > > >
> > > > > [...]
> > > > >
> > > > >
> > > > > > -v5:
> > > > > >  - Definitions now accepted in linux-media, rebased to get conv=
ersions in.
> > > > >
> > > > > Oh, you say so here ;-)
> > > > >
> > > > > >       arm64: dts: renesas: Convert to new media orientation def=
initions
> > > > >
> > > > > So it's been safe for me to pick this up since v5?
> > > >=20
> > > > No it's not, there is a hard dependency.
> > >=20
> > > The whole series needs to be postponed by one kernel cycle :-/ It's n=
ot
> > > urgent so it's not a big deal. Kieran will have the priviledge of
> > > rebasing and sending a v7 :-)
> >=20
> > If all platform maintainers Ack this series, they could go through the
> > media tree where the shared include was already merged. Alternatively
> > the media maintainers could provide a shared branch for everyone to pull
> > into their platform trees.
> >=20
> > But given that this is simply replacing a literal with a preprocessor
> > macro, maybe not worth the extra hassle.
>=20
> Indeed, I'm not personally worried here. I thought that because Sakari
> had accepted the main patches these could go in now, so I refreshed the
> series.
>=20
> I don't really care which route they go, or when. I'd rather not have to
> re-re-rebase again in two months ... but I can cope whatever :D There's
> certainly no urgency here.

You already have my Acked-by and I'm fine with anyone picking up the
Tegra DT changes. I don't think there's going to be any conflict with
any other work in the Tegra tree. If they don't get applied, I'll pick
it up for the next release.

Thierry

--vnshuij5kqlf56wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqxHqkACgkQ3SOs138+
s6GCVA/8CTjCU06x7t4Mbm966PsuhGx8Q1j3ntV2PiowxzhJwEyb68oBkfVXTkrL
9rGbkF8OnuoiY/uxupgsIUa+x2hplNqTs6J/OxG5LLbOhdnv1OpzXUBaXlg6ahe2
+7XwSzG2TQcYExblLuZqsViN21+KOWOJAcTGTnxP/X0lbLQYLjSRmzkVlOPjhtEU
uhszVibjBBSQjotx1SMbk0C2Mxmko7X+ocCxsZ+APwIO3xvrxRRefs3s5nWXRaZH
mb8ywwgh0WqojUcfOLazhhfUQ/wIn5WTNutOymPP17QgoUVluJOu9TUz1KEnSDVg
B5NLXtC37c4Ap7iy4ZZMbs95EpkH6c6Dg5qF6avcs3nDUt/g94yCb3eQ20JBveBj
jOBT9Gpc5pz0s5wLzVzCNWmKk1tQYABslMzcS5aQLBy85HUIwDH/DcCXBOQMm5Tu
ukBohOeV+nvFWVkT5gDK+zRzaHqPpYpajvemCYUJrw5eXZp53X0L8JV+4HvhGgnW
uUHIqXFNgXiRGiSfAs+24+jaUhU/W8Wpj5svPEsD2/OeW2jjUTKpo58pQEo7X4up
XVVNGOuxJaT/8Rh62gC7rHMnM2sVlBE9I0rpRtghOzA8EBdyFnq22rDy/xIx/86j
aXnoCcK0YUHzkj4lzswo2sohi0nE4T9nDsfYTN14FxH3WvRPoFk=
=3wJh
-----END PGP SIGNATURE-----

--vnshuij5kqlf56wu--
