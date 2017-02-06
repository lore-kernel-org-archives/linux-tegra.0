From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] clk: tegra: Add BPMP clock driver
Date: Mon, 6 Feb 2017 12:13:42 +0100
Message-ID: <20170206111342.GI27607@ulmo.ba.sec>
References: <20161115161129.29722-1-thierry.reding@gmail.com>
 <20161117154731.29528-1-thierry.reding@gmail.com>
 <20170125074112.GC13025@ulmo.ba.sec>
 <20170203204302.GF25384@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7SrMUQONj8Rl9QNG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170203204302.GF25384-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7SrMUQONj8Rl9QNG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2017 at 12:43:02PM -0800, Stephen Boyd wrote:
> On 01/25, Thierry Reding wrote:
> > On Thu, Nov 17, 2016 at 04:47:31PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > > This driver uses the services provided by the BPMP firmware driver to
> > > implement a clock driver based on the MRQ_CLK request. This part of t=
he
> > > BPMP ABI provides a means to enumerate and control clocks and should
> > > allow the driver to work on any chip that supports this ABI.
> > >=20
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > > Changes in v2:
> > > - rename ->prepare() and ->unprepare() implementations for consistency
> > > - implement ->is_prepared() instead of ->is_enabled() to avoid the ne=
ed
> > >   for atomic operations
> > > - rename tegra_bpmp_clk_message.clk member to id
> > > - remove a double semi-colon and a stray ampersand
> > > - drop extra check for validity of parent index, the core does it
> > >   already
> > > - make struct tegra_bpmp carry an array of struct tegra_bpmp_clk inst=
ead
> > >   of struct clk_hw to simplify some driver code
> > > - zero out struct clk_init_data to avoid potentially uninitialized da=
ta
> > > - use devm_clk_hw_register() instead of clk_register() because we nev=
er
> > >   need the opaque struct clk cookie
> > > - rearrange functions so that they appear in the order specified by
> > >   struct clk_ops
> > >=20
> > >  drivers/clk/tegra/Kconfig    |   4 +
> > >  drivers/clk/tegra/Makefile   |   1 +
> > >  drivers/clk/tegra/clk-bpmp.c | 620 +++++++++++++++++++++++++++++++++=
++++++++++
> > >  3 files changed, 625 insertions(+)
> > >  create mode 100644 drivers/clk/tegra/clk-bpmp.c
> >=20
> > Stephen, Mike,
> >=20
> > we missed the last merge window with this, but it would be nice to get
> > it in this time. Any more comments?
> >=20
>=20
> Don't think so. Shall I merge it into clk-next?

Yeah, let me know if you do, then I can drop it from the Tegra tree.

> Sadly it's not easy to test compile this single driver on the
> commandline. Grumble.

Any way I could help with that? I did put this into the Tegra tree a
while ago after not getting any further responses to at least get it
some broader build coverage.

I personally use a set of scripts to make sure the proper drivers are
compiled. If you can provide information about what you use, perhaps I
can work with you to make this easier for you.

Thierry

--7SrMUQONj8Rl9QNG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliYWmYACgkQ3SOs138+
s6HFbw/8CNKbJ3DzC2ainoMsrIrGgi6YI2fiH/IfqGpi2CeWr6ucxKwCX8K70i+r
pKsiHwyF+MLYKoApNUSG/c3ie2HUO8GxusOz2Z7iovBTJoz8qubyv6obDVhNm/3i
bH56DZOlTsmo/ew92LRD67p/5XFK/6QYCCA8M9PNKYHCC8F3duQdexM99xiI9OIV
f6FmGqDX75YQknn5XcK874IOZAcpOFYhPJTekwX8ChK1rYwKomMhM3ePwjm1m1W0
yvOb6ObD+3S4dgZrbff20GHRSx8w3dAWey5epZVv7JEXod02kVOGNPV3RnbNnNK4
8XdPMKatH5vdg4HHJTZLZE3V4IWUZAkBveNNR+dIJrbgjcWcDHxJwUrHetRyn5Yk
0r2YPQXKPjXJsvT3+FWr6tAvuiS3vgoH9cbVIPPRwQ8MY41jvBDWrsQQoMBopInn
pVmaoh4lkzx6wpKwQzADZIko6+lS/IRNzsjSKdEiiaInPg3kcsAkwjgrH5brnTaO
M3F7QRmAOh4QPX0cdf/Oe4YR9UzqvQ4bLnxESOqFTK59tpPHeU/WXzCz0pVgcQjA
JFAauiIu3mULWMfitvI/0/r959cv98U0Uz3vf4Izt3pklrGsZUpKPyzSMz50QhKD
RAaRNenoWp4XFXdnOaM8bVC5htJU/p0kiCNVwZzoN99OdAlQP4E=
=whM0
-----END PGP SIGNATURE-----

--7SrMUQONj8Rl9QNG--
