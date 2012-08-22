From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Wed, 22 Aug 2012 12:33:09 +0200
Message-ID: <20120822103309.GB31448@avionic-0098.mockup.avionic-design.de>
References: <50323513.3090606@nvidia.com>
 <20120820131800.GA13785@avionic-0098.mockup.avionic-design.de>
 <1345527561.31608.152.camel@markz-desktop>
 <20120821054256.GA5325@avionic-0098.mockup.avionic-design.de>
 <1345529761.31608.169.camel@markz-desktop>
 <20120821145709.GA701@avionic-0098.mockup.avionic-design.de>
 <50349B58.4000809@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50349B58.4000809-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 22, 2012 at 11:42:00AM +0300, Terje Bergstr=C3=B6m wrote:
> On 21.08.2012 17:57, Thierry Reding wrote:
> > Finally the upload is done. You can find my latest work in the next
> > branch of the following repository:
> >=20
> > 	git://gitorious.org/linux-tegra-drm/linux-tegra-drm.git
> >=20
> > It's down to two patches and based on next-20120820. Eventually I was
> > going to maybe split it up a bit to separate at least the hunks for
> > arch/ (Stephen will probably want this anyway) and maybe also some
> > functionality like HDMI support.
>=20
> Hi,
>=20
> What's the purpose of the drm_clients list? I notice that the drivers
> register into that list, but I can't see how the list is used. I feel
> like I'm missing something.

This is used to determine when the DRM driver can be safely initialized.
Basically the host1x driver scans the DT for display controllers and
outputs and adds them to this list if they are available. When the
drivers for those device call host1x_register_client(), they'll be moved
to the drm_active list and once the the drm_clients list becomes empty,
the DRM driver is registered using the call to drm_soc_init().

> This patch ties all of the drivers to host1x. As not all host1x clients
> are going to be controlled via DRM, we need to eventually decouple
> these. I'm expecting the host1x hardware to controlled by nvhost driver,
> and tegradrm will just call nvhost when it needs host1x.

I'm not sure how this can be solved any better than the above. All the
drivers are inherently tied to host1x anyway. That's why I suggested
putting the host1x driver along with the DRM driver in the last version
of these patches so that we can get the initial support written. If the
functionality is required by other drivers we have two options, either
the API is exported from the DRM driver or the host1x driver is moved to
a more central location where other drivers can use it.

> I know it's a bit difficult to understand in concrete terms what I am
> after as long as I haven't been upload any code. The memory management
> is one obstacle that needs some code before nvhost is usable in upstream
> kernel, and lack of device tree support is another.

That's precisely why I think it's better to get going with the DRM part
and keep the tight coupling for now. If needed it can always be split
off at a later point in time should the need arise.

Thierry

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQNLVlAAoJEN0jrNd/PrOh16oP/1jesCmPr6JClb3avI5iWTWU
hcPYQLWWQSfTkavsz323VHI7p9aXzyXZHMSuj1+7MiIPUr/xkSB91jdzEx0Du04M
XkmZd5gDV9AgcO7C+X4KbWGHP/SmfcLO08eL1dBaR0hKZ3HLWuCeMcpnvxujvU9O
HhQCrkNiDtTc9nUur90366dnI65QwI6hGYteJ/Itzn0rKLNZ1+WCn7FrjVppdtAV
58gZEmGhckXQs8XGXf+a0zlch+ccgnB4FF8exnLHHaU/5zjBtoD4gW3VKJp+F9RO
P+Ra+NPfhnBZwsakvJnOjdhQIwqV221i9Kvl+y+/Z8eK9BWevoflpYkRfu6Gkrx+
4qnFsUGELSpC0br9vvjGKafiUpLiFhxomSv/Ecns4zACd+gBHnUQuLnf6BxohY5y
NMJWNdKsPreFSLVlgEXxWAJ0hfORcfHg1kmdy5nWyPCCq4s261NfwYy9ik/aRqkG
kgfXE20HuCFllQoJrI5DGpLY8/oV3OunsVjq3H5cuBawqAlvvy/FTNyQc02q7+TQ
ACeCZjmoLk6bVSGGMd9+Wp9MQ/ide3r0YExAlJHueDRGjpz8zMnB53fWe1laBlKP
kRLHQVfprv11zpf6/exVQK/LAwDNOc68yqAHcAcQu100YimKsDLrQ5K/RMLf92A8
yV8iLGCwPeX/4ZlzKMs0
=Ga5f
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
