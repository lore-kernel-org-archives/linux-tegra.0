From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 4/5] soc/tegra: pmc: Don't power-up XUSB power-domains
Date: Thu, 11 Oct 2018 18:50:47 +0200
Message-ID: <20181011165047.GD7393@ulmo>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
 <1538143910-24400-5-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1538143910-24400-5-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-tegra@vger.kernel.org


--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2018 at 03:11:49PM +0100, Jon Hunter wrote:
> Now that the Tegra xHCI driver manages the XUSB power-domains itself,
> remove the code to power-up the power-domains used by the xHCI device
> from the PMC driver on boot.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 16 ----------------
>  1 file changed, 16 deletions(-)

In case somebody wants to pick this up along with the earlier patches:

Acked-by: Thierry Reding <treding@nvidia.com>

If not, I'll pick this up into the Tegra tree after patches 1-3 have
been merged.

Thierry

--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlu/f2cACgkQ3SOs138+
s6Eh0BAAqM6Pa4vYLJq0XAt3XNAIbuE2qQ/S7MI8bkzjlmHeql5oGCVJo2TiDpdG
O8vOwggmJ3K0XxYP6LtQq9rLtigC8e1QEQiYLRYygTVElYl+VyE6c4qyu2ZwStdJ
dcgO5kCh3ouG8oJOdUNMWowSNUenw/cLdAGxAMqHEjnRRE2GbVh1Wnxc/ZrkfXDt
ZkEDjoHTMWpD+/Px0gd14F/viPjYbyQnBneAzm70fYCHAhwM/Q+UCQLU0wd0EPj4
aYs1Mp00Gx10yoI/x97BJQkuTPg+Q3xaUtWz/MlO/E3XYiA54fEiacPiM/IhL21a
w7UXSdkgucoifEXB8gfLh1IXdKmMDiHqESWpBxhYi9GuEZRs4QY15JynonaQDlG9
Lb1hqJnxJBQ+1wocWsSs0SuhMoxlCH3MkeTIYeqC08a9ayb8DPap6QyAM/9W8wZg
TT7m6PvDACz0O+ef52xnd29CLyKPtBF8YDSUR0c4Ymzfi9Uow/wpAkveprWoq/OB
HX8rnGw1ncXcp9WIwlkEZMUB/4TNksDu8tE4W0yx8y09tZVRFI4Qkfz7NtkaqS1w
Bgl3DLfoEoDcjB9qdnfNYQJ3JaHirqCMNhfnB7BT0KnMbLzNIqeVpSgM9LrW+thn
0Y9GiKC7wYLhTGPiCZ7sD1dFSguoYQzeqd97kMo66jPvjRw4N6g=
=woEy
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--
