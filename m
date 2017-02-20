From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v3 2/2] i2c: Add Tegra BPMP I2C proxy driver
Date: Mon, 20 Feb 2017 19:17:47 +0100
Message-ID: <20170220181747.lykox7o4ik6d5snu@ninjato>
References: <20170220165234.29299-1-thierry.reding@gmail.com>
 <20170220165234.29299-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yv7t2gkaerqmf5lo"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170220165234.29299-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--yv7t2gkaerqmf5lo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2017 at 05:52:34PM +0100, Thierry Reding wrote:
> From: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Add Tegra BPMP I2C driver. The BPMP is the boot and power management
> processor embedded in Tegra SoCs. In newer SoC versions, access to one
> of the I2C busses goes via the BPMP, requiring a different "proxy" I2C
> driver that accesses the bus via the real I2C driver embedded in the
> BPMP firmware.
>=20
> Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied to for-next, thanks (will be in for 4.11)!

> Changes in v3:
> - pass struct mrq_i2c_response to deserialization function to make it
>   symmetrical to serialization
> - use module_platform_driver(), no need for initcall ordering tricks

Yay, I really like this one!

> - remove error message on adapter registration failure
> - remove unneeded I2C adapter class assignment
> - remove misleading TODO comment

--yv7t2gkaerqmf5lo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlirMssACgkQFA3kzBSg
KbZUnQ//V86AKmzDHahzCOMxmeaTd3FtNyNcNpY4R5la7XT60zqUBiIGkQ2CP3nA
17gWFDR4F5CfmA/tDMBfeC6tU8M+eLbO+UojqoCOMDdogGDtN3tkVmdvfKwS+3Av
fCjXOeB2A/nXLrTSCEIvIV3kt4unbH0H2GJscwqzZNsuHRq+i8x0mwEliXG0bEfS
i8x/htESoO/NDKCmEhl+u6ySCvavpbQJffxOqVTQQgTEaJ8qj8i/4XqcaWBLLBbo
pdfm7atArxeXAwIv16b/DCSVpKlRLT2ejdKiW3BDmi74kEwjOswvB4PTf5pMC42y
HRuKCz8flZ9dUvSfOsjsqE1Tf2vwjEDzDNgVY781API7AVsgGVtg/sIBi79LEN28
KUyoPmpA2gU11DG2XMoOimyOwMYwqHZ5+NmxngJIPK+pvYR1Ffwv7UJf9XAaGbFI
I7uSQWCDYfyFPLXI4I/abOH+3K8BCFv2ptGgpUQg0HjFMw3oc5MVUzB5l2U3AC02
URpFKtpVv3SRJ+/qCOBtFZA3oWahOFa2zJmrinlm1/Gt4uj/BXir0vNCl+R8WvMP
MaI+2hjuHhBYIf98tPiGH37FIdINAW0pavWdwsPwDUJtWxSoRkeVF56w/DU/qIdF
mhQSYI362bMVPrC4WJRNgFaTMbm4wHHI/YtY55wkKy5/UsoqiTQ=
=X+g3
-----END PGP SIGNATURE-----

--yv7t2gkaerqmf5lo--
