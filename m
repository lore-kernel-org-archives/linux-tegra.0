From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 2/2] drm: tegra: Add HDMI support
Date: Sat, 10 Nov 2012 22:11:28 +0100
Message-ID: <20121110211127.GA26998@avionic-0098.mockup.avionic-design.de>
References: <1352469579-3337-1-git-send-email-thierry.reding@avionic-design.de>
 <1352469579-3337-3-git-send-email-thierry.reding@avionic-design.de>
 <CACna6rycZ=TGHP7KpVa_r0JSpc6c=PB89pijR9E_4A=bQ=74Bw@mail.gmail.com>
 <509D28B6.3060207@vodafone.de>
 <20121110210118.GA26809@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121110210118.GA26809-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian =?utf-8?B?S8O2bmln?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 10, 2012 at 10:01:18PM +0100, Thierry Reding wrote:
> On Fri, Nov 09, 2012 at 05:00:54PM +0100, Christian K=C3=B6nig wrote:
> > On 09.11.2012 16:45, Rafa=C5=82 Mi=C5=82ecki wrote:
> > >2012/11/9 Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>:
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
> > >http://lists.freedesktop.org/archives/dri-devel/2012-May/022544.html
> >=20
> > Yeah, that's indeed true. And honestly adding just another
> > implementation of the HDMI info frames sounds like somebody should
> > finally sit down and implement it in a common drm_hdmi.c
>=20
> So I've been looking at what most other implementations do and it seems
> a lot just fill the AVI infoframe with zeroes while only a few actually
> try to put useful information in them. Still in order to plan for a
> generic solution, I thought maybe something like the below set of
> structures and functions could work:
>=20
> /*
>  * Structure that contains the infoframe fields in a form that allows the=
m to
>  * be easily accessed from C code.
>  */
> struct hdmi_avi_infoframe;
>=20
> /*
>  * DRM helper to fill a struct hdmi_avi_infoframe with information taken =
=66rom
>  * a struct drm_display_mode. Fields that cannot automatically be derived=
 by
>  * looking at a struct drm_display_mode are set to the default values.
>  */
> int drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *f=
rame,
> 					     struct drm_display_mode *mode);
>=20
> /*
>  * Packs the struct hdmi_avi_infoframe into a binary buffer that can be
>  * programmed to the hardware-specific registers.
>  */
> ssize_t hdmi_avi_infoframe_pack(struct hdmi_avi_infoframe *frame,
> 				void *buffer, size_t size);
>=20
> Such a scheme would allow DRM drivers to call the helper and tweak the
> fields in the structure if the want or need to and call the packing
> function to obtain a buffer that they can write to the controller.
>=20
> Does that sound at all reasonable?

And I forgot, maybe this shouldn't be included in the drivers/gpu/drm
subdirectory, but rather in a more generic location such as
drivers/video since other subsystems (V4L2) may want to use the same
code.

Thierry

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQnsL/AAoJEN0jrNd/PrOhz74P/RxJss8acQpkW/cLubKKtX2q
htzaUgliKAtMPLH5v8vSa9wDbA9D1c6VdKEKNt0EBqMl5sv15KfnJNGd5gL+CXyf
e0lHM80QkobietjDBbm6vk3vIhjbCpl1v+lLT1tJ5JjRYMzx1WIVzhhAsRGBX6eC
6HE/+dYEtM30fgk3nAziSJBvMPaHp+2j1m39SRVwhfpvy86s6aGr32rD6MNhwCIL
f4xGoFQm1VXvCFXpbZDp8hxO13zXqaxNXc1AXqN/mhXMTjhVWuNhKaGWa6B6z4TJ
sMtY2baK09/yPMqDvyZjXXcOc5CIkmfQ4/732N1BY54+lPDaSIFjxAOwKq9Oj7Wm
lunuh/S5ScruFkjsUZqyuwKJuVbOQmQ2o9EY7Oc3vbQZvlhfT59zmymKR95W6pxW
d5Bialc6OkNpOjUe13v7tLIvnmmK4Iq2XFQXMW0pMTbxdmB7v0HnXVt/3SxxQpMg
6aj48qaWY5jb2BjSdY0jDvb90fH+rltO1Rc7HLOYnE2SX2RpfiWU5QlO6JTCVAnE
jvAhsl6Xb9vcUcgZSy3+Je8CJM+fziJ7hO8PRM++m4+sCb0LunQN61xlYvk4rfo3
u8iwWuZ9fwosQ5cejKNfBNBk54U01ppos6jQTnSteLeKKwbcm6zwH0IdFJ43CpEi
mhnxGvbU33+IEDwU/3K7
=eRBT
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
