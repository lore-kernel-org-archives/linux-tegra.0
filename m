From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 27/27] drm/tegra: Add Tegra114 gr2d support
Date: Mon, 14 Oct 2013 16:00:11 +0200
Message-ID: <20131014140010.GC16302@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-28-git-send-email-treding@nvidia.com>
 <52587F2D.9070007@wwwdotorg.org>
 <525B880A.7090802@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525B880A.7090802-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2013 at 08:58:34AM +0300, Terje Bergstr=C3=B6m wrote:
> On 12.10.2013 01:43, Stephen Warren wrote:
> > On 10/07/2013 02:34 AM, Thierry Reding wrote:
> >> The gr2d hardware in Tegra114 is compatible with that of Tegra20 and
> >> Tegra30. No functionaly changes are required.
> > Similarly here, if the HW is 100% backwards-compatible, there's no need
> > to add compatible values to the driver.
>=20
> We've used this mechanism for attaching a per-hw-version data structure
> in match table to accomodate differences in how the hardware is power
> gated, reset, booted, some per-soc performance related changes etc. It's
> also used in staging features for new chips, such as disabling power
> features when they're not working/verified yet.
>=20
> Upstream driver is not yet in a state where that is relevant.
>=20
> With this, would we still be able to do that with match table? It sounds
> like we could, because we can still (even with multiple compatible
> properties) add separate entries in match table and I guess the
> compatible properties matched in order.

Yes, as long as the device tree files includes the most specific value
in the compatible this should still be possible. So we'd have this:

	gr2d@54140000 {
		compatible =3D "nvida,tegra114-gr2d", "nvidia,tegra20-gr2d";
		...
	};

and the driver will match on "nvidia,tegra20-gr2d" if the more specific
"nvidia,tegra114-gr2d" is not there. When the driver is updated to
support Tegra114 specific functionality, then a more specific entry can
be added to the compatible table to handle it.

Thierry

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSW/jqAAoJEN0jrNd/PrOhbH4QALU3En3mTdoarh9KS6uc9tXo
+EzQPnugO8f4/5CdYHk8/2Zy/VR0wIROG8HK4kMGn8MYocs5AF09FqeCbNLTvNCK
KGd//Bp8eTIw7q4OHczdmK1obx939KdQPwMc/Z88kqfGSrk4qeXkU3PTiYjp38MB
rqLwzaOmo7aPayNjs0C2cbpmqa277mbDvgvYZwI3G5hSR+SVCqdnXRRRlsykImre
usEtC/wx/7x0cVNaNaKQTl56djIfkb4NXbvxT506kZgLGKwtCFR4q2KryeHX0Jg2
RMI7fzaXPWKjEAxnf3pIP57accESv00LXeliE4xpT5oThn5uhPwS12AqkJ0ANr8v
LvtwUkWVKXFUyQpYTuogX+0y68c+SkAP5Jud3DMSF8wrdwDdh6e2PGcMaCoDig1c
4KNhBe/EaHMjUyVvapP+rm8/NV54SW9ZKsOQZemsB8J9SyOpJC3qj37DemaTeGp3
Zu+DOYFYWoi1++dO8gjkdjfE9+3k4rG0swJRg2uniasZVWFU5S/rggIjpdIuHQrI
sjApAQNWENyfcN6Mnn1wHwwX8/4A7XhibqZyeY3IJYVOa+Oas6fEmcyrzYUUzGCS
bKtfBr+dI4gdPey2RxKeQzKNo/KaGHzxXj++lTecq0q0ZBzUOkpUU+hZjDjDu9Hb
x28+9JUT/B9CAmatFI7S
=aj9q
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
