From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: host1x: fix compile error when IOMMU API is not
 available
Date: Thu, 11 Apr 2019 10:30:17 +0200
Message-ID: <20190411083017.GB4633@ulmo>
References: <4c3d021c73c001f633803e364cfbc6ace3381205.1554936354.git.stefan@agner.ch>
 <7371b1573ddd0b127713724ef5051a6f@codethink.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7371b1573ddd0b127713724ef5051a6f@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Stefan Agner <stefan@agner.ch>, digetx@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 09:23:13AM +0100, Ben Dooks wrote:
>=20
>=20
> On 2019-04-10 23:47, Stefan Agner wrote:
> > In case the IOMMU API is not available compiling host1x fails with
> > the following error:
> >   In file included from drivers/gpu/host1x/hw/host1x06.c:27:
> >   drivers/gpu/host1x/hw/channel_hw.c: In function
> > =E2=80=98host1x_channel_set_streamid=E2=80=99:
> >   drivers/gpu/host1x/hw/channel_hw.c:118:30: error: implicit
> > declaration of function
> >     =E2=80=98dev_iommu_fwspec_get=E2=80=99; did you mean =E2=80=98iommu=
_fwspec_free=E2=80=99?
> > [-Werror=3Dimplicit-function-declaration]
> >   struct iommu_fwspec *spec =3D
> > dev_iommu_fwspec_get(channel->dev->parent);
> >                               ^~~~~~~~~~~~~~~~~~~~
> >                               iommu_fwspec_free
> >=20
> > Fixes: de5469c21ff9 ("gpu: host1x: Program the channel stream ID")
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
>=20
> would it be better to provide something like this i nthe header that
> defines dev_iommu_fwspec_get() to be:
>=20
> static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *de=
v)
> { return NULL; }
>=20
> although returning an PTR_ERR would have been better.

I don't think there's really a large number of failures here. Either
your device has an IOMMU fwspec or it doesn't.

But yes, I think it'd be better to have the above static inline dummy in
iommu.h, but I'll apply this for now in the hopes of getting it in
before v5.1 final.

Thierry

>=20
> > ---
> >  drivers/gpu/host1x/hw/channel_hw.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/host1x/hw/channel_hw.c
> > b/drivers/gpu/host1x/hw/channel_hw.c
> > index 27101c04a827..4030d64916f0 100644
> > --- a/drivers/gpu/host1x/hw/channel_hw.c
> > +++ b/drivers/gpu/host1x/hw/channel_hw.c
> > @@ -114,7 +114,7 @@ static inline void synchronize_syncpt_base(struct
> > host1x_job *job)
> >=20
> >  static void host1x_channel_set_streamid(struct host1x_channel *channel)
> >  {
> > -#if HOST1X_HW >=3D 6
> > +#if IS_ENABLED(CONFIG_IOMMU_API) &&  HOST1X_HW >=3D 6
> >  	struct iommu_fwspec *spec =3D
> > dev_iommu_fwspec_get(channel->dev->parent);
> >  	u32 sid =3D spec ? spec->ids[0] & 0xffff : 0x7f;

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyu+xUACgkQ3SOs138+
s6EFHBAAk44H2K1jNNl7wZcBvpROax7r9TTL5TIwr5Unzg+opeXElx0+pM0/A5//
hq+p1oArJNPazReuo1QX+vLFHd3sNi4h48LooFs+/uF4gprz8KtGQZ/4RaNcu4Zn
A9z0x8tXLWTBdKssQ340wOYGk5iWanjoq7bjZdA/f0VZNCzznJME7log7r7xWMQv
el0QGQPjyd4lKd5/RcTgCWV4AbB3fzYBkyxuNq9NbKORo7i+NjDhy7LCHBI0kVUM
dbBopX19BcW1gihEU9mRpSIA1wMDClFRnUuOK61c30bGlCic2kVcYZyVpqH1KHey
n755I2NwoOkFJxwFxIA3H/EFRQY69edpEOzWdbNuSh6lO/W5Q0AZ6jBw04ROdt2i
IYmTzaR4JLUwiZnYFRu1sHPVJILQg3rU+q/8CWe3OBrcBQaSj5E8S/+23PlBV9xE
Wxh+qA/BpXUaGcdb3l7p91gyWG5Dy4EOHSRlYt+ScDDdxdhn8QYcAzcXpMYNgRak
5YVaH7I6Ccoy1mDb/OEhyD2zILmy+r2XNUNOp630HudIYLlTt9lGjZ9HZF2CiqLp
gPcmFYWlpTMx2V2LAQnuEEUZKh8s5ILzcExpSISSXmDEvSv+UPR3ZX0gcGY2D8pa
LbZHExXVY4xv8Njo/orhrO9JJlL3IA3QlMMdIfUYr+rvs47Qd+E=
=mRJf
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
