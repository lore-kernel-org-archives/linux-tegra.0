From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 8/8] phy: tegra: xusb: Enable charger detect for
 Tegra210
Date: Tue, 28 Apr 2020 12:56:47 +0200
Message-ID: <20200428105647.GJ3592148@ulmo>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
 <1586939108-10075-9-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qD3brAgIG4LbUq6d"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1586939108-10075-9-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qD3brAgIG4LbUq6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 01:55:08PM +0530, Nagarjuna Kristam wrote:
> Tegra210 SoC supports charger detect, set corresponding soc flag.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2:
>  - Patch re-based.
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-t=
egra210.c
> index 7d84f1a..2be5201 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -2352,6 +2352,7 @@ const struct tegra_xusb_padctl_soc tegra210_xusb_pa=
dctl_soc =3D {
>  	.supply_names =3D tegra210_xusb_padctl_supply_names,
>  	.num_supplies =3D ARRAY_SIZE(tegra210_xusb_padctl_supply_names),
>  	.need_fake_usb3_port =3D true,
> +	.charger_detect =3D true,
>  };
>  EXPORT_SYMBOL_GPL(tegra210_xusb_padctl_soc);
> =20

Same comments as for patch 7/8, with those addressed:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--qD3brAgIG4LbUq6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oC+8ACgkQ3SOs138+
s6GgYRAAqZ1IWFuvAMyyIhS3Tm7ZAX3mXGSz2pXgTdb72C4U/EN4fwsaGLdM/qAb
+BFMZQL0uH8xyOJSZYERL2rI1eYlJaLM6ovkbzeuUjOpf5y9yjMATjOTpIccubhf
a/g37osHQ0LnXiZbM4kGCLGssLF4DmwYLMEwcTrUjaptX35yHs1eXAPQDcg0K7gv
+SvIW4PiLTGpJMlVq19BPxsAaHs57Z0n7G09e+gT4Hq24SVbxhd1beL4tqwaiWB0
3oIyejEtyZB9zbg5Vxlhpt8LoIoqxh+J5h7BHG7o+et81Pd2j0G5JTgdvCpakC48
jxFzdkSYBxAduQx26vC5/N88TMjILSspL/CARemnszKBJFU7r/OACAqPrkxvtVow
EQzCB77tv5X0z0v1QErPc+E+WvSzhhuHRvidRjDwztrG7qx8uMfPPZVnGSRiCSOp
qrNGqnKXgtbws9+LhAFlo8R2EyAZ5v7ZoymAmk9aWfVlhr+ohMp8+jWce2A3LgVs
Hc4vEbb/3CrEDdrVGq+4zMLpzdSbIDvQVyAi4Jivv7SwfZ/XbkkCdXHeBmOzgqGk
z86CqPXyD03zNU3SY9Rty3aWCMs0DTuTzW7AYK5TvJXmeij6wLvAwjzsmP/vhZzf
Qh9EO4JYlAD2HuuLQraSISM3g6m5NcHMaHhrVbwH0FF8ey0kKTY=
=+2YA
-----END PGP SIGNATURE-----

--qD3brAgIG4LbUq6d--
