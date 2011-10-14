From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Adding board support
Date: Fri, 14 Oct 2011 07:49:45 +0200
Message-ID: <20111014054945.GA32399@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I have two Tegra2 based boards that I would like to add mainline support to.
Currently they run on a modified NVIDIA kernel (Vibrante 1.1 for those who
know it), but I would very much like to have them eventually boot from a
mainline kernel. Both boards are rather similar to Harmony.

I have a couple of questions, though. From what I can tell, the only
functionality missing from mainline is nvmap/nvhost. While this is required
for our boards, I was looking for some remote that includes support. The on=
ly
source I came across was at git.chromium.org (kernel.git and
kernel-next.git). I suppose those are kernels that are recommended to run on
Tegra2 boards if HW-accelerated video decoding and 3D rendering is required,
right?

I guess for the time being, the best plan would be to work on two branches,
one based on the code from chromium and one based on the mainline code which
doesn't contain nvmap/nvhost and used to prepare patches for mainline. Which
branch or repository should I base such work on? Olof's for-3.2 branches?

Another question concerns testing. So far I've always booted a modified
U-Boot (from Vibrante 1.1) to allow booting with an initial ramdisk (loaded
=66rom SD/MMC) as payload for fastboot/quickboot. What are other people usi=
ng?
What tools should I be using to update the firmware? Unfortunately nvflash =
is
not available in source code, and I haven't found any documentation about t=
he
early boot process, so it is kind of hard to figure out how all this is
supposed to work and consequently find ways to automate these things for
production boards.

I realize that some of these questions may be slightly off-topic here. If s=
o,
would someone be so kind as to point me to the correct mailing list?

Thanks,
Thierry

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk6XzXkACgkQZ+BJyKLjJp+qTwCeOoRVVdyLqqyutYH2sjplEtZR
lqMAoKDq4euV8i2wqn6On99efzQJvPgF
=z+5E
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
