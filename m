From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/4] of: Add NVIDIA Tegra XUSB pad controller binding
Date: Thu, 19 Jun 2014 13:39:21 +0200
Message-ID: <20140619113919.GA28111@ulmo>
References: <1403006877-19850-1-git-send-email-thierry.reding@gmail.com>
 <53A06BD6.40608@wwwdotorg.org>
 <53A164E2.7050407@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53A164E2.7050407-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2014 at 01:07:30PM +0300, Mikko Perttunen wrote:
> On 17/06/14 19:24, Stephen Warren wrote:
> >On 06/17/2014 06:07 AM, Thierry Reding wrote:
> >>From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >>This patch adds the device tree binding documentation for the XUSB pad
> >>controller found on NVIDIA Tegra SoCs. It exposes both pinmuxing and PHY
> >>capabilities.
> >
> >Thanks. I'll wait for a Tested-by from Mikko and an Acked-by from Linus
> >before taking this series.
> >
>=20
> With or without negation added to group_get (see reply to 2/4), the serie=
s:
>=20
> Tested-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks. I just sent out another series which addresses the missing
negation in group_get() and the missing BIT() around lane->iddq in
various places as discussed on IRC.

I've also added debugfs support which helps verifying that group_get()
now behaves properly.

Thierry

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTosvnAAoJEN0jrNd/PrOh8wMQAJVPAF8yzxuiezVk5c8NmNJt
D1+raqSzLPjY3MnAtVN0m+y41KkOUizdgE5ZQF+sbuh9kfbhOVX5T8f0B4KbMv9Y
vYwkuD5XZuehj3nPvw1Cl6Bjly7/iq574cqzPMOw63JqPS3mEg4u+SQw/zxKFJnT
I+RYSx5xaKNyuGKsPgOj4Ne10YW86pDsurxmTH6VaKTnrwGmdSYl/NUnLgRtju7n
Gxi4oXLJ0maa/zMP6Qu4L8zlnjZpXExaIMkfqjRiG+cVzl6d2qCYbsLUeg87iMSx
3+8emdDwKFZiNZ3p+LGYLkznHCrYqpFNW7sU4ZklI8w54Ynsrmg1k9MNIYMK4bJq
Yfy1ai3W9mW61thzvLce0uOpaaJkkJX1S6NeWBxWewA1pN3qUR8nVElWyCLiKfLr
qoJxQSeJw3EsNRqTU/u6YM7pdsBtgcs4IpC0G+5GRI+KxBPheOuG5Hwtf8RIDpLF
V/EpPO4IfNFiuvhswoE9XaBRVb5dGzFllZulewLC4G8QX2JD4WsOWh2k6i4K+5XS
ar6zwAKJ19ZOnpowmdA4dCuvkbB9oPiGlmsPiyTn8HrAe07odnYN42XEhvMhE4cQ
8pwyYNlc9135vQuKjuWfDm19qLv3Jz0WppiRTGWmjCu1+proIjslVMhv5Dm9Fpmo
lwPKJSnrk4WZH2I2KGLr
=BW/H
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
