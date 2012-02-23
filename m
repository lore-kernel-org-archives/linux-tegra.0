From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 02/10] pwm: Allow chips to support multiple PWMs.
Date: Thu, 23 Feb 2012 09:12:35 +0100
Message-ID: <20120223081235.GC8621@avionic-0098.mockup.avionic-design.de>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
 <1329923841-32017-3-git-send-email-thierry.reding@avionic-design.de>
 <201202221634.45159.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2201354784055314282=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201202221634.45159.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============2201354784055314282==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline


--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Arnd Bergmann wrote:
> On Wednesday 22 February 2012, Thierry Reding wrote:
>=20
> >  #include <linux/module.h>
> > +#include <linux/of_pwm.h>
> >  #include <linux/pwm.h>
>=20
> You should probably reorder the patches for bisectability, or move the
> of_* related changes out of this patch into patch 3. At the point
> where patch 2 is applied, linux/of_pwm.h does not exist yet.

You're right. The correct thing would be to move the include into patch 3.
I'll make sure to check for bisectability in the next series.

> > +/**
> > + * pwmchip_find() - iterator for locating a specific pwm_chip
> > + * @data: data to pass to match function
> > + * @match: callback function to check pwm_chip
> > + */
> > +struct pwm_chip *pwmchip_find(void *data, int (*match)(struct pwm_chip=
 *chip,
> > +						       void *data))
> > +{
> > +	struct pwm_chip *ret =3D NULL;
> > +	struct pwm_chip *chip;
> > +
> > +	mutex_lock(&pwm_lock);
> > +
> > +	list_for_each_entry(chip, &pwm_chips, list) {
> > +		if (match(chip, data)) {
> > +			ret =3D chip;
> > +			break;
> > +		}
> > +	}
> > +
> > +	mutex_unlock(&pwm_lock);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(pwmchip_find);
>=20
> Is this only used for the device tree functions? If so, I would recommend
> making it less generic and always search for a device node.

It is currently only used to look up a struct pwm_chip for a given struct
device_node, yes. But I can see other uses for this. For instance this could
be useful if we ever want to provide an alternative way of requesting a PWM
on a per-chip basis.

> > +static int pwm_show(struct seq_file *s, void *unused)
> > +{
> > +	const char *prefix =3D "";
> > +	struct pwm_chip *chip;
> > +
> > +	list_for_each_entry(chip, &pwm_chips, list) {
> > +		struct device *dev =3D chip->dev;
> > +
> > +		seq_printf(s, "%s%s/%s, %d PWM devices\n", prefix,
> > +			   dev->bus ? dev->bus->name : "no-bus",
> > +			   dev_name(dev), chip->npwm);
> > +
> > +		if (chip->ops->dbg_show)
> > +			chip->ops->dbg_show(chip, s);
> > +		else
> > +			pwm_dbg_show(chip, s);
> > +
> > +		prefix =3D "\n";
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int pwm_open(struct inode *inode, struct file *file)
> > +{
> > +	return single_open(file, pwm_show, NULL);
> > +}
>=20
> When you have a seq_file with a (possibly long) list of entries, better
> use seq_open instead of single_open and print each item in the
> ->next() callback function.

Yes, that should work better. I just noticed that pwm_show() is actually
missing mutex_lock() and mutex_unlock() to protect against chip removal. Wi=
th
the iterator interface that should be easy to add.

I was again basically looking at gpiolib for inspiration (maybe I should st=
op
doing that :-). Maybe gpiolib should be reworked to use seq_file's iterator
interface as well? Just in case anybody else turns to gpiolib for
inspiration.

Thierry

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9F9PMACgkQZ+BJyKLjJp8YCgCdGxQLa3HL2+sJM9jgMec9wDRU
j4cAn1SMTxgBrCTEc0cTtingQwMmwnge
=/sXw
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--

--===============2201354784055314282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2201354784055314282==--
