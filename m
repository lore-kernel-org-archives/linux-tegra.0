From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 02/10] pwm: Allow chips to support multiple PWMs.
Date: Wed, 8 Feb 2012 09:15:08 +0100
Message-ID: <20120208081508.GA6673@avionic-0098.mockup.avionic-design.de>
References: <1328541585-24642-1-git-send-email-thierry.reding@avionic-design.de>
 <1328541585-24642-3-git-send-email-thierry.reding@avionic-design.de>
 <4F31AB63.3020301@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F31AB63.3020301-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Ryan Mallon wrote:
> On 07/02/12 02:19, Thierry Reding wrote:
> > The total maximum number of PWM devices is currently fixed to 64, but
> > can easily be made configurable via Kconfig.
>=20
> It would be better to make the code handle arbitrary numbers of PWMs. A
> Kconfig knob becomes annoying when you have more than one platform
> configured into the kernel.

AFAICT handling an arbitrary number of PWMs will only be possible once we g=
et
rid of the global namespace and therefore should be postponed for later. I
may be wrong, though, so if anybody can point me in the right direction I'm
perfectly happy to change that in this series.

> > The patch is incomplete in that it doesn't convert any existing drivers
> > that are now broken.
>=20
> Does this patch actually break the drivers in terms of not building or
> running? If so, can this patch series be reworked a bit to allow the old
> PWM framework to be used until all of the drivers are converted?

That sentence is misleading. Since the new framework implements the exact
same API as the drivers, any unconverted drivers will still work unless they
are built within the same kernel as the framework.

The intent is to get the framework into an acceptable, backwards-compatible
shape and port existing drivers (i.e. PWM API providers) to the new framewo=
rk
to ensure everything keeps working as usual.

After that, any issues with the current implementation can be addressed
(per-chip numbering, ...).

> >  struct pwm_device {
> > -	struct			pwm_chip *chip;
> > -	const char		*label;
> > +	const char *label;
> > +	unsigned int pwm;
> > +};
> > +
> > +struct pwm_desc {
> > +	struct pwm_chip		*chip;
> > +	void			*chip_data;
> >  	unsigned long		flags;
> >  #define FLAG_REQUESTED	0
> >  #define FLAG_ENABLED	1
> > -	struct list_head	node;
> > +	struct pwm_device	pwm;
> >  };
>=20
>=20
> Do pwm_desc and pwm_device really need to be separate structs?
> pwm_device only has two fields, which could easily be added to pwm_desc
> (and rename it to pmw_device if you like). They are both opaque
> structures, so it makes no difference to the users of the framework.

This was meant to be a middle-ground between the PWM API and a central
framework. The current PWM API returns a pointer to struct pwm_device when
requesting a PWM but the plan was to keep this in line with gpiolib which
does a lot of the same managing.

Perhaps I should elaborate some more. One thing I find particularily nice
about gpiolib is how each GPIO can be addressed with just the GPIO number
which is initially requested and can only be used by the requester. So the
plan was to keep a set of pwm_desc structures which could be looked up via
the PWM number instead of using a pointer to struct pwm_device.

In retrospect I must say that this may not have been the best idea. If inde=
ed
we want to end up with a per-chip numbering of PWM devices, a global number
won't do any good. Keeping the pwm_device structure and wiring it up with t=
he
PWM chip would be a better fit.

Does that sound reasonable?

> > -static LIST_HEAD(pwm_list);
> > -
> >  static DEFINE_MUTEX(pwm_lock);
> > +static DECLARE_BITMAP(allocated_pwms, MAX_PWMS);
> > +static RADIX_TREE(pwm_desc_tree, GFP_KERNEL);
>=20
> I missed any discussion of this from v1, but why was this approach
> chosen? The bitmap arbitrarily limits the maximum number of PWMs and is
> also a little bit (nitpicky) wasteful when a platform doesn't need
> anywhere near 1024 PWMs.

The initial implementation used a static array of MAX_PWMS pwm_desc
structures (with MAX_PWMS being 64), but in order not to waste memory
unnecessarily this was changed to a radix tree with the bitmap keeping track
of free ranges.

> In most cases I would expect that platforms only have a handful of PWMs
> (say less than 32), in which case a list lookup isn't too bad.

The difficulty with such a scheme is allocating a contiguous range of PWM I=
Ds
for each chip.

> As someone else mentioned, it might be best to drop the global numbering
> scheme and have each pwm_chip have its own numbering for its PWMs. So
> requesting a PWM would first require getting a handle to the PWM chip it
> is on. If a chip has a fixed number of PWMs (e.g. set a registration
> time) then the PWMs within a chip can just be an array with O(1) lookup.

Yes, that would be the ultimate goal.

> > +static int alloc_descs(int pwm, unsigned int from, unsigned int count)
>=20
> >  {
>=20
> You don't really need the from argument. There is only one caller for
> alloc_descs and it passes 0 for from. So you could re-write this as:
>=20
> 	static int alloc_descs(int pwm, unsigned int count)
> 	{
> 		unsigned int from =3D 0;
> 		...
>=20
> 		if (pwm > MAX_PWMS)
> 			return -EINVAL;
> 		if (pwm >=3D 0)
> 			from =3D pwm;

You're right, I'll change that for the next series. Unless we decide to get
rid of the whole pwm_desc structure.

> > -	struct pwm_device *pwm;
> > +	unsigned int start;
> > +	unsigned int i;
> > +	int ret =3D 0;
> > +
> > +	if (pwm >=3D 0) {
> > +		if (from > pwm)
> > +			return -EINVAL;
> > +
> > +		from =3D pwm;
> > +	}
>=20
>=20
> This doesn't catch some caller errors:
>=20
> 	if (pwm > MAX_PWMS || from > MAX_PWMS)
> 		return -EINVAL;

I'll fix that as well.

> > +
> > +	start =3D bitmap_find_next_zero_area(allocated_pwms, MAX_PWMS, from,
> > +			count, 0);
>=20
> Do the PWM indexes need to be contiguous for a given PWM chip? You could
> probably grab each bit individually.

Now that you mention it, I don't think so. Since there can currently only be
a single provider of the PWM API there really aren't any restrictions at all
since each chip will simply get the first N indices anyway.

> That said, I think a better solution is to have per-chip numbering.

Yes, I've heard that a number of times already. =3D)

> > -	list_for_each_entry(pwm, &pwm_list, node) {
> > -		if (pwm->chip->pwm_id =3D=3D pwm_id)
> > -			return pwm;
> > +	if ((pwm >=3D 0) && (start !=3D pwm))
>=20
>=20
> Don't need the inner parens.

I usually like to keep it explicit but I can change it, no problem.

> > +		return -EEXIST;
> > +
> > +	if (start + count > MAX_PWMS)
> > +		return -ENOSPC;
>=20
>=20
> Is this possible? Can bitmap_find_next_zero_area return a start position
> where the count would exceed the maximum?

It can indeed. Whenever the area doesn't fit it will return a number past t=
he
maximum (see lib/bitmap.c).

> > +
> > +	for (i =3D start; i < start + count; i++) {
> > +		struct pwm_desc *desc =3D alloc_desc(i);
> > +		if (!desc) {
> > +			ret =3D -ENOMEM;
> > +			goto err;
> > +		}
> > +
> > +		radix_tree_insert(&pwm_desc_tree, i, desc);
> >  	}
> > =20
> > -	return NULL;
> > +	bitmap_set(allocated_pwms, start, count);
> > +
> > +	return start;
> > +
> > +err:
> > +	for (i--; i >=3D 0; i--)
>=20
>=20
> Nitpick:
>=20
> 	while (--i >=3D 0)
>=20
> is a bit simpler.

Okay.

> > +		free_desc(i);
> > +
> > +	return ret;
> > +}
> > +
> > +static void free_descs(unsigned int from, unsigned int count)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i =3D from; i < from + count; i++)
> > +		free_desc(i);
> > +
> > +	bitmap_clear(allocated_pwms, from, count);
> >  }
> > =20
> >  /**
> > - * pwmchip_add() - register a new pwm
> > - * @chip: the pwm
> > - *
> > - * register a new pwm. pwm->pwm_id must be initialized. if pwm_id < 0 =
then
> > - * a dynamically assigned id will be used, otherwise the id specified,
> > + * pwm_set_chip_data - set private chip data for a PWM
> > + * @pwm: PWM number
> > + * @data: pointer to chip-specific data
> >   */
> > -int pwmchip_add(struct pwm_chip *chip)
> > +int pwm_set_chip_data(unsigned int pwm, void *data)
>=20
>=20
> This interface is a bit ugly. Shouldn't the user need to have a handle
> to the pwm_device in order to access the chip_data? Why should callers
> be able to set/grab chip data from random PWMs?

That interface is meant to be used by drivers to set and retrieve driver-
private data for the PWM. Again, if we get rid of the radix tree and struct
pwm_desc this can be done via the pwm_device structure directly.

> > +int pwmchip_add(struct pwm_chip *chip)
[...]
> > +	/* initialize descriptors */
> > +	for (i =3D chip->base; i < chip->base + chip->npwm; i++) {
> > +		struct pwm_desc *desc =3D pwm_to_desc(i);
> > +
> > +		if (!desc) {
> > +			pr_debug("pwm: descriptor %u not initialized\n", i);
>=20
>=20
> Should this be a WARN_ON?

Yes. I just saw that WARN_ON can even be used within a condition, so I'll f=
ix
that up as well. Unless, of course, pwm_desc is removed.

> > +EXPORT_SYMBOL_GPL(pwmchip_find);
>=20
> So, propreitary modules are not allowed to use PWMs?

I just copied that from gpiolib. I don't know, should they?

> > +	if ((pwm < 0) || (pwm >=3D MAX_PWMS))
>=20
> Don't need the inner parens.

Okay.

> > +		return ERR_PTR(-ENOENT);
>=20
> -EINVAL maybe?

Yes, that's better.

> > +
> >  	mutex_lock(&pwm_lock);
> > =20
> > -	pwm =3D _find_pwm(pwm_id);
> > -	if (!pwm) {
> > -		pwm =3D ERR_PTR(-ENOENT);
> > -		goto out;
> > -	}
> > +	desc =3D pwm_to_desc(pwm);
> > +	dev =3D &desc->pwm;
>=20
> This looks wrong. If the pwm_desc being requested doesn't exist, won't
> this oops?

Yes, a check is missing here.

> >  void pwm_free(struct pwm_device *pwm)
> >  {
> > +	struct pwm_desc *desc =3D container_of(pwm, struct pwm_desc, pwm);
> > +
> >  	mutex_lock(&pwm_lock);
>=20
> pwm_lock is used to protect global addition and removal from the
> radix/tree bitmap. Here you are also using it to protect the fields of a
> specific pwm device? Maybe it would be better to have a per pwm device
> lock for this?

I'm not sure. pwm_free() would be the sole user currently, so maybe it would
be overkill at this point.

> > -	if (!test_and_clear_bit(FLAG_REQUESTED, &pwm->flags)) {
> > +	if (!test_and_clear_bit(FLAG_REQUESTED, &desc->flags)) {
> >  		pr_warning("PWM device already freed\n");
> >  		goto out;
> >  	}
> > =20
> >  	pwm->label =3D NULL;
> > +	pwm->pwm =3D 0;
>=20
>=20
> Why do this? Isn't index 0 a valid PWM index?

I added that just to zero out all fields in the structure. And 0 is a valid
index, yes. There is currently no such thing as an invalid PWM index. Perha=
ps
that needs to be addressed as well. Alternatively this could just be handled
by using the pwm_desc's flags field.

Thanks for the thorough review,
Thierry

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk8yLwwACgkQZ+BJyKLjJp+7SACgoDgK/0IMfOIP+aMgQPRXE1al
Ao8AnjetH8HzTtDKRxb5rwute9rojwKg
=vXPK
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
