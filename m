From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/4] drm: Introduce drm_fb_helper_prepare()
Date: Wed, 23 Apr 2014 09:14:41 +0200
Message-ID: <20140423071439.GA31226@ulmo>
References: <1398177741-28482-1-git-send-email-thierry.reding@gmail.com>
 <1398177741-28482-3-git-send-email-thierry.reding@gmail.com>
 <20140422155406.GU10722@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0089489970=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140422155406.GU10722@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============0089489970==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2014 at 05:54:06PM +0200, Daniel Vetter wrote:
> On Tue, Apr 22, 2014 at 04:42:20PM +0200, Thierry Reding wrote:
[...]
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
[...]
> > @@ -502,6 +503,33 @@ static void drm_fb_helper_crtc_free(struct drm_fb_=
helper *helper)
> >  }
> > =20
> >  /**
> > + * drm_fb_helper_prepare - setup a drm_fb_helper structure
> > + * @dev: DRM device
> > + * @helper: driver-allocated fbdev helper structure to set up
> > + * @funcs: pointer to structure of functions associate with this helper
> > + *
> > + * Sets up the bare minimum to make the framebuffer helper usable. Thi=
s is
> > + * useful to implement race-free initialization of the polling helpers=
=2E In
> > + * that case a typical sequence would be:
> > + *
> > + *   - call drm_fb_helper_prepare()
> > + *   - set dev->mode_config.funcs
>=20
> This step is done in drm_fb_helper_prepare already.

drm_fb_helper_prepare() sets fb_helper->funcs. dev->mode_config.funcs
needs to be set because it gets called by drm_kms_helper_hotplug_event()
which in turn is called by output_poll_execute(), which can be called at
any point after drm_kms_helper_poll_init(). It could be scheduled
immediately by drm_kms_helper_poll_enable().

I wonder if perhaps we should be wrapping that into a function as well.
Currently this is only documented in code by the drivers that call this.
But since it's only a single step it doesn't seem worth it. Perhaps if
we rolled the min/max_width/height into that function as well it would
be more worth it? That could be difficult to do since a couple of
drivers need to set those depending on the chipset generation.

> > + *   - perform driver-specific setup
> > + *   - call drm_kms_helper_poll_init()
>=20
> Maybe mention that after this you can start to handle hpd events using the
> probe helpers?

Isn't that somewhat implied already? The poll helpers call directly the
dev->mode_config.funcs->output_poll_changed() function, which has
already been set up earlier.

> > + *   - call drm_fb_helper_init()
> > + *   - call drm_fb_helper_single_add_all_connectors()
> > + *   - call drm_fb_helper_initial_config()
>=20
> Does this list look sane in the generated DocBook? Afaik kerneldoc
> unfortunately lacks any form of markup, at least afaik :(

I must admit I didn't check. I'll make sure I do that before sending out
the next version.

Thierry

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTV2hfAAoJEN0jrNd/PrOhH08QAIwRlohSgZ7zSsmn/RRnMD64
0Ka7XKmHf2w+XM9jwr3euEnQvP9jtL+3scwoV2IiVUnaZ7DlC6N1kpQt8+sGOMJt
/WsHt4uY1FGxX8yrDXssNhIzH33BN5V9Rp13ENtKqAid7eonJ+/e3TEl3uxRq/QT
N4msq70R3qcj5Rgj5n0X8sZdQZibuYaeYkrqNR02eJ/Q1fsdbYc7xMzSliXLfRtm
c9lcsGg01njc/qj2SHaYkqqXp82QtJhHAa7D05uWiGDrW0msHTDzrH04PEgTs9mV
yv/gGsL95ySCUxCburk/jIebxur8cXzvyaSa68rhY/IoPM0fmLGCcK12LpCmAR6Q
LuRnoVLDmwb8Q5ImWFG/uRxx7pADH73b/jB9C/lXlqiSKup2KRRMGoiTHnr5xC7F
asfZ9hycWCWqdpm5y8Pg3plJFt9qqhWBn+NrjIjqlOkKQbjcCoBNOfWV4qkTCSCo
TSZ1xSP0lyLyQR1sMzaG1l27k1zVr32NqMMepdwqYyK3/PhyGrtCjoUx19l53uTs
V9bcu32rGrqQUrGxVKJJsvf6G+cTeZMxF5w+KoqXU1AqN9xNtHFbs/2n09wcenTa
RryFjNxAPlo+aQfY2yvwc7BP/B1piWvPJFCXpnDZxQqNdjtYiVzwL6X5+SN5AP1p
7TlPlPIjK695PZ8g0gFV
=iga0
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--

--===============0089489970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0089489970==--
