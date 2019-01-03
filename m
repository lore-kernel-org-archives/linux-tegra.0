From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3] i2c: tegra: Fix Maximum transfer size
Date: Thu, 3 Jan 2019 09:55:26 +0100
Message-ID: <20190103085526.GA9287@ulmo>
References: <1546472423-31366-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546472423-31366-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 02, 2019 at 03:40:23PM -0800, Sowjanya Komatineni wrote:
> Tegra194 supports maximum 64K Bytes transfer per packet.
> Tegra186 and prior supports maximum 4K Bytes transfer per packet.
>=20
> This patch fixes this payload difference between Tegra194 and prior
> tegra chipsets using separate i2c_adapter_quirks.

Nit: tegra -> Tegra. Otherwise, this looks good, thanks for fixing this:

Acked-by: Thierry Reding <treding@nvidia.com>

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwtzfsACgkQ3SOs138+
s6FVvxAAs+rLBxy3s/FyAfXLpOMjYae1qqNaZp+hR43PD1b707auo3m0ZlKQVhiM
xMbja+Ego1lHvZ+E2LmlqBAgTe3mVbG7lfQHQYAQzhpEhocSai7PPN8v1UblxpJd
7Dm5DEo0ruwgmB91vVAbVdox5hfXh0nvf/MLVmUTwllaCQMVD/eYphGMCgWxMJHE
xc9eRb8cSsszPgDDiLlDIh2jIogPBUEtO10HXVG0hIftWA6p/ddww1nbmrF0Qod1
cIxydCw57/JXV5L3VvzGm04+uq9Iwk9wPhCNpnTvrXFjXxcHuSw1AsOTFJKAJGRQ
t6B4J1Bk9k1gto9m8+D1updzLy5MJmIvicI2RIdbdDxwrnXjJztvjORy4zjS1kCo
qdTwwZg0HTM/fiG/2j+ouMqL+ov+HJ4epg1wcRideziGQypnjXwSNtPDXlgyUd55
WXnmNXn/9E8oDTTc2hSwfOTmHCiBfGFv6kuaaTNklZ+/0WM2KjQdYGx/ECEIZJFP
26RZqTKSiIwzb/XeodhAYS4slaG6TV1xR0xAEis5FDSTTzusC/WPszwNi0VMu945
kFnztKIKEzP6SrkoaXmvV9E8p9PSMuYky/+WLXXrx0uhqdJTsCX3yZeVhYmqAjSP
f21ZrThraNKUlaOBWj711mi6utA2cMOnzXtQ4zAmzQzr7Lr7XB4=
=XPLB
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
