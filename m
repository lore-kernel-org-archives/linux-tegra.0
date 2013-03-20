From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH V4 9/9] pwm_bl: Add mandatory backlight enable regulator
Date: Wed, 20 Mar 2013 23:19:27 +0100
Message-ID: <20130320221927.GA6416@avionic-0098.mockup.avionic-design.de>
References: <1363719573-20926-1-git-send-email-achew@nvidia.com>
 <1363719573-20926-10-git-send-email-achew@nvidia.com>
 <5149F92A.3070004@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5149F92A.3070004-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, romain.naour-oid7hba3+9NWj0EZb7rXcA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drwyrm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, laforge-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lost.distance-/E1597aS9LQAvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gxt-TG0Ac1+ktVePQbnJrJN+5g@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openezx-devel-ZwoEplunGu3n3BO9LpVK+9i2O/JbrIOy@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2013 at 12:00:10PM -0600, Stephen Warren wrote:
> On 03/19/2013 12:59 PM, Andrew Chew wrote:
> > Many backlights need to be explicitly enabled.  Typically, this is done
> > with a GPIO.  For flexibility, we generalize the enable mechanism to a
> > regulator.
> >=20
> > If an enable regulator is not needed, then a dummy regulator can be giv=
en
> > to the backlight driver.  If a GPIO is used to enable the backlight,
> > then a fixed regulator can be instantiated to control the GPIO.
> >=20
> > The backlight enable regulator can be specified in the device tree node
> > for the backlight, or can be done with legacy board setup code in the
> > usual way.
>=20
> > diff --git a/Documentation/devicetree/bindings/video/backlight/pwm-back=
light.txt b/Documentation/devicetree/bindings/video/backlight/pwm-backlight=
=2Etxt
> > index 1e4fc72..7e2e089 100644
> > --- a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.t=
xt
> > +++ b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.t=
xt
> > @@ -10,6 +10,11 @@ Required properties:
> >        last value in the array represents a 100% duty cycle (brightest).
> >    - default-brightness-level: the default brightness level (index into=
 the
> >        array defined by the "brightness-levels" property)
> > +  - enable-supply: A phandle to the regulator device tree node. This
> > +      regulator will be turned on and off as the pwm is enabled and di=
sabled.
> > +      Many backlights are enabled via a GPIO. In this case, we instant=
iate
> > +      a fixed regulator and give that to enable-supply. If a regulator
> > +      is not needed, then provide a dummy fixed regulator.
>=20
> "enable" doesn't seem like the right name here; if this really is an
> "enable" input, then it's not a regulator. If you're calling it "enable"
> because the regulator is usually controlled by a GPIO that enables it,
> then what you really have is a regulator that provides power to the
> backlight, and the method that you enable that regulator is irrelevant.
>=20
> Put another way, wouldn't "power" be a better name, thus making the
> property "power-supply"? Although that property name migth be considered
> to have some negative correlation with other concepts, so if people
> object to that, perhaps e.g. "vdd-supply"?

"power" sounds like a reasonable name to me.

Thierry

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRSjXvAAoJEN0jrNd/PrOhH58P/3as8S0NPRglpsqClqXKbDUG
KD8EXgJsF5lKY2uBRd5K8Wdh3HmjaIgvFf5FAh7XR4dP4iyq/6/nSzCDEkiyZxui
bGGIAc0vQeXXEM/Hpam9lm6ZQUk2Zr/rcs25U70mpVbDPIqQmh9pgD6ds8n8Xh37
9EuFCzK6lk7LlAmyEC3Qd2QH8JtpDmVHtPVl0NVqGakosOJs/8lSuOpeJi1BKnKy
MLGAAJkld2nB/5JZuvyr/h+6/bxhGf1kmrZ9eb1Dtu1XAGlglxh0F7Ao7+QD05Gg
l3m0Csl78IZE5dx9DoQBLbIR02vfGHoBm6I2RNXh9aJVmjjrJxeHmDx/nYvRTthA
dKZ32u+woziHHY2qBfKRIEwmbxYXemucKlPIOG0le45jY0Lej8BlCgY0DklYo0+H
dMRejn5v0s0kMfUlWfUywYMzCQlqY2i4/ShmjYrO8y02dsamYyJr8cOHd8JM2j3Z
3pM6qQn1gUBgmRaeDjGgDPmE0UUnmoM3Mmys5RvsQ2BbFACk68JdceKssSp3YHQD
DA6RZ8ngVp8owAK2NMgyRPqHeAP+ToiJilk+jS0H0MA/phH0y12F6BAm6sbKa0Xm
uOUG512E8FfMkQqpU9PqtUkp0+iG/v9sxY8Gq7xnbzeFt14lGZrNEGPkb7cgFTkU
+QtKv4DTeD8zgIZ9Wjyr
=cxRC
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
