From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regmap: Support for caching in reg_raw_write()
Date: Fri, 10 Feb 2012 12:14:05 +0000
Message-ID: <20120210121405.GD6472@opensource.wolfsonmicro.com>
References: <1328873572-12603-1-git-send-email-ldewangan@nvidia.com>
 <4F350716.9050407@metafoo.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0IvGJv3f9h+YhkrH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F350716.9050407-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0IvGJv3f9h+YhkrH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2012 at 01:01:26PM +0100, Lars-Peter Clausen wrote:

> In my opinion it makes more sense to introduce a regmap_bulk_write functi=
on
> for this. regmap_raw_write was not really meant to write registers but

This isn't exclusive to that, I think Laxman planned to send a patch
doing that on top of this one which would be what most users would end
up using.

> rather binary blobs, like firmware. Also this keeps things consistent with
> the read part of the regmap API.

See the previous discussion on this in the past day or so - bulk_write()
is more complicated to implement by itself since it's going to end up
boling down to a raw_write() internally anyway (as does reg_write()) and
it seems nicer to just do the right thing if people ask for it. =20

We can always refactor later to improve performance if needed but this
is a simple starting point.

--0IvGJv3f9h+YhkrH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPNQoFAAoJEBus8iNuMP3d/0gP/jz2KslCF75bxKOm8R6Bg/JF
cs70zNJVOvUPLhVNcSTtKZ1GVl6qT3tqCVnXilnT/bFASsUGa9ngxZkB6VBiu8RP
1rZjwFDGkz9D0RAR7LcKNVASSSE6ACkHFrYHien54/riAkp8pzY98HvSMy2x4bk/
CCe+jZQCKsDOOy/UAEwo0bXkB1uUtkOUbFrlJh8goj3kVMObQGerJK88qCgq2zn1
BtzuvoHy4B6CwG0Z9BBlx7uXxtmJx633CvPAdBSfd73OmWlHOWeyW+DZejb2tKEz
oI8mNFBaSzNVKaM9+TIxCaT0u7lC19Qxap5/CRSiDeukb3fAxPDl0n/TQEkYD878
h+zm7wu4am1l64cYbJmJI9f27mXeEBBX1S8G5cjMT+XoHShA6zRnel7UDHtZeDQ8
lEvif526Vhn7qDyIdYntEkOKrLlk5iXNexK31s0N72FsO0jm91Oiz85/hWhKs019
1p15rKXB6FO639f43Ah3YB3oIoir0IHLtRWROAtEeb4BBufSg+LbMIbtyfK26gb4
tdgQ93eQBfRpWftuxhpd2inA4HfENUWK3sgHyXnSXGki3tW3ad6ebRcMVZrRtYBK
3vVCnAu/UrFWvHqQp2KxnWymPOh28nnwBQRUeESJL3RrgfnnuDCHTqdIM3sp0JUY
pYJStqLnid0wYZ15sf6z
=YBW6
-----END PGP SIGNATURE-----

--0IvGJv3f9h+YhkrH--
