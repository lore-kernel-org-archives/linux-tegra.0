From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 2/4] ARM: tegra: Enable PLLP bypass during Tegra124 LP1
Date: Wed, 8 Jan 2020 13:00:13 +0100
Message-ID: <20200108120013.GB1993114@ulmo>
References: <20191003205033.98381-1-swarren@wwwdotorg.org>
 <20191003205033.98381-2-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1347602008950912197=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191003205033.98381-2-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-clk@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============1347602008950912197==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 03, 2019 at 02:50:31PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> For a little over a year, U-Boot has configured the flow controller to
> perform automatic RAM re-repair on off->on power transitions of the CPU
> rail1]. This is mandatory for correct operation of Tegra124. However, RAM
> re-repair relies on certain clocks, which the kernel must enable and
> leave running. PLLP is one of those clocks. This clock is shut down
> during LP1 in order to save power. Enable bypass (which I believe routes
> osc_div_clk, essentially the crystal clock, to the PLL output) so that
> this clock signal toggles even though the PLL is not active. This is
> required so that LP1 power mode (system suspend) operates correctly.
>=20
> The bypass configuration must then be undone when resuming from LP1, so
> that all peripheral clocks run at the expected rate. Without this, many
> peripherals won't work correctly; for example, the UART baud rate would
> be incorrect.
>=20
> NVIDIA's downstream kernel code only does this if not compiled for
> Tegra30, so the added code is made conditional upon the chip ID. NVIDIA's
> downstream code makes this change conditional upon the active CPU
> cluster. The upstream kernel currently doesn't support cluster switching,
> so this patch doesn't test the active CPU cluster ID.
>=20
> [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
>=20
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> v3: No change.
> v2: No change.
> ---
>  arch/arm/mach-tegra/sleep-tegra30.S | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Patches 2-4 applied to for-5.6/arm/core, thanks.

Thierry

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4VxE0ACgkQ3SOs138+
s6E3Ig/+JjmQL+DrA9FZlgMo3Ni2wA7V95dT4yry/2c1athzRmI2QNMrQpfGZScP
zXrhZTpPO4Nyq0mFhxV9cjSDs6HPfMIPqtO3HGt3n2r0glywFRTmzOROfUAwC06B
sGJ8NzV47AGQd4ueON+jf81GXvBvlsqeLsUc2fC8zy1wtuic68jo+p4/Xypw+Lwu
W9lPUE5yThqJ2AegnYTZMwT7L+O4XtpXEJb8kwtDVFSOilRfoZwtURCjUGjRZ9X9
oe40yUAdeiHWo0RyMyawgZ6LpcsFREdBtfS19hI32K7YZr/PtMppD8F4oiNdz7pu
nxtHZwgz3GeLa4I5l5sAVXgaVjnbMaC0qIlnAQJ+mu8x5slHogJtARb/sLOKdahc
2hlfD+0Ig4lCGhNHTG9xvDL5aP1TMX3JseK51H2l/Poo0p6o00auUM83NuLBsavs
y/Xh02MT9bt/Nl4++GPWQxyAyoWUmgNPwlxzLwqAiimSFMmIUw0zla2ux97Mn0wO
hPuyFZrXWysD+y8sl2RjzwbOnF+rWP425zxKNg8hxspCOUGd5zcIsUrKyth2KTJI
Y8tbHYXVO3L6Zt8ctpnah81m19pZEezqDNKXeCjC2BKdQNINeadrOJcXTdzm6y6k
03LVoHLMTU+IfoOvV9W7xM+XfoIy2tTyR7ApXAhsO9BxdVucBw4=
=oiR4
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--


--===============1347602008950912197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1347602008950912197==--
