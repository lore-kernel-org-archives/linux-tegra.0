From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 3/3] arm64: tegra210: Add XUSB powergates
Date: Thu, 30 Jun 2016 12:20:52 +0200
Message-ID: <20160630102052.GH1776@ulmo.ba.sec>
References: <1467112844-26927-1-git-send-email-jonathanh@nvidia.com>
 <1467112844-26927-4-git-send-email-jonathanh@nvidia.com>
 <5773E980.7050907@nvidia.com>
 <20160629155659.GA20065@ulmo.ba.sec>
 <5773F233.7010202@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="17/8oYur5Y32USnW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5773F233.7010202@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--17/8oYur5Y32USnW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 05:07:15PM +0100, Jon Hunter wrote:
>=20
> On 29/06/16 16:56, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Wed, Jun 29, 2016 at 04:30:08PM +0100, Jon Hunter wrote:
> >>
> >> On 28/06/16 12:20, Jon Hunter wrote:
> >>> The Tegra210 XUSB subsystem has 3 power partitions which are XUSBA
> >>> (super-speed logic), XUSBB (USB device logic) and XUSBC (USB host
> >>> logic). Populate the device-tree nodes for these XUSB partitions.
> >>>
> >>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >>> ---
> >>>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ++++++++++++++++++++++=
++
> >>>  1 file changed, 24 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra210.dtsi
> >>> index 65b829b762bb..efb0fd98b789 100644
> >>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> >>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> >>> @@ -670,6 +670,30 @@
> >>>  					 <&tegra_car TEGRA210_CLK_MIPI_CAL>;
> >>>  				#power-domain-cells =3D <0>;
> >>>  			};
> >>> +
> >>> +			pd_xusbss: xusba {
> >>> +				clocks =3D <&tegra_car TEGRA210_CLK_XUSB_SS>;
> >>> +				clock-names =3D "xusb_ss";
> >>> +				resets =3D <&tegra_car TEGRA210_CLK_XUSB_SS>;
> >>> +				reset-names =3D "xusb_ss";
> >>> +				#power-domain-cells =3D <0>;
> >>> +			};
> >>> +
> >>> +			pd_xusbdev: xusbb {
> >>> +				clocks =3D <&tegra_car TEGRA210_CLK_XUSB_DEV>;
> >>> +				clock-names =3D "xusb_dev";
> >>> +				resets =3D <&tegra_car 95>;
> >>> +				reset-names =3D "xusb_dev";
> >>> +				#power-domain-cells =3D <0>;
> >>> +			};
> >>> +
> >>> +			pd_xusbhost: xusbc {
> >>> +				clocks =3D <&tegra_car TEGRA210_CLK_XUSB_HOST>;
> >>> +				clock-names =3D "xusb_host";
> >>> +				resets =3D <&tegra_car TEGRA210_CLK_XUSB_HOST>;
> >>> +				reset-names =3D "xusb_host";
> >>> +				#power-domain-cells =3D <0>;
> >>> +			};
> >>>  		};
> >>>  	};
> >>
> >> The 'clock-names' and 'reset-names' nodes are not used/required and so=
 I
> >> will remove these.
> >=20
> > Please keep them and make use of the names. We used to not do this in
> > the past, and then things became tricky to describe in the DT bindings
> > in order to keep backwards-compatibility.
>=20
> Unfortunately, in order to use them, we would need to keep a list of all
> the clock and reset names in the PMC driver which would be huge.

That's a Linux driver implementation detail, so it shouldn't influence
the binding.

> > Though perhaps you're not using them because they are found by index? In
> > that case I think it might still be useful to have them for consistency.
>=20
> Right, we just iterate over the number of the clocks and resets found
> when we initialise the powergate.

Again, that's a driver implementation detail.

> > If you keep them, you might want to turn the _ into -.
>=20
> I can keep them, however, in other patches I have sent out, for example
> the SOR powergate (part of the DPAUX series) and Audio powergate, they
> do not have them. So I thought I would remove them here to be
> consistent. However, we could add them for these other powergates as well.

Yes, I'd prefer them to be listed in all nodes for documentation, if for
nothing else.

Thierry

--17/8oYur5Y32USnW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdPKEAAoJEN0jrNd/PrOh7rEP+gPeV8zEFIRG5FUuULD0WgnR
xQXog/aF7WsCe29BlysMEXVind5DyVvcBkNjh9Rx3H+cHTPEDcnSdBnmOwlE54ae
KfCLjxil0ClMgVYfu8R1FOSrabsk8eDlIRs2P5MmNTy5DIWixX29C76yeRAvKJKM
bNFvrgVsdQhFohZ4mOVrmoNbEZNbk5gG2TvlSGHmksbTUgshVhorgDG3Y+EZNcxE
sjbalv/7lpxmqWBmpQZrkeEIL6oO6LlG7Btgob5yNgk1h3T+aDpPHNEfmVDIyzks
r7iRzJqCw16r8Hf1XBybYJQhUYj46Dm9INDApIzS8fgRh7Iv6I90ABeFNqNmF/Tx
RZBEBCtvqL+FRaa5Bp1OKFyUpUGAvnUFDMkhyF9xYNYMC0YJJh4Er5lAxoIDjP8v
XOkcTpsFyhJkMT6fkF2jzwBjFHsAAKMHtqYQ2N0oAx5DLbTMFHVvYLRX4dCxoYHr
FQYcBWjZ7GlHeDIr2gDzLcYMkUzg3Rq5oaRm2EwYtLM54l7Gx7IIr+nzJXgAeEXy
gqfC7dVHw4hKkUiuitJRz1dz5CLEM0u3ctfjeHD/8hv+zlc18CGQjJ+5KGq0kkG9
ldVs1c7uh3PeseNIPuCX50BnKp/v8J6JP9ALa4y0XeMXoJjeBgh8Dejk+O3PRJEP
++4DtvZ8L+mJ9JhGb5IH
=bbOc
-----END PGP SIGNATURE-----

--17/8oYur5Y32USnW--
