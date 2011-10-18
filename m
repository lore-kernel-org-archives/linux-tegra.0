From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] [3.3] ARM: tegra: use APB DMA for accessing APB devices
Date: Tue, 18 Oct 2011 12:12:26 -0700
Message-ID: <CAOesGMh8mFTkOgHwT-1HTA+XMdo36husYzwWOymL1CBz-mGiiA@mail.gmail.com>
References: <1318961898-21254-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CC0C@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173CA2CC0C-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 18, 2011 at 11:45 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> Olof Johansson wrote at Tuesday, October 18, 2011 12:18 PM:
>> From: Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Tegra2 hangs if APB registers are accessed from the cpu during an
>> apb dma operation. The workaround is to use apb dma to read/write th=
e
>> registers instead.
> ...
>> +++ b/arch/arm/mach-tegra/apbio.c
> ...
>> +#ifdef CONFIG_TEGRA_SYSTEM_DMA
> ...
>> +static inline u32 apb_readl(unsigned long offset)
> ...
>> +static inline void apb_writel(u32 value, unsigned long offset)
> ...
>> +#else
>> +static inline u32 apb_readl(unsigned long offset)
> ...
>> +static inline void apb_writel(u32 value, unsigned long offset)
> ...
>> +#endif
>> +
>> +u32 tegra_apb_readl(unsigned long offset)
>> +{
>> + =A0 =A0 return apb_readl(offset);
>> +}
>> +
>> +void tegra_apb_writel(u32 value, unsigned long offset)
>> +{
>> + =A0 =A0 apb_writel(value, offset);
>> +}
>
> Why not just make the actual implementations use the exported names, =
and
> have them not be static inline? That way, you avoid the extra functio=
n
> wrapping them.

Yeah, makes perfect sense. Fixed in next revision.

Also, I can't imagine a case where CONFIG_TEGRA_SYSTEM_DMA makes sense
to keep off. Can you? If so, I'm tempted to just kill it (in a
separate patch).

>> +void tegra_init_apb_dma(void)
>> +{
>> +#ifdef CONFIG_TEGRA_SYSTEM_DMA
>> + =A0 =A0 tegra_apb_dma =3D tegra_dma_allocate_channel(TEGRA_DMA_MOD=
E_ONESHOT |
>> + =A0 =A0 =A0 =A0 =A0 =A0 TEGRA_DMA_SHARED);
>> + =A0 =A0 if (!tegra_apb_dma) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_err("%s: can not allocate dma channel\n=
", __func__);
>
> It seems like that should be a lot more noisy if the result is potent=
ial
> HW hangs. Same for the other error below.

Yeah, at least a WARN() seems warranted, I'll revise that too.


-Olof
