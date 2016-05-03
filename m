From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: tegra: fix compatible string for Tegra132 fuse
 node
Date: Tue, 3 May 2016 17:21:11 +0200
Message-ID: <20160503152111.GC19539@ulmo.ba.sec>
References: <1462266577-951-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462266577-951-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: robh+dt@kernel.org, swarren@wwwdotorg.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2016 at 05:09:37PM +0800, Wei Ni wrote:
> This patch changes the compatible of Tegra132 fuse node
> to "nvidia,tegra132-efuse", instead of "nvidia,tegra1124-efuse".
> Because the CONFIG_ARCH_TEGRA_124_SOC will not be enabled for
> Tegra132, the fuse driver can't find the corresponding node.

Okay, that's not really a good reason to modify the DTS. What we should
do instead is make sure that the OF table contains the entry on Tegra132
builds. Unless the IP block really is different and Tegra124 and
Tegra132 aren't compatible in this regard after all.

In the latter case the commit message should reflect the real reason.

Thierry

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXKMHnAAoJEN0jrNd/PrOhyXAP/17X5cNsTnPZlKl/meWm26x4
2zvqqR405vPMaVASWfW/o/8Vi7B3aIuNdYasGbYh6nrhXC0jC+2+jxsLJFVQ82OA
YzGEhX6sywGAM5HVfr8YgMUuZnqnN1ev5SVAV9u9aj0fy+Kz2ya7tKVA5eUDx/Be
3xm5ZrFZ8h8zRnXYCCM2tOOmoOUVLzDpWVJ5zWWwFGgk09vRTBKcNkUMIIE3cysz
o20Tyj3S8gcy2Jnrs1aoUGZWHcmlAV2Pa9FrkBYJJqmXAALcduzM7u+0uf7t45zU
EhXwwUfU3Nu9gO9vZf0QFHR5L84pZpTD1v+nX7uV2/9FSbQam1s1EH4Rk4KbVuQq
aRwWQKPuH4Gcxb2LfZVZjRafpCjupkxWaMR+jLX1hxKO/RmLd/mCenqOgiegJ2vG
fUUJOwJXIfVl+e00ku4RxpSs79Jz6YqLYgkQ0ISogfIhIaXxpCSdTsNB+stG81YN
zT+i2kZ3fYyoTyITIKLPmRK4WEhHBVf9hTK/KYy3Ayqo2CvRjmk1HNwtP6jjibvQ
TMGQe158Pp0Wwb7Z50yn1iq10kbBTyvcXRsGUYWxZGtuKIQ4zrqFXOXC6G4anhgk
dsqif4tDGsH7WRXdMVSTL3hnJmeQiFoKg/HyooVLujrXwQ49f3veC5Htts6PrnNT
gSjaF3h3UZTELX/ljP0l
=k9lg
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--
