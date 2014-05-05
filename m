From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: HDMi out on Venice2
Date: Mon, 5 May 2014 22:32:49 +0200
Message-ID: <20140505203248.GA27821@mithrandir>
References: <CAEUnVG6TcgJ+TB6r11Rsp=LNCvuRawLNXNdfCspF0JpHx1=M4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAEUnVG6TcgJ+TB6r11Rsp=LNCvuRawLNXNdfCspF0JpHx1=M4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 05, 2014 at 12:07:51PM -0700, Dylan Reid wrote:
> Hi Thierry,
>=20
> Did you have to make any user-space changes to test the HDMI output on
> Venice2?  I've got your recent patch series and see the hdmi device
> being probed but I haven't figured out how to get X to use it.  I'm
> using the sample rootfs that was posted for the Jetson board.

I've used custom userspace, but I would expect regular X to work with
the patches as well. The sample rootfs probably comes with only the
NVIDIA Tegra X driver installed. Have you tried installing the
xf86-video-modesetting driver? That should automatically use the HDMI
output if it's connected to a monitor. If not you should still be able
to manually configure the outputs using xrandr.

> My goal is to be able to test the hdmi audio changes on this as well
> as our downstream kernel.

Note that while there's some code to support HDMI audio, nobody's ever
tested this upstream and it's likely not to work. So I think there may
be more work required to get that running. I can help out with that,
it's been on my list of things to do for a while.

Thierry

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTZ/VwAAoJEN0jrNd/PrOhWVkP/0hbn79IbgZrZH57qH8G/6T6
D0u+9wsJDMCMivkETLGe9ue9Fstatiw1PZ1+yrCXCJh4YK3/5uaetXSWOR6ogUM8
4500UB2/I+q7ZP+UO3JdUpVVjUvaiThyAr1QVtDu+rcULSuWvZ3x+o8+jCUfi+iS
U+kUAM2rorzkE1ptQ9PiD1y6kQlNY/ePXBNmok/ifuTwR7CLzILQrHxWUpwNf8bV
7kv1suy+5DVC/upGXYhUwWqIHaKMIqFYopnRFw/e0gGA5XMOJpg4eTjIAmqkJIPl
38rCrtWM5pDz4vSEHLreGHQ4Knqx04yv6FVqbhhzyr6/gqg89kWnm1Q5gBFNcpsk
CiQAWNuuyrb/Cd1i6uLNdJ11TKJDTdTXJwWrynnq3akAhC1c4kTIj004WkpSdLi+
PSfF+3knIA/UkRJqSYaxCTf/d5LZIWWbfz21Thv8fI9wYnc+QjQIyBkQ7lbpLr3S
gMwo7tX5jdYteZtY6d5RFtr/I6gedwlWeWWdd0ruCbgRkOlL6zH0CdShwTojeIIx
9ncetVGbl84YjUhGTgR6hNfuKi3mVY4SFAt8GHgR/4X6jnVQ6Z1kJFU7GJ/ibWuv
j7iYTqCfgaWv0ITxGTVxy4h2G8r5Iobt2FlCppaGlMhsiA6EBtc7df81Ji2iSaLP
qexfFJutmXKxqooYJ3HT
=5tXI
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
