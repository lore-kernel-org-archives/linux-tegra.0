From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 16/22] gpu: host1x: Forbid unrelated SETCLASS opcode in
 the firewall
Date: Tue, 13 Jun 2017 16:06:53 +0200
Message-ID: <20170613140653.GI16758@ulmo.fritz.box>
References: <cover.1495498184.git.digetx@gmail.com>
 <741d3bbfb74b5455e016164a3a30d9e3101bdc24.1495498184.git.digetx@gmail.com>
 <CABPQNSbEXGHUv8kHr2sLjOLrVAiNXdStKUapMZX+CX5RWi0cfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MFZs98Tklfu0WsCO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABPQNSbEXGHUv8kHr2sLjOLrVAiNXdStKUapMZX+CX5RWi0cfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--MFZs98Tklfu0WsCO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2017 at 02:39:33AM +0200, Erik Faye-Lund wrote:
> On Tue, May 23, 2017 at 2:14 AM, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Several channels could be made to write the same unit concurrently via =
the
> > SETCLASS opcode, trusting userspace is a bad idea. It should be possibl=
e to
> > drop the per-client channel reservation and add a per-unit locking by
> > inserting MLOCK's to the command stream to re-allow the SETCLASS opcode=
, but
> > it will be much more work. Let's forbid the unit-unrelated class change=
s for
> > now.
> >
> > Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/gpu/drm/tegra/drm.c  |  1 +
> >  drivers/gpu/drm/tegra/drm.h  |  1 +
> >  drivers/gpu/drm/tegra/gr2d.c | 12 ++++++++++++
> >  drivers/gpu/host1x/job.c     | 24 ++++++++++++++++++++----
> >  include/linux/host1x.h       |  5 ++++-
> >  5 files changed, 38 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index cdb05d6efde4..17416e1c219a 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -531,6 +531,7 @@ int tegra_drm_submit(struct tegra_drm_context *cont=
ext,
> >         }
> >
> >         job->is_addr_reg =3D context->client->ops->is_addr_reg;
> > +       job->is_valid_class =3D context->client->ops->is_valid_class;
> >         job->syncpt_incrs =3D syncpt.incrs;
> >         job->syncpt_id =3D syncpt.id;
> >         job->timeout =3D 10000;
> > diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> > index 85aa2e3d9d4e..6d6da01282f3 100644
> > --- a/drivers/gpu/drm/tegra/drm.h
> > +++ b/drivers/gpu/drm/tegra/drm.h
> > @@ -83,6 +83,7 @@ struct tegra_drm_client_ops {
> >                             struct tegra_drm_context *context);
> >         void (*close_channel)(struct tegra_drm_context *context);
> >         int (*is_addr_reg)(struct device *dev, u32 class, u32 offset);
> > +       int (*is_valid_class)(u32 class);
> >         int (*submit)(struct tegra_drm_context *context,
> >                       struct drm_tegra_submit *args, struct drm_device =
*drm,
> >                       struct drm_file *file);
> > diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
> > index 02cd3e37a6ec..782231c41a1a 100644
> > --- a/drivers/gpu/drm/tegra/gr2d.c
> > +++ b/drivers/gpu/drm/tegra/gr2d.c
> > @@ -109,10 +109,22 @@ static int gr2d_is_addr_reg(struct device *dev, u=
32 class, u32 offset)
> >         return 0;
> >  }
> >
> > +static int gr2d_is_valid_class(u32 class)
> > +{
> > +       switch (class) {
> > +       case HOST1X_CLASS_GR2D:
> > +       case HOST1X_CLASS_GR2D_SB:
> > +               return 1;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static const struct tegra_drm_client_ops gr2d_ops =3D {
> >         .open_channel =3D gr2d_open_channel,
> >         .close_channel =3D gr2d_close_channel,
> >         .is_addr_reg =3D gr2d_is_addr_reg,
> > +       .is_valid_class =3D gr2d_is_valid_class,
> >         .submit =3D tegra_drm_submit,
> >  };
> >
> > diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> > index cf335c5979e2..65e12219405a 100644
> > --- a/drivers/gpu/host1x/job.c
> > +++ b/drivers/gpu/host1x/job.c
> > @@ -358,6 +358,9 @@ struct host1x_firewall {
> >
> >  static int check_register(struct host1x_firewall *fw, unsigned long of=
fset)
> >  {
> > +       if (!fw->job->is_addr_reg)
> > +               return 0;
> > +
> >         if (fw->job->is_addr_reg(fw->dev, fw->class, offset)) {
> >                 if (!fw->num_relocs)
> >                         return -EINVAL;
> > @@ -372,6 +375,19 @@ static int check_register(struct host1x_firewall *=
fw, unsigned long offset)
> >         return 0;
> >  }
> >
> > +static int check_class(struct host1x_firewall *fw, u32 class)
> > +{
> > +       if (!fw->job->is_valid_class) {
> > +               if (fw->class !=3D class)
> > +                       return -EINVAL;
> > +       } else {
> > +               if (!fw->job->is_valid_class(fw->class))
> > +                       return -EINVAL;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static int check_mask(struct host1x_firewall *fw)
> >  {
> >         u32 mask =3D fw->mask;
> > @@ -445,11 +461,9 @@ static int validate(struct host1x_firewall *fw, st=
ruct host1x_job_gather *g)
> >  {
> >         u32 *cmdbuf_base =3D (u32 *)fw->job->gather_copy_mapped +
> >                 (g->offset / sizeof(u32));
> > +       u32 job_class =3D fw->class;
> >         int err =3D 0;
> >
> > -       if (!fw->job->is_addr_reg)
> > -               return 0;
> > -
> >         fw->words =3D g->words;
> >         fw->cmdbuf =3D g->bo;
> >         fw->offset =3D 0;
> > @@ -469,7 +483,9 @@ static int validate(struct host1x_firewall *fw, str=
uct host1x_job_gather *g)
> >                         fw->class =3D word >> 6 & 0x3ff;
> >                         fw->mask =3D word & 0x3f;
> >                         fw->reg =3D word >> 16 & 0xfff;
> > -                       err =3D check_mask(fw);
> > +                       err =3D check_class(fw, job_class);
> > +                       if (!err)
> > +                               err =3D check_mask(fw);
> >                         if (err)
> >                                 goto out;
> >                         break;
> > diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> > index aa323e43ae4e..561d6bb6580d 100644
> > --- a/include/linux/host1x.h
> > +++ b/include/linux/host1x.h
> > @@ -233,7 +233,10 @@ struct host1x_job {
> >         u8 *gather_copy_mapped;
> >
> >         /* Check if register is marked as an address reg */
> > -       int (*is_addr_reg)(struct device *dev, u32 reg, u32 class);
> > +       int (*is_addr_reg)(struct device *dev, u32 class, u32 reg);
>=20
> This seems like an unrelated fix, you might want to mention it in the
> commit message at least.

If you're going to rev the series anyway, might be worth splitting this
off into a separate commit to make it stand out more.

Either way is fine with me.

Thierry

--MFZs98Tklfu0WsCO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk/8XsACgkQ3SOs138+
s6Ga4A/+Mosy7xAFom0GCk/1lfnNpiGzdY4Lvz76uc23QscTkF/vT2BKp4QBlIlN
A/znKaJwAYLUE+dvb5knUkIQTaHrw2nLdklV8zuURHgI/OVyYsUKXiM5157qxIB4
SRVcUf9gp4PKHllOb2OfzyudvLL9bZjgK4bGQ/5qvL21qcvfPYmXofNYaViQPZay
4Jn8TcSvmY9xWoenxfMSYfTQhs62sieVQwcWIStG9K6CVg/qFuzNNxc4/v1oaD2Q
XMraeg5H78DMx8jK8oQP2ixeCrbW3Subv7OyKW11ZyatL96x4WNJXiL21aM2SAmZ
vsni5UqMGg+Sjv+99ybOFZ+kwJD2QT6NzLD+XZkQ4ru+f7qEKafSw6B4fw8fjvkM
N/9kH1jWx4/lLEvT8o0jUfXQcwCtdr56wF0nWcjnzgGp74Ywq2PQwq2RGUlOhsAL
ePOCnUKAK/WF0CthJiA8huInL0YQL+HSlHNdnMwYf7jVeSAoRsudE8aXxJ9LHYwW
EC5oGobpjUe3zIgSnZLMTpbojis6vQWlIBvy50RUFib8mXfsVDy4vPHhbLD/5tHb
0qFcM/gZ1aLbNQfj1BJsOp2rtwYgJWEDu7KqHx/VHmJVdEwgjG0AlmqQcORUrDfF
FAwAsFfkMCy23n9vwgHx/C3urJaEvksKjQPrLAMJ4Mvn7Ca5j5s=
=rlt8
-----END PGP SIGNATURE-----

--MFZs98Tklfu0WsCO--
