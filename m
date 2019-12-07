From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v8 00/19] Consolidate and improve NVIDIA Tegra CPUIDLE
 driver(s)
Date: Sat, 7 Dec 2019 20:31:28 +0100
Message-ID: <20191207193128.GB19924@qmqm.qmqm.pl>
References: <20191203004116.11771-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191203004116.11771-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 03, 2019 at 03:40:57AM +0300, Dmitry Osipenko wrote:
> Hello,
> 
> This series does the following:
> 
>   1. Unifies Tegra20/30/114 drivers into a single driver and moves it out
>      into common drivers/cpuidle/ directory.
> 
>   2. Enables CPU cluster power-down idling state on Tegra30.
> 
> In the end there is a quite nice clean up of the Tegra CPUIDLE drivers
> and of the Tegra's arch code in general. Please review, thanks!
> 
> Changelog:
> 
> v8: - Rebased on recent linux-next, now making use of
>       cpuidle_driver_state_disabled(). [...]

Dear Dmitry

This rebase was not complete, at least in patch 14 direct access to
.disabled field (now removed in Linus' master) are left. The fixups
needed are below (only compile-tested for now).

Best Regards,
Micha³ Miros³aw

diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
index 077ff15e32fb..2d325d3aab57 100644
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -306,13 +306,12 @@ static struct cpuidle_driver tegra_idle_driver = {
  */
 void tegra_cpuidle_pcie_irqs_in_use(void)
 {
-	if (tegra_idle_driver.states[TEGRA_CC6].disabled ||
+	if ((tegra_idle_driver.states[TEGRA_CC6].flags & CPUIDLE_FLAG_UNUSABLE) &&
 	    tegra_get_chip_id() != TEGRA20)
 		return;
 
 	pr_info("disabling CC6 state, since PCIe IRQs are in use\n");
 	cpuidle_driver_state_disabled(&tegra_idle_driver, TEGRA_CC6, true);
-	tegra_idle_driver.states[TEGRA_CC6].disabled = true;
 }
 
 static void tegra_cpuidle_setup_tegra114_c7_state(void)
@@ -328,7 +327,7 @@ static int tegra_cpuidle_probe(struct platform_device *pdev)
 {
 	/* LP2 could be disabled in device-tree */
 	if (tegra_pmc_get_suspend_mode() < TEGRA_SUSPEND_LP2)
-		tegra_idle_driver.states[TEGRA_CC6].disabled = true;
+		cpuidle_driver_state_disabled(&tegra_idle_driver, TEGRA_CC6, true);
 
 	/*
 	 * Required suspend-resume functionality, which is provided by the
@@ -337,9 +336,9 @@ static int tegra_cpuidle_probe(struct platform_device *pdev)
 	 */
 	if (!IS_ENABLED(CONFIG_PM_SLEEP)) {
 		if (!tegra_cpuidle_using_firmware())
-			tegra_idle_driver.states[TEGRA_C7].disabled = true;
+			cpuidle_driver_state_disabled(&tegra_idle_driver, TEGRA_C7, true);
 
-		tegra_idle_driver.states[TEGRA_CC6].disabled = true;
+		cpuidle_driver_state_disabled(&tegra_idle_driver, TEGRA_CC6, true);
 	}
 
 	/*
@@ -349,7 +348,7 @@ static int tegra_cpuidle_probe(struct platform_device *pdev)
 	switch (tegra_get_chip_id()) {
 	case TEGRA20:
 		/* Tegra20 isn't capable to power-off individual CPU cores */
-		tegra_idle_driver.states[TEGRA_C7].disabled = true;
+		cpuidle_driver_state_disabled(&tegra_idle_driver, TEGRA_C7, true);
 		break;
 	case TEGRA30:
 		break;
@@ -358,7 +357,7 @@ static int tegra_cpuidle_probe(struct platform_device *pdev)
 		tegra_cpuidle_setup_tegra114_c7_state();
 
 		/* coupled CC6 (LP2) state isn't implemented yet */
-		tegra_idle_driver.states[TEGRA_CC6].disabled = true;
+		cpuidle_driver_state_disabled(&tegra_idle_driver, TEGRA_CC6, true);
 		break;
 	default:
 		return -EINVAL;
