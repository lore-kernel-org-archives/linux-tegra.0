From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 3/3] arm64: tegra210: Add XUSB powergates
Date: Wed, 29 Jun 2016 17:56:59 +0200
Message-ID: <20160629155659.GA20065@ulmo.ba.sec>
References: <1467112844-26927-1-git-send-email-jonathanh@nvidia.com>
 <1467112844-26927-4-git-send-email-jonathanh@nvidia.com>
 <5773E980.7050907@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5773E980.7050907-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 04:30:08PM +0100, Jon Hunter wrote:
>=20
> On 28/06/16 12:20, Jon Hunter wrote:
> > The Tegra210 XUSB subsystem has 3 power partitions which are XUSBA
> > (super-speed logic), XUSBB (USB device logic) and XUSBC (USB host
> > logic). Populate the device-tree nodes for these XUSB partitions.
> >=20
> > Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra210.dtsi
> > index 65b829b762bb..efb0fd98b789 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > @@ -670,6 +670,30 @@
> >  					 <&tegra_car TEGRA210_CLK_MIPI_CAL>;
> >  				#power-domain-cells =3D <0>;
> >  			};
> > +
> > +			pd_xusbss: xusba {
> > +				clocks =3D <&tegra_car TEGRA210_CLK_XUSB_SS>;
> > +				clock-names =3D "xusb_ss";
> > +				resets =3D <&tegra_car TEGRA210_CLK_XUSB_SS>;
> > +				reset-names =3D "xusb_ss";
> > +				#power-domain-cells =3D <0>;
> > +			};
> > +
> > +			pd_xusbdev: xusbb {
> > +				clocks =3D <&tegra_car TEGRA210_CLK_XUSB_DEV>;
> > +				clock-names =3D "xusb_dev";
> > +				resets =3D <&tegra_car 95>;
> > +				reset-names =3D "xusb_dev";
> > +				#power-domain-cells =3D <0>;
> > +			};
> > +
> > +			pd_xusbhost: xusbc {
> > +				clocks =3D <&tegra_car TEGRA210_CLK_XUSB_HOST>;
> > +				clock-names =3D "xusb_host";
> > +				resets =3D <&tegra_car TEGRA210_CLK_XUSB_HOST>;
> > +				reset-names =3D "xusb_host";
> > +				#power-domain-cells =3D <0>;
> > +			};
> >  		};
> >  	};
>=20
> The 'clock-names' and 'reset-names' nodes are not used/required and so I
> will remove these.

Please keep them and make use of the names. We used to not do this in
the past, and then things became tricky to describe in the DT bindings
in order to keep backwards-compatibility.

Though perhaps you're not using them because they are found by index? In
that case I think it might still be useful to have them for consistency.

If you keep them, you might want to turn the _ into -.

Thierry

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXc+/IAAoJEN0jrNd/PrOhM1oP/jyU0/Kke+r3VBC7R1qAQoGz
y0krji7lAAoSxiGILGTU7bsbpUcegesQdaWa8jrj8sYKOw6pdCCzvIV6TqCEsYtw
uJZaPTKe0BtbZ29jqxn23+lo97XleylMqi/VbwE9ZcysXzAzTtMsJTTAVzyukRq9
Tm1+7UUlDVSYNDYWi3C+99htPQUqSzELkI3fkDohujJ7YeNkm52/euCFv2kpVmgM
zYYGTZTdK5DO5MQmWDq155pc05KSRCsJneBRTF5bNsSxJolvs8e1Gs3kWyLzPjFZ
VAAR+T6V86K3S6Xg2qW4JXAIYVwHq+gzm0mx0K1xT56Ya559KkKGZ60jxlwg3i4J
dW+DZnUYtvdlO422qBXPCddRwpJIUpvqzHtTJqFGWhfcdh5s6JSwRwOw/okzPH1W
k3bD7zrXI5oxp9FOfoo/Jgu0pF6joXAhDDw3HzUQooWrIW5Zg/ZfRZqLF6gTMkrP
4EMrhVWbJRducvUNvDe9dzty8THJyNqFsobU45/4EluQMNJa7BSlfhMnv8J2Ki8Q
Yvk2GF2uE3VKDGsySw/NxExk/rkLIrkIBYBc/666SOwwIMoKGmyLf86Cple+EHfe
Y3UVUKSnDKxUPhZ1d+921+gkUnLnCjCQJhTww7+fyLj5wcEPTpvQIu6N/DQLefkK
wSKaW8tSHup32EcoaWTR
=4R0v
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
