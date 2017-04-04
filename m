From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 6/6] soc/tegra: Add initial flowctrl support for
 Tegra132/210
Date: Tue, 4 Apr 2017 16:02:13 +0200
Message-ID: <20170404140213.GI843@ulmo.ba.sec>
References: <1490704978-22906-1-git-send-email-jonathanh@nvidia.com>
 <1490704978-22906-7-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xQR6quUbZ63TTuTU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490704978-22906-7-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xQR6quUbZ63TTuTU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2017 at 01:42:58PM +0100, Jon Hunter wrote:
> Tegra132 and Tegra210 support the flowctrl module and so add initial
> support for these devices.
>=20
> Please note that Tegra186 does not support the flowctrl module, so
> update the initialisation function such that we do not fall back and
> attempt to map the 'hardcoded' address range for Tegra186. Furthermore
> 64-bit Tegra devices have always had the flowctrl node defined in their
> device-tree and so only use the 'hardcoded' addresses for 32-bit Tegra
> devices.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/Kconfig    |  2 ++
>  drivers/soc/tegra/flowctrl.c | 31 +++++++++++++++++++++----------
>  2 files changed, 23 insertions(+), 10 deletions(-)

Applied to for-4.12/soc, thanks.

Thierry

--xQR6quUbZ63TTuTU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljjp2UACgkQ3SOs138+
s6FUthAAu7omkNKYMYWO1dwRjdoQ22CE7bOO5oX7JicPxXbJsayTa0EsagXnON2A
REm4UnN5kfWEwwW89VimfcUw75D8rY2R5FXaHBf64mM3y3N+Tz6aQvB6f5B9uMUB
xAx5BuGjG9X5aeAbNFUZWFnClsxqgAO4hbGnBZTRz6/vR28ZketC6eBYRmES+jNH
FX9MXBXbfgi1Y4qxVtB7VOz44JeTOvAihksbYOHZK+187WXfgfemqevNdYHMtGMV
6OWzjzgDZM4gOUpIDDVCLjetYxu8o0b648NEr74SShOsQNTy5fHKgDWe5SY5Gdmr
EibaWTWJGEJ7jjh0CjPTk56rIPjg35lqm3FzUFC7cZPpQ+vb3t13edpShJeD0alu
bBVw71hG3CkQCKMQH+3k7VEcfzpP3opSNCON8/vqDT+TT7TjC+S5+7fHRu4IIZUK
+Lz8nV7LcKWUp5mwFgQKHdcSQRVUNr+UcvL0TFGPXC97tk0reJuYbRvnmj0GBCP2
40aAsiNzi/tfgIoxbBqnHC9NIEBhwX+aPC01xaSyV8Q62WYjUkmfaEzXGs70w/+g
phDHgqLXelw1exns6UCxKtapfSHT9uBO15zGNhAyhZGLvzZJ1W02sSEfVsX5Us/U
NvTmKP2WNZpHv3rGu24kwH5fOreLCfEf2b20Ezg1mjzCbQt30gs=
=yzeu
-----END PGP SIGNATURE-----

--xQR6quUbZ63TTuTU--
