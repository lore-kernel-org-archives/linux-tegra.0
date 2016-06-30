From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 00/11] Add support for Tegra DPAUX pinctrl
Date: Thu, 30 Jun 2016 15:25:09 +0200
Message-ID: <20160630132509.GD26758@ulmo.ba.sec>
References: <1467191877-26017-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1364237618=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1467191877-26017-1-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1364237618==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Content-Disposition: inline


--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 10:17:46AM +0100, Jon Hunter wrote:
> The Display Port Auxiliary (DPAUX) channel pads can be shared with an
> internal I2C controller. Add pinctrl support for these pads so that the
> I2C controller can request and use these pads.
>=20
> This series has been tested with Thierry's patches for correcting the
> parent clock for the DPAUX devices [0].
>=20
> Changes from V1:
> - Updated dt node names to use '-' instead of '_' per Rob H's feedback.
> - Updated commit message and dt-binding description for 'i2c-bus' node
>   per Wolfram's feedback.
> - Note the pinctrl patch to add a helper function for freeing mappings [1]
>   is not included in this latest version of the series as this has already
>   been picked up by Linus W.
>=20
> Changes from initial RFC:
> - Dropped patches for adding sor-safe clocks to DPAUX in favour of the
>   patches from Thierry [0].
> - Split the DPAUX function to enable the DPAUX pads into two functions:
>   one for turning on and one for turning off the pads.
> - Updated the description for the 'i2c-bus' node based upon Mark R's
>   feedback.
> - Dropped the second test if the i2c-core when checking for the presence
>   of the 'i2c-bus' node based upon Thierry's feedback.
> - Removed depedency on CONFIG_PINCTRL in the DPAUX driver in favour of
>   using #ifdef's per Thierry's feedback (note by removing the dependency
>   on CONFIG_PINCTRL I had to use #ifdefs as all the structures, function
>   tables, and functions may not be defined).
> - Updated SOR power partition device-tree node to include all clocks and
>   resets as described in the Tegra210 TRM.
>=20
> [0] http://marc.info/?l=3Dlinux-tegra&m=3D146667915802019&w=3D2
> [1] http://marc.info/?l=3Dlinux-tegra&m=3D146669759407988&w=3D2
>=20
> Jon Hunter (11):
>   soc/tegra: pmc: Initialise resets associated with a power partition
>   drm/tegra: Clean-up if probing DPAUX fails
>   drm/tegra: Add helper functions for setting up DPAUX pads
>   dt-bindings: display: Update Tegra DPAUX documentation
>   drm/tegra: Prepare DPAUX for supporting generic PM domains
>   dt-bindings: i2c: Add support for 'i2c-bus' subnode
>   i2c: core: Add support for 'i2c-bus' subnode
>   dt-bindings: Add bindings for Tegra DPAUX pinctrl driver
>   drm/tegra: Add pinctrl support for DPAUX
>   arm64: tegra: Add SOR power-domain node
>   arm64: tegra: Add DPAUX pinctrl bindings
>=20
>  .../display/tegra/nvidia,tegra20-host1x.txt        |  12 +-
>  Documentation/devicetree/bindings/i2c/i2c.txt      |   8 +
>  .../pinctrl/nvidia,tegra124-dpaux-padctl.txt       |  60 ++++++
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  78 +++++++
>  drivers/gpu/drm/tegra/dpaux.c                      | 239 +++++++++++++++=
++----
>  drivers/i2c/i2c-core.c                             |  10 +-
>  drivers/soc/tegra/pmc.c                            |  18 +-
>  7 files changed, 373 insertions(+), 52 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegr=
a124-dpaux-padctl.txt

Applied, thanks.

Thierry

--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdR21AAoJEN0jrNd/PrOhq2kP/iOOsErmkiP3UVKV6vic778B
tpXpmFVSkTpB4zvZzVtHLR/9fG1zbIFw5gam0BoI9Q4dzmytb5Kl4B/Ga/qQf0jI
4ifKcy6G3bnuemsLYYOxMFl9s05AafyT9ng3I3r9VWAvxvFJuPgV8No12oOAnu/q
BoKahjzS+A9p1VpLJSfSqRoMPGsJxYOspVnZXPYA1ltIjdqE8VoGhrFf14xZ2AuD
6OenYvVoHqCxPqdXilDtaWBVwMu3V0F5zbZkQbiHcs9jZAKEqLgb4EfxkExYnbQf
27+udNlWId17EfvN/PAbj1ZauHVdCCDhtfQ9gg7ao+Skh7D0FAiX+eQDUTxJPfRS
MOP77t59XlpXlU6eRt7+ypAlywvdt0g6XtisO6fsnP+wQEe7Q7h4Yf74J6yKZ5h2
ujUUss24X8p3Hwg2INtWvgmAy8Ud7XE7Hv6akeMRmgPAzDAbEsHYELEgtR8MaWM2
vxAAznbJRdmBfI7hG9pbC6hsiJ1wMtHLNcQaQ2LoqKlz45iLskzpZsGDjE9Kg6/d
S3Zl3apZQmMRX+/Ca6eOQfztI9RUnDxht6unySQ8C0sogHHIqx7omqRPCw1j4Urh
okzAvNBUtIrGjIenTG8xCmiriReKJJWOfj4gJGKwb3XykY4l9Z9GqHgvyFYxUe2K
M72jPaW0AjcYAeLkLee5
=cAuv
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--

--===============1364237618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1364237618==--
