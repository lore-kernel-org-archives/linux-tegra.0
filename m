Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7454336B934;
	Fri, 18 Sep 2026 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789735866; cv=none; b=e116NjS+Lltpb/2h73vR00YKBjhHL+j7IGzjAdQ6jogP1qupLoOC07oUz7ZXUPM0BgxNlcXEOdxmhfq/xetVsaBf4RKbUZokmOdbm/A+TmQcqT7lj1/ihGYyyRs0YCQJVSNUbLAWwSZyMJeMLtOklgiQ101eM+51zCwxdmwK1Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789735866; c=relaxed/simple;
	bh=PRahLbgCtHWClJ87WF7IG8TsO861nb3w+UcRAtpoCA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKucJbaT+bVCkt3ddtu6bbPftu+C18lEjmeO18xmEhgDCKaa7ROBh0iJUb86c2/bdmcdEkLY2++350UN/QIGu2QYl0KoIz47Awih61Fd6moxp4tSPiQSiDpr51sLN/f6FKPQJcCYlfcwWk9yBeNzuvJyhMKWsL4WTry0hLqCik0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnWDyoNw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnWDyoNw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693121F000FF;
	Fri, 18 Sep 2026 12:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789735865;
	bh=z1sVU9R9+x4//8cyuQAoI8VIvZltqOe2KgL9ZPE45nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dnWDyoNwbV68RTnEchceD1+JKKl6RQ3G4EQzo1gFK+DbXTE1Yj64LUOrBpn1DwZal
	 Ec7iZzPF7AQd/jVK7+0jPLq9iGy6P2kN+fQ3x8Ucsevr/1RXFyG1fXkFmv6/D60OeI
	 FD0NtWv9YV9veyPlSoPvuOM0E9yfXJIvtx6YdMePDvJqaaFWcHtNKFXI3Rp5Eqg1LO
	 4OcA6uJ6/P4dhEte2viYxOQ9VkmeCWtFMUurOgpjIIm8QESndV4llUPI4/kKphNgVL
	 UI4I/GYJ9MhDPXJ4IS4RhQCWajy9OrWln7c5bXx17xymNuMmGcnLJCMAK0s5eEMVnA
	 MqLOX45h2ncfw==
Date: Fri, 18 Sep 2026 14:51:02 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
	Matthias Fend <matthias.fend@emfend.at>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v6 5/6] ARM: tegra: Convert to new media orientation
 definitions
Message-ID: <aq0zSBPqnQaG-gJ_@orome>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3nge4cpqtpe6oayt"
Content-Disposition: inline
In-Reply-To: <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>


--3nge4cpqtpe6oayt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 5/6] ARM: tegra: Convert to new media orientation
 definitions
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 11:44:17AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the nvidia device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - Fix MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
> ---
>  arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
>  4 files changed, 9 insertions(+), 4 deletions(-)

Looks like the include you're using here is only available in
linux-next, so this should go through the same tree as the patch that
adds the include, in which case:

Reviewed-by: Thierry Reding <treding@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

--3nge4cpqtpe6oayt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqtM7YACgkQ3SOs138+
s6Gr/g//VOXb0tgMpx4OterUqb5K6gB0eoL8pDnZNWXwL0PdFOWg5P/ozvkIHTp6
SW897Ifdf65UNCGVYXKCqHNBL6DH4Kvn2k/JI0DKerKx0VzQWlm4ojWsr2zBsLvy
WDV2HeO2XzTiqaJqRGiXkB9GQYAn4asQXoobBSoIuRtm0Yh3w0lnhMYThKasCVxn
CwbV8yLl5+cOnyp5aIRKBBfqV+C7RDwHzRlaTLWd0+Tha4hjgv5vtsml12jSrdb9
VCT4xxjfIlt9yCBSpdYEa9LETBXfQRYcb7s9yjO5Koj6rWtd2iLEmoSw/gfi019H
OAZPFULbLHmFV/QhzS/mPwQH5BPTshApCNBFf/uLtrhM9SsLfOBBUsW8jYJ+gjT3
rx4ShbEX4bLsIT9POg1riSw+muXyNnnAvy/aG20ZM2Uq88u7eiG2TfnnQq2jujbV
ZE8b/1r4rk8T5aIjnHsLfrztL8LqguWxb6Ni3YcEgQwheH1vAnOOppETs5a2KqW/
LZXO3oW3IxH8qfBLTsO2dGvx9rafI3SBkRtE/LyAsV+C35sEODkNC57OswrL0ty0
DqHxW09drdXNblN7hsWM/j8oD2/M1hEEiaeO9OuH90hWPxNe8m5TdkhFzkF+TLk2
eTziMaYY4dcUYy81zglhvNT8ERnGG7mhiVXm6vbG4zI1FPJksXg=
=khTn
-----END PGP SIGNATURE-----

--3nge4cpqtpe6oayt--
