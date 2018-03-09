From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v7 4/4] soc/tegra: pmc: Use the new reset APIs to manage
 reset controllers
Date: Fri, 9 Mar 2018 09:09:09 +0100
Message-ID: <20180309080909.GA13841@ulmo>
References: <1500479948-29988-1-git-send-email-p.zabel@pengutronix.de>
 <1500479948-29988-5-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1500479948-29988-5-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
List-Id: linux-tegra@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2017 at 05:59:08PM +0200, Philipp Zabel wrote:
> From: Vivek Gautam <vivek.gautam@codeaurora.org>
>=20
> Make use of of_reset_control_array_get_exclusive() to manage
> an array of reset controllers available with the device.
>=20
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> [p.zabel@pengutronix.de: switch to hidden reset control array]
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> No changes since v6.
> ---
>  drivers/soc/tegra/pmc.c | 82 ++++++++++++-------------------------------=
------
>  1 file changed, 20 insertions(+), 62 deletions(-)

I've applied this with the static inline change that Jon suggested.

Thanks,
Thierry

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqiQR4ACgkQ3SOs138+
s6HXTQ//e+zFt1s0RGOWduEZR2kzsTApj7UqF/XklL/8F/SS2DGCx7Irq6TcuDpk
d/RrsCmms8A8qbJ1oHEITgevQFP6APOfB6gE9x0hF+K10IXGKw5JI/PsHM0HgUWK
wVX0sg36SIDixwAd8YdQcTD7L2UqQ0OQipklfNqsOfvSXsfoNO/f8I6EdocCQcXJ
WvBPg0Rst32Lmky1z1Ap8svn2yHUQMC1Tdpi77VPc+SeEckhd7btOEWOj0fw8xyW
Hl2XRdTmcizsIk3wIC5hSfHHVuq9m3BpeouqxheYJbot8kH7JmlNpTaWS8bjNSDM
+G8QkK2jYY1dJ4re434oiiGFdLauyRgxZsqybthPErXCxXN3g2Gp5/UdOiNTZoJ/
fG2qz+DUInhS0/6xznT24Nuu4Jpv2Z+NrpJrWSefxACZsz5ecLhlNGOHph5i6qOp
WWeGTLAj7hk8KCurBK7yMWmpw6bftXXsm5PCIZWsmoLD2SYIktM/hAv9MzVKNtJi
RIPOpS87eRzr++C8+p1GE7qH8LDMx70Pq3amkwlTfFazcwSm9NdOB12StlNXHV1W
M1dNbCaqctYVQUyKsqdCSVMnw2K7wnBG8w3GIEeO3olnn62B1ziPnM3wuQHoCN8b
rBpN5n0ps4Xmb4hw+bMMhUFiEn5WueIE+2LIXpS9hqAmbHrqNIg=
=wa/y
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
