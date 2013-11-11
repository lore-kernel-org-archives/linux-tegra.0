From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Issue with a SOYO monitor and Trimslice
Date: Mon, 11 Nov 2013 13:50:48 +0100
Message-ID: <20131111125047.GA2650@ulmo.nvidia.com>
References: <CAKCjkJY4nYte00jj-f78G_cohXuXSw-krrubJh1dgANtvRhJkA@mail.gmail.com>
 <20131111094625.GJ3884@ulmo.nvidia.com>
 <CAKCjkJaGvW80ycb_oh62_0WXUS0k8HJ=rMaPO+Gad_ZYAxbR_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKCjkJaGvW80ycb_oh62_0WXUS0k8HJ=rMaPO+Gad_ZYAxbR_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steev Klimaszewski <steev-4jv++OSWV9OTkO8mciVlQg@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2013 at 05:49:42AM -0600, Steev Klimaszewski wrote:
> On Mon, Nov 11, 2013 at 3:46 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Sun, Sep 22, 2013 at 06:26:11AM -0500, Steev Klimaszewski wrote:
> > Hi Steev,
> >
> > I just remembered this thread from a while ago. There were some patches
> > to fix DVI support that will be merged into 3.13. You can find them in
> > the drm/for-next branch here:
> >
> >         http://cgit.freedesktop.org/tegra/linux
> >
> > Specifically:
> >
> >         http://cgit.freedesktop.org/tegra/linux/commit/?h=3Ddrm/for-nex=
t&id=3D9f1591231aa72edd2cdad507520ad4088682262a
> >
> > I'm not sure if it fixes the issue that you were seeing, but it might be
> > worth a try.
> >
> > Thierry
>=20
> Hi Thierry,
>=20
> Sadly, it doesn't seem to have changed anything.  What I did here was:
>=20
> git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> cd linux
> git remote add nvidia git://anongit.freedesktop.org/tegra/linux
> git fetch --all
> git merge nvidia/drm/for-next
> Edited the files that had conflicts which were all in i915 so for this
> use case, i'm pretty sure it's fine that I ignored what the proper
> solution should be
> make ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- tegra_defconfig
> make ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- -j8
> ... modules_install to the root partition of the sdcard
> copied the dtb and zImage to boot partition of the sdcard
> popped the sdcard in to the Trimslice
>=20
> my boot.scr file looks like:
>=20
> setenv bootargs rootfstype=3Dext4 drm.debug=3D0xf root=3D/dev/mmcblk0p2
> rootwait console=3DttyS0,115200n8;
> ext2load mmc 0:1 ${loadaddr} zImage;
> ext2load mmc 0:1 ${fdt_high} tegra20-trimslice.dtb;
> bootz ${loadaddr} - ${fdt_high}

That all looks good.

> and dmesg | grep drm is:
[...]
> 23:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
> 0xa
> [    1.132767] [drm:drm_crtc_helper_set_mode], [CRTC:3]
> [    1.152805] [drm:drm_vblank_get], enabling vblank on crtc 0, ret: 0
> [    1.152811] [drm:drm_update_vblank_count], enabling vblank
> interrupts on crtc 0, missed 0
> [    1.154849] [drm:tegra_crtc_setup_clk], rate: 292000000, div: 1

I certainly looks like the clock is properly set up here. The rate here
should be double that of the required frequency of the mode (146 MHz).

> And Out of Range still shows up on the screen.
>=20
> This is with an HDMI -> DVI cable plugged in to the HDMI port.

I can't make heads or tails of it. I remember seeing out-of-range when
the pixel clock wasn't running at the proper rate, or sometimes even
when the AVI infoframes were wrong... I don't think either of those
should be a problem, though.

> When plugged in to the DVI-D port, the drm subsystem doesn't even see it.
>=20
> Are there any plans to enable the actual DVI-D port on the Trimslice?

It's currently not hooked up in the device tree. I vaguely remember
someone (me?!) posting untested patches to make that work, but I can't
find them. Judging by the TrimSlice vendor kernel it seems like there's
no hotplug detect for DVI-D and there's a GPIO that controls whether or
not the DVI transceiver is enabled (GPIO P5). There's no way to control
that GPIO from the driver currently, but wiring up the DDC and the RGB
node should be simple.

The variant of the TrimSlice that I have doesn't come with the DVI
connector, so I can't test this unfortunately.

Thierry

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSgNKnAAoJEN0jrNd/PrOhWMkP/0ib9feB6EDRE54+ypCCa1GF
gx6pUJC7JGkkvqjUszE2iGbloNWgGi51jVSnAqOvgljKkVaiXVTwvjkISQAzGMhD
f08Db+iulfGk8UKGzl4H9a/8ZZYJ/gvM9M5BWKwdTJDV3Mw9lmhIF5/akmRSgLqt
bC/J1VyODiOOvdadgANYiEOiWYFJQno9Kvt6dH/8pL9BbjZ8sm107lBRidapf1gR
HhtLlqgOlQnQmsFI901zJdFhK3Ub+MfFftdb1maSzv9WCJ3jICvq88gP/vgH+b1A
iJzhyJ5yLqLr/AcTd0NOT/NGUzqWob8/QS9ELkXcEiprs2NsMpXOLbx/J6wYakwh
DDRJil/3QRfz2M30jFz5fxtsr6QYo8eiml0ku8/qwc7o54EY1qFsVX9nGx3ZeRYr
yW9tyeLYgsh34GMROeCFZpdMprioY6YWS5JLaPtZxCY1ENdOPZPy6wlYBXmiHYRS
mYcWTSi26JdbeUXXy2z+ZySnRjp+Rz5Wt1bZAuqalZZuNv+UP3T/MXoaPRIVX9Bc
7bge+rKNystFK/KKXsu+O/kuTofXbqJR6Df8oWaPG4BgyFmqK+E+3nM3dqlQQqXh
z8u1Jmf9VDV5PHGaNQP9jlSIm0CN1D884qd9E5jaJyKARoWFb/+MBDV+lJ9LfP5s
10yq+P2+Tdvy5EFVpm5A
=kaNK
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
