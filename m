From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v1 07/26] drm/panel: remove get_timings
Date: Wed, 4 Dec 2019 09:16:50 +0100
Message-ID: <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-8-sam@ravnborg.org>
 <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
 <CACRpkdZrReQs08+bXS7s7eJ-K76nMGvRgQ-L-1-baunEtiF40g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2100899948=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACRpkdZrReQs08+bXS7s7eJ-K76nMGvRgQ-L-1-baunEtiF40g@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Abhinav Kumar <abhinavk@codeaurora.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Purism Kernel Team <kernel@puri.sm>Linux-Renesas <lin>
List-Id: linux-tegra@vger.kernel.org


--===============2100899948==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="voqjdysu66o2gyxb"
Content-Disposition: inline


--voqjdysu66o2gyxb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

On Tue, Dec 03, 2019 at 04:20:24PM +0100, Linus Walleij wrote:
> On Tue, Dec 3, 2019 at 8:47 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> > Using only the mode as we do currently has a bunch of shortcomings as
> > almost no encoder will be able to provide the typical pixel clock, and
> > that situation leads to multiple things:
> >
> >   - If someone working on one encoder wants to upstream a panel they
> >     have tested, chances are this will not be the typical pixel clock
> >     / timings being used but rather the one that will match what that
> >     SoC is capable of. Trouble comes when a second user comes in with
> >     a different encoder and different capabilities, and then we have a
> >     maintainance fight over which timing is the true timing (with a
> >     significant chance that none of them are).
> >
> >   - If we can't match the pixel clock, we currently have no easy way
> >     to make the usual measures of reducing / growing the porches and
> >     blankings areas to match the pixel clock we can provide, since we
> >     don't have an easy way to get the tolerance on those timings for a
> >     given panel. There's some ad hoc solutions on some drivers (I
> >     think vc4 has that?) to ignore the panel and just play around with
> >     the timings, but I think this should be generalised.
>
> I've been confused with these things as they look today and it seems
> the whole struct drm_display_mode could need some improvement?
>
> If .clock is supposed to be htotal * vtotal * vrefresh, what is the
> .clock doing there anyway.

It's one thing I wonder as well. I guess it's just more convenient for
everyone, since it's exposed by the VESA modes (iirc) and a lot of
drivers really care about the clock.

> Sadly I am too inexperienced to realize where the tolerances should
> be stated, but I guess just stating that hsync_start etc are typical,
> then specify some tolerance for each would help a bit?

The timings structure discussed in the patch that started this
discussion is actually doing this nicely, you have for each timing the
minimum, typical and maximum value. The current issue with it though
is that it's pretty difficult to use it, since it's not really tied to
any of the panel code (or DRM helpers). The only driver that was
supporting it was omapdrm and it was removed recently.

If we really wanted to support it, one path forward I can see would be
to make the timings structure the primary one, and only use
drm_display_mode for userspace facing code, and generate it from the
timings. This would be a pretty invasive change though...

> On the DSI displays in video mode there is also this EOL area
> which seems to be where the logic is normally just idling for a
> while, that can be adjusted on some hardware as well, but
> I don't quite understand it admittedly. Sometimes I wonder if
> anyone really understands DSI... :/

I'm not aware of any EOL area in MIPI-DSI that would make the hardware
idle, don't you mean LP-11?

Maxime

--voqjdysu66o2gyxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXedrcgAKCRDj7w1vZxhR
xdavAPjzTTCvwouCytfXW/t4u+SVB9rmOV3G+YlNApkfwiGrAP9ZY7cFIlhaaHR6
KPuqccewYOnD4eU7PSrJ9ryTiv4jDA==
=P7Ao
-----END PGP SIGNATURE-----

--voqjdysu66o2gyxb--

--===============2100899948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2100899948==--
