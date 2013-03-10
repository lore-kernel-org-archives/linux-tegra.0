From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH V2 1/5] ARM: DT: tegra114: add APB DMA controller DT entry
Date: Sun, 10 Mar 2013 23:37:12 +0100
Message-ID: <20130310223712.GE4743@avionic-0098.mockup.avionic-design.de>
References: <1362852678-13421-1-git-send-email-ldewangan@nvidia.com>
 <1362852678-13421-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1362852678-13421-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: swarren@wwwdotorg.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, pdeschrijver@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 09, 2013 at 11:41:14PM +0530, Laxman Dewangan wrote:
> NVIDIA's Tegra114 has 32 channels APB DMA controller. Add DT entry for
> APB DMA controllers and make it compatible with "nvidia,tegra114-apbdma".
>=20
> Tegra114 DMA controller is not compatible with Tegra30/Tegra20 DMA
> controller driver as in T114, the global pause also clock gate the

"clockgates"? "clock-gates"?

> DMA register and hence it iw not possible to write the DMA register

"it is not"

Thierry

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRPQsYAAoJEN0jrNd/PrOhzskQAJQ7KuFg9SozYJTQOxAohR6H
/hOITuXYlGVDSkkV2KclAbvKxtLP7VvLOta1rR7IIsxguB/NVQ8E8RKPo1sihy4U
ChsgmtXnA++1k9EzWIA1cIXNafxqPqZwMIZGV9RBRKITxBbl4mu8wcU7iQERHTrH
yiW1Uk8nsJGIYXj2TBdvxGm1A/GAxDfSiOukn4gEam3ZthYkyIyEcFk55NzbW5L+
fTKktBGS6lGFnlzjGOUsjDD6iH7I8tEftBL0qC6OL4bh+nmjFbVQ3Ox7DBE0VfI5
tXPOrMn5l/cO/u3h7qApHkPZ4znHTNur0YCyIZjD037HBiwykwsGotjIVaF96Wk6
Q2iB80rHRehmmge7rY8L+mj0/CSPQ1sZEKqIGPEo7sVtsAfeXHw51h8XF9Dvx7OW
PyYFZdeFBgffMqRrxiqoAi6iFiEnEvKDmI4KNIlThLkh8Jd0hKB6VqOvPPlb/JB0
YUopjyR0E/19RJc1nlkgnQ08voOU8Ouq12pywG/xvf7RhJUuEJO/AY8y5u/1xYvD
kdISRzx1KRA+AOZOL/J+YdD6uRmqDB70jfXf8mpwyHBC/Pe36INJOsHmc0Jgk7nq
HDvt+ohAo/c1ScrvMAkwSVoAq6rQ6W7qpFMTX5MCxXw9Vt5QeV/AATfFDgJxVGPI
8S9wsqu6GuOXfrImIiZr
=VJCW
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
