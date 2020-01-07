From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/9] NVIDIA Tegra I2C driver fixes and improvements
Date: Tue, 7 Jan 2020 13:38:37 +0100
Message-ID: <20200107123837.GE1964183@ulmo>
References: <20200106010423.5890-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200106010423.5890-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2020 at 04:04:14AM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> This patchset adds support for atomic transfers which are required for
> shutting down machine properly. Secondly, a (not)suspending I2C and some
> other things are fixed/improved by this small series as well. Please revi=
ew
> and apply, thanks in advance!
>=20
> Changelog:
>=20
> v3: The "Prevent interrupt triggering after transfer timeout" and "Support
>     atomic transfers" patches got extra very minor improvements. The
>     completion now is passed directly to tegra_i2c_poll_completion_timeou=
t(),
>     for consistency.
>=20
>     Added two new patches that firm up DMA transfer handling:
>=20
>       i2c: tegra: Always terminate DMA transfer
>       i2c: tegra: Check DMA completion status in addition to left time
>=20
> v2: The series is renamed from "Tegra I2C: Support atomic transfers and
>     correct suspend/resume" to "NVIDIA Tegra I2C driver fixes and
>     improvements" because it now contains some more various changes.
>=20
>     New patches in v2:
>=20
>       i2c: tegra: Correct unwinding order on driver's probe error
>       i2c: tegra: Prevent interrupt triggering after transfer timeout
>       i2c: tegra: Use relaxed versions of readl/writel
>=20
>     The "Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN" got an
>     improved wording for the code's comment to I2C_PIO_MODE_PREFERRED_LEN.
>=20
>     The "Support atomic transfers" also got some very minor tuning, like
>     s/in_interrupt()/i2c_dev->is_curr_atomic_xfer/ in dvc_writel() that w=
as
>     missed in v1.
>=20
> v1: The "i2c: tegra: Support atomic transfers" previously was sent out as
>     a separate patch, but later I spotted that suspend/resume doesn't
>     work properly. The "i2c: tegra: Fix suspending in active runtime PM
>     state" patch depends on the atomic patch because there is a need to
>     active IRQ-safe mode for the runtime PM by both patches.
>=20
>     I fixed a missed doc-comment of the newly added "is_curr_atomic_xfer"
>     structure field and added additional comment that explains why IRQ ne=
eds
>     to be disabled for the atomic transfer in the "Support atomic transfe=
rs"
>     patch.
>=20
>     Lastly, I added a minor "i2c: tegra: Rename .." patch that helps to
>     follow driver's code.
>=20
> Dmitry Osipenko (9):
>   i2c: tegra: Fix suspending in active runtime PM state
>   i2c: tegra: Properly disable runtime PM on driver's probe error
>   i2c: tegra: Prevent interrupt triggering after transfer timeout
>   i2c: tegra: Support atomic transfers
>   i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
>   i2c: tegra: Use relaxed versions of readl/writel
>   clk: tegra: Fix double-free in tegra_clk_init()
>   i2c: tegra: Always terminate DMA transfer
>   i2c: tegra: Check DMA completion status in addition to left time
>=20
>  drivers/clk/tegra/clk.c        |   4 +-
>  drivers/i2c/busses/i2c-tegra.c | 216 ++++++++++++++++++++++-----------
>  2 files changed, 147 insertions(+), 73 deletions(-)

I'm still a bit on the fence about that second patch because I don't
think force-suspend is the right thing to do.

You should probably split the clk subsystem patch out of this series so
that it can be picked up into the clk tree (or I can pick it up into the
Tegra tree).

Other than that, I ran this through the testfarm and didn't see any
regressions:

    Test results:
      13 builds: 13 pass, 0 fail
      11 boots:  11 pass, 0 fail
      38 tests:  38 pass, 0 fail

    Linux version: 5.5.0-rc5-g258d134300af
    Boards tested: tegra20-ventana, tegra30-cardhu-a04, tegra124-jetson-tk1,
                   tegra186-p2771-0000, tegra194-p2972-0000,
                   tegra210-p2371-2180

I'll reply to the individual patches with a Tested-by for patchwork to
pick up.

Thierry

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4Ue8kACgkQ3SOs138+
s6FHoxAAvHsi8u08cTwxeyGLPohqAIgt8N4IHYF4o61EvSMy04p3nr1O8pXkMD0J
newkWzHCcThbhZOvqWWARSMlSvstuDhc/gvOaCEeVqLTPDX22LKY4sG0xo2BB8bg
a/urbpyCLom8Oz93YRy7AOb+KX6r+/Y3PZnymBdY5Qky8+I1nvZXSkN8h0B1c71r
48wYCQP3CsXx8+b9rwN9L1IGM1bYs3CvpnZ7ej94Npd8s+MbyQN8jQED5JL5bDTV
UndZL1nN1LlIxIJDfhqNqJNjf9cbSdb7z9/magEFPGXmyoMAtoG3pzYTI2tPoIPa
X3jVQ3WV7ITZHxJdnHnNbLcHo4w4NfHSD6Xyw/KPKb2nuNHu6lHiBuPy6DTPiHke
+oDkGX9axqH2kUfw/vcKO0f3NlV3oSlBDU+wULic61n6dUigiVQGdhg+F5Qt+MY0
RikF6qUIvfU0wVTIz4crIgP1S6cWK1mZeWsMCRLj3tuvBaEd+PiMrwgLh/wEfzSX
vhXcET569ptCZMinOpp6WdLL1WlRDCxxPX4dCvVhIJ00kBf6xJvwUCYFa0XEDP0C
EO8EQRaUbdcK08xrQ7wsq56RiTwyBitc8u66OeuYXQMb1u+aPJkc5VulC57Zcd5q
l7JToHUpkgNld9rLvVlZUJF3ECnrA0hgt429HLoFgG1jtTbt7ZY=
=DTGX
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
