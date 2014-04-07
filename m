From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] gpu: host1x: handle the correct # of syncpt regs
Date: Mon, 7 Apr 2014 10:41:26 +0200
Message-ID: <20140407084124.GC25718@ulmo>
References: <1396650665-6992-1-git-send-email-swarren@wwwdotorg.org>
 <20140407081838.GB25718@ulmo>
 <5342630E.90908@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5342630E.90908-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2014 at 11:34:22AM +0300, Terje Bergstr=C3=B6m wrote:
> On 07.04.2014 11:18, Thierry Reding wrote:
> > If I understand correctly there's no immediate need for this to go to
> > stable kernels, nor for it to be queued for 3.15, right? That is the
> > potential extra write isn't causing any harm on actual hardware, is it?
> >=20
> > In that case I'll queue this up for 3.16.
>=20
> The reads and writes would get ignored on 32-bit kernel. The change does
> fix sync point behavior in 64-bit kernel, so it is fixing a real issue.

Okay, but given that we don't support any 64 bit Tegra hardware upstream
yet, 3.16 would still be enough, wouldn't it?

Thierry

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTQmS0AAoJEN0jrNd/PrOh95YP/iWYs6ZplInVYHZxkob1QkWL
X6y3IhYasKzBOWiwqr7lVGBB/t3OcchbneRNA0msvGjTe0LIWXA9kgbuvL2EU6Jw
+gZEQC8atT9JpleV0ciRwMXShalWMcp52Dnv7m0pjQL7uyGC7U41YlMmB5/gNXCQ
5IWK2MvEGLvWkNtzRC5DmI1T/pbX4oFx0Tjfmq5w36vJorDizT7ISi3HK8Xbui7v
gwa5t29xw6voqo+XlpJAJ207jjEnOnaaRIdmn6BpiEyOHsdxPoyB4gY4EPt2irIZ
LsZ+9dMB2SoZR4Ki1RIBQjQKo1sFoy/uKsk6/iP9fQ3zMfEBVli6RediDHkYxKvM
QlfZe2d4Hfh1g+YQwqX9NBFKQwSblPiS2AFUmHknomrmI8Hk1gNYY6bb89JpV0ji
10uTqIqoxHGHNi7GLHbGdXG0lu3dEOLf38Z1T3pWZWdQAe63Otmio28nQ07NBRlf
UnJiNMRCcrTppN1/+luEMoXsrb32iQFEdZZItWsmjr+Gg3dcxcKu8y0d6GAfp5TM
l7cwhy9UoqDFh/Uq2mm3lzA2uSutSsjyKUDIV6xdv/qx/2r3Ll1HxxSna93NFMIN
SK1gZajX9pK/Mg/E2qGxkrEpCaWQGw5EpPUS9+uDKEpyk4/zgfHw7picZXxLTBsE
LopNnlS6wuGlknPGqqpB
=D13s
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--
