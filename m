From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: host: ehci-tegra: Remove superfluous dev_err()
 message
Date: Mon, 6 Apr 2020 12:05:14 +0200
Message-ID: <20200406100514.GC475759@ulmo>
References: <20200406055530.10860-1-tangbin@cmss.chinamobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200406055530.10860-1-tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tang Bin <tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
Cc: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2020 at 01:55:30PM +0800, Tang Bin wrote:
> The platform_get_irq() can print error message,so remove the redundant
> dev_err() here.
>=20
> Signed-off-by: Tang Bin <tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
> ---
>  drivers/usb/host/ehci-tegra.c | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6K/toACgkQ3SOs138+
s6EFiQ/9HplumsKrtti66E0YSQfH8LrXsSNONksobklebtje7hxEn+0GDKDzoFT8
yYMmEQMLLwZuOpaK884bFA8FZ4hGtZp7lNNV7oBJkkb/Ecfmsz6IL32LwEhGMWXr
aGYYctiRXIUJNjVcE9dCIUArp8G/qzNmrb4rOv4/EqXw50FIz5DdwCWiQiDEmpBO
kr/qnxF7fUPCcKJSIeoKGc8GVv61ML3YAUVC7tgLYLKSde8okR0fGtSnkwdSPGqS
HBoJ5gKHCizrbvP2z9Fx0Ek1jpmutscmmigR3oidgefcLqqRhEdek7b4phZmmGHE
Aq5n3Vbgqwcdh16WAvgz4Zen+8MF2sMNHWYGDY/PxzzBnVAimqptha3D1urc1Oda
OFJ679xu1DK2hKiaVnb7zDpD9DtARuy3JX8JyV2TuTd43Q59nLN1L5GtW3CtRYmg
LzN36Y8v+aB3faNkRDI5tipxkRezOJxTO2ETIISqcnvwqEn5kWz0LQ3MOxZFuiv0
/GzzbWTC2zIyaj8Hhyc2yokNXRdblt64alNLeRzNsHmieweoW6TUtxDb0pwdSBJw
BWhlF5PnzzI810uaxyVDt2B6O7GfN9Au84gM+MdkDmIY0OZdyikVq8j1vHzGpxTY
nQAJ+8b6zdgjh/WMnljO/EvkiFAF5e1wyjP1MsR1EfATzbJNeWo=
=B7KZ
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
