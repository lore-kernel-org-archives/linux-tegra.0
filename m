Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DF83F20EC;
	Fri, 18 Sep 2026 12:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733980; cv=none; b=NVAZ5hb3EhR+9Dzs39avwZUdKq0XcIVL0FLYi870iMLwTYZQTLJSbShq9/nBNQFpb4uZXPqwJtVpYk+j5xBO/SEC5Ilr/kZyhGvVHvoDo1VkCkekXubqY/Kh8ekWMJvRxWpBZCGNzI4a1UXSXoRvrq2dI2dpiL2I1rNYF6Eb2yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733980; c=relaxed/simple;
	bh=MZro/A7ro5nz7JLZ+GIpyBsLqovSBy1yv895sHvWpJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KV0Z9gNcMe1il9Eu0yIIAZTPHdvcaO4UhlwZuTCS2FX5ePCyFfy0AC18vrFi7Gn1rIAPvS25HXkzuHUuhJjbgmzCA4dZTLUaILhUT16CypB06Jn4qoO2LJyWKcxvLkcJ+xNFE3k8QpmpEBzUBBTLgdHqUXI0lVpdhWSth6r9WkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQzb9XWT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQzb9XWT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E151F000FF;
	Fri, 18 Sep 2026 12:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789733978;
	bh=xoVozf3XKNPP3HzK2ZeGqkN76iLDIyMvofa8UkB13XE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aQzb9XWTRDCZMybJH4mwB1FxibMeY01qhn0jfSxrNWuWxWmkhrPW7DE1zJuekgZcf
	 83ltZ1DVSUTvqw5zWhms2UYvFk5M6Cl5dvWVXBoWZnFBdcsJnHAjN595+QcILI3tEd
	 GBKHUQkPZU3AOJAHjA7ESfyzPAoUzCw6/+8m9XKSB00fNfZqJaXdeH4N9VlWXEc1KB
	 go0ui7kDDeFbExGkAo4xviLdPd2M6WdGWjPGgotXZsDgXtprDqX1pM154F4MS1Olbs
	 RqLpfGcPXYHZK5YzKrrBrJBeJMN5IHXUaLX4oOywEp+/xvXD0wqUckPF0qnEYMenf6
	 myzdJxEuSd7aQ==
Date: Fri, 18 Sep 2026 14:19:36 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/8] ARM: tegra: Clean up AHUB on Tegra124
Message-ID: <aq0sR4k96fGs1MY-@orome>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
 <20260902-tegra-ahub-dt-cleanup-v1-1-028f3c5e72f6@nvidia.com>
 <1114db1e-55fa-4056-bcdd-f1512bac70c5@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rzyhrhrctqple7na"
Content-Disposition: inline
In-Reply-To: <1114db1e-55fa-4056-bcdd-f1512bac70c5@nvidia.com>


--rzyhrhrctqple7na
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/8] ARM: tegra: Clean up AHUB on Tegra124
MIME-Version: 1.0

On Thu, Sep 17, 2026 at 09:01:54PM +0100, Jon Hunter wrote:
> Hi Thierry,
>=20
> On 02/09/2026 11:17, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Use #address-cells =3D <1> and #size-cells =3D <1> because we don't need
> > 64-bit register addressing for this hardware. While at it, also adjust
> > the ranges property to encompass the entire AHUB range as per the TRM.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   arch/arm/boot/dts/nvidia/tegra124.dtsi | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/nvidia/tegra124.dtsi b/arch/arm/boot/dts=
/nvidia/tegra124.dtsi
> > index ce4efa1de509..7a71dba42dc0 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra124.dtsi
> > +++ b/arch/arm/boot/dts/nvidia/tegra124.dtsi
> > @@ -1114,13 +1114,13 @@ ahub@70300000 {
> >   			    "rx3", "tx3", "rx4", "tx4", "rx5", "tx5",
> >   			    "rx6", "tx6", "rx7", "tx7", "rx8", "tx8",
> >   			    "rx9", "tx9";
> > -		ranges;
> > -		#address-cells =3D <2>;
> > -		#size-cells =3D <2>;
> > +		ranges =3D <0x7030000 0x0 0x70300000 0x10000>;
>=20
>=20
> I noticed a regression on Tegra124 Jetson TK1 today and I am seeing ...
>=20
>  tegra30-i2s 70300000.ahub:i2s@70301100: error -EINVAL: invalid resource =
(null)
>  tegra30-i2s 70300000.ahub:i2s@70301100: probe with driver tegra30-i2s fa=
iled with error -22
>=20
> Looks like the first address in the above is missing a 0 and we
> should have 0x70300000 and not 0x7030000.
>=20
> Let me know if you want to fix up or what a patch to fix.

Should be fixed now, thanks for reporting this.

Thierry

--rzyhrhrctqple7na
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqtLFgACgkQ3SOs138+
s6H5/BAAwPKkJgykHi8AKsVAlex59IAoVpE8yH72tGIA8Fk2Kd9Uz4iHxcqlgZTr
NrfX0DKELHIawjqbeI5AYkTFtPDl4gx0FzvKwbp/C+FQrzQgu9d8wqz36qHzr1QW
W06eiWaUtgJe/HXmfUX5a82JUJdtrhPfHxDtUoiuwdhArPz9B4v5i2pC+49A2esM
u5tW+IydQLBmA2MBf9pImDptXhTj7XYk2fuQGPhqYlkCvrU1T7s6/QhHYnGxbQ4r
WC6g5IB+rQilgL4g+LnoOnnq8sKDIc7mEHHNL3VXryFVjj5tc5GdkSh3i27VwrD4
CRWdZrCkwRFPUAi8klqh3mlB4OaWFAViI4PX6ffkXuQRfpi1JxH4somPt0guD2/y
TLw1SsUKr1u5Mc6RzhXG5KCh6dz6WZ3B7zDt88kD8R3WdWZth6/fsjhsQdFzeTTt
xs0LqJ57DW5iQmqnu7AaVrPksyH3Nk4iJ5EmnSUmKpfFPn9j2F3eC2JdJ2+W4iqD
NWiKeLQFyZtG3/F3H2ENr+iwJHmsEaAedUHeDFr634E2ESYrHTQjbUBdCKRYKRCO
l8d/xI1Nw09pR5cgMOPSqb38TAx/mT26kBwX1geNfvH28S9xmhmvdneKPBc6prSH
ISYY5g6h+M1vgxtMyPnmwfTKKi4yz0uDD2ZDI8WhH7vJ8EVGbjY=
=s++q
-----END PGP SIGNATURE-----

--rzyhrhrctqple7na--
