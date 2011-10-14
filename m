From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Adding board support
Date: Sat, 15 Oct 2011 01:24:04 +0200
Message-ID: <20111014232404.GB916@avionic-0098.mockup.avionic-design.de>
References: <20111014054945.GA32399@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A290@HQMAIL01.nvidia.com>
 <20111014185847.GA916@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A33E@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A33E-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Friday, October 14, 2011 12:59 PM:
> > * Stephen Warren wrote:
[...]
> > U-Boot mainline support is another point on my TODO list. Getting the l=
atest
> > mainline code with the patches you mention (I assume you are referring =
to the
> > patch series by Simon Glass and Tom Warren) to work would be a good ste=
p in
> > that direction.
>=20
> I branched from: git://git.denx.de/u-boot.git master at commit
> 0841ca90f22d73b0ea4642ef1ce33d879bb2f3ff.
>=20
> I applied the following:
>=20
> http://patchwork.ozlabs.org/patch/115862/
> http://patchwork.ozlabs.org/patch/115864/
> http://patchwork.ozlabs.org/patch/115865/
> http://patchwork.ozlabs.org/patch/115860/
> http://patchwork.ozlabs.org/patch/115863/
> http://patchwork.ozlabs.org/patch/115861/
>=20
> http://patchwork.ozlabs.org/patch/119321/
> http://patchwork.ozlabs.org/patch/119322/
> http://patchwork.ozlabs.org/patch/119323/
> http://patchwork.ozlabs.org/patch/119324/
> http://patchwork.ozlabs.org/patch/119325/
>=20
> http://patchwork.ozlabs.org/patch/118184/
>=20
> I applied the following to hack the default environment so I could boot f=
rom
> SD cards layed out how mine are; you'll probably need to tweak this a bun=
ch:
>=20
> diff --git a/include/configs/tegra2-common.h b/include/configs/tegra2-com=
mon.h
> index 07546a4..f30f569 100644
> --- a/include/configs/tegra2-common.h
> +++ b/include/configs/tegra2-common.h
> @@ -104,9 +104,19 @@
> =20
>  /* Environment information */
>  #define CONFIG_EXTRA_ENV_SETTINGS \
> -       "console=3DttyS0,115200n8\0" \
> -       "mem=3D" TEGRA2_SYSMEM "\0" \
> -       "smpflag=3Dsmp\0" \
> +       "bootcmd=3Drun usb0_boot ; run usb1_boot ; run mmc1_boot ; run mm=
c0_boot\0" \
> +       "bootdelay=3D2\0" \
> +       "loadaddr=3D0x00500000\0" \
> +       "scriptaddr=3D0x408000\0" \
> +       "script_img=3D/u-boot/boot.scr.uimg\0" \
> +       "mmc0_boot=3Dsetenv devnum 0; run mmc_boot;\0" \
> +       "mmc1_boot=3Dsetenv devnum 1; run mmc_boot;\0" \
> +       "usb0_boot=3Dusb start 0; run usb_boot;\0" \
> +       "usb1_boot=3Dusb start 1; run usb_boot;\0" \
> +       "scr_boot=3Dfatload ${devtype} ${devnum}:c ${scriptaddr} ${script=
_img};source ${scriptaddr};read ${devtype} ${devnum}:${kernelpart} ${script=
addr} 0 10;source ${scriptaddr};\0" \
> +       "mmc_boot=3Dmmc dev ${devnum};setenv devtype mmc;setenv devname m=
mcblk${devnum}p;run scr_boot;\0" \
> +       "usb_boot=3Dsetenv devtype usb;setenv devnum 0;setenv devname sda=
;run scr_boot;\0" \
> +       "platform_extras=3Dlp0_vec=3D0x2000@0x1C406000 kcrashmem=3D0x1000=
00@0x02000000 mem=3D384M@0M nvmem=3D128M@384M mem=3D511M@512M\0" \
> =20
>  #define CONFIG_LOADADDR                0x408000        /* def. location =
for kernel */
>  #define CONFIG_BOOTDELAY       2               /* -1 to disable auto boo=
t */
>=20
> In order to actually use the resultant u-boot.bin, it's pretty simple if =
you
> already have nvflash working with burn fastboot.
>=20
> 1) Edit flash.cfg (or whatever config file you pass to nvflash to define
> The partitions and their content) and replace the filename entry in the
> EBT partition with u-boot.bin.
>=20
> 2) I personally remove all the partition entries in flash.cfg except for
> BCT, PT, EBT. This will avoid nvflash flashing your Android/... filesyste=
m.
> If you want your filesystem in the same flash, don't do this.
>=20
> Then, run nvflash just like you would normally.

Okay, I've been able to build U-Boot and setup some scripts that should
automate the nvflash procedure according to your instructions. I'll have to
wait until I get back to work on Monday to see whether it actually works,
though.

> > Have you done any testing with the NVIDIA binary blobs when booting thi=
s way?
> > The latest information I have from our NVIDIA contacts is that fastboot=
 or
> > quickboot are required, for some reason, to make HW accelerated video
> > decoding and 3D rendering work.
>=20
> It's possible the binary drivers accidentally rely on the bootloader
> having configured some piece of HW.
>=20
> However, in general, the bootloader product you use shouldn't affect
> whether the binary drivers work.
>=20
> In particular, the binary drivers certainly work after the ChromeOS
> U-Boot boots a board.
>=20
> Coincidentally, right before seeing your email, I just tried mainline
> U-Boot on Seaboard with our Linux4Tegra alpha 1 release, and while X
> started, I couldn't see anything on screen. This did previously work
> with some old version of ChromeOS's U-Boot. So, there's certainly some
> missing HW initialization somewhere.

Right, I'll probably run into the same problems then. But if it can actually
make the system boot, it's enough to prepare some patches on top for mainli=
ne
support.

I've just caught up with most of my email backlog and I'm looking forward to
testing the device-tree support in U-Boot that's recently been posted.

> BTW, you might also want to take a look at NVIDIA's web forums:
>=20
> http://developer.nvidia.com/beta-forum
>=20
> While I'm personally happy to answer your questions here, (I work for
> a group dedicated to making general Linux support on Tegra) you may find
> more people aimed at this kind of support on those forums. I'm not
> active on those forums though.

I'm not a big fan of forums, but I guess I should check it out. A co-worker
has actually done more work with the binary drivers and I don't know how mu=
ch
I will be involved there either, but I will make sure to pass the informati=
on
on.

> I hope this all helps!

Yes, very helpful indeed! Thanks again.

Thierry

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk6YxJQACgkQZ+BJyKLjJp+xmwCgmL5b1RnaXZEZmn3NzPkQfZnU
EHoAniU6jOFNoRA4bj69+MbJz7fKl6LS
=JWLF
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
