From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/8] usb: gadget: f_ecm/f_eem/f_rndis: Setup quirk_avoids_skb_reserve
Date: Tue, 15 Aug 2017 12:49:55 +0300
Message-ID: <87k2256tz0.fsf@linux.intel.com>
References: <cover.1502280694.git.digetx@gmail.com> <4c7b3a3b23b44f4115de1745c65d719a3f70c4db.1502280695.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4c7b3a3b23b44f4115de1745c65d719a3f70c4db.1502280695.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> This quirk is required to make USB Ethernet gadget working with HW that
> can't cope with unaligned DMA. For some reason only f_ncm handles that
> quirk, let's handle it in the rest of the network models. All models have
> been tested with a ChipIdea UDC driver on NVIDIA Tegra20 SoC that require
> DMA to be aligned.
>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/gadget/function/f_ecm.c   | 7 +++++++
>  drivers/usb/gadget/function/f_eem.c   | 5 +++++
>  drivers/usb/gadget/function/f_rndis.c | 4 ++++
>  3 files changed, 16 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/fun=
ction/f_ecm.c
> index 4c488d15b6f6..1d198055fd74 100644
> --- a/drivers/usb/gadget/function/f_ecm.c
> +++ b/drivers/usb/gadget/function/f_ecm.c
> @@ -584,6 +584,13 @@ static int ecm_set_alt(struct usb_function *f, unsig=
ned intf, unsigned alt)
>  			 */
>  			ecm->port.is_zlp_ok =3D
>  				gadget_is_zlp_supported(cdev->gadget);
> +
> +			/* Setup DMA alignment workaround for UDC's that
> +			 * need it.
> +			 */
> +			ecm->port.no_skb_reserve =3D
> +				gadget_avoids_skb_reserve(cdev->gadget);

looks like the quirk should be moved to u_ether.c instead.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlmSw8MACgkQzL64meEa
mQZbcBAAw21yzetAeI4imvLnk/589CaT4m8RHDehtNlqduAAY5uNni5YcOBhCnCS
V+1Q8eOAXHOSyfECh7UIvfH3J0ckhwFD32eOPjNL7SchmjZUP/e6uQkqRTezM5P1
YpnWQFmZ/6zlFJxFweeSS3eKUfHdlFajtqI+i7Fh2uu+Nx/mvYmHM3fXfOWU15Ju
GSanHpJaTC7p+z3MLfFL2CkFTkuk+QGzB8oo1Ki2EVCTqG7QY5mrv16JpanhEs7b
Od2GE4llLrGj2HSXNPyfjqLyEVeVJsaM/6uNx7MXy2kLpb/c3t0m1P5/MnM6hqpb
Bxi+1yzAeFUL36ae4+JTgflMVcGHeyGtgenjVBytJP0XDEzYFYB0NO1HNwS99hps
eZPrn5t60c/EbQlQxnyxgkZU0GmOj21kUA7c8ysmco8i1GXaAqZzludxpE/b7Kmb
H7hMpGvoVrshbGqv2TNP2EFWeKjRkJw/hnVKip/QYqm+4OBCSCzZdbxtiV9Ist/4
00AN+lL7lfIJdkdIttX4D0WpQISjgTNs8k3re0XWizc0x+34vOhKwowel2aiE29m
Bd971swFUnloid6mxdQIiAilUjOjN3LpunZq76M7YxD3sjtciw0flM5Thqjr1KNC
tXmk515vhKslIVt08QYEW9Rr4mNCivE/3/YaEHMHwc3hICpGPk4=
=sNka
-----END PGP SIGNATURE-----
--=-=-=--
