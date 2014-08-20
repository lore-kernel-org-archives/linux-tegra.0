From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: add Acer Chromebook 13 device tree
Date: Wed, 20 Aug 2014 17:25:08 +0200
Message-ID: <20140820152507.GA3427@ulmo>
References: <1407957267-3258-1-git-send-email-dgreid@chromium.org>
 <53EF76CF.9050808@suse.de>
 <53F2255E.7090208@wwwdotorg.org>
 <CAL1qeaH-WfA-DLKwuXA_hBPHYuXksAibLq__zisrT9ALaRGdAw@mail.gmail.com>
 <53F28F90.3000004@wwwdotorg.org>
 <CAL1qeaFnfLDOXq07fY4xLfdRpG8FQ63ya+-0Hk+ewA1wXkLOLw@mail.gmail.com>
 <53F3C5FD.4050808@wwwdotorg.org>
 <CAOesGMhDe0zFYkUWqBOTunK76wccdKOQ8b+EFAzeTr+oOUQyWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMhDe0zFYkUWqBOTunK76wccdKOQ8b+EFAzeTr+oOUQyWA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2014 at 06:37:48AM -0700, Olof Johansson wrote:
> On Tue, Aug 19, 2014 at 2:47 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> w=
rote:
> > On 08/18/2014 06:11 PM, Andrew Bresticker wrote:
> >>
> >> On Mon, Aug 18, 2014 at 4:43 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> >> wrote:
> >>>
> >>> On 08/18/2014 05:24 PM, Andrew Bresticker wrote:
> >>>>
> >>>>
> >>>> On Mon, Aug 18, 2014 at 9:10 AM, Stephen Warren <swarren@wwwdotorg.o=
rg>
> >>>> wrote:
> >>>>>
> >>>>>
> >>>>> On 08/16/2014 09:20 AM, Andreas F=C3=A4rber wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> Am 13.08.2014 21:14, schrieb Dylan Reid:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> The Acer Chromebook 13, codenamed Big, contains an NVIDIA tegra124
> >>>>>>> processor and is similar to the Venice2 reference platform.
> >>>>>>>
> >>>>>>> The keyboard, USB 2, audio, HDMI, sdcard, and emmc have been test=
ed
> >>>>>>> and work on the 1266x768 models.  The HD models haven't yet been
> >>>>>>> tested.
> >>>>>>>
> >>>>>>> WiFi does not work yet, it needs at least some PMIC changes to en=
able
> >>>>>>> the 32k clock.
> >>>>>>>
> >>>>>>> The elan trackpad is not yet functional but hopefully will be soo=
n as
> >>>>>>> there are patches under review.
> >>>>>>>
> >>>>>>> There is also an issue on reboot because the TPM isn't reset.  It
> >>>>>>> will
> >>>>>>> cause the stock firmware to enter recovery mode.  This can be wor=
ked
> >>>>>>> around by an EC-reset, press the refresh and power keys at the sa=
me
> >>>>>>> time.
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>>> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts
> >>>>>>> b/arch/arm/boot/dts/tegra124-nyan-big.dts
> >>>>>>> new file mode 100644
> >>>>>>> index 0000000..79f1852
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
> >>>>>>> @@ -0,0 +1,1136 @@
> >>>>>>> +/dts-v1/;
> >>>>>>> +
> >>>>>>> +#include <dt-bindings/input/input.h>
> >>>>>>> +#include "tegra124.dtsi"
> >>>>>>> +
> >>>>>>> +/ {
> >>>>>>> +       model =3D "Acer Chromebook 13";
> >>>>>>> +       compatible =3D "google,nyan-big", "nvidia,tegra124";
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> In light of v1 and the above commit message referring to this as
> >>>>>> Google
> >>>>>> Big, shouldn't this be "google,big", "nvidia,tegra124" and optiona=
lly
> >>>>>> "google,nyan" as secondary string, independent of the new file nam=
e?
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>> Despite this board having been derived from Nyan, it isn't Nyan, so=
 I
> >>>>> don't
> >>>>> think Nyan should be part of any compatible value, nor a separate
> >>>>> compatible
> >>>>> value.
> >>>>
> >>>>
> >>>>
> >>>> "google,nyan-big" is the compatible string that the bootloader on
> >>>> these devices looks for.  It's also the convention we are now using
> >>>> for our ARM devices, as Olof has already mentioned.
> >>>
> >>>
> >>> I don't understand "that the bootloader looks for"; why is the bootlo=
ader
> >>> doing anything w.r.t the compatible value in the DT that's passed to =
the
> >>> kernel.
> >>
> >>
> >> The ChromeOS bootloader ("depthcharge") boots FIT images and selects
> >> the appropriate device-tree from the image based on the compatible
> >> string.  On Big boards, it looks for "google,nyan-big".  This only
> >> becomes an issue if there are multiple device-trees in the FIT image.
> >> If there's only a single configuration (or you chain-load U-Boot),
> >> then the bootloader will boot with that configuration.  If you build a
> >> kernel image in the ChromiumOS environment, however, you'll end up
> >> with multiple device-trees (all those built by the kernel config at
> >> least) in the FIT image - this is what allows us to boot the same
> >> binary on different boards.
> >
> >
> > This just makes me dislike FIT (and DT ABIs) even more, although I supp=
ose
> > the same issue would arise if the DTBs were stored in separate files and
> > looked up by filename.
>=20
> Yes, or stored in separate files and looked up by compatible field.
>=20
> Do you have a suggestion on a better way to solve it, btw? Definitely
> not one of those things we can fix retroactively, but if it works
> poorly for you upstream we'll consider improvements if we can for
> future products.
>=20
> I'm not a huge fan of fitImage myself, but it gets the work done.

It's been a long time since I've used FIT, but I seem to remember that
it was simply a device tree-based description of a file format. As such
couldn't you add an additional property to the configuration entry that
the bootloader could match on? That would avoid the need to parse an
embedded device tree and it might be useful to keep variants for the
same board in the same FIT image.

Perhaps you can explain a little more what the use-cases are. For
example how are people suppose to run an upstream kernel on one of these
Chromebooks? Do they completely replace one FIT image with another (and
in the process delete or rename the original one)? Or can they simply
add another FIT image that contains the kernel and DTB from upstream? Is
there a way to add new configurations to an existing FIT image? How does
dual-booting work? Does the user get a menu to choose a configuration
they want to boot if multiple entries are compatible with the detected
board?

Upstream U-Boot exports some variables (such as $soc and $board) to the
shell environment so that scripts can use them. What I usually end up
doing is put files (zImage, DTB, ...) in locations based on those names
so that I can boot all systems from the same SD card (or TFTP/NFS setup)
yet retain the possibility to update each of the files separately. Maybe
something like that could work for Chromebooks. If you locate files by
filename you become much less reliable on the content itself. Files
could be named tegra124-nyan-big.dtb even if the compatible was just
"google,big". The same goes for additional properties in FIT images.

Thierry

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT9L3TAAoJEN0jrNd/PrOh++IP/1zyJXhb+mTY6YDalpNwN52/
EAQlxFkbTiJ2d0edClVSwyAIV2MKUItPhiqPyVZ6gaF65QTn7KcEXmo6EkRj6AFS
zPmEodsE5/dIr/CxiBRSo8J1AupfOlI+QIsefSjUwhmkfzaNX3pK1YQF0GLtcOeU
5aArH1phAOTdCpeGfSEGt6fkrr0WvnEPjT0An8wBdjf+QsQNw+RR0xvamH1w4b6p
/LlD/8jQ8RQlW11dTuJ9p0R0cO3UtmJFNXTGpGLklJJNlgxzgf3v0H2QMB4RcTdG
o0GprGUqjvXdt2y9ZbeA1070r/hxiPNbD2O8ZwQIgXPA6+28zQWylE9RLXAFZudr
TzfsHEqxNy9jQEknK8kp5x0QF1CuKbF4Gl15N12C5+TRXb03DNHqdf1WQ6ChPLE7
gKKOR9Q+qhW4dlltdmnNHs1vnHvwNDg1RRjtfpKN8CUR4NivJ2X7WU8MnG4SKvoc
w1xjmrlKYnEnC4EEZ+tub9dVInNw5Vlo1YTzP7Vy/QwcSUOvoTktkXq/VAAcK1GC
DcMi+xpwrbBMvxWsbFj2F4bwrRLj/9nB+0NwrTTpTrsRElAuyrkMTh/yJETfeO5L
2+aSgArjonfkYYDH1/G4qTPvWC3YLUpPmjsLc4wYZ+4oVQuSdkeodXvMkrzIaE4T
1F6AlrkUauBDmoM38I0R
=RJE9
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
