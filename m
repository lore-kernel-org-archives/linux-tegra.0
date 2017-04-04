From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: add missing Tegra210 clocks
Date: Tue, 4 Apr 2017 16:03:25 +0200
Message-ID: <20170404140325.GK843@ulmo.ba.sec>
References: <1490192598-26862-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7ArrI7P/b+va1vZ8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1490192598-26862-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mikko Perttunen <mperttunen@nvidia.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--7ArrI7P/b+va1vZ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2017 at 04:23:16PM +0200, Peter De Schrijver wrote:
> iqc1, iqc2, tegra_clk_pll_a_out_adsp, tegra_clk_pll_a_out0_out_adsp, adsp
> and adsp neon were not modelled. dp2 wasn't modelled for Tegra210.
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-id.h               |  6 ++++++
>  drivers/clk/tegra/clk-tegra-periph.c     |  6 ++++++
>  drivers/clk/tegra/clk-tegra210.c         |  7 +++++++
>  include/dt-bindings/clock/tegra210-car.h | 16 ++++++++--------
>  4 files changed, 27 insertions(+), 8 deletions(-)

Applied to for-4.12/clk, thanks.

Thierry

--7ArrI7P/b+va1vZ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljjp60ACgkQ3SOs138+
s6Ff6BAAgAs8lgtU6unbMIYgOq6qzmXu6z3uHvHTZMYMDC+XMMd9r885n2gTgEtV
Njq0cGyCFySlIK2ZXW2lb0lyNP1EaQcdVDufWIbJSxyuMe7y4dZ+lXBBqO0qPBPo
I7WKpfKhvbBcrQjpdlHQEHYAc2gdn5V6XbuZLDNAGIelm596AxI3vSS4lnz0FIPd
2SFXRJHib5kMcxeV7NTo2ZyEL8cKSsDQnLYmi/gNcTp07YriuE7Cu/jZrCrCiaDd
7EQOkrZ3/sdmAwlUvJTcMkuT4dTXNfzY6wgNNJkl4H2Gas2ZYAMlLcUNai95Nduk
icYIx8ixKpJERmJyyYN0/sx0uYipc/4oK2N2zESN093bWOFkKpw7Wg/d4TWA742U
rHgzccw6TleWDqBQcgIZ9eGF5iq5LFWlJHm/IJ7RYdzvrWVFAAYGEBK402yZylac
ipNf40XFr74uc9K/BZ93PJheI60B5Vd+Z7z/qpbFa/Pwb/eZsIL50J/4jhlEeisZ
B29tof7/ylHcvmi4bzn6wenXJ7jbWgsoCkOQ/uas92AsOJtWLo9rNLE1suSYy3Cj
ZxBz4Yk/MxmgUz3yLixflyEuP0uYyS96k7yuPmP+xt5EQqqTWFKG6gFp6MTLQ91v
sXhIyOdLaX/m4Mya4bG9zVK5WWq2gzVfyvIxltLBaGvnRyWhIwI=
=SOvC
-----END PGP SIGNATURE-----

--7ArrI7P/b+va1vZ8--
