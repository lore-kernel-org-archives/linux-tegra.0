Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AB23AF66E
	for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734976; cv=none; b=o26xhToTcO6WL3g5So/XdVsVizCXO/81Vq4vTprkgWqsq43MDMDD2jczGMk0wr+DRYM3Ye9cRc6AoD/g2e2ixE/TxBzevMS6+eQf+qH0pUM4QLpnkFWfCjvto+3PxL1LA9bFBLcIRrLhmu4OC4fO/+q0lelno02/1wIPRu9uzIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734976; c=relaxed/simple;
	bh=+Eawl5SxhbcxVTSrftCHbfh/NkYEt/ITCxfJ9a2Njh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRToxQfl98B96TX7LOpP4rBm+vghi+9xtfJF6bpUoo3N0ihcptx8FnyrOSc2lGse5q9UrjHVqPoqokR02jqtrAR/6+iG1vRlnPtmO6n5ho3RQCJ4L6EUnOhJ+A6bBdnbYFeEKLOBmJsRrrLoGeTb5uqhQrtUyO4lkzJZyCFtRoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DusgQpZI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DusgQpZI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3BE1F000FF;
	Fri, 18 Sep 2026 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789734975;
	bh=Sb0LbV+qy9vs/5l3oux6Y+ZcGfz04wYswEvpakDWmsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DusgQpZIz+qRZGZwEVV53iGNlr2yK/sOSUe0cB2fsd7J9GdoSOk7mCia8ThcOcPv4
	 bbKOZ+6BWxMdK9/kE0dCsg209TdjdYdqVnZI/Xelg1otJ0pyCcX5WC2yu/xOkoUUr7
	 o76NSp67xccdL/EPthaMlnLfQy7GM37CAXbafu2R049u3uv1gZqntmD05iWd/SnR/X
	 GvaKrvnQnHy/UFIGnDpuOHD8JxZvgPSkBpRYH72baMCO6ovs6Nv7sUo3KutAf6n6jt
	 9LZD8yBCocHpioQ/lB5//v8tyiuiuIVx3TDzbtsNiD1S9F7mn65v/+JQfVulB6F5+b
	 ckamN3mQvaW+w==
Date: Fri, 18 Sep 2026 14:36:12 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Enable built-in RTC on Jetson AGX Thor
Message-ID: <aq0wEa-okvY9IaZX@orome>
References: <20260817143205.287870-1-thierry.reding@kernel.org>
 <75f49105-f36a-48cb-877b-5ab96c8fcd90@nvidia.com>
 <aoQ4vGb2-FwwXss9@orome>
 <353be5ea-4845-42dd-a902-430f0ed37348@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="isrtrbl7wjbvke3j"
Content-Disposition: inline
In-Reply-To: <353be5ea-4845-42dd-a902-430f0ed37348@nvidia.com>


--isrtrbl7wjbvke3j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Enable built-in RTC on Jetson AGX Thor
MIME-Version: 1.0

On Fri, Sep 11, 2026 at 03:48:19PM +0100, Jon Hunter wrote:
>=20
> On 18/08/2026 11:54, Thierry Reding wrote:
> > On Mon, Aug 17, 2026 at 03:41:31PM +0100, Jon Hunter wrote:
> > >=20
> > > On 17/08/2026 15:32, Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >=20
> > > > The built-in RTC is mostly useful for testing suspend/resume cycles.
> > > >=20
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > >    arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi | 6 ++=
++++
> > > >    1 file changed, 6 insertions(+)
> > > >=20
> > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.d=
tsi b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> > > > index c4ba3322ed9a..113ecf297378 100644
> > > > --- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> > > > +++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> > > > @@ -13,6 +13,12 @@ chosen {
> > > >    		stdout-path =3D "serial0:115200n8";
> > > >    	};
> > > > +	bus@0 {
> > > > +		rtc@c2c0000 {
> > > > +			status =3D "okay";
> > > > +		};
> > > > +	};
> > > > +
> > >=20
> > >=20
> > > Any reason we should not just enable in tegra264.dtsi by default? I s=
ee that
> > > we do that for tegra234.
> >=20
> > This is more of a development type of option and not everybody may want
> > to have it enabled, especially since it's not always hooked up to do
> > anything useful. We commonly use it on the devkit for suspend/resume
> > testing, so it's useful there, but even then there's usually another RTC
> > on a PMIC or something that's considered the primary one.
> >=20
> > So in production I suspect people may not want to enable the built-in
> > RTC. If we enabled it by default, then people would have to explicitly
> > disable it again.
> >=20
> > I don't feel very strongly either way, and I could easily be swayed.
>=20
> I would be good to get this added. I don't have strong feelings either
> way. So ...
>=20
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

Applied, thanks.

Thierry

--isrtrbl7wjbvke3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqtMDwACgkQ3SOs138+
s6FTVA//X6CYkfe5lvfj3+GLwt98NOsM+ptCbHsqlGuhS1E8K/qP/v/LyAr35PGq
6NdCYaQhIsEXZx20e8MlGpb6Oqf5mn4fAFSAjje6ecHjnLJLki/RjXQSIQ6PtVak
0IwWAqc54r2kZ3yzC3AsqdMn0eAcac2YM8OqLDP0i5Kbr75aoWTaagQUtBPOfuJr
ux2Uzg77uhuLgbV8LEb5H1ep83UtYYZkvZx9wZZdzWqrY6waKLTh4JeZVW/RiTE2
hkyzvnBxB/pLbdqTZTAAk5zgj1X+d77FVpTmWz5JhXdklCXRFlsdwYUJQijLgpH6
5PvTH2mwnZNriX/fqy+o56ZAQY3K1QrOfONEbb7/ajP7sxFcDXVqE9cp78+ZKkbP
3BcVDIj8CBnUCBeQk/ZWGmOMa/P8ECp3y9Qbx5BE0i/M5dGLQOmgBwZDEJ8pbpL1
vT36wzej/gUVDlZsnV+UibEleCkSQdO7wtZnXQm1QFWV0q/SWokrCZl2lQRZ4nFH
GMwOPC/j7w3s2jFIkXdrngV4FnpwuM8EhsxITDRulyidE9iKgF9cMHXBIcXEKVIp
3rKSOCVrMwCUJEuajBocmhC63ETZCEZOBsTFcyAF8ZRBXgX9ORtnJLixiaEj9vDP
bKtnjilbrKu5I2T3vs7K6i8F1OzEnMtZg1Oo6sCAPyF/UwYG6K0=
=7oNh
-----END PGP SIGNATURE-----

--isrtrbl7wjbvke3j--
