From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 26/27] drm/tegra: Add DSI support
Date: Wed, 16 Oct 2013 10:40:31 +0200
Message-ID: <20131016084031.GB21963@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-27-git-send-email-treding@nvidia.com>
 <52587F17.7060104@wwwdotorg.org>
 <20131014135548.GB16302@ulmo.nvidia.com>
 <525C3510.60802@wwwdotorg.org>
 <20131015083342.GH7856@ulmo.nvidia.com>
 <525D7983.6010001@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525D7983.6010001-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2013 at 11:21:07AM -0600, Stephen Warren wrote:
> On 10/15/2013 02:33 AM, Thierry Reding wrote:
> > On Mon, Oct 14, 2013 at 12:16:48PM -0600, Stephen Warren wrote:
> >> On 10/14/2013 07:55 AM, Thierry Reding wrote:
> >>> On Fri, Oct 11, 2013 at 04:43:35PM -0600, Stephen Warren
> >>> wrote:
> >>>> On 10/07/2013 02:34 AM, Thierry Reding wrote:
> >>>>> This commit adds support for both DSI outputs found on
> >>>>> Tegra. Only very minimal functionality is implemented, so
> >>>>> advanced features like ganged mode won't work.
> >>>>>=20
> >>>>> Due to the lack of other test hardware, some sections of
> >>>>> the driver are hardcoded to work with Dalmore.
> >>>>=20
> >>>>> diff --git a/drivers/gpu/drm/tegra/dsi.c
> >>>>> b/drivers/gpu/drm/tegra/dsi.c
> >>>>=20
> >>>>> +static int tegra_dsi_show_regs(struct seq_file *s, void
> >>>>> *data) +{ +	struct drm_info_node *node =3D s->private; +
> >>>>> struct tegra_dsi *dsi =3D node->info_ent->data; + +#define
> >>>>> DUMP_REG(name)						\ +	seq_printf(s, "%-32s %#05x
> >>>>> %08lx\n", #name, name,	\ +		   tegra_dsi_readl(dsi, name))=20
> >>>>> + +	DUMP_REG(DSI_INCR_SYNCPT);
> >>>>=20
> >>>> Does it make sense to use an MMIO regmap instead? That way,
> >>>> you get all the debugfs files for free...
> >>>=20
> >>> As far as I know, regmap doesn't give you the symbolic names
> >>> for the registers. I find that a rather useful feature because
> >>> it allows to easily compare the registers to the ones in our
> >>> downstream kernels.
> >>=20
> >> True. However, we should really be writing user-space scripts to
> >> encode that information. Such a script could be useful e.g. if
> >> reading the information directly from /dev/mem or JTAG too, and
> >> bloating the kernel with debug strings doesn't seem like a great
> >> idea.
> >=20
> > I don't agree. While I see some value in having such userspace
> > scripts, having the symbolic names in debugfs allows anyone to look
> > at a readable form of the data without having to have access to
> > those scripts. Besides it's called *debug*fs for a purpose, isn't
> > it? There's plenty of edited data that's not just a plain dump of
> > data.
>=20
> Perhaps you should work to enhance regmap's debugfs files to support
> optionally naming registers?

Just to follow up with what we've discussed on IRC: I'll take a stab at
refactoring the debugfs file output into something more generic that can
possibly be leveraged by regmap as well. That should provide a somewhat
more lightweight alternative to regmap for implementations that don't
need regmap for anything else while at the same time providing something
so not every driver has to come up with something custom.

Does that sum it up correctly?

Thierry

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXlD/AAoJEN0jrNd/PrOhbfsP/Rz3g1zYMaR7wUk7SnxVXIYL
69QvhW0YOqV01sqRqBjYko1cBidQWaP2ISSlaxEF/njCVr+ILrZqnED9KB3DwcAh
KKJtkFGCkU+B2HNlKx/GIAjmpZn4aI3PlGAYrTil/GOe5C3iJIsPsRBqQY5yHa6k
X8fbGyNCD4r6ce4Fesa43eroq8Kk9rHupqsnju0egl8UewQ7Dg6wJv5QVFYkUsma
Kxc+quOPwwDCh7xaeo4OvD2HguJ+oiOWDYLwCPeB29npTkQud+gTWlB0B1rtAgLk
NdP7voD8yR94pyAGpHHiJvcej8zcvaxNc8xqLqbGPoLigoMpflOQ/UIw0fGbx/E+
vFtUgIN4MLvhZC0YKiZLJBKdlLMBSYCoh4hUaQrnoXurs6UCzEbY5ym2PqiiyAGB
T6Q9z4lR/SmzpbqlHby/OC0IA+STNE1JACE2u1OZdqBoq9/M89SQWTzzydO2sgXN
OogQqIGHjCgeI48BvzL33tNVRKY9OIL94gg3TuJT06F8SX0aLZG4Btaz22Tg3Tct
auUWiQW2GakRb/WaTE9jiFEJqpTkXO2u5MjXBkUV0yKK/Z8KGTNfI/xUSALlCOnq
GPvlIBP1XF8KP6IhvHd6RG6i0hCwekwNuaVS6kRItZLpBQkcbpFMfd6Eb6h7HFzu
OvWgfd0R/2o8GHkGMtsI
=XyNC
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
