From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/4] regulator: tps65910: update type for regmap
Date: Thu, 19 Apr 2012 13:54:43 +0100
Message-ID: <20120419125443.GI3046@opensource.wolfsonmicro.com>
References: <1334710829-22777-1-git-send-email-rklein@nvidia.com>
 <1334710829-22777-2-git-send-email-rklein@nvidia.com>
 <20120418092547.GE3021@opensource.wolfsonmicro.com>
 <1334779402.32315.63.camel@rklein-linux>
 <1334780371.32315.66.camel@rklein-linux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Li7ckgedzMh1NgdW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1334780371.32315.66.camel@rklein-linux>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Li7ckgedzMh1NgdW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2012 at 01:19:31PM -0700, Rhyland Klein wrote:
> On Wed, 2012-04-18 at 13:03 -0700, Rhyland Klein wrote:

> > Which interface are you saying is broken? The regmap interface or the
> > one internal to the tps65910 code?=20

This driver is broken.

> > So to be clear... Your recommendation is to change the tps65910 code to
> > remove the common read/write callbacks and to use regmap directly in
> > each component, and then when using regmap, do use the regmap raw
> > functions instead of the bulkread/write?

> Looking at the code, I would think it makes more sense use regmap_read
> which enforces types since the tps65910 code only ever seems to use
> regmap to access a single register at a time. Do you agree?

Yes, for single register I/O the drivers should just be using the
per-register APIs regmap has if they're using regmap directly.  Having
wrappers for this in the header would be fine also, the things that are
really problematic about the current code are the void * usage and the
fact that individual drivers are writing register read/write functions.

If the driver wasn't using void * this bug would've been caught by the
compiler.

--Li7ckgedzMh1NgdW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPkAsMAAoJEBus8iNuMP3dVEwP/1X+vJVv+E0gjzLKX2vjZrPU
wDMlK32CjnlUFK+sh6o3SXvYT/BV9MSQ6JwKdkudGqV1Vr2uhzY0ES/ut5gaRejJ
vlNwG6V3g0rwTvjbF/Yscv4VpdeFSoLc4daoETFa5X7iBNe8cIYaWl4gU++QsOPx
tp36Ergw/OxAX4g2k5FjqsdZjULtXrPj5K777mtR8wGCKm5P3aGIkxT2jG3wqoxd
PbA3rCnwFJa2cOQtQM+m6uX/bDFVAkBQaYEiBFGVCEHSIVZuidm6cF260+6wBdEv
FlKhiGsgVUme8nowgBygg+LJTBiQD2IPmGABngqugw13QpTxQJtINtjeYkg1+9+S
NkUxrhdKm2RhI97PlPLG0eIWsBJsfxSuCjNfj9INYZdDmwNfwwrWSw6cYePCIN2J
xLea8XC/Kv/JzZuJjAKMOem87jeIbWYNxyfYnUM5lxt43R4xuo2sgJI3e5Q1UGy3
lGdutqAo/igLnF0nq3Gt4cQr/zLrnVM+g5rUuFc70ognL15aDnaUOqS23NOOnf90
5XSobgUefS9lc3NNT7Herplho8Tj92zkZGflMkw24W754SxKDyQxalJBbHAVPdG6
QWC8BsAc2i9Q7/M6mVR7oV7gvRmZwJZABTIh+QRJ9gauFQOkTsTVw1B09xTVS5PU
Am8j2QqWWiDR9N6+IJce
=srMh
-----END PGP SIGNATURE-----

--Li7ckgedzMh1NgdW--
