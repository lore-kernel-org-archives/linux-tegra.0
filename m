From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] clk: Introduce clk_has_parent()
Date: Thu, 22 Jan 2015 08:37:08 +0100
Message-ID: <20150122073707.GA427@ulmo>
References: <1421750935-4023-2-git-send-email-thierry.reding@gmail.com>
 <1421856780-32103-1-git-send-email-thierry.reding@gmail.com>
 <54C04145.1010906@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54C04145.1010906-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2015 at 04:16:05PM -0800, Stephen Boyd wrote:
> On 01/21/2015 08:13 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > This new function is similar to clk_set_parent(), except that it doesn't
> > actually change the parent. It merely checks that the given parent clock
> > can be a parent for the given clock.
> >
> > A situation where this is useful is to check that a particular setup is
> > valid before switching to it. One specific use-case for this is atomic
> > modesetting in the DRM framework where setting a mode is divided into a
> > check phase where a given configuration is validated before applying
> > changes to the hardware.
> >
> > Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> > Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
>=20
> Reviewed-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>=20
> This will slightly conflict with Tomeu's  patches for per-user clock
> constraints. It would be best if we can take this through the clk tree
> to fix up any conflicts

I had hoped to take this through the drm tree to resolve the build-time.
Another possibility would be for me to include the clk tree (or a subset
thereof) in my pull-request. That way you can still fix things up in the
clock tree if there are any conflicts with other work. We could make
that work two ways: this patch gets applied to the clk tree and I pull
it, or I provide a stable branch that I base my pull request on and that
branch can be pulled into the clk tree.

Yet another alternative would be to split out the clk_has_parent()
change from the series and not use it for now. That way we're going to
miss this check, but we do that anyway currently and it will only be
temporary until v3.21.

Perhaps given where we are in the release cycle the latter would make
the most sense for now.

> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
[...]
> > +	/* Optimize for the case where the parent is already the parent. */
> > +	if (clk->parent =3D=3D parent)
> > +		return true;
>=20
> I worry that we'll need to grab a lock here with Tomeu's patches, but
> maybe I'm wrong.

Why would this need a lock? Worst case somebody concurrently changes the
parent, in which case will not succeed and fallback to the lookup below.

It's been a while since I last looked at Tomeu's series, but I seem to
remember that struct clk was going to be per-user, in which case I guess
the code would have to be modified anyway since ->parent and
->parent_names will likely become properties of the clock structure
shared by all users (was it struct clk_core?).

Thierry

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUwKijAAoJEN0jrNd/PrOhr3QP/jUKgrMOcnyrKfGsHDJuLX3U
aIeOwV8vjX8hUmH0VfNzcVnCTZ33fJeOO8YqHbioVKIQatDrRI6O1rKXZHh7axNR
z+b+exTF6bDsY0JIDn76tkDxrToWwBPTCjxwJ2ZmkqTRFrhE/0/2513QDqIBOhuf
Ko/EkzD/HaVcOOTg2XJCbDJm96n7thQQTinYfijHR152sdMKn42hLc4nmfbBmWz1
3HtvjSaeJQrf+VGvfk+mc6PNAzThfSXWl11tsMd5ZS9/D8ejWV0LnYhd0cZaRgm/
BhHiK+vxiZhsNe/b0F257jKP++P7aaJtwwiTIjzQSBtDoVLRxsHqBT3PF4tgChqW
ATCs2lkykcpxgJzZKnxLEuRyqnMVPgj2Us6+mKb69Ilc8TtntSVAMbRQkpOzq9c7
D2um5TWgWjDrhU7Cy9VabG+lo5GHZF37o38/l5TKjvqlM4QVxPuRhCDiznXtyrU3
5qJtVO7ua5sdYyvZI+LYZOauVjfNxPdbGQpcLtitonAWCPLTx7xVstTtt2sUY+mS
DM904b613NANSN/rEMJYgWrAaDIXT3XlsbMU9DY7u6FO5NrTc0J+YHbKMsAtheEZ
r+5PUalPs4WMv882Dl81j5+BwUI0f5ErxfjepaiFseBj7ieBVhcqH1bbDSEh8fHG
PHl8vg6vah4XYp4WMeBT
=F3BC
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
