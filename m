From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Reboot hangs on Jetson TX1
Date: Mon, 2 Jan 2017 18:08:43 +0100
Message-ID: <20170102170843.GC18393@ulmo.ba.sec>
References: <20161218042716.GA7344@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161218042716.GA7344-IRMp5PtgtdoigzW5ZibpNwC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 17, 2016 at 08:27:16PM -0800, Martin Michlmayr wrote:
> Reboot hangs on the Jetson TX1 developer kit.  This is with mainline
> u-boot and mainline 4.9 (and before) using defconfig.
>=20
> The last line I see is:
>=20
> [   31.227974] kvm: exiting hardware virtualization
>=20
> and then it just hangs.
>=20
> poweroff doesn't work either.
>=20
> (The last line is kvm related but the problem has nothing to do with
> kvm.)

I can confirm that. Looks like communication with the PMIC isn't working
properly. I'll investigate.

Thanks,
Thierry

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlhqiRkACgkQ3SOs138+
s6HMLQ/5AWqEVcKRiE95ZCD0lRYRpnYCqAGmwOUBcpVUpAhF7TBt2eY+PZVE8+oL
dl1a2gHXzwfePBxKpMJRNBcxN2rtZWNWF9xeSO8vDVUq84idyAZsIQudoKNxF9mZ
VXQWssAeVR0BGb1RnHlzzNDWto+fvwLjsugYhvYsHQ4lLlQfqIVCBiD0M3ZhMsRX
6BHIVO8Dy0uLMpl52kP4T9TpQSRXwjan+TWnVgKxHInPCDOKWy0b7M+5kyMd7erb
w5GJMxjzRuR4Ft8jxP4ElOiwOykmsfUXy4sD7HDv5ou6dcnlfYnDzHoHXeAZ2aqr
sySnuMW5i/U42AdZ6Q7dzjOps5/uh6FhcbGrw2OCkynVaXaOSOQSrTVaP2nnw3Lj
dNawR64HmXUvTxEgq3TaLbva0do0n5FrE+6CEgKgo0+3H3QWMAYn2NPlTc79yoZD
nKyDzjOvsWznUDVW4Zzu+M3r5rj2F8YCMXEI8WDSVpIRERSpuVVbhGhvO674+dSy
UAOyzvY56lRbKYVtOmUAdo9FRwH0YGvW8tQAdY3wM/FFTn/mNb9oCZmsQenhbXoF
VljoxhEkTvsQAP+8KizjdRRflhUqSGBriP5fCJ9CqQlrsLCfPj+8rVC8TVNbp91N
NcgEE3Ak/1O59KW3x1YrMBzJBc0+u+j2H3KHqWR9Nu6Z6LHAYQg=
=UFgA
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
