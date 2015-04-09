From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/8] clk: tegra: Fix duplicate const for parent names
Date: Thu, 9 Apr 2015 12:19:48 +0200
Message-ID: <20150409101947.GM12103@ulmo>
References: <1428499339-29569-1-git-send-email-k.kozlowski@samsung.com>
 <1428499339-29569-5-git-send-email-k.kozlowski@samsung.com>
 <20150409100036.GK12103@ulmo>
 <CAJKOXPd4KsZ-pLDUtyWwyJviZyFWQKVLTVpW_6_Yye2o=3xy0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L/bWm/e7/ricERqM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPd4KsZ-pLDUtyWwyJviZyFWQKVLTVpW_6_Yye2o=3xy0g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Barry Song <baohua@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tomasz.figa@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--L/bWm/e7/ricERqM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2015 at 12:07:59PM +0200, Krzysztof Kozlowski wrote:
> 2015-04-09 12:00 GMT+02:00 Thierry Reding <thierry.reding@gmail.com>:
> > On Wed, Apr 08, 2015 at 03:22:15PM +0200, Krzysztof Kozlowski wrote:
> >> Replace duplicated const keyword for 'emc_parent_clk_names' with proper
> >> array of const pointers to const strings.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >> ---
> >>  drivers/clk/tegra/clk-emc.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > This would probably better go in via the Tegra tree since the patch that
> > contains this has only made it to linux-next.
> >
> > Stephen, Mike, any objections to me taking this?
>=20
> Applying this without the change for const-ness of parent_names (patch
> by Sascha Hauer sent before mine [1]) would introduce a warning -
> assign of const to non-const. Any idea to solve it? Immutable branch?

Right, I had missed that. Immutable branch would work, though perhaps
it'd be easier to just defer this until after v4.1-rc1. The warning
shouldn't happen if we leave out this single patch and apply it later
on, right?

Alternatively the whole series could be deferred until after v4.1-rc1.

Thierry

--L/bWm/e7/ricERqM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVJlJDAAoJEN0jrNd/PrOhA/4QAJP3X9ep2pBzKwit0uajH0D9
RQhdOT5HLfdsHrsajslvA0n/XSWlziT56Wbzc4E6BmQNXcGygzI/RnJJi4NQL81i
839nygLxVzcwRwGcTl/Ihgm4p0N+/EuoiWQekAX5ZFZIMpbN9MfjETVNyHE3rU4+
SZhIcwr7J9k/mx4sXZoC/GgHDMstM9Oo6hRaJr+RvC0hdrg7aAHgz+Y/y6whRG8r
1IaDSTnBET18t16t4eAsDyJ96nuITgWp5NEIpjQoaQ4C5AnDYNpnbEV02xVZUx1b
3WFcQqSuXybAYVt6Ku4fN2h/joOH7+QI9WqabjDnBmlci4fyjlw+GbXOr8NaEyMO
i3mIQ2ZRk6aEYYKxxtfLIlpcw0ONgvnu+KFtL0+URFqxrXBnm7+Kv/73j65/L+7z
rPraKUpzEWqcbfOcV+vBsnuaxjgd8jL7YyyAJpokndL0Ig8xDOfs6QAuzssg/fSc
sXD1S2MabaNmvVkCTLvLZORr7fbAKO4pCm2pqei0GMPLbvIVCkFbyrirRF9v6gM+
5au8HZCCm7qBxYH+Bu918tY40t8/HJbI+rr+qgE+UsQByNthwACDwgPjPwaejzTW
q6vgvkHL3/WXLM0fg4R9UjXp6n26CDVJNH0U/Vm8b4hTudEfuIOcXrXdHwD1SEyl
52woHtlf/Rb1lXK4w2he
=1GZ5
-----END PGP SIGNATURE-----

--L/bWm/e7/ricERqM--
