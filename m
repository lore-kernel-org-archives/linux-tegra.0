From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 16/27] drm/tegra: Add Tegra114 display controller
 support
Date: Sat, 12 Oct 2013 13:32:32 +0200
Message-ID: <20131012113231.GD22284@mithrandir>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-17-git-send-email-treding@nvidia.com>
 <52587843.9070806@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ycz6tD7Th1CMF4v7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52587843.9070806-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Ycz6tD7Th1CMF4v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2013 at 04:14:27PM -0600, Stephen Warren wrote:
> On 10/07/2013 02:34 AM, Thierry Reding wrote:
> > From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The Tegra114 display controller is backwards-compatible with previous
> > generations of the Tegra SoC. No code changes are required.
>=20
> If the HW is backwards-compatible, then there's no need to add extra
> compatible values to the driver; just write the following in the DT, and
> it'll just work:
>=20
> compatible =3D "nvidia,tegra114-dc", "nvidia,tegra30-dc";

One reason why I thought it might be useful to still include this, even
though unnecessary, was to match it to the host1x_drm_subdevs table. We
can probably remove the entry from there as well, though.

As far as I can tell, the same holds for Tegra30, which is also
backwards compatible with Tegra20 but the DTS doesn't contain the
Tegra20 compatible. So to keep ABI compatibility we'll need to keep the
nvidia,tegra30-dc in the driver's match tables, but I could still update
the DTS to include the nvidia,tegra20-dc for correctness.

Does that make sense?

Thierry

--Ycz6tD7Th1CMF4v7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSWTNPAAoJEN0jrNd/PrOhg+YQAMCX7Sdoehs6HqNy7DVUpPIR
4Qtn/P2+diQ3sABjFIgtuIwTI0el4rx+izZgn7D4ANTDvGMT8fU+JSZ8QEv3CjAI
7kZted65e4IE45PUApdPuYiNP5VLnM2cPAvNAjB3UN2JlDTEf5Iv/t1q8fu9n1sH
5KsfG0GZdJPuvH1+hC4Wps7kR+b+Y8KIk7zVWRPi2aweUnTsfXSKsy75fg0dnUM6
tREPNTB8J0f9es5o28NsYM6piKWvq74tbA8drwbLGQYPX17AD1R5jL9GjJFAew25
+iyLYKF4LJh0SvL8FTEYMKRD0Z9kVg109wM6sz0rmhiT/GFjw5Y8DG0XU5XwDPWV
8/odYDIJ/olNRZOY4dh5s9kM68CmTVRnRC8BYrjLP4X5dfoRWlwGx0j6PwPlTOp/
WRp7U3mJ8ePUd7fE7QaNw7f5bi41ocxuNpeBAp29nb51seJpOJw475JcWOnpLDL/
Kc241ScsnnUrclGJOrsqezq8vdluy4tSKYga+FiNhAIEEKfQ7ZE+QjPlGYwUU+pe
9tNIweLaDsmR0cgukDoE8OlEizQlKwTCuHY0pH29iEfyohnQDiet/Ofwkhj4kRJa
HsAvq1lamUXZG+pWElI7CAfhqkfUe7H2gouenwqh6Wxt/BbFqe3RsJrOhpJD36Xv
YZrXyKA4Zn18sYtbIc7U
=XY6A
-----END PGP SIGNATURE-----

--Ycz6tD7Th1CMF4v7--
