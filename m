From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] soc/tegra: pmc: Drop SMP dependency from CPU APIs
Date: Thu, 13 Dec 2018 09:46:14 +0000
Message-ID: <1544694374-21231-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When CONFIG_SMP is disabled, the tegra clk driver now fails to build:

drivers/clk/tegra/clk-tegra30.c: In function =E2=80=98tegra30_cpu_rail_off_=
ready=E2=80=99:
drivers/clk/tegra/clk-tegra30.c:1151:2: error: implicit declaration of func=
tion =E2=80=98tegra_pmc_cpu_is_powered=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]
  cpu_pwr_status =3D tegra_pmc_cpu_is_powered(1) ||
    ^
Fix the above error by removing the CONFIG_SMP ifdef around the
declaration around the PMC CPU APIs because although these are not
needed for non-SMP configurations, there is no harm in including these
for non-SMP builds either.

Fixes: 61866523ed6e ("clk: tegra30: Use Tegra CPU powergate helper function=
")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 2 --
 include/soc/tegra/pmc.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 8c46b0aace0b..7ea3280279ff 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -689,7 +689,6 @@ int tegra_powergate_sequence_power_up(unsigned int id, =
struct clk *clk,
 }
 EXPORT_SYMBOL(tegra_powergate_sequence_power_up);
=20
-#ifdef CONFIG_SMP
 /**
  * tegra_get_cpu_powergate_id() - convert from CPU ID to partition ID
  * @cpuid: CPU partition ID
@@ -749,7 +748,6 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid)
=20
 	return tegra_powergate_remove_clamping(id);
 }
-#endif /* CONFIG_SMP */
=20
 static int tegra_pmc_restart_notify(struct notifier_block *this,
 				    unsigned long action, void *data)
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index fd816f6aa9cc..a9db1b501de1 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -26,11 +26,9 @@
 struct clk;
 struct reset_control;
=20
-#ifdef CONFIG_SMP
 bool tegra_pmc_cpu_is_powered(unsigned int cpuid);
 int tegra_pmc_cpu_power_on(unsigned int cpuid);
 int tegra_pmc_cpu_remove_clamping(unsigned int cpuid);
-#endif /* CONFIG_SMP */
=20
 /*
  * powergate and I/O rail APIs
--=20
2.7.4
