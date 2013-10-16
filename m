From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 04/13] ARM: tegra: Add MIPI calibration DT entries for
 Tegra114
Date: Wed, 16 Oct 2013 12:57:44 +0200
Message-ID: <20131016105743.GG21963@ulmo.nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
 <1381850883-12722-5-git-send-email-treding@nvidia.com>
 <525DA888.2060800@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525DA888.2060800-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2013 at 02:41:44PM -0600, Stephen Warren wrote:
> On 10/15/2013 09:27 AM, Thierry Reding wrote:
> > Add a device node for the MIPI calibration block on Tegra114. There is
> > no need to disable it by default because it only enables the clock while
> > performing calibration and therefore shouldn't be consuming any power
> > when unused.
>=20
> > diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra1=
14.dtsi
>=20
> > +	mipi: mipi {
> > +		compatible =3D "nvidia,tegra114-mipi";
> > +		reg =3D <0x700e3000 0x100>;
> > +		clocks =3D <&tegra_car TEGRA114_CLK_MIPI_CAL>;
> > +		#calibrate-cells =3D <1>;
> > +	};
>=20
> Do you have a link to the binding documentation for this? I'm still in
> the dark re: why there's a need for #calibrate-cells at all. It seems
> like this should be some internal implementation detail of the Tegra
> DC/..., or implicit based on the compatible value (if cell count
> changes, just rev the compatible value; it's not like this is a generic
> service for loosely coupled drivers).

Here's the commit that adds the device tree binding:

	https://gitorious.org/thierryreding/linux/commit/43b798a54063156692e0fde2a=
9022c0ae44b862e

I was under the impression that we needed the #*-cells properties so
that the device tree code could verify that the content is actually
correct and so that it knows how to parse the specifier. I mean why
else do we have the #gpio-cells property for GPIO controller nodes?

Also note that this driver isn't for something internal to the DRM
driver. It can (and will) also be used by the V4L2 camera driver that
Bryan is working on, because the CSI pads need to be calibrated in the
same way.

Thierry

--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXnEnAAoJEN0jrNd/PrOh0UUP/iiK+FcoSKDShGwendhb6gUZ
IZnMjA/E8jg5H0q/Ab5wVZbCZW+jB979G2b6XyRKOn6rWQRvIGjJwcMZwPBs2K8m
JczUsWic0uAfxXZHa0BaJZxeSg/RpvttsMX94CoPoYc4rHZVNlNPwC6cgtw5fmgW
HtSZjH3rp+hIP9qWs5N7UEVtPvY5oKOMgEdEc6kM2SJiQsLt7EKBmuw/BlrpwusD
XyzzNIsi8om4+6rpnHRAypKU0QTpcrLa88buoKK6qNIWqay0zOhmKi/XZ0/0vFhF
MjTzEpx1ITUKgVdW+RWrTKCJOC+WqRY+BF0db2PbhlvOTsCqMw+1/GwzUlZKGR4C
Vdua+WVFoW1HF/U9U54drJSvjxmw+aTlqswVELSQX94QWCcPRN0Xliz8Q6RCWHYP
tyi6X1ka7Lg6kRo6FO8bAUclHQ3a5XrRUBhyBK20CrkGOmd1YgZuoLAS7Do0D5NM
wSJvL3okPcHu60iyH0dtHd+6rvy8hQ6dQSF2uMsNnE1PBMly0pneEPuA+pclQB4f
tajQzHD6bMHw408//3rIV80AOkk3vLqjJitw+/7dAGLqbgZkSZ9cZsb9DbK9GrJa
+yI+hl2rEbADu8aTgKEwAsXAljkLY76gQCrYIRIysJnHB8nXOW7v9rP1nGOvMnLU
UFQBie++dJD/qCNaCXyo
=XQYk
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
