From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: Enable watchdog support for tegra114 and
 tegra124.
Date: Fri, 12 Feb 2016 18:28:10 +0100
Message-ID: <20160212172810.GB29081@ulmo>
References: <564AFE51.6060601@mblankhorst.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <564AFE51.6060601-FcfepWsj2zOByvU0x3ry2g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maarten Lankhorst <dev-FcfepWsj2zOByvU0x3ry2g@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2015 at 11:15:45AM +0100, Maarten Lankhorst wrote:
> This allows the watchdog timer to work on my tegra124.
>=20
> tegra_wdt specifies: compatible =3D "nvidia,tegra30-timer";
>=20
> But the dtsi was only setting tegra20-timer, fix this
> by adding tegra30-timer explicitly. This allows
> the watchdog to work on my Jetson TK1.
>=20
> Signed-off-by: Maarten Lankhorst <dev-FcfepWsj2zOByvU0x3ry2g@public.gmane.org>
> ---
> XXX: Should this be Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org to add the missing device =
on older kernels?

I've applied this with a slightly reworded commit message. I haven't
added a Cc: stable because I don't think this qualifies. There is no
regression that this fixes, or any bugs. It enables a feature, which
is useful, but doesn't need to go to stable in my opinion.

If you or anyone else feels strongly I can be convinced to add it,
though.

Thierry

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWvhYqAAoJEN0jrNd/PrOhwn0P/Rbv6joD11ozpX0xG2zYQzIl
sgKUnwdlGv4DV8Ube0cPsOBWmn7NWwpmHPdc52Ei3XrIGCo3zXXptA0xheNh6cnp
eP/4ncSAFjQhQQuFqmyFMpHyZoL1f00dB7D9n73wjcBqeweLlhrqsMbwLeAh3VS8
/wnH/vCsylm1t71cTWVv4TdMKGzMcAwUaNOv1tnL7Yfo3uYuYxeyuN8e/cFsLMpu
cTmOX2lCvZ3cwCEoih3yHMQSKH5V9Rl7K9rC0Vvc7nlPqNLgIxg/hiC5hDuRms8Z
KTTCYtP9V5M4k2Z1mtR3YviF5NmQI98GkDYcUuLP6k9xhvE9AXMnwpU71flSeVXb
AjBe9dBzQfgWvoJd+xzUdKpQPXyIxmRt7esMQzeFHu//+Ftrs8WIi8ivF/p2PRJL
Fm6T6br7MUBO2yBmllDbqKCli3v+IvDi8vNQjOMavOh1kfzykK9BQIfJD+6iyHb0
ymcrFINNOYZEXf0mr6CwwRJhDFVeTpbsUVrzY6Dwwnuc2tqek/fNWzjskZ7iCmwY
yEYD7CnbY3AK2W5vxpOjq3nsCW2AprSPXpoxXTK6HNItbJhO/fugnn3C3F4mIhfF
lZohsnuusC1HsYlaxeQTJa4bYw3NICsCwqCS9bYme3GI6VFHRAnaPi+nG3o0Ythh
fdqjkYno+NFgMu8Mibu7
=W0vs
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
