From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/4] pinctrl: Add NVIDIA Tegra XUSB pad controller
 support
Date: Tue, 17 Jun 2014 14:09:00 +0200
Message-ID: <20140617120859.GC18816@ulmo>
References: <1402930623-28886-1-git-send-email-thierry.reding@gmail.com>
 <1402930623-28886-2-git-send-email-thierry.reding@gmail.com>
 <53A02479.8080405@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53A02479.8080405-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2014 at 02:20:25PM +0300, Mikko Perttunen wrote:
> This v3 breaks SATA; see below
>=20
> On 16/06/14 17:57, Thierry Reding wrote:
> ...
> >+                       regval =3D padctl_readl(padctl, lane->offset);
> >+
> >+                       if (!value)
> >+                               regval &=3D ~lane->iddq;
> >+                       else
> >+                               regval |=3D lane->iddq;
> >+
> >+                       padctl_writel(padctl, regval, lane->offset);
> ...
>=20
> The bits at at lane->iddq are actually IDDQ_DISABLE bits, so this is the
> wrong way around: having iddq =3D <0> in device tree leads to the device
> turning off. So either the DT property should be renamed or the branches =
of
> the if here should be switched around.

Indeed, s/!value/value/ in the above fixes this. I've sent a v4 with
that fix and changes to address Stephen's comments regarding the
#address-cells and #size-cells properties.

Thanks,
Thierry

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJToC/bAAoJEN0jrNd/PrOhRLgP/0PDhSKTyQwRRlVFKGhUDzbt
Hukc+CTNC5U4M67succ17BJFK41dyZsygJAavnkNfLIenDFB2HrOpgtxbB47EQiv
lf9V4tfcu49gSqlAuTpla3OsR7hxJl/bRDruLxl4KpSclbiej/gOlCbLPn1uPVFR
Q8ycqckVVAgORs76xaA1PAXjfaqRxUPEcVVI7RC+yYlz5X7AaPYdL/JUxGDYj7Js
saTJ+dFvEd46VjAS1vqDcf0kaf5dxFtp8uysZB5/AsgwZsvisWHRRhzTdbCwOH0I
sACVDIeTHixrO9rlYktPqJRwquJH1UEazJcL+4tU1ii68K3bufzCtW5AUHoaRXvW
jQ6CK3551xX6mSv9E0iYpmaVvsi3Xv5pa35EZAoxqIsu6rD6n+7u69UBtvLfyXEb
Ka7mq63BScuaIU4gHblgyT1k7fQxGpKRdYsExojlAtLF3RJXkHgVsEAf7F71ruXq
fizCpxKaXPGYOKT1Zty9bpfmFGRtLTSfxnmorO1D6a9yCYqXrP2m163QwhzjNtpD
ZQtV29y1pdRUfcTTD5+bfplqupVVI11mvIsbrdk4UQU2wEEHuiogb66aXYbO8Qdu
HvCedrjaN4CX+FqIovMGCW4lTf4+ek8pg8bLT5P5je2YLMAaqa2mMJhpJbEmdaly
QCfyqZk+k7/sGN0mjw01
=Bac7
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
