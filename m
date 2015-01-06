From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 1/3] of: Add descriptions of thermtrip properties to
 Tegra PMC bindings
Date: Tue, 6 Jan 2015 16:09:17 +0100
Message-ID: <20150106150916.GP31830@ulmo.nvidia.com>
References: <1420541578-27968-1-git-send-email-mikko.perttunen@kapsi.fi>
 <1420541578-27968-2-git-send-email-mikko.perttunen@kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8298219480077644934=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1420541578-27968-2-git-send-email-mikko.perttunen@kapsi.fi>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mikko Perttunen <mikko.perttunen@kapsi.fi>
Cc: gnurou@gmail.com, wni@nvidia.com, swarren@wwwdotorg.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============8298219480077644934==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zxEKvxCKojqA/Afl"
Content-Disposition: inline


--zxEKvxCKojqA/Afl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 12:52:56PM +0200, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> Hardware-triggered thermal reset requires configuring the I2C
> reset procedure. This configuration is read from the device tree,
> so document the relevant properties in the binding documentation.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-p=
mc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
> index 68ac65f..2fd5051 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
> @@ -47,6 +47,23 @@ Required properties when nvidia,suspend-mode=3D<0>:
>    sleep mode, the warm boot code will restore some PLLs, clocks and then
>    bring up CPU0 for resuming the system.
> =20
> +Hardware-triggered thermal reset:
> +On Tegra30, Tegra114 and Tegra124, if the 'i2c-thermtrip' subnode exists,
> +hardware-triggered thermal reset will be enabled.
> +
> +Required properties for hardware-triggered thermal reset (inside 'i2c-th=
ermtrip'):
> +- nvidia,i2c-controller-id : ID of I2C controller to send poweroff comma=
nd to. Valid values are
> +                             described in section 9.2.148 "APBDEV_PMC_SC=
RATCH53_0" of the
> +                             Tegra K1 Technical Reference Manual.
> +- nvidia,bus-addr : Bus address of the PMU on the I2C bus
> +- nvidia,reg-addr : I2C register address to write poweroff command to
> +- nvidia,reg-data : Poweroff command to write to PMU
> +
> +Optional properties for hardware-triggered thermal reset (inside 'i2c-th=
ermtrip'):
> +- nvidia,pinmux-id : Pinmux used by the hardware when issuing poweroff c=
ommand.
> +                     Defaults to 0. Valid values are described in sectio=
n 12.5.2
> +                     "Pinmux Support" of the Tegra4 Technical Reference =
Manual.

As discussed on IRC, I'd prefer if this referred to the Tegra K1 TRM
like the comment for the nvidia,i2c-controller-id above so that people
aren't required to look at two different documents to get these values.
I've filed an internal bug to get this information added to the Tegra K1
TRM. In addition it might be nice to copy the table with the values into
the binding document for easier reference and in case the TRM suddenly
becomes unavailable.

Thierry

--zxEKvxCKojqA/Afl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUq/qcAAoJEN0jrNd/PrOhbFQP/0oriLBKg7j1a68Jj2P6Gjhv
v4EciHRDoMWKC14m1vLxkKv8rRENmk4CdCtxnDKOfb3CtAzJ1ZWrXWvYuxiu5drB
VNyLQYrI03B1B/Z4TolVBFGyB78uWKQqlxKX++Jvl9Zni9Wn8iEieQORjoiow0ym
n2jfO9zoP/JSaPlCRw5mqr5nGoX2TPOeqowXqFDTM0uXC0SYBbcJr6IPCqlY+I6q
321ErtlHvMXXAbxNyVTUrXloL9ECdhDWJFyoQMe4LPqt1EoV0rMtoSYTYJnyK0zN
SOVcmVLGnolfPJh67Ju7Tskw0nq9gdOh0belOpM5aTglEmNtHoVqLLdCrzbprt9E
JNQLYp1vy7VljuE9q/bBC939KKjwsWuW4eCl4dcEudvMuXWJXirkE7KqxAs6jh9w
t5B6aSMdlawM+MVnPnd8AlMV/AhsoD8/eoevYfOmXTJJwzJcoUMYwivtV5JWLG4U
OM0/nu4/a2VSU31Hzt4MlaL7g3JcXYsDl37pwKa1Ey5ukGmGD8LoT3DBo4eKu1/k
LfknpoCYW2FEQACVD4z50E5iJm8wiIv44q9V5/8zwRCkdxmSMKNLX9eq3BsucT7x
X+dO5RhceVd6WToxYHzf5Ox8KQEcKt9qZ4L9Ts4vVnb/cqj4rMdoQvGWv/qv4MDK
eTJoyq3w65/Tt+XOjT5U
=kOtx
-----END PGP SIGNATURE-----

--zxEKvxCKojqA/Afl--


--===============8298219480077644934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8298219480077644934==--
