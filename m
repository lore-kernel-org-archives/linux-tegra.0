From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 5/8] phy: tegra: xusb: Add soc ops API to enable UTMI
 PAD protection
Date: Thu, 4 Jun 2020 15:58:46 +0200
Message-ID: <20200604135846.GD1138399@ulmo>
References: <1589437363-16727-1-git-send-email-nkristam@nvidia.com>
 <1589437363-16727-6-git-send-email-nkristam@nvidia.com>
 <db698a53-c5f6-d03f-edf0-f4fb38963e1f@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <db698a53-c5f6-d03f-edf0-f4fb38963e1f-l0cyMroinI0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2020 at 05:54:03PM +0530, Kishon Vijay Abraham I wrote:
> Thierry,
>=20
> On 5/14/2020 11:52 AM, Nagarjuna Kristam wrote:
> > When USB charger is enabled, UTMI PAD needs to be protected according
> > to the direction and current level. Add support for the same on Tegra210
> > and Tegra186.
> >=20
> > Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Can you give your Acked by for pending patches in this series?

I went through these patches one more time and I think they're all good
now. I've acked the ones that didn't have my Acked-by yet.

Thierry

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7Y/hYACgkQ3SOs138+
s6HnyA/9Fj2LLU1HqZfshnRjI3aQgaPbxFFuL1xOjZMMWSLk0qZ9BkE+knzQ9/c2
G0EfbsP+Z0tp3HFRK37yT6YL2xNwciVYEQow+y0TMzwVCQdBY+ChdcL4M7Da/iNp
VjJsEsmp7kWn2AApkN3CqZsrtYp+rzWTFoh7DPZfJr1Ny21gKaa7CHI72b/PXYoS
sNnJvHwYBYZ9KofaSKteV+LyueAMuOxvQHA8CTWP9qgG5rpPb9n3lbv0D6BGOjSP
xbt2Q1I5mxrTOVkpUpTjXDpVKglC3TCwUC9FLkDHOrfzjoF3pJFG1x97EuU2aH5Y
E2xbIA7kSniYH+ZtxlL6f+iYmWqFyNsm6H6dWF3m/j5sryhLzwoa3KYSCdH2QSoc
L/sW43agd+HcUKsHKk0mH1K1cVgGO2grnTQdSwbNRn8tlhchy0gikuCM1Ecs3Ehc
bfSRDHVsV75gQtOxavNEdKfIwz9ExOKGolDsazpgLJ32c57lwGLHHGxPTmI5PmTo
NgwrE40zXoC5fG3XuWg/Iel3zXvUZSHn/rfk+d41wZXN2CpDjESOkK+RTiSeherg
UHYPTk5jGBFw9WVZFImkI+791yWp8cWpJej73wKj3bhoCcFpIXgFvV7R+iKvPxkp
WqFTPpsaCZVq1WB2vzCxKhiYe1U6IuN+uhvNaoCCKFtZiq1NI1g=
=91er
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--
