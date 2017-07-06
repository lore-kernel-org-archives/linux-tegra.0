From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Tegra DRM driver is not probing with 4.12 on tegra124
Date: Thu, 06 Jul 2017 19:15:45 +0300
Message-ID: <1499357745.1309.0.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-ycJkbB2O8qsm+33v1pn5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--=-ycJkbB2O8qsm+33v1pn5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As I was investigating why my nyan_big's screen was staying dark when testi=
ng
4.12, it appeared that the tegra drm driver does not get probed at all on m=
y
setup (read: host1x_drm_probe never gets called). I have also tested on jet=
son-
tk1, with the same result.

I am using a finely-tuned out-of-tree config[0], but it appears (from looki=
ng at
the lack of drm line in the logs) that the same is happening with the tegra=
 and
multi_v7 defconfigs hooked to kernelci.

First, I am wondering whether the tegra drm driver is probing for anyone
following this list on any tegra124 device with 4.12. If so, feel free to r=
aise
your voice so we can find out what is wrong with my setup.

I initially thought that it was caused by missing firmwares (that are now n=
eeded
for falcon/vic support), but disabling that (by removing the &tegra_vic_dri=
ver
entry and associated compatible string in drm.c) does not help.

Hopefully, I will have time to run a bisect this week-end and identify the
commit that introduced the regression. It would be quite important to get t=
his
fixed for the 4.13 release.

In the meantime, test results with different setups are more than welcome :=
)

[0]: http://git.code.paulk.fr/gitweb/?p=3Dlibettereboot.git;a=3Dblob;f=3Dpr=
ojects/linux/configs/tegra124/config;h=3D4bd57ffdd8fa3d36e5dfadbbafc753a4f9=
b34266;hb=3DHEAD

--=20
Paul Kocialkowski,

developer of free digital technology and hardware support

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-ycJkbB2O8qsm+33v1pn5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlleYjEACgkQhP3B6o/u
lQxSFQ//dFW3NuzEVGjQsu6e2Nk0Vtc8pPLhGA7C75UMaVk/uxMZA0f5gJ3h8Z16
Hh72Dk0DwbGPJTOSkuZn4+w9Y9ITv7NDo2J3fAeVtvSDfG0U7xunLLYgCvDnzXCu
A4gZU+efI1ut40QChbIxYhg3O/iQCRXC6vn6BiMhbCRxE9fj627odeExM8fFSrTS
hFUOQMjG1gRDdzV2NpQF5jNxD+uWN4w+OLXkuaaUqhSk2Ksl530YenHG1NHAVjBb
UR7PBdEAhAOT8MxwgFOxEDm+aF9XHC8UD8E1atzt1VV4dKT0o7s1A6fuCyEnaZxe
oVAwOv0rC9af9NtM+ID1wDejwt6pilrm83hSljEtUy+dM6fMEEzNIWk0gN8lpKir
ouCO44NV0Zd81m+vr5dzqRrR17ZhWs65xICfuXQ+dZg1SHDRXWpf5gQ/ral0pNNZ
hEp+T4TdLNs9Zro0ubhFMjkEsLH73dyjA/6599fzBXCMYMg4JT8bbrwIC3VnhdCo
fQMYcYwUnM+8q5AQpvPfj22lUR26nI1yQoR8DEe1ETm83jgttYqjR9eWryMZSz3+
1TWft0qFjwK7qlWTJ5p+a+ydYxmW6ypVnQOO+4TIpWy2x0rQACBtO5rypbFujNvw
/C3c5WggysbltDoaGUO+MbXq9cFA4bEAMf9WKASEvj7OlASzqIE=
=OPWz
-----END PGP SIGNATURE-----

--=-ycJkbB2O8qsm+33v1pn5--
