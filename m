From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 06/20] clk: tegra: pll-params: change misc_reg count
 from 3 -> 6
Date: Wed, 6 May 2015 16:18:17 +0200
Message-ID: <20150506141816.GF22098@ulmo.nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
 <1430757460-9478-7-git-send-email-rklein@nvidia.com>
 <CANLzEksajPjf1VH8Zn-1oXhgL8f-b7GuCBprExTP-w18WbCC4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TU+u6i6jrDPzmlWF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANLzEksajPjf1VH8Zn-1oXhgL8f-b7GuCBprExTP-w18WbCC4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--TU+u6i6jrDPzmlWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2015 at 01:35:09PM -0700, Benson Leung wrote:
> On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > New SoC's may have more then 3 MISC registers, so bump up the
> > array size and use a #define to be more informative about the value.
> >
> > Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/clk/tegra/clk.h |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> > index 5759b8bfb80e..8e7361886cf9 100644
> > --- a/drivers/clk/tegra/clk.h
> > +++ b/drivers/clk/tegra/clk.h
> > @@ -156,6 +156,8 @@ struct div_nmp {
> >         u8              override_divp_shift;
> >  };
> >
> > +#define MAX_PLL_MISC_REG_COUNT 6
> > +
> >  /**
> >   * struct clk_pll_params - PLL parameters
> >   *
> > @@ -213,7 +215,7 @@ struct tegra_clk_pll_params {
> >         u32             iddq_bit_idx;
> >         u32             aux_reg;
> >         u32             dyn_ramp_reg;
> > -       u32             ext_misc_reg[3];
> > +       u32             ext_misc_reg[MAX_PLL_MISC_REG_COUNT];
> >         u32             pmc_divnm_reg;
> >         u32             pmc_divp_reg;
> >         u32             flags;
>=20
>=20
> Missing kernel doc above for ext_misc_reg and some other surrounding memb=
ers.

I added the missing kerneldoc in that patch I sent out earlier. The
problem is preexisting for this field, so doing it in a separate patch
is fine in my opinion.

Thierry

--TU+u6i6jrDPzmlWF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSiKoAAoJEN0jrNd/PrOhYzsP/jad71JRthSpHD9ZNPEf8I7e
a0webVBLzJZ0ASUDWjTNobIwDSEtnj+hae6Kmh/xuZZHy3RRiWEBf7DhqEgM3ECs
5p7ryEuBEsSO8L0+pTYp5EBaveSxJCHv90GxayWwJkfCZCyt8XvbqpDQ2iLuhs6C
e61BWFuVWPSGUmFd0CWjXvf6ZdT3KMvRt/SwE+faq+3oOkW9hFoE6iua2Ui0QH8Q
+vhyhWyEh3fUi2qPY+rbkRyf5mRG8/OzSfvagcyXdbhWGjOb3UEPWEd4J533oXsg
Uuqr+r+TL8Z31CA3Ya9HvaWbQexjallJjUF9Ah+kxwB3snQA8h0PUCVNRIErxVAR
/9Wmd+OcLLnzl9yUO90fqQ9IcuU6KSMjQTo7gVSOj13xhGFHlg41MQvwXoC61iUu
7l+pNv5vEHEexfo2ssY/ZDA8+Zj9Tb4vJIAKKAhdq2xxKM0FEfoGFAtxWOsXuHuj
dVbIQBQibs5FL0Q0qw5AWTCrMhjBpNDzZxoOqG0QqCKzrmkGYqZyLDM6gvYoK6sh
SopAA0tgbfu61SMHq6SUUwRN2MGm+fP5JFCuUAWyHC4+OC7vx7AcPtDbPZxI7tdS
X6BH5hNTIVTV+g2a58drxheEv1IMqkrRQOx5kppDgopKAGRixv4oHak8z3+58S4N
vt9quRFfkOC6xBpejgiY
=LhiZ
-----END PGP SIGNATURE-----

--TU+u6i6jrDPzmlWF--
