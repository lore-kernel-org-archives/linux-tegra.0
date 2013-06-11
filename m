From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] mfd: tps6586x: correct device name of the regulator
 cell
Date: Tue, 11 Jun 2013 13:00:08 +0100
Message-ID: <20130611120008.GB1403@sirena.org.uk>
References: <89e4451e14f324d8bd480f843fa5960b481e3188.1370894247.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vgqGEEhIUeLzQgKp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <89e4451e14f324d8bd480f843fa5960b481e3188.1370894247.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vgqGEEhIUeLzQgKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 10, 2013 at 10:27:55PM +0200, Marc Dietrich wrote:
> Change the device name of the regulator function to the one chosen for
> MODULE_ALIAS. This fixes kernel auto-module loading for the regulator function.

Applied, thanks.

--vgqGEEhIUeLzQgKp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRtxFFAAoJELSic+t+oim9SlEP/RPXlNluJ1tZFbgDrHusaEBD
9WNecvzDdFf0Vfxp1Bdxk9rGtjHLVW1vymHlKWQo5HkJx+mIsnvC1koNZwtc/jHG
1najWdJCFe9T0O5qk5wKG8ioBjFbn3iyOCAq3/ICu1JwTaXZGxf2AXJoaI/dMlee
fQSqFCDbMg9PfbwWdwp1V/mk4wfyJCGRjhfNGcBjEKcTb23mPn+59HhgEQ+ztbNy
UnmrpfNrNzxlg3sk8sEWN8VaV8JIbhNtwRKhyyGc0V/TIbxO7BgOa21OC3oWw/37
fM/Nw+MP4wAuNO92V38nBp0D3tKjS53Yb/QvezNCrxqn7mz7fDK1apYMa2Hr7n7c
MOOOu8RL5DDMUNy1LrtOGPO0PL72XJUQOwmB2Am8Ik1D/vAyj5vgWtfr802v9GX1
hepYKiMz1jJxxT6G5HeojVcGMkf1q1Wuc0SOA0+b4JnYXX6whLmIKkMvOVIkUmUw
FVYBRTRyZlgdMxAKhcGbBJ0yYaT6+qQcTeqSxYfLThk3lz16x+4BNBQ2d4QrC4po
9jb9lxfVKm7asnMc7hP2D7RWzxhayoN+c5/yxmlkqFJxtwLFyMYTnHZ7YKG5sVoF
1MlX8rHpi7Smy4QC3wXASB90B7/UmnzH5IIIlsheNqerUZJruQUzw7GiDzl3Ci4W
Kcdzqrp9uhSfmc7y09Ol
=QLgh
-----END PGP SIGNATURE-----

--vgqGEEhIUeLzQgKp--
