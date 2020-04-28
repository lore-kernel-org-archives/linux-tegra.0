From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V1 4/4] usb: gadget: tegra-xudc: add port_speed_quirk
Date: Tue, 28 Apr 2020 14:25:12 +0200
Message-ID: <20200428122512.GN3592148@ulmo>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
 <1587022460-31988-5-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NJSRbAqOy4NeGDns"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1587022460-31988-5-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NJSRbAqOy4NeGDns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 01:04:20PM +0530, Nagarjuna Kristam wrote:
> Add port_speed_quirk that modify below registers to limit/restore OTG
> port speed to GEN1/GEN2.
> SSPX_CORE_CNT56
> SSPX_CORE_CNT57
> SSPX_CORE_CNT65
> SSPX_CORE_CNT66
> SSPX_CORE_CNT67
> SSPX_CORE_CNT72
>=20
> The basic idea is to make SCD intentionally fail, reduce SCD timeout and
> force device transit to TSEQ. Enable this flag to only Tegra194.
>=20
> Based on work by WayneChang <waynec-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 106 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 106 insertions(+)

You're telling readers what you're doing, but after reading the commit
message, I have no idea why this is being done. Can you provide more
information on why exactly is this needed? Why do we have to limit the
OTG port speed?

Thierry

--NJSRbAqOy4NeGDns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oIKgACgkQ3SOs138+
s6H1XRAAgIkN+EUOOO1bRRCqdItpBhUzAnXz56qxx16NpYjpIjJPHwPtCDwb2XhK
NK6gSk93H07QtoJtWLRt74q5c/exqcYbFDpP1Zx1tnPaK9IlTi0x450TBO6cW5QC
NDeOAyRwckbJT16Iab59ZOM6uSIW2VnB2eHHmEiq46mKPm/TQb2aE3lJMjkNskE7
ZzW7SCNwfkJu7r8WcDq/+4jYjg+/0viQ/jd8gyZCJ+WqQu+G6qlPws2D7sVlta6Z
PjC4lWFddArpC6W1Xvhq+I0cDJ4ActilTeIeOnSPF60T52S1Uso4cJRBn0AwGcaG
Eoab3z2D9s1HkbvCwbteWpMnXWuscXasxKonQ71Z4ifwcQFxoXRtNLBFKrX+Zdxy
azEmdmu/6WF5AY28LvmM36UzWvQgPcXimOE2Bb+fOUOb7jW4qtqTNbBPtSJg8zqP
NlzMxQ5JDfxhdG7W/A9MzV31cuDjLSWCI59BGSEOcoKjN3ehapybAHxfacvpqarz
VoEvo/KG2AykqH8Xx5DJU7eLyOHZKSTF86mHKCucU2G+7NcdMi+j8kQwhzY41rDH
2G4Jh8ycg/HpjIdQLXebWLZh+afh2M0LxX9ShM6MJ4KrTph0hbnzf72mCHhmRzFk
C5g1JrwbmRR+tdwsfbSUHOnK7S4J+kG65VCCuyKexREetPWzeY0=
=KTH2
-----END PGP SIGNATURE-----

--NJSRbAqOy4NeGDns--
