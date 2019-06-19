From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 6/8] clocksource/drivers/tegra: Restore base address
 before cleanup
Date: Wed, 19 Jun 2019 10:18:57 +0200
Message-ID: <20190619081857.GG3187@ulmo>
References: <20190618140358.13148-1-digetx@gmail.com>
 <20190618140358.13148-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7uYPyRQQ5N0D02nI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190618140358.13148-7-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--7uYPyRQQ5N0D02nI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 05:03:56PM +0300, Dmitry Osipenko wrote:
> We're adjusting the timer's base for each per-CPU timer to point to the
> actual start of the timer since device-tree defines a compound registers
> range that includes all of the timers. In this case the original base
> need to be restore before calling iounmap to unmap the proper address.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--7uYPyRQQ5N0D02nI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J7/AACgkQ3SOs138+
s6G//w/+LuaiOSjzCI5doh93svlKmXL2y/HbIfj0eUbei7qZ6r2GfkksqnlvkqFB
il0eCJ01RrN0PveODIw/KOYDqQ8++WRCVuneUAOrt9Eh/hrozKuL5gKweyAZ/xy/
zy48TL9ano+8YYtsgq7+7oZ/edC9vLIG/k0JZl9/3NR6+VoTtFFH74TQ8nBgR+r8
umrlMpQhf+7FkzDW07IphsllABb+NdoImqAAudiIl3XQKR7xVQb72i0o5grffUM8
cWnNHGAmDH8IKC+m/cNuUoACuXa+ZQxh+AvXYKiN5rB8UFKm5MccWIdlQHRDlH8E
00sl6mNfMwvNqPL/8oOj7LaLAt76Ypz0jJ3DchpzA6Dno/yT52cdBJhC5lqp1TY9
tCv+vkA24Jqf1LhPdsUzDD0/X/174kDU0xK1KPRHjHfgqgSVWBg3QLnyacaGv73l
WkYL63Sg2OXiPy1VBrq47u8ZmXVJrFL3wFIYMvhIp4X14P9m3fn9sPqKNfVNwf69
I1XX7DQSmxCYCZJnKmCn0A+HwygLVdrXkaUiJfAX5Ge7ICgDr8WsSQF8Q03OzrnH
3lWYmAvnXYd0VpkiA1/RVak7S5OdK0WKlAljNB8we6DwtfPBrJLs7GnOiMc5k2DK
0JeP49BssprFT4Dh1usnOEdBv+GHJMBlR+azMIaorXWS9IFPugs=
=DBtq
-----END PGP SIGNATURE-----

--7uYPyRQQ5N0D02nI--
