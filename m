From: Colin Cross <ccross@android.com>
Subject: Re: [PATCH v6 03/10] arm/tegra: prepare clock code for multiple tegra variants
Date: Fri, 9 Dec 2011 10:32:25 -0800
Message-ID: <CAMbhsRSBtkOybN+SDgQyjHZffUT=YxeQ1YnSd52WPS0BL+q=HA@mail.gmail.com>
References: <1323348254-29072-1-git-send-email-pdeschrijver@nvidia.com>
	<1323348254-29072-4-git-send-email-pdeschrijver@nvidia.com>
	<CAMbhsRT97Oq-=8f9++f6Jgg=YVaimKSz68xcDDNbDbvL+V5fJg@mail.gmail.com>
	<20111209091319.GI27578@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111209091319.GI27578@tbergstrom-lnx.Nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Randy Dunlap <rdunlap@xenotime.net>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Gary King <gking@nvidia.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 9, 2011 at 1:13 AM, Peter De Schrijver
<pdeschrijver@nvidia.com> wrote:
> On Thu, Dec 08, 2011 at 07:25:53PM +0100, Colin Cross wrote:
>> On Thu, Dec 8, 2011 at 4:43 AM, Peter De Schrijver <pdeschrijver@nvi=
dia.com<mailto:pdeschrijver@nvidia.com>> wrote:
>> Rework the tegra20 clock code to support multiple tegra variants :
>>
>> =A0* remove tegra2_periph_reset_assert/tegra2_periph_reset_deassert.=
 This
>> =A0 functionality should be in clock.c.
>> =A0* compile tegra_sdmmc_tap_delay only on tegra20 as this feature w=
ill not
>> =A0 be available in future variants.
>> =A0* don't export clk_measure_input_freq as its functionality is als=
o available
>> =A0 using clk_get_rate().
>>
>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com<mailto:pd=
eschrijver@nvidia.com>>
>> ---
>> =A0arch/arm/mach-tegra/clock.c =A0 =A0 =A0 =A0 | =A0 12 +++++++-----
>> =A0arch/arm/mach-tegra/clock.h =A0 =A0 =A0 =A0 | =A0 =A08 ++++----
>> =A0arch/arm/mach-tegra/tegra2_clocks.c | =A0 14 +-------------
>> =A0arch/arm/mach-tegra/timer.c =A0 =A0 =A0 =A0 | =A0 12 ++++++++----
>> =A04 files changed, 20 insertions(+), 26 deletions(-)
>>
>> diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock=
=2Ec
>> index f8d41ff..f27bdcc 100644
>> --- a/arch/arm/mach-tegra/clock.c
>> +++ b/arch/arm/mach-tegra/clock.c
>> @@ -387,13 +387,15 @@ EXPORT_SYMBOL(tegra_clk_init_from_table);
>>
>> =A0void tegra_periph_reset_deassert(struct clk *c)
>> =A0{
>> - =A0 =A0 =A0 tegra2_periph_reset_deassert(c);
>> + =A0 =A0 =A0 BUG_ON(!c->ops->reset);
>> + =A0 =A0 =A0 c->ops->reset(c, false);
>> =A0}
>> =A0EXPORT_SYMBOL(tegra_periph_reset_deassert);
>>
>> =A0void tegra_periph_reset_assert(struct clk *c)
>> =A0{
>> - =A0 =A0 =A0 tegra2_periph_reset_assert(c);
>> + =A0 =A0 =A0 BUG_ON(!c->ops->reset);
>> + =A0 =A0 =A0 c->ops->reset(c, true);
>> =A0}
>> =A0EXPORT_SYMBOL(tegra_periph_reset_assert);
>>
>> @@ -403,9 +405,9 @@ void __init tegra_init_clock(void)
>> =A0}
>>
>> =A0/*
>> - * The SDMMC controllers have extra bits in the clock source regist=
er that
>> - * adjust the delay between the clock and data to compenstate for d=
elays
>> - * on the PCB.
>> + * The SDMMC controllers on tegra20 have extra bits in the clock so=
urce
>> + * register that adjust the delay between the clock and data to com=
penstate
>> + * for delays on the PCB.
>> =A0*/
>> =A0void tegra_sdmmc_tap_delay(struct clk *c, int delay)
>> =A0{
>>
>> I created this wrapper around tegra2_sdmmc_tap_delay because I guess=
ed the same requirement would be present in tegra3. =A0If you don't exp=
ect this to be required on anything but tegra2, you could drop the wrap=
per and just have callers use tegra2_sdmmc_tap_delay.
>>
>
> I will ask around if this is needed for tegra30.
>
>> diff --git a/arch/arm/mach-tegra/clock.h b/arch/arm/mach-tegra/clock=
=2Eh
>> index 688316a..135bb5f 100644
>> --- a/arch/arm/mach-tegra/clock.h
>> +++ b/arch/arm/mach-tegra/clock.h
>> @@ -146,15 +146,15 @@ struct tegra_clk_init_table {
>> =A0};
>>
>> =A0void tegra2_init_clocks(void);
>> -void tegra2_periph_reset_deassert(struct clk *c);
>> -void tegra2_periph_reset_assert(struct clk *c);
>> =A0void clk_init(struct clk *clk);
>> =A0struct clk *tegra_get_clock_by_name(const char *name);
>> -unsigned long clk_measure_input_freq(void);
>> =A0int clk_reparent(struct clk *c, struct clk *parent);
>> =A0void tegra_clk_init_from_table(struct tegra_clk_init_table *table=
);
>> =A0unsigned long clk_get_rate_locked(struct clk *c);
>> =A0int clk_set_rate_locked(struct clk *c, unsigned long rate);
>> +#ifdef CONFIG_ARCH_TEGRA_2x_SOC
>> =A0void tegra2_sdmmc_tap_delay(struct clk *c, int delay);
>> -
>> +#else
>> +#define tegra2_sdmmc_tap_delay(c, d) do {} while(0);
>>
>> It's more standard to use an empty static inline function here.
>>
>
> clock.h is included in several board files. So making this a static i=
nline
> function results in a number of 'static function declared but not use=
d'
> warnings.

That's true for "static", but not for "static inline".  Look at a
commonly used header like include/kernel.h, it's full of static
inlines that are not used by most of the includers.
