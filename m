From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: tegra20: Rename USB UTMI parameters
 according to new definitions
Date: Thu, 27 Jun 2013 09:50:07 +0300
Message-ID: <20130627065006.GJ15455@arwen.pp.htv.fi>
References: <1372247927-28470-1-git-send-email-mperttunen@nvidia.com>
 <51CB289A.2070506@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lYetfuAxy9ic4HK3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51CB289A.2070506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--lYetfuAxy9ic4HK3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2013 at 11:44:58AM -0600, Stephen Warren wrote:
> On 06/26/2013 05:58 AM, Mikko Perttunen wrote:
> > Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Damn. I thought that Venu had converted the *.dts files completely to
> match the new binding definition in the last series he sent. I guess he
> missed these because the driver doesn't use them yet and he wasn't
> paying attention. Grrr.
>=20
> So, this change is fine (modulo missing description as Felipe pointed
> out), but will again mean that the USB tree needs to take some Tegra
> *.dts changes:-( I don't expect this will cause any conflicts, so it
> probably won't require any cross-subsystem merge, but it'd be best to
> apply all these Tegra changes in a separate topic branch just in case...
>=20
> Felipe, let me know if you want me to actually do the patch application
> for that topic branch to save you the hassle.

if it works for you, then I just merge your branch, cheers.

--=20
balbi

--lYetfuAxy9ic4HK3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRy+CeAAoJEIaOsuA1yqREgjIQAJ9kG/0zcI+vXBd0kZ44S0XD
LmTE+J8sG56y1mv1a0qoSxu2jc5YuK9Kpjm5DgJf9SkG0msIXJwFiJ75u+658oxM
ZjsxvG6dr0jO+WUGc9WA/mEtpG07oTRUjRI7PfmoWNMavPkxNYC8IHwgBs+MTtTN
1hl80QFSNwEnsBtC0kaBpquAn6q0GMSfzHyBVhO91JchtrQz6BTooMDo17U+WLkP
R6uUWF1/TwvP4BjO+TS2m8Yn2+VTk1qMFC2xx89KRXtLymEB3EqfEsXvGnRM8UVi
c7mcsb2AW8ftS5aPO7UhdQQw/chnDSU+dJCSD4Vxle6nE1OSVpsmB3GhjWWCf5+8
zq8mT0f7rPL2vYuUaSIkJdJLFrdaF9Rev5aEhQO05biO2pXuAdxJCoM7yfBsS2bh
VGSTX9szqJI79FgbqpMP7rJpSw+lm7HlenYnGZPQ0uNG6an/v4MDSPwSweJY9m/E
hXQSTjmqVfW4K04c+xfRYfA+OrZjBuS0IAr1O1e8W/6lf5tjhWb/6hCHQaPZZDCG
2fe0DuouHRE2GZEqV6l7kqvDaQZwGMAlLedyyJSUnOCwlkFFOKcvvTcKXjSf84Am
cvpZLrn3ktkdu+zZlu62Gc1OAeu1wuxwfx+uy5wsWYm13zIB3L562o2HZL5AD+Dt
bgdGWAvV5n6Fv0dBQUhk
=OOp0
-----END PGP SIGNATURE-----

--lYetfuAxy9ic4HK3--
