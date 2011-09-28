From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v4 3/3] arm/tegra: device tree support for ventana board
Date: Wed, 28 Sep 2011 11:33:21 -0700
Message-ID: <CAOesGMgv5wqZPMZPS4UKO4owgxBRLP9T6NPSFAVVcLd3vPYkiQ@mail.gmail.com>
References: <1317171902-14736-1-git-send-email-pdeschrijver@nvidia.com>
	<1317171902-14736-4-git-send-email-pdeschrijver@nvidia.com>
	<201109281516.42513.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201109281516.42513.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Sep 28, 2011 at 6:16 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 28 September 2011, Peter De Schrijver wrote:
>> --- a/arch/arm/mach-tegra/board-dt.c
>> +++ b/arch/arm/mach-tegra/board-dt.c
>> @@ -47,7 +47,7 @@
>>
>> =A0void harmony_pinmux_init(void);
>> =A0void seaboard_pinmux_init(void);
>> -
>> +void ventana_pinmux_init(void);
>>
>> =A0struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata =3D {
>> =A0 =A0 =A0 =A0 OF_DEV_AUXDATA("nvidia,tegra20-sdhci", TEGRA_SDMMC1_=
BASE, "sdhci-tegra.0", NULL),
>> @@ -95,6 +95,8 @@ static void __init tegra_dt_init(void)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 harmony_pinmux_init();
>> =A0 =A0 =A0 =A0 else if (of_machine_is_compatible("nvidia,seaboard")=
)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 seaboard_pinmux_init();
>> + =A0 =A0 =A0 else if (of_machine_is_compatible("nvidia,ventana"))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ventana_pinmux_init();
>
> Are you (Peter, Colin, Olof) confident that this is not getting out
> of hand before it's getting better?
>
> If we are keeping the per-board pinmux configuration in the kernel
> for longer, I think it would be better to do this table-driven than
> having a list of top-level of_machine_is_compatible() statements
> and do something like:
>
> static struct {
> =A0 =A0 =A0 =A0const char *machine;
> =A0 =A0 =A0 =A0struct tegra_pingroup_config *config[];
> } pinmux_configs[] __initdata =3D {
> =A0 =A0 =A0 =A0{ "nvidia,ventana", &ventana_pinmux },
> =A0 =A0 =A0 =A0{ "nvidia,seaboard, &seaboard_pinmux },
> };

That is definitely a nicer solution. I didn't see a strong need to
switch to that model now since it should hopefully be a temporary
thing, but given Stephen's mention of Cardhu, I think it does make
sense.

Peter, care to respin this patch with the above solution instead?
Also, please print a warning if no match is found.


Thanks,

-Olof
