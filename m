From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/4] drm: Introduce drm_fb_helper_prepare()
Date: Wed, 23 Apr 2014 15:44:48 +0200
Message-ID: <20140423134447.GB28031@ulmo>
References: <1398177741-28482-1-git-send-email-thierry.reding@gmail.com>
 <1398177741-28482-3-git-send-email-thierry.reding@gmail.com>
 <20140422155406.GU10722@phenom.ffwll.local>
 <20140423071439.GA31226@ulmo>
 <20140423073548.GW10722@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1614720614=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20140423073548.GW10722@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============1614720614==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2014 at 09:35:48AM +0200, Daniel Vetter wrote:
> On Wed, Apr 23, 2014 at 09:14:41AM +0200, Thierry Reding wrote:
> > On Tue, Apr 22, 2014 at 05:54:06PM +0200, Daniel Vetter wrote:
> > > On Tue, Apr 22, 2014 at 04:42:20PM +0200, Thierry Reding wrote:
> > [...]
> > > > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_=
fb_helper.c
> > [...]
> > > > @@ -502,6 +503,33 @@ static void drm_fb_helper_crtc_free(struct drm=
_fb_helper *helper)
> > > >  }
> > > > =20
> > > >  /**
> > > > + * drm_fb_helper_prepare - setup a drm_fb_helper structure
> > > > + * @dev: DRM device
> > > > + * @helper: driver-allocated fbdev helper structure to set up
> > > > + * @funcs: pointer to structure of functions associate with this h=
elper
> > > > + *
> > > > + * Sets up the bare minimum to make the framebuffer helper usable.=
 This is
> > > > + * useful to implement race-free initialization of the polling hel=
pers. In
> > > > + * that case a typical sequence would be:
> > > > + *
> > > > + *   - call drm_fb_helper_prepare()
> > > > + *   - set dev->mode_config.funcs
> > >=20
> > > This step is done in drm_fb_helper_prepare already.
> >=20
> > drm_fb_helper_prepare() sets fb_helper->funcs. dev->mode_config.funcs
> > needs to be set because it gets called by drm_kms_helper_hotplug_event()
> > which in turn is called by output_poll_execute(), which can be called at
> > any point after drm_kms_helper_poll_init(). It could be scheduled
> > immediately by drm_kms_helper_poll_enable().
> >=20
> > I wonder if perhaps we should be wrapping that into a function as well.
> > Currently this is only documented in code by the drivers that call this.
> > But since it's only a single step it doesn't seem worth it. Perhaps if
> > we rolled the min/max_width/height into that function as well it would
> > be more worth it? That could be difficult to do since a couple of
> > drivers need to set those depending on the chipset generation.
>=20
> Oh I've misread this step for the fb_helper->funcs assignment. Makes sense
> and I don't think we need to augment your kerneldoc more to explain this.
>=20
> > > > + *   - perform driver-specific setup
>=20
> Hm, maybe clarify this as "initialize modeset objects like crtcs, encoders
> and connectors"? Since that's the important part we need to get done here.
>=20
> > > > + *   - call drm_kms_helper_poll_init()
> > >=20
> > > Maybe mention that after this you can start to handle hpd events usin=
g the
> > > probe helpers?
> >=20
> > Isn't that somewhat implied already? The poll helpers call directly the
> > dev->mode_config.funcs->output_poll_changed() function, which has
> > already been set up earlier.
>=20
> I've more meant that after this it's save for drivers to enable hpd
> interrupts and start to process them. I.e.
>=20
> 	- enable interrupts and start processing hpd events
>=20
> as an additional step to make it really cleear how it all fits together.
> Otherwise driver authors are left wondering wtf this isn't just one
> function call to do it all for them ;-)
>=20
> > > > + *   - call drm_fb_helper_init()
> > > > + *   - call drm_fb_helper_single_add_all_connectors()
> > > > + *   - call drm_fb_helper_initial_config()
> > >=20
> > > Does this list look sane in the generated DocBook? Afaik kerneldoc
> > > unfortunately lacks any form of markup, at least afaik :(
> >=20
> > I must admit I didn't check. I'll make sure I do that before sending out
> > the next version.
>=20
> If it looks ugly I'm ok as-is, just wondered. Kerneldoc is a bit
> simplistic ime.

In the second version I just sent out I ended up moving the description
of this sequence into the fbdev helper section rather than keeping it in
the description of the drm_fb_helper_prepare() function, since the new
function is really just a part of the whole sequence, so it seemed to
fit more nicely. And I've dropped the list formatting and turned it into
prose instead.

Thierry

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTV8PPAAoJEN0jrNd/PrOhyD8P/2KOu+P7I1xfL0lvByaH7EWf
XWHGvsa2I32dBC9FMhh82LANjL7aDOF0yWFbrquXSURGUIGlDy9SGo5PvFjZtlOf
2/Qxdh9rltuXelXxQGyi6Arjz+LDvT87sSVWN6PvGDPuSldWk7XU1AQLjQIiwe0/
zY/ZjCcRGim1dbtIbQqwhbnJFYss0QcXpmR3wEpCyT9bWRU/H5mjQxvmCp6csFFG
CzUSpGt9qdseCSkCgY95+qhxntxUhwtbhFpkzVz1npYWUXf9nUELMHrsHg1ZLwMI
4IHnjAo8Eku/DCgz3V3s9fwnx8Z3v9mJCQfyd+yTkQRrUCDiFE/QtEak/nYJybFH
BAmYspi6vBlFuYrAHYhTcHfZFtF+zGQe4SUSwss7JzyIL09Rs7dLH8tCkhUdsdR8
Wa/aE1LjS18ZpGA5N5cPuRiQz7s+/YJyp804Zl6C9dPl2uZGORDP5vJZq4KKAl5K
BpMpJJee5YN0uokETZNZQshqGlmslV3QYtZaUfsDmuMt5j4FTa4q0KW/rPpKm4yY
inl3ZHu9U+o/xG57MdDRjP189O50LqEKM/AuXnCixEMymreQsvjZOOePT5/LWh1Z
vFRy622a7kZSpI66O10SbtvOPUXevAY5Z7WiLGmozW2EO+kMj3RbEtNEbrow89Wl
Wq7KYcDB80zFmDV/Cz30
=5Zmy
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--

--===============1614720614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1614720614==--
