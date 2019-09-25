From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/2] net: stmmac: Enhanced addressing mode for DWMAC
 4.10
Date: Wed, 25 Sep 2019 13:17:06 +0200
Message-ID: <20190925111706.GA762@ulmo>
References: <20190920170036.22610-1-thierry.reding@gmail.com>
 <20190924.214508.1949579574079200671.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190924.214508.1949579574079200671.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, f.fainelli@gmail.com, jonathanh@nvidia.com, bbiswas@nvidia.com, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2019 at 09:45:08PM +0200, David Miller wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> Date: Fri, 20 Sep 2019 19:00:34 +0200
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The DWMAC 4.10 supports the same enhanced addressing mode as later
> > generations. Parse this capability from the hardware feature registers
> > and set the EAME (Enhanced Addressing Mode Enable) bit when necessary.
>=20
> This looks like an enhancement and/or optimization rather than a bug fix.
>=20
> Also, you're now writing to the high 32-bits unconditionally, even when
> it will always be zero because of 32-bit addressing.  That looks like
> a step backwards to me.
>=20
> I'm not applying this.

Sounds like you would prefer v2 of this:

	https://patchwork.ozlabs.org/project/netdev/list/?series=3D129768&state=3D*

While v2 didn't have a cover letter, it did write the upper 32 bits
conditionally.

Do you want to pick that up instead, or do you want me to send out a v4
with the cover letter from v3 and the patches from v2?

Thierry

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2LTK4ACgkQ3SOs138+
s6HijQ/+Pq/zxEk+Hd2Tte3ohElo3VjxVScgrj1Cr48KuVRw4g6upLfx6LUSSDKb
GPv/gGq8gqiP4AL0F9TJvzntRTpFIMvewGXxbIbppe9J0kO+OkcRGwMV10pBCyjU
i8FGO4kGvg+Nv6Hk41ZlJ4Clzc7BfBYhEQN8azZu+0EshNbGd0IA37Njl9l37fuP
EkRQ2hCxz1v/iPlcxHan4k4+oWEJOdTIkd44VywVvdzY8BJQKFNiGtdEdzBt4d2n
gjFexFnDwsMafjdHYOGVrRnBHmGoaqL+z7uTKdktzXEAExDCBqiZcUUL3pJw5aP5
3gwRRYWxmeGz3B62AAb+s+mBU7QcM4Q7hyQuVHQ9XSwTX6Qvrdu48BN/e0TdR2cz
uGxLlLDYjCVeFuUoQ/xoQkMSES6rxiNVpAJnnv4Gqf70OrXXojQBgnQTDPYllBeW
MzE+DhiLXveadYG0h01UlmFoyuEjlXa2VspByZb5kBZImG3eg3vKumoLKuakB18d
qiyK2B5QZBKj3ywjwtgRRqH2UGdb8lq8unBaR13hFaFz79+F8yUTDKyfLoFf1DsI
qRkiuaL+SD7Uat8v5Be5rNpUg8M6j+CphDKLrU+/5NvgPhdpBMYoctjqqI/V/gGH
aiBW527bCgsbjAvV9HBR5MdrWAspx1H6Cp60ZCEBNWZeoYOQUMQ=
=iMf9
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
