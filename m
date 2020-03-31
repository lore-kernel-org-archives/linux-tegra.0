From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/9] gpio: tegra186: Add support for pin ranges
Date: Tue, 31 Mar 2020 22:53:04 +0200
Message-ID: <20200331205304.GD2954599@ulmo>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-3-thierry.reding@gmail.com>
 <CACRpkdZ-7Fm8uPYoE6fL7WXQYbdV-nW_Ttt1ggXSApxMi55ODQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OROCMA9jn6tkzFBc"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ-7Fm8uPYoE6fL7WXQYbdV-nW_Ttt1ggXSApxMi55ODQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--OROCMA9jn6tkzFBc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2020 at 11:39:35AM +0100, Linus Walleij wrote:
> On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Add support for Tegra SoC generations to specify a list of pin ranges
> > that map GPIOs to ranges of pins in the pin controller.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Patch applied!

Hi Linus,

I see patch 1 applied to gpio/for-next, but patches 2 and 3 don't seem
to be in linux-next yet. Did anything go wrong with those?

Thierry

--OROCMA9jn6tkzFBc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6DrbAACgkQ3SOs138+
s6Fjig/+ITFzu90AVbO2aoJvVTkwo257Rmutpy+shRroAqnbY0/JvKMDCnESkeYU
lWH/LBVf5dxgmr+z6E7zlEHHyHM8atMziMVVLgu9st9GAOljFXf4Ia031HNVZNTb
1L+XnasEKcYtInDbw0d0PrdzQVXQ9QV1/mU+FZX700wRRz3TvOqFHybztn7dZ1Yg
x0KIVC13UNUIvFFiMb184SgPCgCxWVybVqSCbjSd+VgSuwCmfwCTkFYXQ95YWF5F
zOcVAScfUtbl2e2E/hK0yDgwEarNDrDUhsZeOFO2Z6MLeSXyPP9uI8Dj9eFQTVJq
JXYEiUL3eKGhXIQ68F7kHdrl2i210Z0GzzfQR0zJm6REOn06yJcpUaUIk4ZrG/a8
HY/bEggZvz+XlSST8fd1+e1BLzLkcp+lXwb55WoWluKND8WZACjn4qkS/uA4faFH
aWoPdCef9LzbOqHlZjZlT4pMApWv5Jtw32AXW4hH5uhTAl+L6YbIiFYfy1UB2BFU
/ynGkvyhsjwi0aHLsjW4xs4pwIpRssz41s2jYjrMQBuyjinfF2WMsKB+XLvrYwBK
bU+0XTHDouN4eNh0OltOdLiV5XljIP6/mzF9bZN03LDwiqwB05Y/yz7/Gq2wnmXB
5nYU9hkjIWJLX5JrTvtYY5z5u527He38NZRQEKDMvILC6/TUWSE=
=Ezrv
-----END PGP SIGNATURE-----

--OROCMA9jn6tkzFBc--
