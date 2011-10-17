From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Adding board support
Date: Mon, 17 Oct 2011 12:26:58 +0200
Message-ID: <20111017102658.GA12373@avionic-0098.mockup.avionic-design.de>
References: <20111014054945.GA32399@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A290@HQMAIL01.nvidia.com>
 <20111014185847.GA916@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A33E@HQMAIL01.nvidia.com>
 <20111014232404.GB916@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111014232404.GB916-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Thierry Reding wrote:
> * Stephen Warren wrote:
> > Thierry Reding wrote at Friday, October 14, 2011 12:59 PM:
> > > * Stephen Warren wrote:
> [...]
> > > U-Boot mainline support is another point on my TODO list. Getting the=
 latest
> > > mainline code with the patches you mention (I assume you are referrin=
g to the
> > > patch series by Simon Glass and Tom Warren) to work would be a good s=
tep in
> > > that direction.
> >=20
> > I branched from: git://git.denx.de/u-boot.git master at commit
> > 0841ca90f22d73b0ea4642ef1ce33d879bb2f3ff.
> >=20
> > I applied the following:
> >=20
> > http://patchwork.ozlabs.org/patch/115862/
> > http://patchwork.ozlabs.org/patch/115864/
> > http://patchwork.ozlabs.org/patch/115865/
> > http://patchwork.ozlabs.org/patch/115860/
> > http://patchwork.ozlabs.org/patch/115863/
> > http://patchwork.ozlabs.org/patch/115861/
> >=20
> > http://patchwork.ozlabs.org/patch/119321/
> > http://patchwork.ozlabs.org/patch/119322/
> > http://patchwork.ozlabs.org/patch/119323/
> > http://patchwork.ozlabs.org/patch/119324/
> > http://patchwork.ozlabs.org/patch/119325/
> >=20
> > http://patchwork.ozlabs.org/patch/118184/
> >=20
> > I applied the following to hack the default environment so I could boot=
 from
> > SD cards layed out how mine are; you'll probably need to tweak this a b=
unch:
> >=20
> > diff --git a/include/configs/tegra2-common.h b/include/configs/tegra2-c=
ommon.h
> > index 07546a4..f30f569 100644
> > --- a/include/configs/tegra2-common.h
> > +++ b/include/configs/tegra2-common.h
> > @@ -104,9 +104,19 @@
> > =20
> >  /* Environment information */
> >  #define CONFIG_EXTRA_ENV_SETTINGS \
> > -       "console=3DttyS0,115200n8\0" \
> > -       "mem=3D" TEGRA2_SYSMEM "\0" \
> > -       "smpflag=3Dsmp\0" \
> > +       "bootcmd=3Drun usb0_boot ; run usb1_boot ; run mmc1_boot ; run =
mmc0_boot\0" \
> > +       "bootdelay=3D2\0" \
> > +       "loadaddr=3D0x00500000\0" \
> > +       "scriptaddr=3D0x408000\0" \
> > +       "script_img=3D/u-boot/boot.scr.uimg\0" \
> > +       "mmc0_boot=3Dsetenv devnum 0; run mmc_boot;\0" \
> > +       "mmc1_boot=3Dsetenv devnum 1; run mmc_boot;\0" \
> > +       "usb0_boot=3Dusb start 0; run usb_boot;\0" \
> > +       "usb1_boot=3Dusb start 1; run usb_boot;\0" \
> > +       "scr_boot=3Dfatload ${devtype} ${devnum}:c ${scriptaddr} ${scri=
pt_img};source ${scriptaddr};read ${devtype} ${devnum}:${kernelpart} ${scri=
ptaddr} 0 10;source ${scriptaddr};\0" \
> > +       "mmc_boot=3Dmmc dev ${devnum};setenv devtype mmc;setenv devname=
 mmcblk${devnum}p;run scr_boot;\0" \
> > +       "usb_boot=3Dsetenv devtype usb;setenv devnum 0;setenv devname s=
da;run scr_boot;\0" \
> > +       "platform_extras=3Dlp0_vec=3D0x2000@0x1C406000 kcrashmem=3D0x10=
0000@0x02000000 mem=3D384M@0M nvmem=3D128M@384M mem=3D511M@512M\0" \
> > =20
> >  #define CONFIG_LOADADDR                0x408000        /* def. locatio=
n for kernel */
> >  #define CONFIG_BOOTDELAY       2               /* -1 to disable auto b=
oot */
> >=20
> > In order to actually use the resultant u-boot.bin, it's pretty simple i=
f you
> > already have nvflash working with burn fastboot.
> >=20
> > 1) Edit flash.cfg (or whatever config file you pass to nvflash to define
> > The partitions and their content) and replace the filename entry in the
> > EBT partition with u-boot.bin.
> >=20
> > 2) I personally remove all the partition entries in flash.cfg except for
> > BCT, PT, EBT. This will avoid nvflash flashing your Android/... filesys=
tem.
> > If you want your filesystem in the same flash, don't do this.
> >=20
> > Then, run nvflash just like you would normally.
>=20
> Okay, I've been able to build U-Boot and setup some scripts that should
> automate the nvflash procedure according to your instructions. I'll have =
to
> wait until I get back to work on Monday to see whether it actually works,
> though.

I'm unable to make this work. I've done as you said, branched from the comm=
it
you mentioned and applied the patches you listed. Then ran:

	$ make CROSS_COMPILE=3D... O=3Dbuild/harmony harmony_config
	$ make CROSS_COMPILE=3D... O=3Dbuild/harmony -j8

And flashed the resulting u-boot.bin like you described, by replacing the
fastboot.bin in the configuration with u-boot.bin. When rebooting the device
(I used a Harmony for this testing obviously) there's nothing. No output on
the serial line. Flashing fastboot.bin I can at least see some debugging
output.

I also tried to update the TEXT_BASE, which seems to be 0x00108000 for
fastboot, and 0x00E08000 for U-Boot, but that didn't make a difference. Any
ideas on what could be the problem?

I'm not quite sure where these values come from. Are they hard-coded in the
boot ROM? And how does it know from which NAND partition to load the
bootloader?

Thanks,
Thierry

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk6cAvIACgkQZ+BJyKLjJp92NACfciXto1SUW3UbbMhnZBLCfN4Y
VDAAoJcWL5QJ3Xgm1TQzS6uw8Du9r+Pl
=hCJL
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
