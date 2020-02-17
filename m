From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V5 09/21] usb: gadget: tegra-xudc: Remove usb-role-switch
 support
Date: Mon, 17 Feb 2020 09:38:03 +0100
Message-ID: <20200217083803.GE1339021@ulmo>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
 <1581322307-11140-10-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ILuaRSyQpoVaJ1HG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1581322307-11140-10-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ILuaRSyQpoVaJ1HG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 01:41:35PM +0530, Nagarjuna Kristam wrote:
> Padctl driver will act as a central driver to receive USB role changes via
> usb-role-switch. This is updated to corresponding host, device drivers.
> Hence remove usb-role-switch from XUDC driver.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V5:
>  - Removed select USB_ROLE_SWITCH from Kconfig.
> ---
> V4
>  - Updated device_mode variable with usb_role and remove role variable.
>  - Removed debug log related to always on.
> ---
> V2-V3:
>  - No changes in this version
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 58 +++++--------------------------=
------
>  2 files changed, 7 insertions(+), 52 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--ILuaRSyQpoVaJ1HG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KUOsACgkQ3SOs138+
s6E+pxAAjij1EkuGeJ/PrsnWFIzGxqC2hx3tx1qdlArC6SLmUZDLHbjf30ywoYAy
jJekzHYN6r5lYfVE3HmvsJogBCqRowQYp3Ld7rKzOZdDzCIDVBz9v6r0IJkLYfN3
Autd3TnAI3klGZ9AW37rACQoGVAmcyydsXqdNZKotM9A/ah6/GKZ0qNCPSuZSnZq
4Nwwa3XENQquhGiMd37CbH7MeVgoH2XUsN9DBtGB0t4NNvqV44WPDmy4ExjBj+M2
XZ1chP+ul8n8AvZIWf23QV5mpR3otgCYv8+Aer3tleejbBcfRqDZfroXgahqHCA8
rE1z4ysvSvZMsnh7tl65aFvqxZOxjR5y9ew5qhVqWoqqyKVJJvhNkjteJ2A18BkM
X70TVdZANAcKldv3Az9ojFToCMWevo9oA9ESqz6aTUMQbExD22D6X7Pw2iTFL7pM
0njYV/EM/VH/dsVUg/wgfafpjwJORsmAslXpdHSBN6JbVk2W2EngP8ZHU2lZb1pR
BRwZQCbTA6ZQhwL7tJb2oNpK3/yNz4tgmIkcNCZlNYTekn7QfMWecF98JZKBONYH
ONTmlT/jdbI+UmOYV7TeJWRlhFilwki0hy58374sFpH91bhuNr7mY9yQWEaonjYc
FGearA2eaxKwp8q6OjbHFnymA5KRrU9QnAt2tP3+1DTuqKKFOTA=
=SV9f
-----END PGP SIGNATURE-----

--ILuaRSyQpoVaJ1HG--
