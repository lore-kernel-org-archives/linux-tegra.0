From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: add Acer Chromebook 13 device tree
Date: Wed, 20 Aug 2014 07:36:16 +0200
Message-ID: <20140820053614.GB13793@ulmo>
References: <1407957267-3258-1-git-send-email-dgreid@chromium.org>
 <53EF76CF.9050808@suse.de>
 <53F2255E.7090208@wwwdotorg.org>
 <CAL1qeaH-WfA-DLKwuXA_hBPHYuXksAibLq__zisrT9ALaRGdAw@mail.gmail.com>
 <53F28F90.3000004@wwwdotorg.org>
 <CAL1qeaFnfLDOXq07fY4xLfdRpG8FQ63ya+-0Hk+ewA1wXkLOLw@mail.gmail.com>
 <53F3C5FD.4050808@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53F3C5FD.4050808-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 03:47:41PM -0600, Stephen Warren wrote:
> On 08/18/2014 06:11 PM, Andrew Bresticker wrote:
> >On Mon, Aug 18, 2014 at 4:43 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> =
wrote:
> >>On 08/18/2014 05:24 PM, Andrew Bresticker wrote:
> >>>
> >>>On Mon, Aug 18, 2014 at 9:10 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> >>>wrote:
> >>>>
> >>>>On 08/16/2014 09:20 AM, Andreas F=C3=A4rber wrote:
> >>>>>
> >>>>>
> >>>>>Hi,
> >>>>>
> >>>>>Am 13.08.2014 21:14, schrieb Dylan Reid:
> >>>>>>
> >>>>>>
> >>>>>>The Acer Chromebook 13, codenamed Big, contains an NVIDIA tegra124
> >>>>>>processor and is similar to the Venice2 reference platform.
> >>>>>>
> >>>>>>The keyboard, USB 2, audio, HDMI, sdcard, and emmc have been tested
> >>>>>>and work on the 1266x768 models.  The HD models haven't yet been
> >>>>>>tested.
> >>>>>>
> >>>>>>WiFi does not work yet, it needs at least some PMIC changes to enab=
le
> >>>>>>the 32k clock.
> >>>>>>
> >>>>>>The elan trackpad is not yet functional but hopefully will be soon =
as
> >>>>>>there are patches under review.
> >>>>>>
> >>>>>>There is also an issue on reboot because the TPM isn't reset.  It w=
ill
> >>>>>>cause the stock firmware to enter recovery mode.  This can be worked
> >>>>>>around by an EC-reset, press the refresh and power keys at the same
> >>>>>>time.
> >>>>
> >>>>
> >>>>
> >>>>>>diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts
> >>>>>>b/arch/arm/boot/dts/tegra124-nyan-big.dts
> >>>>>>new file mode 100644
> >>>>>>index 0000000..79f1852
> >>>>>>--- /dev/null
> >>>>>>+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
> >>>>>>@@ -0,0 +1,1136 @@
> >>>>>>+/dts-v1/;
> >>>>>>+
> >>>>>>+#include <dt-bindings/input/input.h>
> >>>>>>+#include "tegra124.dtsi"
> >>>>>>+
> >>>>>>+/ {
> >>>>>>+       model =3D "Acer Chromebook 13";
> >>>>>>+       compatible =3D "google,nyan-big", "nvidia,tegra124";
> >>>>>
> >>>>>
> >>>>>
> >>>>>In light of v1 and the above commit message referring to this as Goo=
gle
> >>>>>Big, shouldn't this be "google,big", "nvidia,tegra124" and optionally
> >>>>>"google,nyan" as secondary string, independent of the new file name?
> >>>>
> >>>>
> >>>>
> >>>>Despite this board having been derived from Nyan, it isn't Nyan, so I
> >>>>don't
> >>>>think Nyan should be part of any compatible value, nor a separate
> >>>>compatible
> >>>>value.
> >>>
> >>>
> >>>"google,nyan-big" is the compatible string that the bootloader on
> >>>these devices looks for.  It's also the convention we are now using
> >>>for our ARM devices, as Olof has already mentioned.
> >>
> >>I don't understand "that the bootloader looks for"; why is the bootload=
er
> >>doing anything w.r.t the compatible value in the DT that's passed to the
> >>kernel.
> >
> >The ChromeOS bootloader ("depthcharge") boots FIT images and selects
> >the appropriate device-tree from the image based on the compatible
> >string.  On Big boards, it looks for "google,nyan-big".  This only
> >becomes an issue if there are multiple device-trees in the FIT image.
> >If there's only a single configuration (or you chain-load U-Boot),
> >then the bootloader will boot with that configuration.  If you build a
> >kernel image in the ChromiumOS environment, however, you'll end up
> >with multiple device-trees (all those built by the kernel config at
> >least) in the FIT image - this is what allows us to boot the same
> >binary on different boards.
>=20
> This just makes me dislike FIT (and DT ABIs) even more, although I suppose
> the same issue would arise if the DTBs were stored in separate files and
> looked up by filename.
>=20
> I have to say this sucks, because it means that a downstream bootloader is
> imposing an ABI on the mainline kernel without a chance to fix things dur=
ing
> upstreaming. For all other boards, we've concentrated on mainline U-Boot =
as
> the bootloader precisely so that strange behaviour of our downstream prod=
uct
> kernels don't force the hand of the mainline kernel design.
>=20
> Still, I suppose I have no choice but to drop my objection here.

Do you? We reject things all the time if they're considered not good
enough during upstreaming. The whole DT ABI debate in fact explicitly
resulted in the decision not to take any of the downstream components
into consideration when upstreaming. ABI stability only counts for
things that we've supported in one of the final releases.

Thierry

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT9DPOAAoJEN0jrNd/PrOhRpwQAJfiLl5CcoqOAka7q+Uldy71
llJvPmOHyGv5LKs3GRo4dbqcOPXsfIZIebQRY2mpKAvjpXtcGpGo8HRNNix4eU7A
EUUymW8KXpRVvXubkFnp4dtGeSY0+4yIb2bHWeyFuZBmIAMjV9lUi28+Xtxi4Fat
27irFezMZh2kf40zpcBcn5K2n8ab8vXV2wEW0YjNQEL11CI3oNTw58MVhFW87015
wMt46i7pJXnH0kRJgQcb9YcHfKrsh2rMLwDt0NOUs4dUjz9EK99BI9x1p613UJfn
qdhhwvc7Etosrg43J3lb5fPuFfpwDJdgXfeiNn9/iOElUrXVB4OlkBqhQxVomkYr
qSjl+wmPom1et5PeUR1m8cF/gxqx5C5xsVwFLd5omPzKnJWCMqicgudbmGoNTouC
wnq4ZdRn8gi0RobyP9CgmlnMo5QkpzKurMRgAmK+g56dHQf7QIyVf7418PsE+fil
r1LfDNHWXxZn4saxEPj+C5ZG9aNKz71et/1DBtXD2/QKWCLe1xWAOBSszTW+WoEc
7kIa+OzmbqpHuz2VnzAvVvBoiIkptuxATwos8grPG76azDamps1ldZYCZuFS0WbS
rsFf1SdWIDsL/ZqnkrpaL7FaRr64VZPCB+mHtxAm76FR7pBR/VVKEHD3AmOd4Ljj
rd3jg7NNInHzGunXEd5V
=v9+i
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
