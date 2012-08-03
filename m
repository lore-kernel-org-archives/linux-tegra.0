From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: tegra: paz00: add regulators
Date: Sat, 4 Aug 2012 00:02:36 +0530
Message-ID: <501C1944.4030505@nvidia.com>
References: <1343932593-999-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343932593-999-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 03 August 2012 12:06 AM, Stephen Warren wrote:
> From: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The Toshiba AC100/PAZ00 uses a TPS6586x regulator. Instantiate this.
>
> Three data sources were used for the data encoded here:
> * The HW defaults, as extracted from real HW.
> * The schematic, which specifies a voltage for each rail in the signal
>    names.
> * The AC100 kernel used by the Ubuntu port:
>
>    repo git://gitorious.org/~marvin24/ac100/marvin24s-kernel.git
>    branch chromeos-ac100-3.0
>    file arch/arm/mach-tegra/board-paz00-power.c
>
>    For many rails, the constraints in that tree specified differing min
>    and max voltages. In all cases, the min value was ignored, since
>    there's no need currently to vary any of the voltages at run-time.
>    DVFS might change this in the future.
>
> In most cases these sources all matched. Differences are:
>
> sm0: HW defaults and schematic match at 1.2v. marvin24's kernel had a max
> of 1.3v, but this higher voltage was only applied to HW by DVFS code,
> which isn't currently supported in mainline.
>
> sm1: HW defaults and schematic match at 1.0v. marvin24's kernel had a max
> of 1.125v, but this higher voltage was only applied to HW by DVFS code,
> which isn't currently supported in mainline.
>
> ldo3: The HW default is on. marvin24's kernel didn't specify always-on,
> but since the board wasn't marked as having fully constrained regulators,
> the rail was not turned off, so the difference had no effect. The rail
> is needed for USB.
>
> ldo6: The HW default is 2.85v. The schematics indicate 2.85v. However,
> since this regulator is used for the same purpose as on other boards that
> require 1.8v, this is set to 1.8v. Note that this regulator feeds the CRT
> VDAC on Tegra, and so in practice is unlikely to be used, even though it
> is actaully hooked up in HW.
>
> Portions based on work by Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Signed-off-by: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Marc Dietrich<marvin24-Mmb7MZpHnFY@public.gmane.org>  # v2
> ---

Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>



>
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells =<1>;
> +		#size-cells =<0>;
> +

Is "simple-bus" accepted?
Accordingly I need to update for the Cardhu  also to have regulator 
support which I am going to send.
