From: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: tegra: Disable cpuidle driver if PSCI is
 present
Date: Tue, 6 Oct 2015 09:36:22 +0100
Message-ID: <56138806.2010502@siemens.com>
References: <cover.1442990383.git.jan.kiszka@siemens.com>
 <5151ffebe8611545c55f8cc499cf2368b1b789c4.1442990383.git.jan.kiszka@siemens.com>
 <20151006082106.GB21527@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151006082106.GB21527-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 2015-10-06 09:21, Thierry Reding wrote:
> On Wed, Sep 23, 2015 at 08:39:44AM +0200, Jan Kiszka wrote:
>> The firmware takes over the ownership of the flow controller when
>> it provides PSCI support. To avoid clashes, disable the Tegra
>> cpuidle driver if PSCI was detected.
>> 
>> Signed-off-by: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org> --- 
>> arch/arm/mach-tegra/Kconfig | 1 + arch/arm/mach-tegra/tegra.c | 4
>> +++- 2 files changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm/mach-tegra/Kconfig
>> b/arch/arm/mach-tegra/Kconfig index 0fa4c5f..373768c 100644 ---
>> a/arch/arm/mach-tegra/Kconfig +++ b/arch/arm/mach-tegra/Kconfig 
>> @@ -4,6 +4,7 @@ menuconfig ARCH_TEGRA select
>> ARCH_SUPPORTS_TRUSTED_FOUNDATIONS select ARM_AMBA select ARM_GIC 
>> +	select ARM_PSCI select CLKSRC_MMIO select HAVE_ARM_SCU if SMP 
>> select HAVE_ARM_TWD if SMP diff --git
>> a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c index
>> 2378fa56..d97c961 100644 --- a/arch/arm/mach-tegra/tegra.c +++
>> b/arch/arm/mach-tegra/tegra.c @@ -44,6 +44,7 @@ #include
>> <asm/mach-types.h> #include <asm/setup.h> #include
>> <asm/trusted_foundations.h> +#include <asm/psci.h>
>> 
>> #include "board.h" #include "common.h" @@ -136,7 +137,8 @@ static
>> void __init tegra_dt_init_late(void) int i;
>> 
>> tegra_init_suspend(); -	tegra_cpuidle_init(); +	if
>> (!psci_smp_available()) +		tegra_cpuidle_init();
>> 
>> for (i = 0; i < ARRAY_SIZE(board_init_funcs); i++) { if
>> (of_machine_is_compatible(board_init_funcs[i].machine)) {
> 
> The equivalent of this part is already in cpuidle-tegra114.c and
> I'm not sure this adds anything. cpuidle-tegra114.c is the same
> code that is used on Tegra124. Anything before Tegra114 is now
> unlikely to gain PSCI support. Given that they're Cortex-A9 and
> lack virtualization extensions I don't think it's even possible to
> support PSCI on them. Anything after Tegra124 will very likely be
> 64-bit and hence require firmware support (such as PSCI) for CPU
> idle anyway.

Oh, missed that change.

> 
> That still leaves the select ARM_PSCI which we don't have in
> mainline yet. I'm also not sure if select ARM_PSCI is the right
> approach here. It means that everyone will be forced to have PSCI
> support in the kernel. But what if for some reason you want to
> disable PSCI (and instead use the kernel's cpuidle support)? Maybe
> it'd be better to add this to the tegra_defconfig instead.

Would be fine with me as well.

Jan

- -- 
Siemens AG, Corporate Technology, CT RTC ITP SES-DE
Corporate Competence Center Embedded Linux
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYTiAYACgkQitSsb3rl5xSJnQCg7IRy0ju/r0Ka70WCWYRZPGDR
Z1MAnRTWStY3BOI4yK8mL7CLYAbumUCD
=uAvw
-----END PGP SIGNATURE-----
