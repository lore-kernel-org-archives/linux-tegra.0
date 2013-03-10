From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/5] rtc: tegra: protect suspend/resume callbacks with
 CONFIG_PM_SLEEP
Date: Sun, 10 Mar 2013 23:30:15 +0100
Message-ID: <20130310223015.GA4743@avionic-0098.mockup.avionic-design.de>
References: <1362852588-13362-1-git-send-email-ldewangan@nvidia.com>
 <1362852588-13362-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362852588-13362-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 09, 2013 at 11:39:45PM +0530, Laxman Dewangan wrote:
> The CONFIG_PM doesn't actually enable any of the PM callbacks, it
> only allows to enable CONFIG_PM_SLEEP and CONFIG_PM_RUNTIME.
> This means if CONFIG_PM is used to protect system sleep callbacks
> then it may end up unreferenced if only runtime PM is enabled.
> Hence protecting sleep callbacks with CONFIG_PM_SLEEP.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/rtc/rtc-tegra.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRPQl3AAoJEN0jrNd/PrOhZi0P/RCrHDh6UdZSqgeprjSBHqBi
7AlbLPU3XbPjTI6JQoEvS2f4qBz9reNr17PNk4orJo6PnOB0dxEqL9MCJfXxeN06
ULRiyzPcEKJ0a2J/ZTKbo+6Hy8p/brPQuPi3sNqX8QMIfNrIjBOXh7FPur3wm1RR
R1rnveC8LYJ5a9cLGuX8iYBJuBdmpKfAqXF+WdqRoBGnwy7JSpSIyK/yY4Zw9UOs
vDTRgSM5ss9q4GxpX0RHNVRD51JUJ8mAO96RTsTYQ5GREnoTWa9bELGjEePYagy7
tZ8K5j46z/b4k2cBAAtQqjqGGbn3OEgaHm23M/m06jZ33bLlqhkYgykERRCJ6MtF
HAzGa5RFUEluzvV0FOfd3v3/BLuNocX+0mMTlvb5UWClOemzSdSy3phrapIxvyPs
vzTWf11867Kg2zyiu81GWdoqjCxbmwC1IGyjs3rPvPwEeOvFX9iYKMMK2gVFN8Au
FRDtzQtEExvfb9AqTqJwDds10R1CRzCp3Ux95oMi9eGwCev8lJZJgvffjeoBpu1e
qU9N4XTtF0Gmysy8Exdq6y3CEqwWhwo6mPYKJzbR92O0X596lJs6xgVrXoJzt+2U
qFenDDo9tj+73jh1ESELQZCwXlZvxOSDMPYm8Pj3X/KtUt6qb7IPxY59DcqPX/99
KEPa2FU81fRYuI4wfqre
=ON/y
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
