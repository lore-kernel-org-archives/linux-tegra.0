From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: PCIe: Provide 3.3V supply voltage
Date: Fri, 17 Feb 2012 20:16:05 +0100
Message-ID: <20120217191605.GA11127@avionic-0098.adnet.avionic-design.de>
References: <1329493468-7741-1-git-send-email-thierry.reding@avionic-design.de>
 <20120217163931.GB961@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120217163931.GB961-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Mark Brown wrote:
> On Fri, Feb 17, 2012 at 04:44:28PM +0100, Thierry Reding wrote:
>=20
> > +	err =3D regulator_set_voltage(regulator, 3300000, 3300000);
> > +	if (err < 0)
> > +		goto err_put;
> > +
>=20
> This is a bit weird, why is this not just set by constraints?

I guess because I didn't know any better. I don't have access to the hardwa=
re
right now, so it'll have to wait until Monday. I'll follow up with a patch
after I've verified that setting via constraints works.

Thierry

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk8+p3UACgkQZ+BJyKLjJp8ZhwCgmbwQWck8m5c2FPAHdqX0d2X7
yWsAn2EHzwRaqGE5wcF6SeQMgshn1AiV
=nkmG
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
