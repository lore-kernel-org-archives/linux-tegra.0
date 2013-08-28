From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: tegra: Add hdmi to Tegra114 Dalmore device tree
Date: Wed, 28 Aug 2013 15:25:53 +0200
Message-ID: <20130828132552.GC604@ulmo>
References: <1377686459-16634-1-git-send-email-mperttunen@nvidia.com>
 <1377686459-16634-6-git-send-email-mperttunen@nvidia.com>
 <20130828123008.GC32254@ulmo>
 <521DF1E9.7050504@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <521DF1E9.7050504-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2013 at 03:49:45PM +0300, Mikko Perttunen wrote:
> On 08/28/2013 03:30 PM, Thierry Reding wrote:
> >On Wed, Aug 28, 2013 at 01:40:59PM +0300, Mikko Perttunen wrote:
[...]
> >>  			regulator-min-microvolt =3D <5000000>;
> >>  			regulator-max-microvolt =3D <5000000>;
> >>  			enable-active-high;
> >>+			regulator-always-on;
> >>+			regulator-boot-on;
> >
> >This warrants at least a mention in the commit message.
>=20
> Hmm, yeah. Looks like the HDMI driver only enables the Vdd in
> tegra_output_hdmi_enable, which is too late at least for DDC. I
> guess a better patch would be to enable it earlier. In _probe?

I don't think that would be much better. That way the supply will still
always be on, independent of whether we're actually using HDMI or not.
I'm thinking that perhaps we need to allow HDMI to override get_modes()
by something custom. That should also help with the EDID problem in the
earlier patch.

Thierry

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHfpgAAoJEN0jrNd/PrOhD+8P/0AL5x/hr33/Tng2tV3i9iyO
o4cuIpRbbi8GurRtvsCgg0GJQgfSSN4owwdZtKDdogBVvLkt6bNEGPG6YWVDUyQr
KGd8iNtBmpJ2f/ZXfclHqxLUXPJarjYNwj1Z2TW0jossRysxXso2yIGPYdR5769+
iUiyix5wAYCylEYGApepdH/jk7hyxWO6lMb+3vBC/Bf4fIJXTymQVZNIuWBRstX8
NLY0YvA0jiD0ldQXshUcPVrvjRa+6H5VNBc4JkP2ALyf2N2+oppVZ7+o+yDp4G26
b6TDEdFj5Gvf6FaCHy1X5KIxQvQ22c7qn2JXR0EcAR7ALfksEUBkS+5/YzI1pS7k
FoV5FrAtvWxG0K3pvNcTQOyGQ1u+PUsNceFZxYJJLyeN539dBy/Q+TCwuww5kxkR
p/viwukxWVFjaYui86ruADJBSEMbEOSpkMjUq00geUu4nwHJCDep7i6iq6aPomTy
Xpx7NuDXBbKiBh4lRFsTOi4JwVDy0A4ZUW/JutXyqQB31l3te774MdZLKdaz+CE5
x4133zP9JH39bQnqQZMAmHru5T75fjKLDWDAj5flrlBd/u5p5NfPwttpJWVj6um7
A5Fy0Iwyy9709VZOvp5g4IL3rdmLhlu6l3keEh6Q07nrp0jpjkMw3DvLTHyE7KlX
1aT5i0jLhRPjjA4HaOpQ
=n80n
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
