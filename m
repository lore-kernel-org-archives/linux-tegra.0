From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V2 8/9] clk: tegra: pll: Fix typos around clearing plle
 bits during enable
Date: Mon, 25 Jan 2016 13:47:23 +0100
Message-ID: <20160125124723.GM20452@ulmo.nvidia.com>
References: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
 <1452799478-14791-9-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="00sTfE/IIAT5d2r5"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452799478-14791-9-git-send-email-rklein@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--00sTfE/IIAT5d2r5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 02:24:37PM -0500, Rhyland Klein wrote:
> While enabling PLLE on both Tegra114 and Tegra210, we should be clearing
> PLLE_MISC_VREG_BG_CTRL_MASK and PLLE_MISC_VREG_CTRL_MASK not setting
> them. This patch fixes both places where we incorrectly set instead
> of cleared those bits.
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--00sTfE/IIAT5d2r5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphlbAAoJEN0jrNd/PrOhiYQQALL4lxI4NtiA3shZB/EEjkXp
07AO/DBWd0JLwMaiJJ3ttUH/628QCjzc/A4+gRM1PPuupWu6NaAf0DYb/nXoZNdL
2zYywsMjK9VimTW2yt+B4Kq7xlJhlMaw7AbBc6BmPymyFMalapjD7Vtz4BCF6K0d
WLU4h8mYt+zkey0MLH9j6lckH9qHOP330N8Uz9h5dykBHUE1Xlz2ysCYiXvBShbn
reQgnfMvq5ytBOZhEZUd1U9Hl+UUMouF5AUkWMz28ujPO3WObiei59l3Bd+/Nn/K
XD+hlST3ZTJHsg/Ed0l9g1Jj+sJUOgYvhwh4qrN5sp7aYA/I6JgqzwHrOHOSTiGq
8Xtq5ND7ZN4X6fqKvie3CGU5oeCgrsh/ArX4mTt5K3LIWjsJODqU0+or8epzxzhA
IVel7MRhxbAq3218tJhzodbM//lBLULiw51M9atewKzgvBuEvjRwfb5Z+S8ADjPu
eEecLUjMRztgxkgtgbP2bgE2wFtyij2D6JKEDF1vwuzwYdbNk5aIA+w2ihchHBkZ
M7JzvLfQxsa3Or5BdodHOoWmPz4/ocxk2AFCoTL3XFiXscaElhvblVCIXdeuisRD
MjqUG/u9pQxwBwgLCt7aG0u1DAhrjLbSONVQyblcfs8JXSvUOCJR+RbIfaIM+T1d
gm/C1qN4Pz2uTD5hXIZQ
=nQRb
-----END PGP SIGNATURE-----

--00sTfE/IIAT5d2r5--
