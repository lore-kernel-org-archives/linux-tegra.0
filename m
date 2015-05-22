From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] tegra: dpaux: pinctrl proposal
Date: Fri, 22 May 2015 16:37:08 +0200
Message-ID: <20150522143706.GA19922@ulmo.nvidia.com>
References: <1431963229-12867-1-git-send-email-jonathanh@nvidia.com>
 <20150519144654.GG26748@ulmo.nvidia.com>
 <555C901F.8090009@nvidia.com>
 <20150520154022.GB7734@ulmo.nvidia.com>
 <555CAE47.6070907@nvidia.com>
 <555CDC82.1010104@wwwdotorg.org>
 <555DD7B3.6020608@nvidia.com>
 <20150521140356.GA28021@ulmo.nvidia.com>
 <CACRpkdYP5FN=4_pWxc1j=e_JfcjA3bXCPDRmZYHeiZ8HDyEaEQ@mail.gmail.com>
 <555F1E3E.7040500@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <555F1E3E.7040500-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2015 at 01:17:02PM +0100, Jon Hunter wrote:
>=20
> On 22/05/15 08:03, Linus Walleij wrote:
> > On Thu, May 21, 2015 at 4:03 PM, Thierry Reding
> > <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >=20
> >>>> I don't see any conceptual reason why the driver that binds to that =
node
> >>>> can't register as both a pinctrl driver plus anything else it needs =
to.
> > (...)
> >>> Looking at it there should not be a problem here with regard to the
> >>> driver_data member of the device struct and so I don't see why the
> >>> tegra_dpaux_probe() could not call pinctrl_register() to register the
> >>> device.
> >>
> >> Yes, I think that'd be the best solution.
> >=20
> > I'm pretty much ready to go to any compromises to get DRM/GPU
> > drivers to use internal kernel subsystems. The tendency there
> > is to reimplement all kernel driver frameworks and hammer registers
> > they need to access.
>=20
> Thanks Linus, but after looking at this further I don't think this
> approach will work after all. In order to call pinctrl_register() from
> outside the pinctrl directory, also means exposing the pinctrl_dev and
> pinctrl_desc structures and so this will get messy. Or at least a bigger
> churn than I would have hoped for.

It's not that much churn, is it? The structure definitions could be
moved to include/linux/pinctrl/machine.h. That's included by core.h in
drivers/pinctrl anyway, so that should really be all there is to it.

> Thierry, what if we add a drivers/pinctrl/pinctrl-tegra-dpaux.c and then
> simply call platform_device_register_data() from tegra_dpaux_probe() to
> register the device? I could still use the parent of_node to match the
> platform data for the dpaux pin controller.

That'd work for me too. But if that's what it comes down to, I don't see
a need to go through the driver model. Why not simply expose a simple
set of functions to setup and tear down the pinctrl that the DPAUX
driver can call?

I'd still clearly prefer to have the pinctrl code live directly in the
DPAUX driver, so I think we should at least give that a shot.

Thierry

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVXz8PAAoJEN0jrNd/PrOh/zMP/2XpnaLJ3s7r0YJt+GjZzApE
cLv1Xg0sMrtQH9p8TyEq95Lsx3ym1p/DoL3HoVM5jA2rvh0nsVFwPkll7i1Ko8kJ
QOUfm3+wBYD/kk5ldQTVLt9EXu0fPRUEQXwfHgRnv5l6Pz2lRIyiTuJMAZL2/V5f
2dnojBBUI7YVaGwfLZT6S7IqXkrN0M62r/y2oxSArRNFY7j+wRYsaAP2Jly+7gdm
6F1LGp90m1Zm8dXzwwpI3dilFd+zv6Lv3DgCZ/A9i5Bqq6xJ2bcC0qG+Ld/y1kIw
Zg4DetFpfnPPDfIjM24cHNvpfVoDXarhFnnWZZ4beG7n0VlzqMqlLz9A7vv1uVXF
UBRgMUlxLHQjFefPCq25Z23X3V1VhZ4KPUBBWE6VfIYg4s1RWmyLaSnaZs2CjHHq
QvhS68PjiI/3rKgQ/xoK6QcrlNEbV1CnIcGNOhA/JrQ41DEKWHFy3egLI/4wsXBP
6gUnm32XMjeDRl5k7WCsc7z1RyD+2e2G54xVl+jTJJtOcCkqHdapMPRiLg40rwgB
94sIL9hvY92l/hZB6XsNGylFCB6mle4Uqbt6gmHzjyOFY6pXrYtcjg1yuFluuMhb
VppOL1w9vVvKNa71QemHoUcUwtJ+6E4nwYx2lzaFZUX3VhiKd3GvqeaaF0yWywIg
8rYMhxUFSieitK5Zj14V
=70FS
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
