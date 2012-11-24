From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: xf86-video-tegra or xf86-video-modesetting?
Date: Sat, 24 Nov 2012 22:09:17 +0100
Message-ID: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

With tegra-drm going into Linux 3.8 and NVIDIA posting initial patches
for 2D acceleration on top of it, I've been looking at the various ways
how this can best be leveraged.

The most obvious choice would be to start work on an xf86-video-tegra
driver that uses the code currently in the works to implement the EXA
callbacks that allow some of the rendering to be offloaded to the GPU.
The way I would go about this is to fork xf86-video-modesetting, do some
rebranding and add the various bits required to offload rendering.

However, that has all the usual drawbacks of a fork so I thought maybe
it would be better to write some code to xf86-video-modesetting to add
GPU-specific acceleration on top. Such code could be leveraged by other
drivers as well and all of them could share a common base for the
functionality provided through the standard DRM IOCTLs.

That approach has some disadvantages of its own, like the potential
bloat if many GPUs do the same. It would also be a bit of a step back
to the old monolithic days of X.

So what do other people think?

Thierry

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQsTd8AAoJEN0jrNd/PrOhLVwP/0c8fCe3uwqsMGCSXKG83/x4
q3nmHCI7CFLozwBZLKCa5dtfZnhOU5H3cRxJ0zzfJm5gAG3MD2ilKtTmLO2sJwYi
HhahO3dMH9nhjr6NPOXQsWcDEHvxgGBWzoHDMDR/s8bgJsFWyLgtWE3/Kf2NOtCt
nzVMg8MLKK4nGy2p2EAqZu8uMi1kxBjua2bP5kuRFzuQD8D43fNt2cw3BywSydks
OCrIXuZ7kacJKFEuAr+FXAfH7ayZbUA9W2FDEXYc86lAMM8D9yC4d1+EcfQtmviR
JVZHxr++19ocjZgDiE4zdEbURZrimOfA7kKgGp2Wd33GSZRSw+m8WhGHzHlHfx7r
I3SFu0dMDBHtbzaP7aaA/2NUMcLQwekfQMP2BZps3uhWABm1IwbC7yahs7MOEQde
dYb7nZ/pse0NmkPPXsPKzEjdu9i8dXbOUS+N8RwrOZW91uYxsHWAhugIbATy7FiQ
vhuHrQTTNe3qPO91tKMUjlCC652tuk6AgDdSiOZIu/xoeMF0F7dE67MXjq9GbCLE
XuW3QxVrsCgkyGaBXa3qQvmj0QJtTe3/CQpyfYW+LuWDQiSkzDlpZd617L+AsfpM
w0eTdffBF+gBfFFpZKz8vUoj920JGQKfWkfvH7Gh4Nkt5l9ZvcsAFGDUnovEI4JJ
1ruUmUYqz/p657/gYtnY
=lxVN
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
