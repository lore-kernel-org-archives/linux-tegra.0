From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V1 2/4] arm64: tegra: Add xudc node for Tegra194
Date: Tue, 28 Apr 2020 14:16:26 +0200
Message-ID: <20200428121626.GL3592148@ulmo>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
 <1587022460-31988-3-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m+jEI8cDoTn6Mu9E"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1587022460-31988-3-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--m+jEI8cDoTn6Mu9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 01:04:18PM +0530, Nagarjuna Kristam wrote:
> Tegra194 has one XUSB device mode controller, which can be operated
> HS and SS modes. Add DT entry for XUSB device mode controller
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Looks good to me, I'll pick this up into the Tegra tree.

Thierry

--m+jEI8cDoTn6Mu9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oHpcACgkQ3SOs138+
s6F38w/8DcNjQD7ygu05FLIvH5mMzvp/ZOq1zIJxBqJ39kNj1aGgyT1wlnw0d6o7
MfdVgIC2Z4rRXaGjGkD1UAvatjkgOUhdONYBJVM7FvoGmv/+1KRSR03ibr+EZtvy
WfCxoj11GHauJlzuYulg+6fpnCxzhXn4RSBDSm1/12Vp3BbQvjOcdidEHCQYbDHy
mV8ylgoNrJ/DW56wsWlMYsdoTWBuSh6S3NsC1rEzKVs31+qcp1qIhVTJegdS4KZF
hr6QasS7SQy2z1VRkFqh+D4fRUErOWHiheJ0EPO/UQpQTnQQW3hO9IHEV3r1N3BQ
SJV6/4pDaJuKJE1qXfu5QfqYuoD5ZR2ViWE3cEc6VNxGoRu1uGTfs+/fDi0Bz6oR
INDmJuNXyB+KtrWWooSQMOZ5naawEDRHojCvDJUA+l/474MI6v/RxLCoj9QD9ECx
AvbALWhpwSzUJWszB4cMBdMuDmKE23V85gDU4Md7VcwqOSelUnoauVeVNmlKwAt7
Y4FmRC5pL7CZCnP0jHGAEexEnxQaCbMdXe3TN9eRt5RVqj0ks3MkWyJ7PIu63Bu1
o4yZma2mkq7skiM2e9Ari8JgMBQ+EjBHtpG4kshmkJJpzbrDHH79f3w9hTw49q25
MCSr+mpc2gnWKx1BPBJHlGSKVVHXyWNEWWFdbI4eK8dmnsVnm0s=
=2SXp
-----END PGP SIGNATURE-----

--m+jEI8cDoTn6Mu9E--
