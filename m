From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] usb: phy: tegra: Fix phy suspend for UDC
Date: Mon, 2 Oct 2017 13:52:22 +0200
Message-ID: <20171002115222.GA350@ulmo>
References: <1506943373-11560-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1506943373-11560-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2017 at 12:22:53PM +0100, Jon Hunter wrote:
> Commit dfebb5f43a78 ("usb: chipidea: Add support for Tegra20/30/114/124")
> added UDC support for Tegra but with UDC support enabled, is was found
> that Tegra30, Tegra114 and Tegra124 would hang on entry to suspend.
>=20
> The hang occurred during the suspend of the USB PHY when the Tegra PHY
> driver attempted to disable the PHY clock. The problem is that before
> the Tegra PHY driver is suspended, the chipidea driver already disabled
> the PHY clock and when the Tegra PHY driver suspended, it could not read
> DEVLC register and caused the device to hang.
>=20
> The Tegra USB PHY driver is used by both the Tegra EHCI driver and now
> the chipidea UDC driver and so simply removing the disabling of the PHY
> clock from the USB PHY driver would not work for the Tegra EHCI driver.
> Fortunately, the status of the USB PHY clock can be read from the
> USB_SUSP_CTRL register and therefore, to workaround this issue, simply
> poll the register prior to disabling the clock in USB PHY driver to see
> if clock gating has already been initiated. Please note that it can take
> a few uS for the clock to disable and so simply reading this status
> register once on entry is not sufficient.
>=20
> Similarly when turning on the PHY clock, it is possible that the clock
> is already enabled or in the process of being enabled, and so check for
> this when enabling the PHY.
>=20
> Please note that no issues are seen with Tegra20 because it has a slightly
> different PHY to Tegra30/114/124.
>=20
> Fixes: dfebb5f43a78 ("usb: chipidea: Add support for Tegra20/30/114/124")
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes since V1:
> - Added fixes tag
> - Added test in PHY enable to see if clock is already on before enabling
>=20
>  drivers/usb/phy/phy-tegra-usb.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnSKHMACgkQ3SOs138+
s6FO5w//RQbP2RQy8Kyc0SD09Q0l4TGgZecf1Js15iuupZ3DOAMJFpNZ/0FCFMGH
kj3cYRnAaYPpCMbWUHgng3VIq42N2N73J2o/V/frDqSo16g4HaN+iW8NLDopdn9R
EF7KSF2L8/g4+Fd4rZAKNMAx9Sp6BYYEMzs8BkvW8a/AGiuMHc+5cQ4W+ghUO8MI
YuiEN3bZ9ACNBZTlEPCmhoTofT5jvszuKU3YW/vlXhEnLTprD//7NqAq1vA2wKom
xkT9ikWvoM9Bzq0PyA7eDGksTf63QiM3RiYGHhej45/4qwPLa7CNTARy2LVkbxkA
cL3FqWqQf3P7eTU3oHcPQFlnW5nO65RTsKJOMs7DhjRWJn5IQKSaDUO3+1UsMQsI
7rut/VTEt/ZaWS//2hYCut2RE2vwHBiY6N4ZHWQ/gTuP+X1o85t0DkxWUoNbzpUj
W95POBfws0XMt9sXjSvHnsDbO9Qu0/nW3uQC9VJj01wvZiS1XLRW4KOcSCQQ7rhw
X3GIng8tUIY7gjBDmUDH/aTS6o2J+yNhrA3roScaIjQ1LVWlpz5v2a8Xmqa71scD
L4X9PpcTcc4hQhw9lg/eYgEUM1YX1ApttQY7jtgP6Cro+gFO8mACd6pCo0FjEdCj
RmFz/iU+O6S7SYuY8DRTJfW/dtED41Y0yrhkNFDqI3WXCdNriiY=
=cHkh
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
