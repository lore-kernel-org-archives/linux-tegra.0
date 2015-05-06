From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 08/20] clk: tegra: pll: Add logic for handling SDM data
Date: Wed, 6 May 2015 15:57:20 +0200
Message-ID: <20150506135719.GB22098@ulmo.nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
 <1430757460-9478-9-git-send-email-rklein@nvidia.com>
 <CANLzEksFVpYOtcG5QHHfQa6bGXJ6nMYrsP4yG=5wszxCHrWqug@mail.gmail.com>
 <554916F8.2060908@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <554916F8.2060908@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Benson Leung <bleung@chromium.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2015 at 03:16:08PM -0400, Rhyland Klein wrote:
> On 5/4/2015 7:01 PM, Benson Leung wrote:
> > On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> >> @@ -495,6 +505,28 @@ static int _calc_rate(struct clk_hw *hw, struct t=
egra_clk_pll_freq_table *cfg,
> >>         return 0;
> >>  }
> >>
> >> +static void clk_pll_set_sdm_data(struct clk_hw *hw,
> >> +                                struct tegra_clk_pll_freq_table *cfg)
> >> +{
> >> +       struct tegra_clk_pll *pll =3D to_clk_pll(hw);
> >> +       u32 val;
> >> +
> >> +       if (!pll->params->sdm_din_reg)
> >> +               return;
> >> +
> >> +       if (cfg->sdm_data) {
> >> +               val =3D pll_readl_sdm_din(pll) & (~sdm_din_mask(pll));
> >> +               val |=3D sdin_data_to_din(cfg->sdm_data) & sdm_din_mas=
k(pll);
> >> +               pll_writel_sdm_din(val, pll);
> >> +       }
> >> +
> >> +       val =3D pll_readl_sdm_ctrl(pll);
> >> +       if (!cfg->sdm_data !=3D !(val & pll->params->sdm_ctrl_en_mask)=
) {
> >=20
> > You can use sdm_en_mask(pll) here.
> >=20
> > I'm not super clear about what you're trying to accomplish here with
> > !cfg->sdm_data !=3D !(val & mask).
> > Are you just checking if the masked value is different from sdm_data,
> > but accounting for the integer widths being different (u16 vs u32)?
>=20
> So I got clarification from the downstream author to be sure, and this
> is the answer to what this is checking:
>=20
> (<Configuration has non zero  SDM_DATA>  AND <sdm control is disabled>)
> OR
> (<Configuration has zero  SDM_DATA>  AND <sdm control is enabled>)
>=20
> So the check is correct, just a complicated way of expressing it.

Can it be rewritten to be less complicated? I hate it when I have to
look at code for several seconds and still not understand what it's
doing. Why not something that is closer to the pseudo code you gave:

	bool enabled =3D (val & pll->params->sdm_ctrl_en_mask) !=3D 0;

	if ((enabled && cfg->sdm_data =3D=3D 0) || (!enabled && cfg->sdm_data !=3D=
 0))

? Also I think this could use some could comments explaining what's
going on. Perhaps this could be simplified even further:

	if (cfg->sdm_data =3D=3D 0 && enabled)
		val &=3D ~pll->params->sdm_ctrl_en_mask;

	if (cfg->sdm_data !=3D 0 && !enabled)
		val |=3D pll->params->sdm_ctrl_en_mask;

	pll_writel_sdm_ctrl(val, pll);

Now that I have a /much/ easier time reading and understanding. That may
not even require comments because it's pretty plain what's going on. But
there may be some advantage in adding comments about SDM in general. The
comment could be something like what you have in the commit message, so
that people don't have to go find the commit that added the code to find
out what this is doing.

Thierry

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSh28AAoJEN0jrNd/PrOh2f4QAJ6mpQGh4iYyA9i5vFX8Vll9
GSDREKoiZj4NM5HHPLa7hKqnmnD5Pd3djqfvzuM343qEYrerwletEUOwLLzimYUO
+zfdnhgOjEU57CE9TWZaVYVN2m7od6dalJ2nGQ0NhvmshF8p+bZeSmlIrUCrwMcY
N9lj3gzWioe6d2lZ2tloQAmJHHEnH7k2npPCgNJdjytY6AcCopAXRDXB9X+00ziz
Sgs+XjiuTLR5SjHeKXZSVgwHXO8Ow8fxGhV0BL8uijRJP5sVFzvu90fqEVBarZMJ
vDdN0/E5QyJJNNdr4jqIxzbYwWbJ4iSX7t1VTud/mw7deccrhP7D5W0sxVS7LMkU
NSqNRyOc4wn+RjDvZP6xJMv2xyaPGlYQ0IZOmXd70YonTP/ZOGjS1DBHRz9wHj3O
uQU/ZKbz6D388tOl3VEGWLExJwnHJz304V0wHgZHtvAhaODfiPMXS9gIjkW2mpz6
M5CoaJsnss8s7xYpmySmAx0OWVbNAIUfh+T8f2qK7NLOIMtCJ822NQEvMxkD/5fq
w5DFvuBZzPiTCTcpQaTYMzgdyy3eE6CFBh7g876zrV6nU1z/uc0KMlVTEISvIoEE
UFce6wAIwI4+7jce5C758o4Xb2eB/AGDRvLkBPnqGAqWnXKVL+MpwaY62TzVn0Jb
iptTFm7yAgi8U09QlWUR
=2WTy
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
