From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv8 21/21] ARM: dt: tegra124: add sdhci iommus bindings
Date: Wed, 4 Jun 2014 23:39:50 +0200
Message-ID: <20140604213949.GD18780@mithrandir>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
 <1401448834-32659-22-git-send-email-hdoyu@nvidia.com>
 <5388B2FD.7040307@wwwdotorg.org>
 <87y4xjrzc9.fsf@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0/kgSOzhNoDC5T3a"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87y4xjrzc9.fsf-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--0/kgSOzhNoDC5T3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2014 at 07:44:06PM +0300, Hiroshi Doyu wrote:
>=20
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
>=20
> > On 05/30/2014 05:20 AM, Hiroshi Doyu wrote:
> >> Add sdhci iommus bindings.
> >
> > This isn't adding bindings, it's adding DT properties. A binding is the
> > documentation of the schema, not the actual data in the DT.
> >
> >> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra=
124.dtsi
> >> index 5b339ca8a1ab..011831ffd390 100644
> >> --- a/arch/arm/boot/dts/tegra124.dtsi
> >> +++ b/arch/arm/boot/dts/tegra124.dtsi
> >> @@ -472,6 +472,7 @@
> >>  		resets =3D <&tegra_car 14>;
> >>  		reset-names =3D "sdhci";
> >>  		status =3D "disabled";
> >> +		iommus=3D<&smmu TEGRA_SWGROUP_CELLS(SDMMC1A)>;
> >
> > Is the "iommus" property documented anywhere? I suspect not, since
> > there's an active ongoing discussion about how IOMMU bindings should be
> > structured. I suspect this series needs to wait until that discussion
> > completes, and the "iommus" property is documented somewhere.
>=20
> Yes, I'm catching up that thread now. That's why I drop document part.
>=20
> If Thierry's patch(v2 or v3) is accpeted, this patch won't need any
> further doc since it will use the IOMMU standard bindings("iommus =3D ").

The binding for the Tegra SMMU would still need to document what the
specifier means. Also I think we should change the current meaning of a
two-cell bitmask to the more explicit one cell per SWGROUP binding, that
is something like this:

	iommus =3D <&smmu TEGRA_SWGROUP_SDMMC1A>;

Thierry

--0/kgSOzhNoDC5T3a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTj5IlAAoJEN0jrNd/PrOhjPsQAIn9vJmIilLQW9KhKUtMb4pQ
sd/+WQtWBtK39mpKrWEo7JEr1bT0oFMKvP+2MC/pZIMJ6uLzxSqttumN9atuneOc
VsvU2379Ew6YvI+o1qTzD/tm3Tv3xtEz4SFC3yNtLItu9XMpFv/XN50IBxsDgyZW
ReKPlMXNwxKqBvsJsHw1VDcb7TLreb8kydQcdPxWpJDw8Hb1gEcJO8S21AddDTAh
dlGbWUIO4gljuklgcGdy6uRp0S/oavLge+f9/RDXbF189mFc7137xcvR+gPkrLvv
3af2sN4hg3GdwoCBDsxsL5/Qd4kCkYKMaQcoy1qzoydKX0kJQg1dC4XGTA2BYpyX
iYNSyXNbqOFVsComEPChVihjQB13CeXvOPCXfBTlfM1uJmGw9+d8nJQurrFEcoKL
TC2EPn7jCexF/c7ONlcPaILyQCXtH6AawvevYz7FJHsodRHeU2e3F0Zgvo0uIOm7
5daPN650Glt3yTFyL39O+v9CIoHODGVYZ1RCOer7znBBJCXboCEbtpf3EPBkESO9
Ei6hLraK+xK9sxPKV6J+Vm+X7K1GP2E7aQiVphYWdJ1RyaSSBDMLIfYxtkFiQqua
cQFojGdweDC7KZvPUJDNwVuttT7R0wMP/KXOhCRSC+ZByZzGgV4Fg9B8QHk2wRFq
lQCTgiWVXsQW2vcu4yJh
=vZke
-----END PGP SIGNATURE-----

--0/kgSOzhNoDC5T3a--
