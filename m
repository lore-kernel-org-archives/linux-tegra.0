From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Linux hangs on Tegra 2 / U-Boot board
Date: Tue, 24 Jul 2012 16:05:47 +0200
Message-ID: <20120724140547.GA27999@avionic-0098.mockup.avionic-design.de>
References: <loom.20120724T152735-115@post.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <loom.20120724T152735-115-eS7Uydv5nfjZ+VzJOa5vwg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2012 at 01:32:59PM +0000, Nuno Santos wrote:
> Hi
>=20
> As I explained in a previous post, I have a Tegra2 based board (Harmony)
> and (thanks to your help) I successfully managed to flash and boot U-Boot.
>=20
> However, I=E2=80=99ve been trying to boot Linux from U-Boot but to no ava=
il. Once the
> device runs U-boot, I load a Linux image into memory over TFTP, run the
> command =E2=80=9Cbootm=E2=80=9D, and then Linux immediately hangs after p=
rinting message
> =E2=80=9CStarting kernel ...".
>=20
> I=E2=80=99ve tried multiple suggestions I=E2=80=99ve seen online: definin=
g linux console
> boot in the =E2=80=9Cbootargs=E2=80=9D parameter in case it is a console =
misconfiguration,
> recompile the kernel with CONFIG_DEBUG_LL to diagnose the problem, and ch=
eck
> the machine id (by providing machine id 0xAAB in the environment var
> =E2=80=9Cmachid=E2=80=9D). In all these attempts there is no change whats=
oever in the output.

You need to pass earlyprintk in bootargs to see early debug output
(CONFIG_DEBUG_LL). Also make sure that you've flashed with the correct
ODMDATA set so the output goes to the correct UART.

> I=E2=80=99d be really grateful if someone could give me a hand on this. S=
o, here=E2=80=99s
> the details.
>=20
> 1. I=E2=80=99m using the kernel from git://nv-tegra.nvidia.com/linux-2.6.=
git,
> pulled today and configured as indicated in the doc (make tegra_defconfig=
);
> the compilation also creates a uImage for U-Boot. I=E2=80=99m using the l=
atest version
> of U-Boot, compiled locally using the standard procedure.

It might help to try and run the upstream kernel just to check that
everything works. I believe the NVIDIA downstream kernels currently
don't boot properly when run from the upstream U-Boot. But I may be
mistaken.

Thierry

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQDqu7AAoJEN0jrNd/PrOhzisP/iBgZy7lf3QRMwgndeFUtnwb
/9cElBiJEWS0HJdGwVEy+vfTueHLTiZ/2vMa6d4O+WOuU1TJ1SYTZgCDT+5o40mW
1YX5Ddn3caucYA32RDyEhHFTDDjfY+YBGcdNxBVAB69Wd5vnqGMcIa7SskTew9ED
BRbUnmc+yNmOBYUeKD670BRbx53julpFNdhi1sFVaqDg3HVp3zsMYFyVN6x06k0G
QiceY2rjYdVK4esGUcu84P1WWV20OKE2OsMirdGHuDt8Zzuv7zZNyNcgmDgdah3a
Wb9qWoPda52+FW29A3s6GFepAecHYl5DJEGXOtQy0i52niNIz2twoP+M/xdhfWJ+
0DcLAiY8pqB59Qt6RTAD6rr4VsUqwKWyg1mrYqWkbyTQgb+J1F3MmJiImf2Nog9J
gqJfhP6zuPYpz/AKxnFmSBRoTLtIWhoXLtaSqCe5pX5jsXT3Pjxc6ZZYtbMxksZq
mBaLmX5VH8hCWSCI53FkzsrpJ0ZhQfRkPX9FTZ3ZZXB4KHJQAElWs88l4GzmrqmT
y4Woqau1dyCYcrfx2hrdod/Ee1uvX3fC5/mMWo2ikUoyV2y8IL3ZY9fs0u6k3HrM
K5PbNl5ayHN5H+g83S73MbNR6L3zBOcOSMOPn6qiZ44FkR/VGZFYupyhyZBdfyrV
MEjke7rTP2kb9W5ZYkqT
=cXqU
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
