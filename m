From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/9] ARM: tegra: Add host1x, DC and HDMI to Tegra114
 device tree
Date: Tue, 8 Oct 2013 13:04:05 +0200
Message-ID: <20131008110404.GF19633@ulmo.nvidia.com>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com>
 <1381146528-18069-5-git-send-email-treding@nvidia.com>
 <52532546.1010506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pql/uPZNXIm1JCle"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52532546.1010506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Pql/uPZNXIm1JCle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2013 at 03:19:02PM -0600, Stephen Warren wrote:
> On 10/07/2013 05:48 AM, Thierry Reding wrote:
> > From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Add host1x, DC (display controller) and HDMI devices to Tegra114
> > device tree.
>=20
> > diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra1=
14.dtsi
>=20
> > +		dc@54200000 {
> > +			compatible =3D "nvidia,tegra114-dc", "nvidia,tegra20-dc";
>=20
> Is the HW really 100% backwards-compatible, such that any driver that
> only knew about the Tegra20 HW could work unmodified on Tegra114?
> Perhaps that's possible, since your large driver patch doesn't seem to
> have a patch to add Tegra114 DC support...

AFAIK the DC hasn't changed since Tegra20. Or at least not significantly
enough that it doesn't work with the generic driver. There might be more
features, but nothing backwards incompatible.

Thierry

--Pql/uPZNXIm1JCle
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSU+akAAoJEN0jrNd/PrOhAygP/2plbC5F6z47dUBVg58gzdqS
Es0lE4keVxVR2uzCocIUPCP2/42aglP+xlQi0xCaMTVlKEZw0F8CUnO09S5IfYS4
kXkyI5S8TuDIMjFfUY8LPo7wA1byB6wifJrdqzdnX3YPjexnw1Ry1aD7PopcV3xk
EuW07eKh7npDyASdRsqnHrCiZvumit/rAEcuTQFhf9wBS9JoTsJ4iB+BU0yv3b53
8dSR13b+C8AjUnAlqsJdtirifjtvYnmgbAUX6XjA1xvIJsygAyKTL5s0ZCiYPL2x
iZeKnimaD6m5VzQvFd/kXvjwaTdmNjCszZvLYt+Pgn8mazIWUcYNEBkBz0T30edM
9VplLK3u794FRHm52JnFDik4YmJGAXbCI0Sf95anV8RpN1oN2I8SvpEx39CbnB0/
BoKaxdxqBFbAtYtJsm9vLB3zKf2w4Va4ZdCEcIgY4kEqNvOsYjmpYfQ76lY7isOS
3OTlQJ9xnMkrXXM9UfTHiqPCxnrm8wa+/kTLv0Qx/MuDvtdbkEG0uX4sKKT40f7U
onVECg8n457MDs1gB/0UB1DxVwqInlyEWVqEEd68xbw9VnoA6psUamdG/TD/ZOFH
m8pCKzCgcDDVn9PiOjJfOmGYPdhzNzpkAQZ/TI35GaKXjb08dxOBgYG1g+94SyVj
DdSUv4JxUBDr3p0JRovO
=O7K0
-----END PGP SIGNATURE-----

--Pql/uPZNXIm1JCle--
