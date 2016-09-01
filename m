From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] phy: add missing header dependencies
Date: Thu, 1 Sep 2016 13:34:27 +0200
Message-ID: <20160901113427.GA18255@ulmo.ba.sec>
References: <1472633809-19904-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472633809-19904-1-git-send-email-baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2016 at 04:56:49PM +0800, Baoyou Xie wrote:
> We get 5 warnings when building kernel with W=3D1:
> drivers/phy/tegra/xusb.c:948:27: warning: no previous prototype for 'tegr=
a_xusb_padctl_get' [-Wmissing-prototypes]
> drivers/phy/tegra/xusb.c:981:6: warning: no previous prototype for 'tegra=
_xusb_padctl_put' [-Wmissing-prototypes]
> drivers/phy/tegra/xusb.c:988:5: warning: no previous prototype for 'tegra=
_xusb_padctl_usb3_save_context' [-Wmissing-prototypes]
> drivers/phy/tegra/xusb.c:998:5: warning: no previous prototype for 'tegra=
_xusb_padctl_hsic_set_idle' [-Wmissing-prototypes]
> drivers/phy/tegra/xusb.c:1008:5: warning: no previous prototype for 'tegr=
a_xusb_padctl_usb3_set_lfps_detect' [-Wmissing-prototypes]
>=20
> In fact, these functions are declared in linux/phy/tegra/xusb.h,
> so this patch adds missing header dependencies.
>=20
> Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/phy/tegra/xusb.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJXyBJAAAoJEN0jrNd/PrOhZfsQAKspA1xnbr9eiJ+GRbDorQeF
m6BHsifKHFhJ/6ZgOAvSSyp6LQx8sp4+Xo93OCZwU2UrH8AJcrq+LotuTCdIHKgX
64N8yX+LPuIpnlYy7L7JFgjIjouzuYvk5/yrDid2EcacaWVa+KUpadN9TxKv+Aj/
RU2hq1qlabJH0FYf17cwcJhF/lyJ0avV46Y7Hprog+US81vyjK5E1ZnGDXqdoIDH
lDOo9rKTT7JamxBJMkQ1PIQIyrNgt3PgxollL4BHfVtv03YU/iX0YEu/ynqzJUot
Gn+70dB2JbAc85lKgXilqcIAyP5UmnpVdmlspVcWdoJDcAS7kZPc2OgiaVS+JMVJ
WcPAoEJVWxF9g6IkkzlKtfrUCY/c9M1WV2hhNmhIPKq6ofn/CzgCuaOpvJwM4dzJ
o/Z2OtmFa9LtU/5+L9wXnzTq91HU3nqb8R8LL8UtIvmTRj9g/KEbxAiaQdpL2PU8
4t2xRKQIKcSfCnC3v5JF967OPO1MLmwpG3ZbKEG31sbFM2lBDSFZRMX18ddOE5BF
PhiFOcpnOthxnf3XF/SIbU76Otwp/BXkzG26xvHLZZUD2KAqbvtVllMPYvjudlgq
Zhy2+G645PPapZvDdElth3+njuDxfkMnHhyqqw8rjebHr8b2sRRqR/OAivQ/Sk6i
pNSfl4BwsyLlt+svJ679
=t58L
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
