Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E983F2F39D7;
	Fri, 27 Mar 2026 15:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774623938; cv=none; b=l132+/vL3sx0HNlzl1AYtDU8P83aOWR16lczvg9rBISU4UJO9AchkYPnqFq4kqsNXaCWE6im1ICnaKuYBMsObpZpyqNW+PAajL44c548Jo3Iev1gEL0z59o0naipVwDjHj4lrXJKxO8a5O1CyyDGigd+GhIJn4q+lwab0fJnuuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774623938; c=relaxed/simple;
	bh=aaAxQ7EXWU8Fl48+WxX4DQz2eWLTJyo+EtdUui8D/68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oer9c90u7JOQQNW9NRGLxwmKUNY0cMF3LqiFdJP/En6/2jlheprxGrivfN73T/d4wKuw4jziCcZYMfqNmaSuWVkKDO57zFlomjGkuUf8+0lntl3IoaO2koH4L5vzmaRE30rmY5dbREJQm7W637tY1SAFgKgfRfd7d39Q70ICOUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2zuV4NT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2zuV4NT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30BFC19423;
	Fri, 27 Mar 2026 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774623937;
	bh=aaAxQ7EXWU8Fl48+WxX4DQz2eWLTJyo+EtdUui8D/68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2zuV4NTHTb/p9CMGsFhFUdZcu3PoLuHAcnJk3C2bqCAnddEZUojfkBaGrjC1tMyx
	 IyA3/RgP28dZUnwzlC82wE3V6p6/pqeAeYCRF9Dl250Pld4R0RqfbMpwN91Ix9vkiU
	 ylbCmMQgY14GfpOJhdvCR9KEJn8j7aOqL5Tk5aqHFUZGWaxhU4jbRtjFKsMpWFrFLL
	 514WBwCr1dCB4br096VIXej4XYxrZLTVPPZCXkJjUo7KDtybnKVNCDh5lqxywbNo3i
	 YX/wyqPyXQKOsNLV+D7YsPCx+pQPq5hj8VlYT7S5nWOpRt76PjB39h70/kZj4nVAT/
	 HVqz9hDV3uxmQ==
Date: Fri, 27 Mar 2026 16:05:34 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] ARM: tegra: lg-x3: add missing nodes
Message-ID: <acacdUaXVNIKHT2O@orome>
References: <20260126101018.24450-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a32hysasxpbh5ygy"
Content-Disposition: inline
In-Reply-To: <20260126101018.24450-1-clamor95@gmail.com>


--a32hysasxpbh5ygy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/4] ARM: tegra: lg-x3: add missing nodes
MIME-Version: 1.0

On Mon, Jan 26, 2026 at 12:10:14PM +0200, Svyatoslav Ryhel wrote:
> With the recent kernel updates, Tegra30-based LG smartphones now support
> several additional features, including an RGB-DSI bridge, DSI panels,
> MUIC, a charger, a battery temperature sensor, OTG mode, and capacitive
> buttons on the P895. Add required nodes to device trees.
>=20
> ---
> Changes in v2:
> - fixed dw9714 and tx13d100vm0eaa nodes
> - added video device pipes graph
>=20
> Regarding CHECK_DTBS output in v2:
> - nvidia,tegra30-pcie, nvidia,tegra30-gmi, nvidia,tegra30-kbc,
>   nvidia,tegra20-kbc, nvidia,tegra30-ahub are not documented yet
> - nvidia,tegra30-vi was adjusted and applied, change did not apper yet
>   (https://lore.kernel.org/lkml/176860988748.1688420.11717122647073678.b4=
-ty@nvidia.com/)
> - st,m24c08 appers undocumented though it seems to be different from
>   st,24c08, at least they google as separate devices. atmel,24c08 is not
>   documented, though it is widey used in linux device trees and is
>   supported by driver. Here is one of examples:
>   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/arch/arm/boot/dts/allwinner/sun7i-a20-linutronix-testbox-v2.dts?h=3Dnext-=
20260123#n33
> - onnn,mt9m114 does not have 'orientation' property, though it should
>   include it since it is generic for camera devices
> - ti,lp8720 and maxim,max77663 have txt documentation and are not yet
>   converted to DT schema
> - backlight in panel nodes was not added since lm3533 has no DT support
> - missing '#io-channel-cells' in ti,tsc2007 addressed in
>   https://lore.kernel.org/lkml/20260122193549.29858-2-clamor95@gmail.com/
> - missing dsi controller properties of ssd2825 addressed in
>   https://lore.kernel.org/lkml/20260123073411.7736-2-clamor95@gmail.com/
> - missing '#io-channel-cells' in generic-adc-thermal was proposed in but =
rejected
>   https://lore.kernel.org/lkml/20250310075638.6979-2-clamor95@gmail.com/
> ---
>=20
> Svyatoslav Ryhel (4):
>   ARM: tegra: lg-x3: add panel and bridge nodes
>   ARM: tegra: lg-x3: add USB and power related nodes
>   ARM: tegra: lg-x3: add node for capacitive buttons
>   ARM: tegra: lg-x3: complete video device graph
>=20
>  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |  39 +++
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |  79 +++++
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 328 ++++++++++++++++++-
>  3 files changed, 429 insertions(+), 17 deletions(-)

Patches 1-3 applied. Patch 4 has checkpatch has checkpatch warnings:

	WARNING: DT compatible string "st,m24c08" appears un-documented -- check .=
/Documentation/devicetree/bindings/
	#255: FILE: arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi:1243:
	+			compatible =3D "st,m24c08", "atmel,24c08";

So I've left it out for now.

Thierry

--a32hysasxpbh5ygy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnGnLoACgkQ3SOs138+
s6GH2BAAon+JsEUMDnuTUUG2YVuyah6tz4JxOlON5h7maG22z686v45oIQHIGH6U
wNBpC+R8roXYnAXsFMSCHLXPUnSCZOJHiOgY7T4lfXY7jUJK4ICYpJ3p2SqJKjdh
SrgvK6b+vkD1NKDzwS0o1qi+n8558KxhZ7R7bQNQfCRVSESeXA0wJu48ytvQnAGO
eJC0BScTVCHqhFszaZebaEsYsdx9NS3ASx9b2DOEj8Zj5RG8Hh/PDjVjxSCVucTY
EWzGFbwEKIrYL4C+8C6iwxY5wSdWx/V/y6K4+DrMdU5w6JaX4DcsO4FygkO7Wswq
FM5/g0YdlsLcakKol+YzwQQxfRkiLkRV16veXSn0Vm9TTGOyDHD0OfI6a2NkDq51
AO6IoMt+0VyKlBPDnAqPbcnT03bWnZG+f2W8p8DJI84cdY9uDkqc7oYkkzEFzKbj
qLYDcIXWPe0wPMWb8NFb62eb00ggrua60eflBZx6cP/3MEioEfjFoMuInKgtm9QD
Cr3YVyk+/VDnwY3QoP2J3VBmNpq6jhuOPnklDnrZUraqZgPLLnnYAxL6cYn16ByN
Gyu5IC++iBw2htgqCCuWGJPCVZEYo7NAFLAoAZFlFuh6UgG8+MqK9e1sBkYbsp3o
xdq+NYHa6eUhELKM1rknrndqnr6fGSyvg9NDTn47y2MkWKt6Guw=
=puU5
-----END PGP SIGNATURE-----

--a32hysasxpbh5ygy--
