From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: cardhu: add dt entry for PMIC TPS65911.
Date: Thu, 05 Jul 2012 13:16:19 -0600
Message-ID: <4FF5E803.7000304@wwwdotorg.org>
References: <1341414479-6446-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1341414479-6446-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/04/2012 09:07 AM, Laxman Dewangan wrote:
> Tegra30 based platform "cardhu" have the power management
> IC TPS65911 for the regulator.
> Adding DT entry for this device.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I recall there were some differences between Cardhu A02 and A04. Does
this patch apply equally to both?

Please have a look at the recent threads re: various Tegra20 boards'
regulator .dts files, and see the results at:

git://nv-tegra.nvidia.com/user/swarren/linux-2.6 linux-next_common

Most of these comments are driven by comments made in the review of
those patches.

In the patch description, can you please specify where you got all the
values from, and any discrepancies.

> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dts b/arch/arm/boot/dts/tegra30-cardhu.dts

> +				vdd1_reg: regulator@0 {
> +					reg = <0>;
> +					regulator-compatible = "vdd1";
> +					regulator-name = "vdd_1v2_gen";

It'd be good to list all the signals that these regulators drive
directly; the schematics "rename" the signals quite a lot.

> +					regulator-min-microvolt = < 600000>;
> +					regulator-max-microvolt = <1500000>;

Similarly, the contraints should list the exact voltage that's required
of the regulators, not a range. Right now, there is no DVFS in the
mainline kernel, so even for rails where DVFS could be used in the
future, we should specify the single voltage we want these rails to run
at without DVFS for now.

> +					regulator-always-on;
> +					regulator-boot-on;

These properties aren't in the same order in all the nodes. It'd be nice
to have them ordered the same way everywhere.

I'm not sure if it really makes sense to specify regulator-boot-on,
since there's no way to know what SW has run before the kernel which
might have turned off the regulator; regulator-always-on seems to cover
all necessary use-cases.
