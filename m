From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: tegra: Properly setup PWM clock on Tegra30
Date: Fri, 1 Nov 2013 10:38:41 +0100
Message-ID: <20131101093840.GF27864@ulmo.nvidia.com>
References: <1383061872-27899-1-git-send-email-treding@nvidia.com>
 <1383061872-27899-3-git-send-email-treding@nvidia.com>
 <52701062.30405@wwwdotorg.org>
 <20131030210023.GB7686@mithrandir>
 <52717C4F.6000202@wwwdotorg.org>
 <20131030225443.GB6939@mithrandir>
 <20131031153923.GW22111@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NQTVMVnDVuULnIzU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131031153923.GW22111-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--NQTVMVnDVuULnIzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2013 at 05:39:23PM +0200, Peter De Schrijver wrote:
> On Wed, Oct 30, 2013 at 11:54:44PM +0100, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Wed, Oct 30, 2013 at 03:38:23PM -0600, Stephen Warren wrote:
> > > On 10/30/2013 03:00 PM, Thierry Reding wrote:
> > > > On Tue, Oct 29, 2013 at 01:45:38PM -0600, Stephen Warren wrote:
> > > >> On 10/29/2013 09:51 AM, Thierry Reding wrote:
> > > >>> The clock for the PWM controller is slightly different from
> > > >>> other peripheral clocks on Tegra30. The clock source mux field
> > > >>> start at bit position 28 rather than 30.
> > >=20
> > > >>> diff --git a/drivers/clk/tegra/clk-tegra30.c
> > > >>> b/drivers/clk/tegra/clk-tegra30.c
> > > >>=20
> > > >>> @@ -836,7 +837,6 @@ static struct tegra_clk
> > > >>> tegra30_clks[tegra_clk_max] __initdata =3D { [tegra_clk_extern1]
> > > >>> =3D { .dt_id =3D TEGRA30_CLK_EXTERN1, .present =3D true },=20
> > > >>> [tegra_clk_extern2] =3D { .dt_id =3D TEGRA30_CLK_EXTERN2, .present
> > > >>> =3D true }, [tegra_clk_extern3] =3D { .dt_id =3D TEGRA30_CLK_EXTE=
RN3,
> > > >>> .present =3D true }, -	[tegra_clk_pwm] =3D { .dt_id =3D
> > > >>> TEGRA30_CLK_PWM, .present =3D true },
> > > >>=20
> > > >> I think you still need an entry in this table; isn't it used by
> > > >> the DT->internal clock ID translation function?
> > > >=20
> > > > As far as I can tell, this is used by the generic code to
> > > > determine which of the generic clocks to register. If
> > > > TEGRA30_CLK_PWM is kept within this list, tegra_periph_clk_init()
> > > > will register the clock a second time.
> > > >=20
> > > >> Either way, it seems like this patch might want to add a=20
> > > >> tegra_clk_pwm_tegra30 so that the common C files can still
> > > >> implement this clock, just with different parameters?
> > > >=20
> > > > That's pretty much what this patch does, isn't it? It adds a
> > > > custom entry for the PWM clock to the Tegra30-specific
> > > > tegra_periph_clk_list and keeps the common one from being
> > > > registered by dropping the entry from tegra30_clks.
> > >=20
> > > I was hoping for the new clock that gets added to be added to the
> > > common file that defines the common clocks rather than to be added to
> > > the Tegra30-specific files. However, I suppose if it really is a
> > > Tegra30-specific clock, then keeping it isolated to the
> > > Tegra30-specific file might make sense.
> > >=20
> > > That said, I wonder if we can't keep the PWM clock definition in the
> > > common file, and just make it a bit parameterized? Perhaps that
> > > defeats the purpose of a common definition though.
> > >=20
> > > > The same is already done on Tegra20, where the PWM clock is
> > > > similarly weird.
> > >=20
> > > OK, perhaps that's reasonable precedent for this then.
> > >=20
> > > > On Tegra114 and Tegra124 the clock is still weird, but it can be=20
> > > > tweaked into behaving more commonly by lying about the actual
> > > > position and size of the mux field.
> > >=20
> > > That doesn't sound good... What if someone actually wants to use the
> > > correct position/size (e.g. use mux options that presumably can't be
> > > selected now we've lied)? We really shouldn't lie about things.
> >=20
> > Perhaps I've misinterpreted the code. At least comparing to the register
> > definitions the field should still be 3 bits wide, but the code clamps
> > it to the upper 2, which makes it compatible with the regular peripheral
> > clocks. The mux options that are left out are apparently very uncommonly
> > used (PLLC2 and PLLC3).
> >=20
>=20
> And also not validated. Also by policy PLLC2 and PLLC3 are used for scali=
ng
> IP blocks. So I don't think it makes sense to use them for PWM?

But the policy is already defined in the clock initialization tables, so
we could still setup the clock to exhibit all the possible HW choices
and simply not use those excluded "by policy".

Thierry

--NQTVMVnDVuULnIzU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSc3agAAoJEN0jrNd/PrOhq9wP/iCHdZZZL3PvHFGgNv+jBaLw
w39QeahF38hq0u7ZTodxSKBeQx1/CYsoGGexDVKDs6IQKSYNflLAYGtOXGQI3yDL
H3OO84FecQTMGGy2BZhxOiocGRlGT/MoJXiKv0E62L9hQ1Nhm+5yG5DZVy/pxN0d
pWn72lqX3DxYp1j8lImrD6B0NvoaMHFrJ8BdE6+T+Qgz+c8WmW+w6eEUU4Tpz+ID
pnGJxXOLNV4vthNIreb9t8ulvZQQNbARPawmEgewMmx3d6cerMHZI1/eVWS22d2D
TQvzYT2eqMO6dEaGJb3AMZilv537siMQEiAPIycntHoAVLIRkWaM3tdVkc5zIjAC
coGxOwEGcVZMXFRKH9R6KOpowm2z13EwQJkKf5InTZXHj56av+CVOBUlXjTGvXDv
h3QbpVRtgFWK2S6q7aFVgWV71yH+Rk3iFzeDnUGqKOhBUkzEMTYsW7A70gyAOra7
3Jw4XR6YpIG/sx2wBnUaU8Q7UMn2IXt/JD7d14kofyCFnTjAv8AeWPM0PuMNIzvL
mGyqtYIHa1W2VQx//qNa+T8Osq5eW2ThwzxxYR0uX0BJRWpGJgHZO3NhEkViGzX5
MUyIsTH3HXfP5I1vk3qyf33dvb7VoGKylZegMUNKR/oqlYbZAmS5xoX4P8Mu7pQi
n7y1B3xm5CmxF9cZ8pdf
=8lxR
-----END PGP SIGNATURE-----

--NQTVMVnDVuULnIzU--
