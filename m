From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: [PATCH] media: soc-camera: support deferred probing of clients
 and OF cameras
Date: Tue, 11 Feb 2014 21:53:54 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1402112151370.521@axis700.grange>
References: <1391807504-8946-1-git-send-email-pengw@nvidia.com>
 <Pine.LNX.4.64.1402092122250.7755@axis700.grange>
 <CAK5ve-L5y+X+hLBrP_XTuv_fEU46mXB1P_Xoin+upboutT-8gQ@mail.gmail.com>
 <Pine.LNX.4.64.1402110732070.24582@axis700.grange>
 <CAK5ve-Kct71b4jZ_c9Jq3-tLozSBBH7FxgZUy2VSV1VUUefsZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <CAK5ve-Kct71b4jZ_c9Jq3-tLozSBBH7FxgZUy2VSV1VUUefsZA@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 11 Feb 2014, Bryan Wu wrote:

> On Mon, Feb 10, 2014 at 10:37 PM, Guennadi Liakhovetski
> <g.liakhovetski@gmx.de> wrote:
> > Hi Bryan,
> >
> > On Mon, 10 Feb 2014, Bryan Wu wrote:
> >
> >> On Sun, Feb 9, 2014 at 2:20 PM, Guennadi Liakhovetski
> >> <g.liakhovetski@gmx.de> wrote:
> >> > Hi Bryan,
> >> >
> >> > Thanks for reiterating this patch!
> >> >
> >>
> >> Sure, my pleasure. I basically assembled your patches together and
> >> change them to use latest V4L2 soc_camera API.
> >>
> >> > On Fri, 7 Feb 2014, Bryan Wu wrote:
> >
> > [snip]
> >
> >> >> @@ -67,6 +81,8 @@ struct soc_camera_async_client {
> >> >>
> >> >>  static int soc_camera_video_start(struct soc_camera_device *ic=
d);
> >> >>  static int video_dev_create(struct soc_camera_device *icd);
> >> >> +static void soc_camera_of_i2c_info(struct device_node *node,
> >> >> +                               struct soc_camera_of_client *so=
fc);
> >> >
> >> > If you have to resubmit this patch, plase, make sure the second =
line of
> >> > the above declaration is aligned af usual - under the first char=
acter
> >> > _after_ the opening bracket.
> >> >
> >>
> >> No problem, I will update this.
> >> Hmmm, something weird on my side. I did put the second line starti=
ng
> >> under the first character after the opening bracket. But in git sh=
ow
> >> and git format-patch I got this
> >> ---
> >> static int soc_camera_video_start(struct soc_camera_device *icd);
> >>  static int video_dev_create(struct soc_camera_device *icd);
> >> +static void soc_camera_of_i2c_info(struct device_node *node,
> >> +                                  struct soc_camera_of_client *so=
fc);
> >> ---
> >>
> >> But I think that's what you want, right?
> >
> > Don't know - now a=F6=F6 TABs above are replaced with spaces, so, c=
annot say.
> >
> > [snip]
> >
> >> >> +{
> >> >> +     struct soc_camera_of_client *sofc;
> >> >> +     struct soc_camera_desc *sdesc;
> >> >
> >> > I'm really grateful, that you decided to use my original patch a=
nd
> >> > preserve my authorship! But then, I think, it'd be also better t=
o avoid
> >> > unnecessary changes to it. What was wrong with allocation of *so=
fc in the
> >> > definition line?
> >> >
> >>
> >> Oh, this is really I want to bring up. It's a very subtle bug here=
=2E
> >>
> >> If we use local variable sofc instead of zalloc, fields of sofc ha=
ve
> >> undetermined None NULL value.
> >
> > No. If you initialise some members of a struct in its definition li=
ne, the
> > rest will be initialised to 0 / NULL. I.e. in
> >
> >         struct foo y =3D {.x =3D 1,};
> >
> > all other fields of y will be initialised to 0.
>=20
> I see, but original one is soc_camera_link which is simple in this
> case. right now we move to soc_camera_desc. I think following line is
> not very straight forward in a local function.
>=20
> struct soc_camera_desc sdesc =3D { .host_desc =3D { .host_wait =3D tr=
ue,},};

I usually do

struct soc_camera_desc sdesc =3D {.host_desc.host_wait =3D true,};

> What about a) struct soc_camera_desc sdesc and use memset to all 0. b=
)=20
> use kzalloc() and kfree() in this function.
>=20
> I think b) is more straight forward and easy to understand.

With error handling for a failed kzalloc() - don't think so.

Thanks
Guennadi

>=20
> Thanks,
> -Bryan
>=20

---
Guennadi Liakhovetski, Ph.D.
=46reelance Open-Source Software Developer
http://www.open-technology.de/
