From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: tegra: Ensure entire dcache is flushed on entering
 LP0/1
Date: Mon, 23 Nov 2015 12:14:58 +0100
Message-ID: <20151123111458.GF31868@ulmo.nvidia.com>
References: <1447942787-31137-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NQTVMVnDVuULnIzU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447942787-31137-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--NQTVMVnDVuULnIzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2015 at 02:19:47PM +0000, Jon Hunter wrote:
> Tegra support several low-power (LPx) states, which are:
> - LP0: CPU + Core voltage off and DRAM in self-refresh
> - LP1: CPU voltage off and DRAM in self-refresh
> - LP2: CPU voltage off
>=20
> When entering any of the above states the tegra_disable_clean_inv_dcache()
> function is called to flush the dcache. The function
> tegra_disable_clean_inv_dcache() will either flush the entire data cache =
or
> up to the Level of Unification Inner Shareable (LoUIS) depending on the
> value in r0. When tegra_disable_clean_inv_dcache() is called by
> tegra20_sleep_core_finish() or tegra30_sleep_core_finish(), to enter LP0
> and LP1 power state, the r0 register contains a physical memory address
> which will not be equal to TEGRA_FLUSH_CACHE_ALL (1) and so the data cache
> will be only flushed to the LoUIS. However, when
> tegra_disable_clean_inv_dcache() called by tegra_sleep_cpu_finish() to
> enter to LP2 power state, r0 is set to TEGRA_FLUSH_CACHE_ALL to flush the
> entire dcache.
>=20
> Please note that tegra20_sleep_core_finish(), tegra30_sleep_core_finish()
> and tegra_sleep_cpu_finish() are called by the boot CPU once all other CP=
Us
> have been disabled and so it seems appropriate to flush the entire cache =
at
> this stage.
>=20
> Therefore, ensure that r0 is set to TEGRA_FLUSH_CACHE_ALL when calling
> tegra_disable_clean_inv_dcache() from tegra20_sleep_core_finish() and
> tegra30_sleep_core_finish().
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>=20
> Please note that I have not encountered any problems without this change
> so far, but I noticed this from reviewing the suspend sequence. I have
> tested this on tegra20, tegra30, tegra114 and tegra124 and verified that
> suspend/resume to LP1 is working fine.
>=20
>  arch/arm/mach-tegra/sleep-tegra20.S | 3 +++
>  arch/arm/mach-tegra/sleep-tegra30.S | 3 +++
>  2 files changed, 6 insertions(+)

Applied, thanks.

Thierry

--NQTVMVnDVuULnIzU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWUvUvAAoJEN0jrNd/PrOhkBwQAIUbYxObieMI0p6tqHqCrmIH
S+SnTi+TdoCx90lPzIjug4JrJur/FTQPgQ69c6ZUhWgf2npQiGJTEc+IFm91nyar
18uIZMZtwalEbE8/2snJuoRXkb5mHeRd9H5cb3Wxk/fWkoKJ0AdZwy59uhUNzwxR
izITS6b8DgXuJUlcELxL2VrMjfEsTFrvztTmkf9Oi34mFc5tO4QELI+ZZL63OCOJ
mUMxta6EG7t77G5GW9KN7UL8Nu9wgKTyuX44d+2pZzEGOvP0gCqdIYrgMDiBdUHx
UEqDZ0O/h6716CZ7pH2PeyTgoZdzBDh9AeNHut5vEHnCzBFvpDJu4UN7vmDHQ8KD
GU7iAwAuMbfLkdO2qzXOLii7cu00JvhZr0/5GPh7vxNQq/6xfJSs2LKJMsSMLEzo
zqTt3Sp+80fMvgpe7reb4L3OK8LmaUda+QFPpV1gI/HMsLtvTnS6NYuscVeWsRNd
r6dRNzVo0a3xgYCLpPnEprIDU8dz86DRBFrTWvCICv6spAhD629DqkhPzG1kqKeH
+XJxVDH2vicfJln4V0dTmbDqVFUt4NXIxxTgmnIuZm8c5nahNEhS8pdOr1YrnCBk
TH4AR+r6MZtH8iMiV4xU//wdlryw+8oFgj/6ODGXN+oOP8FJJQPr2xsZ8kDy61td
zNtUbVsQTMfv9pD1Gw+M
=2x89
-----END PGP SIGNATURE-----

--NQTVMVnDVuULnIzU--
