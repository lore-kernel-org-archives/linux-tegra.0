From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] media: soc-camera: support deferred probing of clients
 and OF cameras
Date: Tue, 11 Feb 2014 07:37:15 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1402110732070.24582@axis700.grange>
References: <1391807504-8946-1-git-send-email-pengw@nvidia.com>
 <Pine.LNX.4.64.1402092122250.7755@axis700.grange>
 <CAK5ve-L5y+X+hLBrP_XTuv_fEU46mXB1P_Xoin+upboutT-8gQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK5ve-L5y+X+hLBrP_XTuv_fEU46mXB1P_Xoin+upboutT-8gQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Bryan,

On Mon, 10 Feb 2014, Bryan Wu wrote:

> On Sun, Feb 9, 2014 at 2:20 PM, Guennadi Liakhovetski
> <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org> wrote:
> > Hi Bryan,
> >
> > Thanks for reiterating this patch!
> >
>=20
> Sure, my pleasure. I basically assembled your patches together and
> change them to use latest V4L2 soc_camera API.
>=20
> > On Fri, 7 Feb 2014, Bryan Wu wrote:

[snip]

> >> @@ -67,6 +81,8 @@ struct soc_camera_async_client {
> >>
> >>  static int soc_camera_video_start(struct soc_camera_device *icd);
> >>  static int video_dev_create(struct soc_camera_device *icd);
> >> +static void soc_camera_of_i2c_info(struct device_node *node,
> >> +                               struct soc_camera_of_client *sofc)=
;
> >
> > If you have to resubmit this patch, plase, make sure the second lin=
e of
> > the above declaration is aligned af usual - under the first charact=
er
> > _after_ the opening bracket.
> >
>=20
> No problem, I will update this.
> Hmmm, something weird on my side. I did put the second line starting
> under the first character after the opening bracket. But in git show
> and git format-patch I got this
> ---
> static int soc_camera_video_start(struct soc_camera_device *icd);
>  static int video_dev_create(struct soc_camera_device *icd);
> +static void soc_camera_of_i2c_info(struct device_node *node,
> +                                  struct soc_camera_of_client *sofc)=
;
> ---
>=20
> But I think that's what you want, right?

Don't know - now a=F6=F6 TABs above are replaced with spaces, so, canno=
t say.=20

[snip]

> >> +{
> >> +     struct soc_camera_of_client *sofc;
> >> +     struct soc_camera_desc *sdesc;
> >
> > I'm really grateful, that you decided to use my original patch and
> > preserve my authorship! But then, I think, it'd be also better to a=
void
> > unnecessary changes to it. What was wrong with allocation of *sofc =
in the
> > definition line?
> >
>=20
> Oh, this is really I want to bring up. It's a very subtle bug here.
>=20
> If we use local variable sofc instead of zalloc, fields of sofc have
> undetermined None NULL value.

No. If you initialise some members of a struct in its definition line, =
the=20
rest will be initialised to 0 / NULL. I.e. in

	struct foo y =3D {.x =3D 1,};

all other fields of y will be initialised to 0.

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
=46reelance Open-Source Software Developer
http://www.open-technology.de/
