From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: regression? no hdmi output on tegra124 (kernel 4.12)
Date: Sun, 09 Jul 2017 18:55:06 +0300
Message-ID: <1499615706.1355.1.camel@paulk.fr>
References: <CAHMsQjVGGF-QFzccok0--22DzOEspULSYRLt+0aatO-0=D1jqw@mail.gmail.com>
         <97b04d3a-a969-a23b-9414-4937dd2f2ef6@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-8EBfqwEFrwsZ0WSG95vE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <97b04d3a-a969-a23b-9414-4937dd2f2ef6-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Anthony Eden <aeden-EfZU8u+QLuPpgkiH4x7ZXw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--=-8EBfqwEFrwsZ0WSG95vE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 07 juillet 2017 =C3=A0 14:28 +0100, Jon Hunter a =C3=A9crit :
> On 05/07/17 21:31, Anthony Eden wrote:
> > I no longer have any HDMI output from either my Jetson TK1
> > (tegra124-jetson-tk1) or Acer Chromebook 13 CB5-311
> > (tegra124-nyan-big) in Linux 4.12. In 4.11 I had no problem starting
> > up X server.
> >=20
> > Lightdm tries to start on boot and /var/log/Xorg.0.log contains:
> >=20
> > ...
> >=20
> > [    10.723] (II) modesetting: Driver for Modesetting Kernel
> > Drivers: kms
> > [    10.723] (II) modeset(0): using drv /dev/dri/card0
> > [    10.724] (II) modeset(0): Creating default Display subsection in
> > Screen section
> >         "Default Screen Section" for depth/fbbpp 24/32
> > [    10.724] (=3D=3D) modeset(0): Depth 24, (=3D=3D) framebuffer bpp 32
> > [    10.724] (=3D=3D) modeset(0): RGB weight 888
> > [    10.724] (=3D=3D) modeset(0): Default visual is TrueColor
> > [    10.724] (II) Loading sub module "glamoregl"
> > [    10.724] (II) LoadModule: "glamoregl"
> > [    10.724] (II) Loading /usr/lib/xorg/modules/libglamoregl.so
> > [    10.726] (II) Module glamoregl: vendor=3D"X.Org Foundation"
> > [    10.726]    compiled for 1.19.3, module version =3D 1.0.0
> > [    10.726]    ABI class: X.Org ANSI C Emulation, version 0.4
> > [    10.726] (II) glamor: OpenGL accelerated X.org driver based.
> > [    10.920] (II) glamor: EGL version 1.4 (DRI2):
> > [    10.924] (II) modeset(0): glamor initialized
> > [    10.924] (WW) modeset(0): No outputs definitely connected,
> > trying again...
> > [    10.925] (WW) modeset(0): Unable to find connected outputs -
> > setting 1024x768 initial framebuffer
> > [    10.925] (=3D=3D) modeset(0): Using gamma correction (1.0, 1.0, 1.0=
)
> > [    10.925] (EE) modeset(0): No modes.
> > [    10.957] (II) UnloadModule: "modesetting"
> > [    10.957] (II) UnloadSubModule: "glamoregl"
> > [    10.957] (II) Unloading glamoregl
> > [    10.957] (EE) Screen(s) found, but none have a usable
> > configuration.
> > [    10.957] (EE)
> > Fatal server error:
> > [    10.957] (EE) no screens found(EE)
> > [    10.957] (EE)
> > Please consult the The X.Org Foundation support
> >          at http://wiki.x.org
> >  for help.
> > [    10.957] (EE) Please also check the log file at
> > "/var/log/Xorg.0.log" for additional information.
> > [    10.957] (EE)
> > [    10.957] (EE) Server terminated with error (1). Closing log
> > file.
> >=20
> > ...
> >=20
> > I am running the ArchLinuxARM linux-armv7 kernel (.config is
> > attached), along with the ALARM userspace.
> >=20
> > I've attached dmesg's from my Jetson TK1 and Chromebook. How can I
> > help to debug this further?
>=20
> Thanks for the report. I am seeing this too. Bisect is point to the
> following commit, hopefully, Thierry and Mikko can comment ...
>=20
> commit 404bfb78daf3bedafb0bfab24947059575cbea3d
> Author: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date:   Wed Dec 14 13:16:14 2016 +0200
>=20
>     gpu: host1x: Add IOMMU support

Thanks! I have investigated a bit further and can pinpoint it to
iommu_attach_device returning -ENODEV in drivers/gpu/host1x/dev.c's
host1x_probe.

I'll keep investigating to find out what's going on with the IOMMU code.

Cheers,

--=20
Paul Kocialkowski,

developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-8EBfqwEFrwsZ0WSG95vE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlliUdoACgkQhP3B6o/u
lQwABRAAjt131nn4RaGg3+stxQSBiKrrbKcBb0ZRhnrAlRwOeNWNTN9obERuVouF
JoZK8C0TMpQW/5aCI8nwUwrFjWANMYG6tOE3V+M+nja/UEi7poodYLs+3iMNqbDl
xBYBlhitTMYye/Zi9rAScXO/xdKvEUbKed2hBPib5S5hqmDzsp1UpsArGK7UHXd0
kCRLKxMYKyqHpxXUa5DmRnYiCM1dTLy2U2UgaVS+wsLodTKbhFJr5E0DplMrg3Di
wLyjanYj96kiPSHujCDRG3hDsG9NNr/cjjkYB7HycMRLvymjGNMsFVO19EcLhxwh
DkXGPY/SXzj+ahLyvGdUIKox17lYPsX5SZqhHcP6QYjdHuI4L8WLBbjCzAeHlwzm
vfd4O/XjNtURVgoBK2RV75DsSxvFPqkmkg1C2BXAWFqsv6aZOqBKIY5/lVMdjdX/
SaiwjwHGx2Eb3nF9hZ+8U3KSxqFmV7GDsgUCcWWr7LPrJ61m45er1PqYRTvIhRh2
XBB/YUyu7B5Y+PVGiqr7alcxKUDs78zoGz78ClcLx4P24r5SmGj/9Sl4ALfPm5oJ
jtcJiSEJP+iqzc+5dIxihYHnkU3hov3oS+2ug3WzF0fuQNgEbkkQwVNFC61eDpcM
3dvJftWVj05tfmGnlWJczKME6MVRF2xtE0/mbqfEvmgZLqPUJJY=
=oKNx
-----END PGP SIGNATURE-----

--=-8EBfqwEFrwsZ0WSG95vE--
