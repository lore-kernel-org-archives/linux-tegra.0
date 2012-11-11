From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm: tegra: Add HDMI support
Date: Sun, 11 Nov 2012 15:46:44 +0100
Message-ID: <20121111144644.GK5854@phenom.ffwll.local>
References: <1352469579-3337-1-git-send-email-thierry.reding@avionic-design.de>
 <1352469579-3337-3-git-send-email-thierry.reding@avionic-design.de>
 <CACna6rycZ=TGHP7KpVa_r0JSpc6c=PB89pijR9E_4A=bQ=74Bw@mail.gmail.com>
 <509D28B6.3060207@vodafone.de>
 <20121110210118.GA26809@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121110210118.GA26809@avionic-0098.mockup.avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <deathsimple@vodafone.de>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Dave Airlie <airlied@redhat.com>
List-Id: linux-tegra@vger.kernel.org

On Sat, Nov 10, 2012 at 10:01:18PM +0100, Thierry Reding wrote:
> On Fri, Nov 09, 2012 at 05:00:54PM +0100, Christian K=C3=B6nig wrote:
> > On 09.11.2012 16:45, Rafa=C5=82 Mi=C5=82ecki wrote:
> > >2012/11/9 Thierry Reding <thierry.reding@avionic-design.de>:
> > >>+/* all fields little endian */
> > >>+struct hdmi_audio_infoframe {
> > >>+       /* PB0 */
> > >>+       u8 csum;
> > >>+
> > >>+       /* PB1 */
> > >>+       unsigned cc:3; /* channel count */
> > >>+       unsigned res1:1;
> > >>+       unsigned ct:4; /* coding type */
> > >>+
> > >>+       /* PB2 */
> > >>+       unsigned ss:2; /* sample size */
> > >>+       unsigned sf:3; /* sample frequency */
> > >>+       unsigned res2:3;
> > >>+
> > >>+       /* PB3 */
> > >>+       unsigned cxt:5; /* coding extention type */
> > >>+       unsigned res3:3;
> > >>+
> > >>+       /* PB4 */
> > >>+       u8 ca; /* channel/speaker allocation */
> > >>+
> > >>+       /* PB5 */
> > >>+       unsigned res5:3;
> > >>+       unsigned lsv:4; /* level shift value */
> > >>+       unsigned dm_inh:1; /* downmix inhibit */
> > >>+
> > >>+       /* PB6-10 reserved */
> > >>+       u8 res6;
> > >>+       u8 res7;
> > >>+       u8 res8;
> > >>+       u8 res9;
> > >>+       u8 res10;
> > >>+} __packed;
> > >I was told it won't work on different endian devices. See
> > >[RFC][PATCH] drm/radeon/hdmi: define struct for AVI infoframe
> > >http://lists.freedesktop.org/archives/dri-devel/2012-May/022544.ht=
ml
> >=20
> > Yeah, that's indeed true. And honestly adding just another
> > implementation of the HDMI info frames sounds like somebody should
> > finally sit down and implement it in a common drm_hdmi.c
>=20
> So I've been looking at what most other implementations do and it see=
ms
> a lot just fill the AVI infoframe with zeroes while only a few actual=
ly
> try to put useful information in them. Still in order to plan for a
> generic solution, I thought maybe something like the below set of
> structures and functions could work:
>=20
> /*
>  * Structure that contains the infoframe fields in a form that allows=
 them to
>  * be easily accessed from C code.
>  */
> struct hdmi_avi_infoframe;
>=20
> /*
>  * DRM helper to fill a struct hdmi_avi_infoframe with information ta=
ken from
>  * a struct drm_display_mode. Fields that cannot automatically be der=
ived by
>  * looking at a struct drm_display_mode are set to the default values=
=2E
>  */
> int drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infofram=
e *frame,
> 					     struct drm_display_mode *mode);
>=20
> /*
>  * Packs the struct hdmi_avi_infoframe into a binary buffer that can =
be
>  * programmed to the hardware-specific registers.
>  */
> ssize_t hdmi_avi_infoframe_pack(struct hdmi_avi_infoframe *frame,
> 				void *buffer, size_t size);
>=20
> Such a scheme would allow DRM drivers to call the helper and tweak th=
e
> fields in the structure if the want or need to and call the packing
> function to obtain a buffer that they can write to the controller.
>=20
> Does that sound at all reasonable?

Sounds good, especially the disdinction between the infoframe creation =
and
packing. E.g. on intel sdvo outputs we may not put in one of the ECC by=
tes
(since the hw creates it), so we need our own packing code there.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
