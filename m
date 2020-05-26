From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 07/11] memory: tegra: Changes for v5.8-rc1
Date: Tue, 26 May 2020 13:40:54 +0200
Message-ID: <20200526114054.GA2935745@ulmo>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
 <20200515145311.1580134-8-thierry.reding@gmail.com>
 <CAK8P3a0kqjt8UNxe2ruRDOJNedOcqWxP-i5y2uW6YsaMNJgejg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a0kqjt8UNxe2ruRDOJNedOcqWxP-i5y2uW6YsaMNJgejg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
List-Id: linux-tegra@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2020 at 11:52:30PM +0200, Arnd Bergmann wrote:
> On Fri, May 15, 2020 at 4:53 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> >
> > ----------------------------------------------------------------
> > memory: tegra: Changes for v5.8-rc1
> >
> > Contains a few cleanup patches and an implementation to scale the EMC
> > frequency on Tegra210 systems.
>=20
> I don't mind taking the memory driver patches, but it seems odd that this
> pull request has so many drivers/clk changes but does not mention that
> in the pull request, and does not Cc the clk maintainers or include Acks
> from them.
>=20
> I would assume that the reason for this is that you have based
> the memory controller changes on a branch that was already
> accepted by the clk maintainers in to their tree, but when you do that
> please be more explicit so I know what is going on.

So historically there's often a lot of dependencies, either build-time
or runtime, between Tegra clock patches and other work. That's why we
ended up with this model where I collect Tegra clock patches in the
Tegra tree and it's not uncommon to end up with the clock branch being
a dependency of one of the other branches.

I did send this to Mike and Stephen about 1 1/2 weeks ago, but it does
not look like they've pulled it into the clk tree yet.

I typically highlight the dependencies in the pull request, but looks
like I forgot to do that this time around.

> Waiting for clarification before I can pull this.

Given the above, might be best to hold off on this for a bit until the
clock branch was pulled by Mike or Stephen.

Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7NAEEACgkQ3SOs138+
s6Fv6w/8Cu4dQWtsRKUDrg20jXHqNhVoKWh9ZIqXfZLZ6kbRuNF1Fov+dDUNJujN
QqPjGh5YyFb3pwIDXK+EKBnPMi4BIDm2khwlL1Y6IgiOpgssfMLdB0SLZRZdHDnf
dxvR2/yvNC6kjv7kDmc//1QuU+5k/JjmP6Mvqm5NsccJBNpsnlqzN5oMtZVJOYXo
TOLKcRg0iRwkBJeeL20Q0HgikZCRUpazlhX/6ec4dclFpi6IrVwCBwKMpas77nzf
cfW6IDba/sygJw5Xhcbj0Tk+aBTJ0OPmrwopAYunLO6vykjzlf9bYpbwesbJ3cbN
ra1yLxUPM0y0wdEmPpHxzUQrDnPvgDpn2N7wrQN0TFMWvoeII75kh2cB6nChVhaE
Lx2R/4TupCwMQjUOyULNRN+2y9cNdVoOb34Jl/nXwHD6XlWywZhJKEo5+jTSkG3e
dmaxZS1WfkrCHEAdRkXNNQTSBznXBu6+yiKEN4GQRvOeEHmSWSnT1cVChVh94KES
XRnAabAIne4kTqpS2gNugj1DrRytD1k2i2ZCsj/gVy8Qe/AY0rLmjXMSQOLFxdkO
z9BBuZSLpkOAVvfAFCXpkJFOF8VDd699oyppGOp3fJyqVGPC34qEmvXW6qHzyUFp
DaB2C2HMPOU3/fCn3QlSoSga8yJgBIXLj9l32h3eJ6eGTa3iZ5I=
=8dgG
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
