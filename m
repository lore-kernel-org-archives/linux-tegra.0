From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 8/9] of/i2c: Resolve interrupt references at probe time
Date: Mon, 23 Sep 2013 10:02:31 +0200
Message-ID: <20130923080230.GA11881@ulmo>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
 <1379320326-13241-9-git-send-email-treding@nvidia.com>
 <20130923073451.GE3051@katana>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130923073451.GE3051@katana>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2013 at 09:34:51AM +0200, Wolfram Sang wrote:
> On Mon, Sep 16, 2013 at 10:32:05AM +0200, Thierry Reding wrote:
> > Instead of resolving interrupt references at device creation time, delay
> > resolution until probe time. At device creation time, there is nothing
> > that can be done if an interrupt parent isn't ready yet, and the device
> > will end up with an invalid interrupt number (0).
> >=20
> > If the interrupt reference is resolved at probe time, the device's probe
> > can be deferred, so that it's interrupt resolution can be retried after
> > more devices (possibly including its interrupt parent) have been probed.
> >=20
> > However, individual drivers shouldn't be required to do that themselves,
> > over and over again, so this commit implements this functionality within
> > the I2C core.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/i2c/i2c-core.c | 23 +++++++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
> > index 29d3f04..163a1e8 100644
> > --- a/drivers/i2c/i2c-core.c
> > +++ b/drivers/i2c/i2c-core.c
> > @@ -236,6 +236,21 @@ int i2c_recover_bus(struct i2c_adapter *adap)
> >  	return adap->bus_recovery_info->recover_bus(adap);
> >  }
> > =20
> > +static int of_i2c_probe(struct i2c_client *client)
>=20
> This function should be in the CONFIG_OF block.

I'll argue the other way. I think that the whole CONFIG_OF block should
be remove, or at least be confined to public functions. The reason that
I've chosen to do it this way is that the i2c_device_probe() uses an
IS_ENABLED(CONFIG_OF), which will evaluate to 0 if OF isn't selected
which in turn will cause the compiler to throw away of_i2c_probe()
because it is static and never used.

The big advantage of this is that we get compile coverage for these
functions independent of what configuration is built. The same could
probably be done for the whole CONFIG_ACPI block. In fact I volunteer to
provide that patch if I've convinced you that this is actually better
than sprinking the code with the #ifdef blocks that make it harder than
necessary to verify that the code builds in all configurations.

> > +{
> > +	struct device_node *np =3D client->dev.of_node;
> > +	int ret;
> > +
> > +	/* skip if the device node specifies no interrupts */
> > +	if (of_get_property(np, "interrupts", NULL)) {
> > +		ret =3D of_irq_get(client->dev.of_node, 0, &client->irq);
>=20
> of_irq_get really sounds as it does refcounting. +1 to change the name.

Done in v2.

Thanks,
Thierry

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSP/WWAAoJEN0jrNd/PrOhL+oQAKawZNWxGfLSBNe7JFjV+j4S
/vz45ZOf0xaI5UU/GjxDvYIVyjLIm9BVJtu/u9nchNdsjQXdpXWFkEMYsUnp4PHI
TzSEiywvU/BiSYpvKPeJtGuVFmANQ2tP0qanLAnSW8pkU4O0CyLO5tOVfpR55HRc
006c77+qqnqi/NnWIyq+VBiGAV8vkZuusR4Al3FgBK+a/RZsgF3ETaw3MjM4Tjje
/ffRjiYhOiWkvfZFyFpr02MxwIzGMhHTzQO27xQNT002kXHvUPI4BRKxs7Xck6kN
jD1C4GHgtTTdBHCCsfTkBtioCL4OdL5xZTLhtRSXHgtUuAwqDZ/qM0OP+Yfy1/tn
0k1bBQudEPXgGRjyFvX/l6Qv7jIOkL4qlrMILpKfMViKoFgBioo1HN/Q/aJFwG1w
S1ASELICCoVmFeEXsr91s+mcNSm/a3PKyym4rj7jyvdiWLVpNMVnL0v7sr0JqtNR
Wo/cgJ66jtHfq4t6mFqwDQdtlLOkqh+dsHFIrIO0pXw4PCJhVhFpp3W7dY1jtF/9
fFiz6swxsbJS1pTLdZ8ssWi5orLDx36W7KT4dzj+3x3i/TA3GRIQ6rrUcLGy6mOe
iMITYAO+A4jwKcAW2uCKy8rQUau/F94NVzyIQPXhnL9/Ly3IQZQcZbNni0CyjjpR
n4AsUWrcUpWdw7HG8ORE
=girG
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
