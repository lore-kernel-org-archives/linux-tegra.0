From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 01/10] clk: tegra20/30: Add custom EMC clock
 implementation
Date: Tue, 18 Jun 2019 14:21:08 +0200
Message-ID: <20190618122108.GO28892@ulmo>
References: <20190616233551.6838-1-digetx@gmail.com>
 <20190616233551.6838-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1SVgZ+3xbDF9VW5n"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190616233551.6838-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Dmitry Osipenko <digetx@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joseph Lo <josephl@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--1SVgZ+3xbDF9VW5n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 02:35:42AM +0300, Dmitry Osipenko wrote:
> A proper External Memory Controller clock rounding and parent selection
> functionality is required by the EMC drivers. It is not available using
> the generic clock implementation, hence add a custom one. The clock rate
> rounding shall be done by the EMC drivers because they have information
> about available memory timings, so the drivers will have to register a
> callback that will round the requested rate. EMC clock users won't be able
> to request EMC clock by getting -EPROBE_DEFER until EMC driver is probed
> and the callback is set up. The functionality is somewhat similar to the
> clk-emc.c which serves Tegra124+ SoC's, the later HW generations support
> more parent clock sources and the HW configuration and integration with
> the EMC drivers differs a tad from the older gens, hence it's not really
> worth to try to squash everything into a single source file.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/Makefile          |   2 +
>  drivers/clk/tegra/clk-tegra20-emc.c | 305 ++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-tegra20.c     |  55 ++---
>  drivers/clk/tegra/clk-tegra30.c     |  38 +++-
>  drivers/clk/tegra/clk.h             |   6 +
>  include/linux/clk/tegra.h           |  14 ++
>  6 files changed, 368 insertions(+), 52 deletions(-)
>  create mode 100644 drivers/clk/tegra/clk-tegra20-emc.c

Hi Mike, Stephen,

The remaining patches of this series have a build-time dependency on
this clock driver patch. Would you mind if I pick this up into the Tegra
tree, so that I can resolve the dependency there? I can send a pull
request of the stable branch with this one patch if we need to resolve a
conflict between the clk and Tegra trees.

Thierry

--1SVgZ+3xbDF9VW5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0I1zQACgkQ3SOs138+
s6GmNxAAh2/FHVRpd1T/DtfRNWMm4FuJgUZNxY4iWXI2BBihdTriaHoryReZxM5J
jbMpjbFEF7O8luXOxjT8N9msBIUKeIEGSMssD42yuz0YQ0qFAi5R8JJCk9ZEhP37
S8Mucfsuc3W4y+E1k6TcYAyCANyVbnYVQKP2JW/cTsP8kTpg6kTwSOVC3zqSSiFM
VwxqF/e3WFbvH/YjQFExotAB2JrTlgcdLOwwBEFI/pbgW6QwlHXNCQS59x10bqVa
VqanvlQQusiu6F1CFJRQgy2VzJZHOIv1mtj0RjoM1WF+aNSFBrRr9FMlniQrFedj
mvH72ES60Ely+A11pjdTL3h5n2ckubGHREU6d0q+Qd29G7IP+II1NRbHWXi0A6Gp
p3m/SUHGdKLltA8mSH6si9trqXevmKfM3lz3lF3OUVzyVmwk7q2o3l4BoluVvOtE
s41nMWBNqWhaVw7HWcyAeAXbjnTsUcM19ZuLpe+gJw0El/yPU5gJ95/KPFapEVxw
1NVYt4F4mSgT2jqEdP06w2aoh9N+sW8lBY4vMaHoAxn10ysSR4UT3aPj3228SnXK
gRZIq1XpQvruxfowMHuMuxllWjADW8HCTBw605/M9S+E0jArFo831tDm27tp3bv/
b882fe4FQ96z/KNDIdRTm1URKHPWz6ZsBGjptfhBBj0cm9KNI4o=
=XtZc
-----END PGP SIGNATURE-----

--1SVgZ+3xbDF9VW5n--
