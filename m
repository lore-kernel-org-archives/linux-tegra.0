From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: USB-related build errors on Tegra in next-20130319
Date: Wed, 20 Mar 2013 18:45:53 +0200
Message-ID: <20130320164553.GL1567@arwen.pp.htv.fi>
References: <51489251.5040504@wwwdotorg.org>
 <20130320122031.GI29659@arwen.pp.htv.fi>
 <5149E62F.9090705@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S6vg04ofUPzW4qJg"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5149E62F.9090705-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--S6vg04ofUPzW4qJg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 20, 2013 at 10:39:11AM -0600, Stephen Warren wrote:
> On 03/20/2013 06:20 AM, Felipe Balbi wrote:
> > Hi,
> >=20
> > On Tue, Mar 19, 2013 at 10:29:05AM -0600, Stephen Warren wrote:
> >> I see the following Kconfig warnings in next-20130319:
> >>=20
> >>> warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects
> >>> USB_ULPI which has unmet direct dependencies (USB_SUPPORT &&
> >>> USB_PHY && ARM) warning: (ARCH_TEGRA_2x_SOC &&
> >>> ARCH_TEGRA_3x_SOC) selects USB_ULPI_VIEWPORT which has unmet
> >>> direct dependencies (USB_SUPPORT && USB_PHY && USB_ULPI)=20
> >>> include/config/auto.conf:624:warning: override:
> >>> ARCH_MULTIPLATFORM changes choice state warning:
> >>> (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI which
> >>> has unmet direct dependencies (USB_SUPPORT && USB_PHY && ARM)=20
> >>> warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects
> >>> USB_ULPI_VIEWPORT which has unmet direct dependencies
> >>> (USB_SUPPORT && USB_PHY && USB_ULPI)
> >>=20
> >> Which I believe are the cause of the following build errors:
> >>=20
> >>> drivers/built-in.o: In function `controller_resume':=20
> >>> drivers/usb/host/ehci-tegra.c:556: undefined reference to
> >>> `tegra_usb_phy_preresume' drivers/usb/host/ehci-tegra.c:479:
> >>> undefined reference to `tegra_ehci_phy_restore_start'=20
> >>> drivers/usb/host/ehci-tegra.c:551: undefined reference to
> >>> `tegra_ehci_phy_restore_end' drivers/usb/host/ehci-tegra.c:546:
> >>> undefined reference to `tegra_ehci_phy_restore_end'=20
> >>> drivers/built-in.o: In function `tegra_ehci_probe':=20
> >>> drivers/usb/host/ehci-tegra.c:734: undefined reference to
> >>> `tegra_usb_phy_open' drivers/built-in.o: In function
> >>> `tegra_ehci_hub_control': drivers/usb/host/ehci-tegra.c:162:
> >>> undefined reference to `tegra_usb_phy_postresume'=20
> >>> drivers/usb/host/ehci-tegra.c:215: undefined reference to
> >>> `tegra_usb_phy_preresume' make: *** [vmlinux] Error 1
> >>=20
> >> I pointed out at least the Kconfig problems when you posted the
> >> PHY error handling cleanup series, so I'm not sure why those
> >> patches were applied.
> >=20
> > Because tegra EHCI shouldn't be selecting the PHY and you didn't
> > even have a proper PHY driver. Try patch below:
>=20
> I understand that, but applying the patches without that resolved
> still seems wrong. Just because something is currently sub-optimal
> doesn't mean it should get broken.
>=20
> The patch you gave fixes the Kconfig warnings, but not the build failure.
>=20
> The issue is that: tegra_defconfig enables CONFIG_USB_EHCI_TEGRA, but
> not CONFIG_USB_PHY since it's new. ehci-tegra.c directly calls
> functions exported by phy-tegra-usb.c. However, phy-tegra-usb.c
> doesn't get built, since drivers/usb/Makefile adds phy/ to
> obj-$(CONFIG_USB_PHY), so doesn't end up "recursing" into the
> sub-directory at all. drivers/usb/phy/Makefile contains:
> obj-$(CONFIG_USB_EHCI_TEGRA)+=3D phy-tegra-usb.o which used to couple
> the two builds together, in the absence of this new change that limits
> the building of phy/.
>=20
> For now, I think the correct solution is to have USB_EHCI_TEGRA select
> USB_PHY. I validated that solves the build problem, and has the bonus
> of not needing any changes to tegra_defconfig.
>
> In the series that converts phy-usb-tegra.c to a real driver, we can
> give it its own Kconfig option, and have USB_EHCI_TEGRA depend on
> that, if you want. We'll then also need to take a patch through the
> Tegra tree to update tegra_defconfig.

Alright, do you want to send that patch ? My bad that I missed that
build error...

--=20
balbi

--S6vg04ofUPzW4qJg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRSefBAAoJEIaOsuA1yqREgrYQAIghUS1rLjI5CW9oR8jyf+W4
iXJf1RZ+nahJYH0+PeTC1MjU8HyExs2cj+k4GWACDJPXTy+Qmz4X7B/04PKxnKl+
VftP9mH0miEQFZtn6jJN7sG8kF8qCchckh4vJrXMuSgyPfms7D4OSyV6eDqLj3+8
4QARLENqdg8/x5ZjlC3oiQW4ZpY1JoVxErnM5jKJXRZZECrCsqFtH9rATSWkZ1Yh
pXqjCMNNVy/cMGwHMi7Ujvg5SGqGGHt/54v45vt/RNZwLqlIPlbDBcbEWKxYwH8P
eMCBmmJl9l0rtYNiqCxIEs6tI5yF4QJBdx5MsB4X9imuFa0Ls/NKZ9jRoyJZtTqp
JZDtelRv+fHRms6NDGmJKzn6nhLGcQBTOheExJ8raGwKUGZoHuABDdk5JU42COO1
fh9swy5IjsQZVJaeuFUDizSDrhjMY58Si02fZe5AFCuhqbYdWtaQ9836kGXn23St
Ul2sJNPXd+NN1AKv1aqCU2K3ruxSlKuAONi3eUl4ipQpbqLFgP/wrQe2PE0X2ukA
7eumA/UhxjElzk2Q+eb0ypLI/m9i2BIgK4l2ol0mkMCcZTrYqjnA/iNH6YtVK9O4
myXEvhZmKEq4RmxLm/ACsz/HGyuy4H8acybHByvyoZT+JVt7wluz1bzTER3KYQal
jz8w/HQ+3Ia5i2rVPxBN
=zn9C
-----END PGP SIGNATURE-----

--S6vg04ofUPzW4qJg--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
