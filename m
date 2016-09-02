From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Expose color key and plane blending controls
 to userspace
Date: Fri, 2 Sep 2016 17:32:19 +0200
Message-ID: <20160902153219.GA396@ulmo.ba.sec>
References: <20160902093359.9063-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160902093359.9063-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 02, 2016 at 12:33:42PM +0300, Dmitry Osipenko wrote:
> Chromakey is a simple way of video overlay overlap implementation. This
> patch adds 2 new IOCTL's: first - sets color key and is common across of
> all Tegra SoC's, second - sets plane blending controls and allows to
> utilize the color key, this one is exclusive to Tegra20/30.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c   | 150 +++++++++++++++++++++++++++++++++----=
---
>  drivers/gpu/drm/tegra/dc.h   |   6 ++
>  drivers/gpu/drm/tegra/drm.c  | 159 +++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/tegra/drm.h  |  14 ++++
>  include/uapi/drm/tegra_drm.h |  34 +++++++++
>  5 files changed, 337 insertions(+), 26 deletions(-)

I think these are really nice features to have, but these would need to
be exposed as properties, rather than custom driver-specific IOCTLs. It
seems to me like the colorkey feature could be implemented in much the
same way as in the Armada, RCar and Nouveau drivers.

As for the blending options, I think they should be exposed in terms of
the zpos property, to allow generic userspace to make use of them. Also
can you explain why this needs to be exclusive to Tegra20 and Tegra30?

Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJXyZuAAAoJEN0jrNd/PrOhvJkP/iuNG5UBPC3uf2TYy5u2UgSh
t2j3n3E4zmfzCrtB60G0Udt/v5LVk9POiGIQrfgidXqbeKeuiWYbLW9Bp9KDGPBE
5HhgJlUMpIKgzGJwnxvM5XxM6/mJuxxLVFPPmWadrH7JIMXgV6ADy45gBd+MbLrv
MYVi9xAhumHJq225cTSkHinYY1+HkWOg30DRxL2/kvWeCvkjnVjyLL0dr2mzL4pK
56GErgwFI+1CkjbjMCpy/00QN/3J1QJjIPxqCMV8uqXysszQ57RCROOT+M7TKcFb
HS1xdRIOC110TO50CXwhYg2fQRmQ+tKnXV7s1yeSiiW4Kdut3j0bHAZO73BbsjZK
dCkhSh9Ewq8YQS8U2i2iKYdapFP3C9eoOcrXY2eJ2vNnvMXDehyXugW2tRI7ZoQb
Q9X3LNK69ekGw3fCef85yuCGedHXSScpQRmYOELQwnIxUtwdb9bbu4ooiaIsEQBx
kgdCEvIhV/QmhqrclQ0SiUP5BEtoUTPiFkzVdd4Qqe3T/1L/kyj0cxb/Xtwi3xpS
A3quEjMGLQFbN1tGtqQFdXbxwrYHHwzWj1K/8IhvgeL9NKayUP6CVL+CgSYpXQ5s
kGroGXnZSFyw8KSg343BILKrgn7Hpmi196h22VfGKInuPhlMgkbP5jAfPav+VSOx
p8n/44FASKqwu3yQckXI
=nPNp
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
