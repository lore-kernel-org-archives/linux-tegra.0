From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: roth: Add MMC pwrseq to power wifi on
Date: Wed, 8 Jul 2015 16:18:48 +0900
Message-ID: <CAAVeFuJ8sQN6t3tPQNyHizd4LGz=0=R3xdrdQstq5PtwYYnwSg@mail.gmail.com>
References: <1433749292-13890-1-git-send-email-acourbot@nvidia.com> <CABxcv=kBcr7g77jj98KQ19R_oaoTrVGjqDgQa6ghZz7CJ+t3uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABxcv=kBcr7g77jj98KQ19R_oaoTrVGjqDgQa6ghZz7CJ+t3uw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Ping Thierry, is this patch good to be merged?

On Mon, Jun 8, 2015 at 5:12 PM, Javier Martinez Canillas
<javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org> wrote:
> Hello Alexandre,
>
> On Mon, Jun 8, 2015 at 9:41 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> The wifi chip on roth needs to have its reset deasserted in order to be
>> probed. Add a mmc-pwrseq-simple to allow this to happen and get wifi
>> working at boot time.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/tegra114-roth.dts | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
>> index ea1772a686c2..04762532a178 100644
>> --- a/arch/arm/boot/dts/tegra114-roth.dts
>> +++ b/arch/arm/boot/dts/tegra114-roth.dts
>> @@ -972,6 +972,11 @@
>>                 nvidia,invert-interrupt;
>>         };
>>
>> +       sdhci0_pwrseq: sdhci0_pwrseq {
>> +               compatible = "mmc-pwrseq-simple";
>> +               reset-gpios = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_LOW>;
>> +       };
>> +
>>         /* Wifi */
>>         sdhci@78000000 {
>>                 status = "okay";
>> @@ -979,6 +984,7 @@
>>                 broken-cd;
>>                 keep-power-in-suspend;
>>                 cap-sdio-irq;
>> +               mmc-pwrseq = <&sdhci0_pwrseq>;
>>         };
>>
>>         /* SD card */
>
> I'm neither familiar with this board nor have a schematic but the
> patch looks good to me.
>
> Reviewed-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
>
> Best regards,
> Javier
