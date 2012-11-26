From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Mon, 26 Nov 2012 22:27:02 +0100
Message-ID: <20121126212702.GA2651@avionic-0098.adnet.avionic-design.de>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
 <50B3AACE.3050908@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50B3AACE.3050908-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org" <xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2012 at 09:45:50AM -0800, Aaron Plattner wrote:
> On 11/24/2012 01:09 PM, Thierry Reding wrote:
> >Hi,
> >
> >With tegra-drm going into Linux 3.8 and NVIDIA posting initial patches
> >for 2D acceleration on top of it, I've been looking at the various ways
> >how this can best be leveraged.
> >
> >The most obvious choice would be to start work on an xf86-video-tegra
> >driver that uses the code currently in the works to implement the EXA
> >callbacks that allow some of the rendering to be offloaded to the GPU.
> >The way I would go about this is to fork xf86-video-modesetting, do some
> >rebranding and add the various bits required to offload rendering.
>=20
> From a purely logistical standpoint, if you do choose to create a
> fork, calling it xf86-video-tegra might be a problem since there's
> already an existing tegra_drv.so.

Right, you already use that name. Anyone have any great ideas for a new
name?

> You could probably graft tegradrm support onto xf86-video-nv pretty
> easily, if you want to reuse an existing driver package.

I think I'd rather go with a fork of the modesetting driver since it
already provides everything that we need and only the acceleration bits
need to be added on top.

Thierry

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQs96mAAoJEN0jrNd/PrOhd+wP/29Q4WtSVOufPnxGCIzx/JJL
12erNZPnUjhyM6w7LvBEBo6Zbxpy07iUjl6XVbOc/Il3bVqOyHIw30xqcOSuqrVc
NQpucbUyZBSN73OVNBtQquZxYQra6noQXZntExfcL3LI5lZxaQLvtTWh7UzD4vCG
ewubWBDFlalN6HAcJQIzfC0j/a0LEUMtgbnSgZl2lh+oddTdr+PN/HTMf1mv+yca
40rhRsK804W7DQJcZnOAE3Hb4nhrDfABe33j+/fJ/w7oAyiy6293jRJ7WpendUk7
nZs8Rt1x4r6X+MZXWlo+hqPgMLG1WjhQDQxExg0fSIn5+l1angEEWe/CAp5fIJz6
ezEacjZAs6mg283pht2F8+uWfqdIzQPlE6BFy6ICMQeDqkpSD8fe9ukXnmcVg5xO
DsKWh2ZIZK3UBth8vWsBEID/5JIG1JLf5vgksSPjq50oPl49TpszZMzylqyXYT2/
SghHBkUqsbENTY/pjRj+ColUH5YZjoCYCvnEJ1WlLVBT0U+GstOjsHs57rkmi0P/
yyXfzEryGcHjxLuvUp0cQ1Mmaa5+belxXeUn+sY8aC+bOPrV21JZksyL1LkMQJAA
LzX4s6uRLcjBfE/iE/Pf6eauzLyGCXzs2ajkr6EsB004rZVE0piIw8gFSzC2Ljk5
QxMhyqjLwVGds2bcMQu1
=roJW
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
