From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V5 10/21] usb: gadget: tegra-xudc: Add usb-phy support
Date: Mon, 17 Feb 2020 09:40:20 +0100
Message-ID: <20200217084020.GG1339021@ulmo>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
 <1581322307-11140-11-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MrRUTeZlqqNo1jQ9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1581322307-11140-11-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--MrRUTeZlqqNo1jQ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 01:41:36PM +0530, Nagarjuna Kristam wrote:
> usb-phy is used to get notified on the USB role changes. Get usb-phy from
> the UTMI PHY.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V5:
>  - No changes.
> ---
> V4:
>  - Addressed nit comments from Thierry.
>  - usb_phy_event is used to detect device mode instead of usb_role.
> ---
> V2-V3:
>  - No changes in this version
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 48 +++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 45 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--MrRUTeZlqqNo1jQ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KUXQACgkQ3SOs138+
s6He/A/+NvmNzVycAfLDcJJgsSNYD4OlUiIZfaPP1qgjhMSdtb0HekLzdiKabsPz
jp9VHDewmnEGM8Dg89vurRKJoAAMmVBTO9SrBAWcEp3ld+dLguxLG+SVpL4Ji+9S
tl8zybuUHDNmxZLVQ1Haxmba0KaI8OuaN4bDDB73WPCXS8I753N18QN/eaKuE05+
XjjhTmtcgmnWOyxZOf7x4V695kmFmUwckoCaSLGE+65Cdl9xifi5krBl6NfhfNKO
O5AcGRmBLmtVdw6AjekQJJ9ZT7PTlBYaZnwUso2GKNOSNQWzk9nNqSZn/eeXpUgD
1di8H0Fta77xSGiTO0dG4xln2B1sktjscc1Kw0xkDZLxeWS2neN3TvjYGuXzROhe
QAbpGEG5BvA/K+7/wHP9jFEfXUh+MEzHyTpsUju55jgk7LzfL7jUfMXdu8iVcnax
oDKdtyC+x8ugUFr3Uz/9TorjGTbKMnBV1li8CqIwMpFZBCNqnuN49PMJPkrjgCB2
o6OTtuYxtadBB2qAoO/8LIM/0c0je7yy7it6LjPCp55ELZmjaajeBWrEjDPvXNPZ
Fm8NkfoG7mtVCSCUQtGv/0rktNh9rCbg57JRmLPIW5yRlQL0jrVUCPAfEqD38X9s
intiE4YDqHbL8m/1RpNiM3nWvM+kNrC0TBNSSrEIwOQtIyAVEK4=
=gtx2
-----END PGP SIGNATURE-----

--MrRUTeZlqqNo1jQ9--
