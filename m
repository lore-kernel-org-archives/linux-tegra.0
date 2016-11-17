From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 8/9] arm64: tegra: Enable PSCI on P3310
Date: Thu, 17 Nov 2016 18:33:28 +0100
Message-ID: <20161117173328.GB7915@ulmo.ba.sec>
References: <20161117171131.20062-1-thierry.reding@gmail.com>
 <20161117171131.20062-8-thierry.reding@gmail.com>
 <786f354d-a1f2-f2c6-fde7-7b1af3df756c@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <786f354d-a1f2-f2c6-fde7-7b1af3df756c-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 05:21:34PM +0000, Sudeep Holla wrote:
>=20
>=20
> On 17/11/16 17:11, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The P3310 processor module comes ships with a firmware that implements
> > PSCI 1.0. Enable and use it to bring up all CPUs.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 36 ++++++++++++++++++=
++++++++
> >  1 file changed, 36 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm6=
4/boot/dts/nvidia/tegra186-p3310.dtsi
> > index 807af7b68761..2c158c6809a5 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> > @@ -26,7 +26,43 @@
> >  		status =3D "okay";
> >  	};
> >=20
> > +	cpus {
> > +		cpu@0 {
> > +			enable-method =3D "psci";
> > +		};
> > +
> > +		cpu@1 {
> > +			enable-method =3D "psci";
> > +		};
> > +
> > +		cpu@2 {
> > +			enable-method =3D "psci";
> > +		};
> > +
> > +		cpu@3 {
> > +			enable-method =3D "psci";
> > +		};
> > +
> > +		cpu@4 {
> > +			enable-method =3D "psci";
> > +		};
> > +
> > +		cpu@5 {
> > +			enable-method =3D "psci";
> > +		};
> > +	};
> > +
> >  	bpmp {
> >  		status =3D "okay";
> >  	};
> > +
> > +	psci {
> > +		compatible =3D "arm,psci-1.0";
> > +		status =3D "okay";
> > +		method =3D "smc";
>=20
> [...]
>=20
> > +
> > +		cpu_off =3D <0x84000002>;
> > +		cpu_on =3D <0xc4000003>;
> > +		cpu_suspend =3D <0xc4000001>;
>=20
> These are applicable only for "arm,psci"(i.e. PSCI v0.1), so you need to
> drop them.

Oh, indeed. I obviously skipped the arm,psci and arm,psci-0.2 entries in
the binding documentation and then assumed the optional properties
applied regardless of PSCI version.

Removed these and everything still works as expected.

Thanks,
Thierry

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYLennAAoJEN0jrNd/PrOhZtwP/1X19w2M8v6jpFpmzDnl2w+B
m0d4B4T2UqDe/KPznVXf1ILeO4pNWc/VdbG/AeVQHLakZh/qg2JwE0viiwHjYT6K
ba8HBkLtshD2vELAZvydeVJQuiaI+Wry2zbJT6qRAowc0Iy4Vc5AjXSpUDPJ6CDR
YtQU1crLK+ePTkaaXBCFlpt5Q/AZkBNoqEmOaGj77mWiC0sHQlXNxx1TQAcKdAFJ
PJMapEnUO6YGn/ftI6kbgILJegu2m3pEPec2D9nmnLZtIAzZW8hXZn3gTRAdqiAX
t/SH5MGV0XvZi9rtQWqtCvfOnCDDTkmbK3g0n5OJzepdAPkB11E/LvL+iGR0n2I7
CFBoHlpDWxeyFrwX9z8jhhi0i5ppUfNQl2yB7Hl5iOJEuTgLUvc6wTyXiLBMTjH1
X3FZ3bnEWHyZsDStV/1m7v1WHA9Vg9us/3+3bssCHiXck6MKoKfG9d1D2kENd+Qi
wA3EVxVPntZSz+Go516diN2/VF5f9kuxrC3ylWFkMThpbdhjrteSz8n5HGlwiFaz
09OFn3a54kw0gVyIT4tXvWmwd1LDcg+NMTqopJOVlf0q4Q9KLLJfZPw6WnpZEzbg
wAYQEJ+o1hS4ovdWcGfcUAktY4WQnx5kZHykMO+AoudrVmzgaVpnHOXoPatfPHLi
+7xARtDort7iI/DAHcDS
=43Df
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
