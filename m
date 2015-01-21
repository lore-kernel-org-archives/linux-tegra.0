From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 01/36] clk: Introduce clk_try_parent()
Date: Wed, 21 Jan 2015 16:05:12 +0100
Message-ID: <20150121150511.GB22884@ulmo.nvidia.com>
References: <1421750935-4023-1-git-send-email-thierry.reding@gmail.com>
 <1421750935-4023-2-git-send-email-thierry.reding@gmail.com>
 <54BEAAB4.9030803@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0347129163=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54BEAAB4.9030803@codeaurora.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-tegra@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0347129163==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2015 at 11:21:24AM -0800, Stephen Boyd wrote:
> On 01/20/2015 02:48 AM, Thierry Reding wrote:
> > =20
> >  /**
> > + * clk_try_parent - check if a clock can be the parent clock source of=
 another
> > + * @clk: clock source
> > + * @parent: parent clock source
> > + *
> > + * This is like clk_set_parent(), except that it only checks that pare=
nt can
> > + * be the parent clock source for clock.
> > + *
> > + * Returns success (0) or negative errno.
> > + */
> > +int clk_try_parent(struct clk *clk, struct clk *parent)
> > +{
> > +	int err =3D 0;
> > +
> > +	if (!clk || !parent)
> > +		return -EINVAL;
>=20
> NULL clock should be a nop, so return success in either case.

Okay.

> > +
> > +	if ((clk->num_parents > 1) && !clk->ops->set_parent)
> > +		return -ENOSYS;
>=20
> This suffers from the same problem as discussed in another thread where
> the mux is read-only and the parent is the current parent. That case
> shouldn't fail.

Okay, if I do a lookup on the parent names array as you suggested below
I don't need to consider this anyway.

> > +
> > +	clk_prepare_lock();
> > +
> > +	if (clk->parent =3D=3D parent)
> > +		goto unlock;
> > +
> > +	err =3D clk_fetch_parent_index(clk, parent);
> > +	if (err > 0)
> > +		err =3D 0;
> > +
>=20
> Given that we just throw away the index, perhaps we should just loop
> over the parent_names array searching for a name match on the parent's
> name. If we did that this entire function would be lockless too.

Done.

> > +unlock:
> > +	clk_prepare_unlock();
> > +
> > +	return err;
> > +}
> > +EXPORT_SYMBOL_GPL(clk_try_parent);
> > +
> > +/**
> >   * clk_set_parent - switch the parent of a mux clk
> >   * @clk: the mux clk whose input we are switching
> >   * @parent: the new input to clk
> > diff --git a/include/linux/clk.h b/include/linux/clk.h
> > index fb1ac65f127c..94da8c68a515 100644
> > --- a/include/linux/clk.h
> > +++ b/include/linux/clk.h
> > @@ -328,6 +328,15 @@ long clk_round_rate(struct clk *clk, unsigned long=
 rate);
> >  int clk_set_rate(struct clk *clk, unsigned long rate);
> > =20
> >  /**
> > + * clk_try_parent - check if a clock can be the parent clock source of=
 another
> > + * @clk: clock source
> > + * @parent: parent clock source
> > + *
> > + * Returns success (0) or negative errno.
>=20
> Why not a bool? Do we really care why we can't set the parent in the
> error case?

A bool should do fine. I guess a negative error code would've been
easier to propagate, but we can probably just return an -EINVAL if
clk_has_parent() fails.

> > + */
> > +int clk_try_parent(struct clk *clk, struct clk *parent);
>=20
> The name makes me think of mutex_trylock(), so I immediately think this
> tries to set the parent. Perhaps a better name would be
> clk_can_have_parent() or clk_has_parent()?

clk_has_parent() sounds good to me.

Thierry

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUv8AnAAoJEN0jrNd/PrOhB5sQAJnhGRMYSv6JJb4OkVU1V1sw
rpxMQyuN1JL2Mqr02+Mc6Xo8YXeyhXn3qQabG8WBcnrA221oFHO5EtMGojr1Vfys
eRNgvWWR+ETChW2b5N52IDYDWhtVz82whgi4//2jg7bMx93c3AzaSN65Hw4izcwi
DtzXG3qGEu9QvXyCBwAQjbHsuD6XiWTKrPYq3pcCHoF4z62Z5zax2j4C+G1GU0pK
FrWim7/jLfnQQHr5FfQNwlIsLqXvAabxQr46DmVnwXmJ1sDrCXDIjZjuHwenZN9X
aj9BgCqrF8YY71QeZHYpvSt7GUl8XaFelD+a+BjOo0UxOxMSP4L4JZVlZR/slyqG
EY2s/tz6u3cRWyXqwVvv7OWADaj7eQeV/11yqQFbXHqPgvVsfEV5QgJuTh34ESJr
/crk42D5piFeepWTlUzCURufB/QhKN42DuSYYCOoSim7nkncvbwx3YLRdSTxFtXW
AK6+6Fwu/tYGFoYLvAK9DUXRkRVRWT5yTvtd60czM4K8/KaALfiqdjJ+z4HJX7Nj
S3b1IZeXr7r1Shv75OHC6MjOidc4ft836enxiEE/5uC2Ymdsw05DxetkhhxUTd+Z
haXSEGLBQcf5DNCviAcRmOGh6yqefnxVC7h8hqoYJez5eyGvMi6KhepCnSJkioeC
GkrWj89mk9RjWuMs/Bvb
=XWy/
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--

--===============0347129163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0347129163==--
