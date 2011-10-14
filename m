From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Adding board support
Date: Fri, 14 Oct 2011 20:58:47 +0200
Message-ID: <20111014185847.GA916@avionic-0098.mockup.avionic-design.de>
References: <20111014054945.GA32399@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A290@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A290-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for taking the time to reply. This is *exactly* the kind of
information I'm looking for.

* Stephen Warren wrote:
> Thierry Reding wrote at Thursday, October 13, 2011 11:50 PM:
> ...
> > I have a couple of questions, though. From what I can tell, the only
> > functionality missing from mainline is nvmap/nvhost. While this is requ=
ired
> > for our boards, I was looking for some remote that includes support. Th=
e only
> > source I came across was at git.chromium.org (kernel.git and
> > kernel-next.git). I suppose those are kernels that are recommended to r=
un on
> > Tegra2 boards if HW-accelerated video decoding and 3D rendering is requ=
ired,
> > right?
>=20
> There are also some NVIDIA kernel repos that contain this support; see:
> http://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-2.6.git;a=3Dsummary
>=20
> I think our current Linux4Tegra releases do use the kernel from ChromeOS,=
 but
> future releases may move to our internal kernels.

The kernel at the NVIDIA website seems to be close to what Vibrante ships
with. I'll have a closer look at it.

> > I guess for the time being, the best plan would be to work on two branc=
hes,
> > one based on the code from chromium and one based on the mainline code =
which
> > doesn't contain nvmap/nvhost and used to prepare patches for mainline. =
Which
> > branch or repository should I base such work on? Olof's for-3.2 branche=
s?
>=20
> Just as an FYI, upstreaming nvmap/nvhost isn't a near-term goal. In the l=
onger
> term, we're starting to think about a solution here.

That's good news. :-)

> For practical purposes, you'll probably want to base any product kernels =
off
> one of NVIDIA's various downstream branches. Given your Vibrante usage, i=
t'd
> probably be best to ask your existing NVIDIA contacts some of these quest=
ions.
>=20
> However, please don't let that stop you upstreaming basic board support; =
you
> should be able to upstream anything that doesn't depend on nvhost/nvmap e=
tc.
> You'll probably want to use device-tree exclusively for any new board sup=
port
> in mainline.

We'll have to stick to the Vibrante kernel while some issues are still being
worked out and I don't want to risk any differences in the kernel to
interfere.

However, in the meantime I would like to prepare some board support patches
for inclusion in the mainline kernel. My intention was indeed to use the
device-tree exclusively. Since both boards are rather similar to Harmony, it
will probably be easy to derive them from Harmony. I've been meaning to read
up on device-trees for a while and this looks to be the perfect opportunity.

> > Another question concerns testing. So far I've always booted a modified
> > U-Boot (from Vibrante 1.1) to allow booting with an initial ramdisk (lo=
aded
> > from SD/MMC) as payload for fastboot/quickboot. What are other people u=
sing?
>=20
> Personally, I've recently switched to using mainline U-Boot on almost all=
 my
> boards (Harmony, Seaboard, Ventana). Maybe I'll add TrimSlice support the=
re
> too. Note that this relies on a number of patches that have been posted to
> the U-Boot mailing list, but not yet checked into their repos. This compl=
etely
> bypasses fastboot; Tegra's boot ROM runs U-Boot directly instead of fastb=
oot.

I was hoping that somebody had gotten this to work. Would you mind sharing
the script that you use? All the scripts I've seen so far create some boot
image (using a tool named mkbootimg) that contains U-Boot.

U-Boot mainline support is another point on my TODO list. Getting the latest
mainline code with the patches you mention (I assume you are referring to t=
he
patch series by Simon Glass and Tom Warren) to work would be a good step in
that direction.

Have you done any testing with the NVIDIA binary blobs when booting this wa=
y?
The latest information I have from our NVIDIA contacts is that fastboot or
quickboot are required, for some reason, to make HW accelerated video
decoding and 3D rendering work.

> > What tools should I be using to update the firmware? Unfortunately nvfl=
ash is
> > not available in source code, and I haven't found any documentation abo=
ut the
> > early boot process, so it is kind of hard to figure out how all this is
> > supposed to work and consequently find ways to automate these things for
> > production boards.
>=20
> Try grabbing the Linux4Tegra packages from:
> http://developer.nvidia.com/content/linux-tegra-release-12-alpha-1-releas=
ed
>=20
> at least that has a publically obtainable/usable nvflash for a few boards.
> You should be able to adjust the flash.cfg files there for other boards.
>=20
> It's a little early to say much, but there are some early movements towar=
ds
> replacing nvflash with something more open for general Linux usage.

More good news.

> You may also want to look at the "cbootimage" tool here:
>=20
> https://gitorious.org/cbootimage

That's great. Another missing piece of the puzzle. This seems to be the
open-source equivalent of another tool from Vibrante that allows to create
BCT files from "source" files (I've forgotten the name).

Thanks,
Thierry

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk6YhmcACgkQZ+BJyKLjJp8mTwCfQ+hwp7+JWjn3MxgGSGNdJiWP
COgAoJRybjeENy5uAmaeuRObXxv7NHi8
=g6Tt
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
