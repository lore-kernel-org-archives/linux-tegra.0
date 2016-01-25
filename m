From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V2 3/9] clk: tegra210: Fix naming of MISC registers
Date: Mon, 25 Jan 2016 13:36:02 +0100
Message-ID: <20160125123602.GF20452@ulmo.nvidia.com>
References: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
 <1452799478-14791-4-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i3lJ51RuaGWuFYNw"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452799478-14791-4-git-send-email-rklein@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--i3lJ51RuaGWuFYNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 02:24:32PM -0500, Rhyland Klein wrote:
> Some register for PLLM and PLLMB were named MISC0 but according to the
> TRM, they have different names. Sync up the names to make it easier to
> understand which register they are really referring to.
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 36 ++++++++++++++++++----------------=
--
>  1 file changed, 18 insertions(+), 18 deletions(-)

Applied, thanks.

Thierry

--i3lJ51RuaGWuFYNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphayAAoJEN0jrNd/PrOh7ZEQAInNP4jVF/YD+SdPdGAE3z3t
XTMd1tUv7jLQKyJh1VT4NPo0VScn2fQsR5H06HoMCmQEoW3kTwJMaVBptQlEnfmm
tSBC6MPBZyoqDEo4OiAYHgmAsvSn2LbnHBUgJotRowxSMlPwZWlHEAN2MInywkOo
q90D1eY8q4LZMx5py5z9N2Mo+fbThQX9KydpgDchjePvjaAtwX4a6kQSGK7RDVNU
oZ1aTB2DtgvqUnlY3pLP6EHw132A9St+FzfY5N0f+pdPZwFP6hsnTtZtZq5TcnGG
589+AmD8WSI+J3eIMh1HKLV3VhfeBjdPhZzSxtu94+UJU6qJRn1Z+ZKLjbafF94P
huMe+7uEv79QzKy5beTNnu2mUWHhizQae7s3pkoZhHmfhQrGk38NA8mzjr97NAaY
gCQ1OozbOtycLNYXH4CzLqBrbst1so3ImhlYWxu/G2KokdotcwSrJjJSOXZt6daX
+FGDugBh3R9tt5vDuxlsF4RSq/oJd2/wPZFbzeQKBc7nIr4Yun4HvvxMrPU36kR3
TUwuwjAbGCjylp+GKb7yCe7JL6nsny1/VsLynbHYPm+l73JXNqQ91TT+M8FEaA7o
9zyGWpGTqOiaHPMg9TJdjvnT5gZTx6ujKM+QVgtU22hM7KwiQb71lTefzr7WO2Yd
iQXCJ7OzJ/vsgkjn/FAv
=iuLk
-----END PGP SIGNATURE-----

--i3lJ51RuaGWuFYNw--
