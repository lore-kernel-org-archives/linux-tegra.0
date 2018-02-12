From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 0/4] MBIST work around (WAR) for Tegra210
Date: Mon, 12 Feb 2018 17:09:03 +0100
Message-ID: <20180212160903.GA4287@ulmo>
References: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2018 at 04:00:09PM +0200, Peter De Schrijver wrote:
> This patch series introduces the Memory Built-In Self Test (MBIST)
> work around (WAR) needed when power ungating certain domains. More
> details can be found in 'clk: tegra: MBIST WAR for Tegra210'. I choose to
> implement the WAR in the Tegra210 clock driver, because most accesses are
> to CAR registers and for the VENC domain, we need to make sure the CSI
> clock source is not changed during the WAR execution.
>=20
> Changes in v4:
> * moved locking and clock control to tegra210_clk_handle_mbist_war()
> * propagate errors during WAR execution to user
> * rework error handling tegra210_mbist_clk_init() slightly
>=20
> Changes in v3:
> * fix compile problem on non-Tegra210 platforms
> * fix clock handling bug in tegra210_generic_mbist_war()
> * addressed minor comments
>=20
> Changes in v2:
> * Use readl for fence_delay() rather than readl_relaxed
> * clarify MBIST and WAR acronyms
>=20
> Peter De Schrijver (4):
>   clk: tegra: Add la clock for Tegra210
>   clk: tegra: add fence_delay for clock registers
>   clk: tegra: MBIST work around for Tegra210
>   soc/tegra: pmc: MBIST work around for Tegra210
>=20
>  drivers/clk/tegra/clk-tegra210.c         | 357 +++++++++++++++++++++++++=
+++++-
>  drivers/clk/tegra/clk.h                  |   7 +
>  drivers/soc/tegra/pmc.c                  |   7 +
>  include/dt-bindings/clock/tegra210-car.h |   2 +-
>  include/linux/clk/tegra.h                |   6 +
>  5 files changed, 376 insertions(+), 3 deletions(-)

Hi Mike, Stephen,

since there's a dependency from patch 4 to patch 3 in the series, do you
mind if I take this in via the Tegra tree? I can send out a pull request
for the clock branch sometime later in the release cycle and pick up any
other Tegra clock related patches that may show up in the meantime.

Thierry

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqBvBoACgkQ3SOs138+
s6Ft8BAAtOzBwzUiHNLPri6diF44f8zNJF6wTuRMxpZfT8prqa7FmLoEEuwchW5O
VYcXNmO8l+5nlB743EMu8hD/4jDMXPvFq8wgp4SnUCA/yJHZr7/fno2iA7y1+aMB
edJYbjUpTyMJhJcr2VmjINGKBwmvEpTNedkrmb/1+dnVIVBeIWSRwsA/eqQg9XJM
y+8mapXJitpljKaURiesbE4t3fRk3hWrjFeY+LmxTQGfw1lHXSlf/K71Xx3YXAzI
+czkZc3ig+4n988M1ClZDHf2TzMuLzggFXXSxfb4dqMB4EKF8mbQA3s65jO3e3de
UiC5RJNYUu2qDQHPMnMnwqc/3JbyVYa7Z/QJT1/YnCqry4elG+rMa0AB5IQFFCBD
tlx2tKc/UeH3mtW20c/8JYJUvYJPIjevN2DYBY+gClLZAjHbR9ziSEtdi++E0HUl
7suXGhH68W2sfQlBZ8I9hQD7sXkiKBxQfIPCCw99wgpeLlkRNz+TOquFaPWOV8E7
k77BYISrq4mHV+FA95tRV/ERDp4epoii9SnG1EIJWYiy1DkXEcEFzPNgZAoFlSHn
2A+soPmMFYSCS27N1MkOSY6wwDgQVMQoHl55SqZtzwJUYLVlRRZ8qaM0aLiVuvps
oXV9Tk+e0GH77AqoLU7XgM5HFWXjUO7e/PEJ1ce1W/J9hYrUbd4=
=FFUS
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
