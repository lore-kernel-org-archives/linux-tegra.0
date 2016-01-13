From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] clk: tegra: Fix warning caused by pll_u failing to
 lock
Date: Wed, 13 Jan 2016 18:10:00 +0100
Message-ID: <20160113171000.GP2588@ulmo>
References: <1450702592-7755-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uGrbifh0UoBBidu/"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450702592-7755-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--uGrbifh0UoBBidu/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2015 at 12:56:31PM +0000, Jon Hunter wrote:
> If the pll_u is not configured by the bootloader, then on kernel boot the
> following warning is seen:
>=20
>  clk_pll_wait_for_lock: Timed out waiting for pll pll_u_vco lock
>  tegra_init_from_table: Failed to enable pll_u_out1
>  ------------[ cut here ]------------
>  WARNING: at drivers/clk/tegra/clk.c:269
>  Modules linked in:
>=20
>  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.4.0-rc4-next-20151214+ #1
>  Hardware name: NVIDIA Tegra210 P2371 reference board (E.1) (DT)
>  task: ffffffc0bc0a0000 ti: ffffffc0bc0a8000 task.ti: ffffffc0bc0a8000
>  PC is at tegra_init_from_table+0x140/0x164
>  LR is at tegra_init_from_table+0x140/0x164
>  pc : [<ffffffc0008fee78>] lr : [<ffffffc0008fee78>] pstate: 80000045
>  sp : ffffffc0bc0abd50
>  x29: ffffffc0bc0abd50 x28: ffffffc00090b8a8
>  x27: ffffffc000a06000 x26: ffffffc0bc019780
>  x25: ffffffc00086a708 x24: ffffffc00086a790
>  x23: ffffffc0006d7188 x22: ffffffc0bc010000
>  x21: 000000000000016e x20: ffffffc0bc00d100
>  x19: ffffffc000944178 x18: 0000000000000007
>  x17: 000000000000000e x16: 0000000000000001
>  x15: 0000000000000007 x14: 000000000000000e
>  x13: 0000000000000013 x12: 000000000000001a
>  x11: 000000000000004d x10: 0000000000000750
>  x9 : ffffffc0bc0a8000 x8 : ffffffc0bc0a07b0
>  x7 : 0000000000000001 x6 : 0000000002d5f0f8
>  x5 : 0000000000000000 x4 : 0000000000000000
>  x3 : 0000000000000002 x2 : ffffffc000996724
>  x1 : 0000000000000000 x0 : 0000000000000032
>=20
>  ---[ end trace cbd20ae519e92ced ]---
>  Call trace:
>  [<ffffffc0008fee78>] tegra_init_from_table+0x140/0x164
>  [<ffffffc000900ac8>] tegra210_clock_apply_init_table+0x20/0x28
>  [<ffffffc0008fec40>] tegra_clocks_apply_init_table+0x18/0x24
>  [<ffffffc00008291c>] do_one_initcall+0x90/0x194
>  [<ffffffc0008cfab0>] kernel_init_freeable+0x148/0x1e8
>  [<ffffffc000636bb0>] kernel_init+0x10/0xdc
>  [<ffffffc000085cd0>] ret_from_fork+0x10/0x40
>  clk_pll_wait_for_lock: Timed out waiting for pll pll_u_vco lock
>  tegra_init_from_table: Failed to enable pll_u_out2
>  ------------[ cut here ]------------
>=20
> pll_u can be either controlled by software or hardware and this is
> selected via the OVERRIDE bit in the pll_u base register. In the function
> tegra210_pll_init(), the OVERRIDE bit for pll_u is cleared, which selects
> hardware control of the pll. However, at the same time the pll_u clocks
> are populated in the init_table for tegra210 and so software will try to
> configure the pll_u if it is not already configured and hence, the above
> warning is seen when the pll fails to lock. Remove the pll_u clocks from
> the init_table so that software does not try to configure this pll on
> boot.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 2 --
>  1 file changed, 2 deletions(-)

Applied, thanks.
Thierry

--uGrbifh0UoBBidu/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWloToAAoJEN0jrNd/PrOhJToQAJew95si8lfu12Pk+eZ1mJGI
9WSyWJFnmhboL/01FW7iAlTRZhkrTvTzcsGE7SoLJhdo4871NiSsUmBChVzNJCSo
7M1v0ams51MoZTO38WDPPoOljLOPmchL0frbdOPwJPnVSgqgzMUGs0AHk+IkVJjI
HiuyL3KQBhWnK4oi6sz/v49zrH+xnYiAjk2w+mpN4fMHye7ddWKYo4q5zbud09E4
Xu+MWa1Zdq1dOpxBaJp5pV0iNwBqPsVfEsqNgsmM2/aJPqznVkeDZTHNsR+fxr18
z3+dkiL13w/Ai4JXpFYPCmauKyv3qtNignEloptzQH8XW55p2uekNDlblQGd9AT0
cxNIzXJyuM1J7F/XVy7UtJj4EBZONmE7+7iEgVjir/D5hl3YeHmdtWGbziqnefh7
iDuXt8XwtVIa8M8bfc9KcxK2Ikzf/gqmLXi6DmorvUFXmphKWCOyeta2U7tM2pc/
5/POgkiNs/UwEOfB239rCN144ilWELZIzG4X5UKP2OcTl9CCQ83v0L7qfjUGyFva
QsM2lPSIH1ekHx4L3s4V37JnKCx62VkcygcMPxiW1UufcmCPf7UtklXS+yDjtH1I
YrPXWXV44xXshwGV88z0FxB9MM5rBaNMzROhmuAgQdW4+6tgZAFr6n9l7JK/qsQj
TmHZt6vXsEdfOsNeLar0
=n4Wm
-----END PGP SIGNATURE-----

--uGrbifh0UoBBidu/--
