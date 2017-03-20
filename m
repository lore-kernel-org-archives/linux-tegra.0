From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] soc/tegra: Move Tegra flowctrl driver
Date: Mon, 20 Mar 2017 18:00:40 +0100
Message-ID: <20170320170040.GC14787@ulmo.ba.sec>
References: <1489584715-23138-1-git-send-email-jonathanh@nvidia.com>
 <1489584715-23138-4-git-send-email-jonathanh@nvidia.com>
 <20170320141434.GC28203@ulmo.ba.sec>
 <c0b18931-1377-813d-c8a3-60aea4379aa6@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c0b18931-1377-813d-c8a3-60aea4379aa6-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2017 at 04:37:58PM +0000, Jon Hunter wrote:
>=20
>=20
> On 20/03/17 14:14, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Wed, Mar 15, 2017 at 01:31:53PM +0000, Jon Hunter wrote:
> > [...]
> >> +static int __init tegra_flowctrl_init(void)
> >> +{
> >> +	/* hardcoded fallback if device tree node is missing */
> >> +	unsigned long base =3D 0x60007000;
> >> +	unsigned long size =3D SZ_4K;
> >> +	struct device_node *np;
> >> +
> >> +	if (!soc_is_tegra())
> >> +		return 0;
> >> +
> >> +	np =3D of_find_matching_node(NULL, matches);
> >> +	if (np) {
> >> +		struct resource res;
> >> +
> >> +		if (of_address_to_resource(np, 0, &res) =3D=3D 0) {
> >> +			size =3D resource_size(&res);
> >> +			base =3D res.start;
> >> +		}
> >> +
> >> +		of_node_put(np);
> >> +	}
> >> +
> >> +	tegra_flowctrl_base =3D ioremap_nocache(base, size);
> >> +
> >> +	if (!tegra_flowctrl_base)
> >> +		return -ENXIO;
> >> +
> >> +	return 0;
> >> +}
> >> +early_initcall(tegra_flowctrl_init);
> >=20
> > Do we want to implement a hand-off to a proper driver at some point,
> > similar to what we have for PMC?
>=20
> Yes I can add, it won't do much apart from remap the io-space, but at
> least it is registered as a device then.

Yeah, the same is true for PMC, but I find it quite convenient to have a
struct device * around. Ideally, of course, we'd be able to somehow have
deferred probe take care of the dependencies so that we wouldn't have to
muck about with these initcalls, but I don't think we're there yet. That
"partial" driver would at least be some way in the right direction.

Thierry

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljQCrgACgkQ3SOs138+
s6EOdhAAo5zy/nNi4ghmUT0bVNKEtmFdTY7N313qNlRH16Fq9AsVkGaKbEEGANkZ
JJWDXXvKdP8x1OSyJCpETYsozhz5Nh90Teht5BvA3u+8nIFOKPVPAjebxbSeyAFY
RERLTJ5dxnEMMmwgTg9wYAIf2gUEQsPmy1UZlKhOe7gBoDdy9i/L2hxe3pO9W3YJ
csuQrLnd13qm+mmQTZSRoKw92HFsh/xScwEcCUFUVczcgXBC4/9eTTEn2CNbk+Bf
eOLfkn1fhcL0a4PA8GAVtQmp4H5Io+sEeVG8FweYoHVZrC5F3oQGKUBxZebOaVKw
9qHzN6UmtzvFzxIwH9ev5QQY+zxSSXd1tdTWjTXZ9t18iV//Hs/LzCf2mS9ZmQbQ
ZF+e9tt46Ym9BpM9NdakNLtkACh4KG0LJv4TUnSsO4pAmaK9Zzf+iKxsgaRfSYjq
D0QK5e5CVX5Jcke5ZjBtZsfZ06rwI694zdw07SCGBt/3EvDJIUN22Ud27aosF4Z8
htBNL4aMGkfiNerOl6jCxZqEU2qLARyEHef8Xd08yK96Q3axczesBkVz6Ba7ECEK
azOE0CWQNavfdEySSxzdggNshHoTxMeDD3Dy/x9gpwwqLZckgadUvXyLasuyKqTP
Ro4JxAz6qakMPv2Aij0JR/VB53UEfzsHp1IsjeB2BDTj0K+qc0w=
=jq8r
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
