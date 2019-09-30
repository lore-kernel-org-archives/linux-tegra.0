From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 00/14] Consolidate and improve NVIDIA Tegra CPUIDLE
 driver(s)
Date: Mon, 30 Sep 2019 10:26:45 +0200
Message-ID: <20190930082645.GF1518582@ulmo>
References: <20190929175952.22690-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7cm2iqirTL37Ot+N"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190929175952.22690-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--7cm2iqirTL37Ot+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2019 at 08:59:38PM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> This series does the following:
>=20
>   1. Unifies Tegra20/30/114 drivers into a single driver and moves it out
>      into common drivers/cpuidle/ directory.
>=20
>   2. Enables CPU cluster power-down idling state on Tegra30.
>=20
> In the end there is a quite nice clean up of the Tegra CPUIDLE drivers
> and of the Tegra's arch code in general. Please review, thanks!

I generally like this series and it looks really good from a diffstat
point of view. However, removing existing drivers completely and then
incrementally add a new one make this impossible to review.

If you think about it, it also makes it really difficult to find what
went wrong if at any point in the future we find a regression caused by
the new driver. A bisection will always point at the commit that removes
the old driver because between that and the point where you add the new
driver, CPU idle just doesn't work at all anymore.

While I understand that it's very convenient to just throw away old code
and rewrite it from scratch, it's also impractical (and a little rude).
It's not how we do things in the kernel. Unless maybe under specific
circumstances.

Can you please try and make this a little more iterative? At the very
least I'd expect a series where you do all the preliminary work in
preparatory patches and then replace the old driver by the new driver in
a single patch. That way at least there will be an unambiguous commit in
a bisection.

Ideally, you'd also break up that last conversion patch into smaller
incremental patches to make it easier for people to review. Remember
that your chances to attract reviewers increases if you make the patches
easy to review, which means your patches should be small, logical
changes that (ideally) are obviously correct.

Thierry

> Changelog:
>=20
> v5: - Rebased on a recent linux-next, fixed one minor conflict in Kconfig.
>=20
>     - Improved commit's message of the "Support CPU cluster power-down st=
ate
>       on Tegra30" patch.
>=20
>     - The "Support CPU cluster power-down state on Tegra30" patch is also
>       got split and now there is additional "Make outer_disable() open-co=
ded"
>       patch.
>=20
>     - Made minor cosmetic changes to the "Introduce unified driver for
>       NVIDIA Tegra SoCs" patch by improving error message and renaming
>       one variable.
>=20
> v4: - Fixed compilation with !CONFIG_CACHE_L2X0 (and tested that it still
>       works).
>=20
>     - Replaced ktime_compare() with ktime_before() in the new driver,
>       for consistency.
>=20
> v3: - Addressed review comments that were made by Jon Hunter to v2 by
>       splitting patches into smaller (and simpler) chunks, better
>       documenting changes in the commit messages and using proper error
>       codes in the code.
>=20
>       Warnings are replaced with a useful error messages in the code of
>       "Introduce unified driver for NVIDIA Tegra SoCs" patch.
>=20
>       Secondary CPUs parking timeout increased to 100ms because I found
>       that it actually may happen to take more than 1ms if CPU is running
>       on a *very* low frequency.
>=20
>       Added diagnostic messages that are reporting Flow Controller state
>       when CPU parking fails.
>=20
>       Further polished cpuidle driver's code.
>=20
>       The coupled state entering is now aborted if there is a pending SGI
>       (Software Generated Interrupt) because it will be lost after GIC's
>       power-cycling. Like it was done by the old Tegra20 CPUIDLE driver.
>=20
> v2: - Added patches to enable the new cpuidle driver in the defconfigs:
>=20
>         ARM: multi_v7_defconfig: Enable Tegra cpuidle driver
>         ARM: tegra: Enable Tegra cpuidle driver in tegra_defconfig
>=20
>     - Dropped patches that removed CPUIDLE_FLAG_TIMER_STOP from the idling
>       states because that flag actually doesn't have any negative effects,
>       but still is correct for the case of a local CPU timer on older Teg=
ra
>       SoCs:
>=20
>         cpuidle: tegra: Remove CPUIDLE_FLAG_TIMER_STOP from Tegra114/124 =
idle-state
>         cpuidle: tegra: Remove CPUIDLE_FLAG_TIMER_STOP from all states
>=20
>     - The "Add unified driver for NVIDIA Tegra SoCs" patch got more polis=
h.
>       Tegra30 and Terga114 states are now squashed into a single common C7
>       state (following Parker TRM terminology, see 17.2.2.2 Power Managem=
ent
>       States), more comments added, etc minor changes.
>=20
> Dmitry Osipenko (14):
>   ARM: tegra: Remove cpuidle drivers to replace them with a new driver
>   ARM: tegra: Change tegra_set_cpu_in_lp2() type to void
>   ARM: tegra: Propagate error from tegra_idle_lp2_last()
>   ARM: tegra: Compile sleep-tegra20/30.S unconditionally
>   ARM: tegra: Expose PM functions required for new cpuidle driver
>   ARM: tegra: Rename some of the newly exposed PM functions
>   ARM: tegra: Add tegra_pm_park_secondary_cpu()
>   ARM: tegra: Make outer_disable() open-coded
>   clk: tegra: Add missing stubs for the case of !CONFIG_PM_SLEEP
>   cpuidle: Introduce unified driver for NVIDIA Tegra SoCs
>   cpuidle: tegra: Support CPU cluster power-down state on Tegra30
>   ARM: tegra: Create simple platform device for cpuidle driver
>   ARM: multi_v7_defconfig: Enable Tegra cpuidle driver
>   ARM: tegra: Enable Tegra cpuidle driver in tegra_defconfig
>=20
>  arch/arm/configs/multi_v7_defconfig           |   1 +
>  arch/arm/configs/tegra_defconfig              |   1 +
>  arch/arm/mach-tegra/Makefile                  |  23 +-
>  arch/arm/mach-tegra/cpuidle-tegra114.c        |  89 -----
>  arch/arm/mach-tegra/cpuidle-tegra20.c         | 212 -----------
>  arch/arm/mach-tegra/cpuidle-tegra30.c         | 132 -------
>  arch/arm/mach-tegra/cpuidle.c                 |  50 ---
>  arch/arm/mach-tegra/cpuidle.h                 |  21 --
>  arch/arm/mach-tegra/irq.c                     |   3 +-
>  arch/arm/mach-tegra/pm.c                      |  50 +--
>  arch/arm/mach-tegra/pm.h                      |   4 -
>  arch/arm/mach-tegra/reset-handler.S           |  11 -
>  arch/arm/mach-tegra/reset.h                   |   9 +-
>  arch/arm/mach-tegra/sleep-tegra20.S           | 170 ---------
>  arch/arm/mach-tegra/sleep-tegra30.S           |   6 +-
>  arch/arm/mach-tegra/sleep.h                   |  15 -
>  arch/arm/mach-tegra/tegra.c                   |   7 +-
>  drivers/cpuidle/Kconfig.arm                   |   8 +
>  drivers/cpuidle/Makefile                      |   1 +
>  drivers/cpuidle/cpuidle-tegra.c               | 349 ++++++++++++++++++
>  drivers/soc/tegra/Kconfig                     |   1 -
>  include/linux/clk/tegra.h                     |  13 +
>  include/soc/tegra/cpuidle.h                   |   2 +-
>  .../mach-tegra =3D> include/soc/tegra}/irq.h    |   8 +-
>  include/soc/tegra/pm.h                        |  31 ++
>  25 files changed, 453 insertions(+), 764 deletions(-)
>  delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra114.c
>  delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra20.c
>  delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra30.c
>  delete mode 100644 arch/arm/mach-tegra/cpuidle.c
>  delete mode 100644 arch/arm/mach-tegra/cpuidle.h
>  create mode 100644 drivers/cpuidle/cpuidle-tegra.c
>  rename {arch/arm/mach-tegra =3D> include/soc/tegra}/irq.h (59%)
>=20
> --=20
> 2.23.0
>=20

--7cm2iqirTL37Ot+N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2RvEMACgkQ3SOs138+
s6GpyA//Vx/ifjVN7GCkREIya9nFFTeAoC27H5LQZ5kvow0zD8roK0/nYlegdL0j
UsJ36dF2Kk/83wGicrFCVX5mDZHreIOT8W9sVt+VlsCYZ93z8afx+B6MPAx1Gnft
3HUcJrRkUX1wL5n0m+mN+Nzn79gNmhFLdlpXGy9esCcZrR2Rm2Ouf80ZKiSrumcM
txfhSEcK0uCIXU14Gc8ykSpfUpfUaN9A+5XnRx37Tl43AHJaugt5TQ92+ryWk7xE
5MhNJ5Vo7lB8uLn1X6afSpBQmTAV7W2Pou9bKr4yWjDrPUgjt7AP9NLPRmlsUjLV
P9sTfduBmvhpW5eETznIsdjbQL+ADr3zk1w442Yxt1mXlNRw+iN2b1slb4uv2Qie
eG5riVlyCFm63Or0EdMUo3jRrkfKPGViaaVAFGlgSgIszHc/sgC6AuiKnQqYsEkG
jyxGlhuFp3ah/POur8r/VefU1vsI8sCVXdRPhyPAPn5En++RpQ3nTdn2R9a1g7xq
voBpqkNThganApBrbpCp9O1ylqv46s3QH3LIfZaBdUnjIBMILVKs3udg9LIKDXkJ
jDhts6RKEB6isXmpCA7dCEp24+2ijc5gB4kwJ6YVTObFUymX1c7TX2KlPSLdh4Ao
KOEiHc4Zns7K085HqIgu7N3XQeUtUtvIgb/6xRTt+bFpo8eq3as=
=UqLp
-----END PGP SIGNATURE-----

--7cm2iqirTL37Ot+N--
