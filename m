From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v4 10/10] pwm-backlight: Add rudimentary device tree
 support
Date: Tue, 20 Mar 2012 09:39:44 +0100
Message-ID: <20120320083943.GA20249@avionic-0098.adnet.avionic-design.de>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
 <1331740593-10807-11-git-send-email-thierry.reding@avionic-design.de>
 <4F67F2AF.3020404@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0847131336409593096=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F67F2AF.3020404-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============0847131336409593096==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> On 03/14/2012 09:56 AM, Thierry Reding wrote:
> > This commit adds very basic support for device tree probing. Currently,
> > only a PWM and a list of distinct brightness levels can be specified.
> > Enabling or disabling backlight power via GPIOs is not yet supported.
> >=20
> > A pointer to the exit() callback is stored in the driver data to keep it
> > around until the driver is unloaded.
>=20
> > +++ b/Documentation/devicetree/bindings/video/backlight/pwm-backlight
>=20
> > +pwm-backlight bindings
> > +
> > +Required properties:
> > +  - compatible: "pwm-backlight"
> > +  - pwm: OF device-tree PWM specification
> > +  - num-brightness-levels: number of distinct brightness levels
> > +  - brightness-levels: array of distinct brightness levels
>=20
> I assume the values in this array are 0 (darkest/off) to 255 (max
> brightness)? The doc should probably specify this.

Typically yes. Although I haven't tested this it should work for pretty much
any range starting from 0 because the last value will be used to interpolate
("scale") the PWM duty cycle. So it really is 0 (darkest/off) to <last item>
(max brightness). I should document this, of course.

> > +  - default-brightness-level: the default brightness level
>=20
> Likewise, this is an index into the default-brightness-level? Again,
> it'd be best to explicitly state this.

Yes. Correct.

> ...
> > +		brightness-levels =3D <0 4 8 16 32 64 128 255>;
> > +		default-brightness-level =3D <6>;
>=20
>=20
> > +static int pwm_backlight_parse_dt(struct device *dev,
> > +				  struct platform_pwm_backlight_data *data)
> ...
> > +		ret =3D of_property_read_u32(node, "default-brightness-level",
> > +					   &value);
> > +		if (ret < 0)
> > +			goto free;
>=20
> Range-check that against max_brightness?

Yes, that would be good. I guess logging a warning and falling back to
max_brightness would be the proper action?

> >  static int pwm_backlight_probe(struct platform_device *pdev)
> ...
> > -	pb->pwm =3D pwm_request(data->pwm_id, "backlight");
> > -	if (IS_ERR(pb->pwm)) {
> > -		dev_err(&pdev->dev, "unable to request PWM for backlight\n");
> > -		ret =3D PTR_ERR(pb->pwm);
> > -		goto err_alloc;
> > -	} else
> > -		dev_dbg(&pdev->dev, "got pwm for backlight\n");
> > +	if (!pb->pwm) {
> > +		pb->pwm =3D pwm_request(data->pwm_id, "backlight");
> > +		if (IS_ERR(pb->pwm)) {
> > +			dev_err(&pdev->dev, "unable to request PWM for backlight\n");
> > +			ret =3D PTR_ERR(pb->pwm);
> > +			goto err_alloc;
> > +		} else
> > +			dev_dbg(&pdev->dev, "got pwm for backlight\n");
> > +	}
>=20
> Hmmm. It'd be more consistent if pwm_backlight_parse_dt() called
> something like of_pwm_get() instead of of_pwm_request(), so that this
> code could always call pwm_request() on the PWM and hence operate the
> same irrespective of DT vs non-DT. GPIOs work that way at least.

That's actually what the initial patch had. Unfortunately that's pretty much
the opposite direction of where the PWM framework is headed because it would
involve getting a global index to request the PWM. I think in the long run =
it
would be much better to get rid of pwm_request() altogether and unify by
having the non-DT case request the PWM device on a per-chip basis.

Thierry

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEUEARECAAYFAk9oQk8ACgkQZ+BJyKLjJp8ZIgCXYfxPA5MMEFA7OaZdhhc3ZyhB
fACeP5QJQU6/l00pPdVFnpkVY3RxuAg=
=36MB
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

--===============0847131336409593096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0847131336409593096==--
