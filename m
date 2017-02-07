From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] clk: tegra: Add BPMP clock driver
Date: Tue, 7 Feb 2017 11:52:40 +0100
Message-ID: <20170207105240.GA29507@ulmo.ba.sec>
References: <20161115161129.29722-1-thierry.reding@gmail.com>
 <20161117154731.29528-1-thierry.reding@gmail.com>
 <20170125074112.GC13025@ulmo.ba.sec>
 <20170203204302.GF25384@codeaurora.org>
 <20170206111342.GI27607@ulmo.ba.sec>
 <20170206225224.GI25384@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170206225224.GI25384-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 02:52:24PM -0800, Stephen Boyd wrote:
> On 02/06, Thierry Reding wrote:
> > On Fri, Feb 03, 2017 at 12:43:02PM -0800, Stephen Boyd wrote:
> > > On 01/25, Thierry Reding wrote:
> > > > On Thu, Nov 17, 2016 at 04:47:31PM +0100, Thierry Reding wrote:
> > > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > >=20
> > > > > This driver uses the services provided by the BPMP firmware drive=
r to
> > > > > implement a clock driver based on the MRQ_CLK request. This part =
of the
> > > > > BPMP ABI provides a means to enumerate and control clocks and sho=
uld
> > > > > allow the driver to work on any chip that supports this ABI.
> > > > >=20
> > > > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > > ---
> > > > > Changes in v2:
> > > > > - rename ->prepare() and ->unprepare() implementations for consis=
tency
> > > > > - implement ->is_prepared() instead of ->is_enabled() to avoid th=
e need
> > > > >   for atomic operations
> > > > > - rename tegra_bpmp_clk_message.clk member to id
> > > > > - remove a double semi-colon and a stray ampersand
> > > > > - drop extra check for validity of parent index, the core does it
> > > > >   already
> > > > > - make struct tegra_bpmp carry an array of struct tegra_bpmp_clk =
instead
> > > > >   of struct clk_hw to simplify some driver code
> > > > > - zero out struct clk_init_data to avoid potentially uninitialize=
d data
> > > > > - use devm_clk_hw_register() instead of clk_register() because we=
 never
> > > > >   need the opaque struct clk cookie
> > > > > - rearrange functions so that they appear in the order specified =
by
> > > > >   struct clk_ops
> > > > >=20
> > > > >  drivers/clk/tegra/Kconfig    |   4 +
> > > > >  drivers/clk/tegra/Makefile   |   1 +
> > > > >  drivers/clk/tegra/clk-bpmp.c | 620 +++++++++++++++++++++++++++++=
++++++++++++++
> > > > >  3 files changed, 625 insertions(+)
> > > > >  create mode 100644 drivers/clk/tegra/clk-bpmp.c
> > > >=20
> > > > Stephen, Mike,
> > > >=20
> > > > we missed the last merge window with this, but it would be nice to =
get
> > > > it in this time. Any more comments?
> > > >=20
> > >=20
> > > Don't think so. Shall I merge it into clk-next?
> >=20
> > Yeah, let me know if you do, then I can drop it from the Tegra tree.
>=20
> Ok. I've applied it to clk-next now.
>=20
> >=20
> > > Sadly it's not easy to test compile this single driver on the
> > > commandline. Grumble.
> >=20
> > Any way I could help with that? I did put this into the Tegra tree a
> > while ago after not getting any further responses to at least get it
> > some broader build coverage.
> >=20
> > I personally use a set of scripts to make sure the proper drivers are
> > compiled. If you can provide information about what you use, perhaps I
> > can work with you to make this easier for you.
>=20
> Ideally I'd like to compile the driver with
>=20
> make drivers/clk/tegra/clk-bmpm.o
>=20
> and have that just work. To do so, I have to make sure my config
> has the right settings, which is the annoying part. If it wasn't
> one-off APIs with #ifdefs to make things compile out when configs
> aren't set it would work better.
>=20
> Similar problems happen for I2C drivers. I should probably just
> put the work into making a script figure out the right config to
> compile a file or something. If you have a good solution here it
> would be great if I could incorporate it into my flow.

A while back I had written about the setup that I use for the PWM and
DRM subsystems. It doesn't have anything magic to figure out how to
build a certain file, so some manual effort will be required to come
up with a good configuration, but I think there's a nice balance
between flexibility and automation:

	https://sietch-tagr.blogspot.de/2016/03/compile-testing-for-linux-kernel.h=
tml

There's a couple of links to earlier blog posts and a github repository
with the scripts and configurations. I suspect it would be fairly easy
to do the same thing for the clock tree.

Thierry

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliZpvYACgkQ3SOs138+
s6FEiQ/5AYFZwATsQ0aeC7r0XocJg8lY2uEHfa5nLZTuByn4uDo6qM1LihogLHBf
U/SzVYO06CcgyP3m2NFdfw8184TJnAUvJbPJYT1GCxhQ8GQvtszSExLs3hhCCxm2
iZ+lJkOuAi1qt5FOqh4bbmw5QouTvg6FN47Y/4JRXzO20bVePHrJWM0ZoqIXlX3o
DSNZG7qPg01c3fAXhbdE52879i+ts5tDmeHXM2/r8zmxz4/bG+O4N/3DRXCXUxXL
CuPSEcU7QnL9VYM3llaUnxf+uBxitXCV6mHefRv5L2M/huJyndPy1DqVyVGQf5Fl
zoDUyswxibCJCt/0+d2zoH3FeW7ON1w27jffkyV2CQkURoQuTOdLNJDNernlgUDn
LJsVZy7pwE7Jt9V2UEqRVaBSDItYEXTJ0/9UCDbtJOGuasir3M+q6xD9DcWifJ1D
3l/grxhD1kpKM4v02o0UgvZatZMvukHqIkGuzjPqk8GcSxGMyPAZTIpR9ZbdqVwh
GI3vrR69Rmd5Jq+Dtpfw/Ynv6uJdsV/Lb97vorqoVYyjas8JBJX9cVdrJQLD/z+1
Fq6eMY/d5Vsbrj6JPNOqeDncr62XtqU/kDhxNnvgpmbPNEy/w6KfODU39FkT1o8Z
7+KIltnArdpIvg7DcE3+2i8x5Upe4VPqY4e3zwx/tFJ9Vvt8Btg=
=8vtc
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
