From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 12/21] clk: tegra: pll: Add specialized logic for T210
Date: Wed, 20 May 2015 13:24:39 -0400
Message-ID: <555CC357.5090105@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>	<1431451444-23155-14-git-send-email-rklein@nvidia.com> <CANLzEkuqCB+wF65MrtWwnsgTDhw0T9Vae9C5sBALGDbPvwrr_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANLzEkuqCB+wF65MrtWwnsgTDhw0T9Vae9C5sBALGDbPvwrr_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 5/13/2015 4:59 PM, Benson Leung wrote:
> On Tue, May 12, 2015 at 10:23 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On Tegra210 SoC's, the logic to enable several of the plls is different
>> from previous generations. Therefore, add registeration functions specific
> 
> s/registeration/registration
> 
>> to Tegra210 which will handle them appropriately.
>>
>> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> v5:
>>   - Removed unused variables.
>>
>> v4:
>>   - Fixed plle_tegra210_is_enabled callback typos
>>
>> v2:
>>   - Fixed plle logic. PLLE on Tegra210 has had its enable bit moved, so
>>     we can't use the default _clk_pll_enable/disable routines. Instead,
>>     manually set/clear the correct bit for PLLE within its functions.
>>
>>  drivers/clk/tegra/clk-pll.c |  347 ++++++++++++++++++++++++++++++++++++++++++-
>>  drivers/clk/tegra/clk.h     |   24 +++
>>  2 files changed, 369 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
>> index 54ebab2b85e5..2b1f672e3bdb 100644
>> --- a/drivers/clk/tegra/clk-pll.c
>> +++ b/drivers/clk/tegra/clk-pll.c
>> @@ -65,6 +65,7 @@
>>  #define PLLE_BASE_DIVN_WIDTH 8
>>  #define PLLE_BASE_DIVM_SHIFT 0
>>  #define PLLE_BASE_DIVM_WIDTH 8
>> +#define PLLE_BASE_ENABLE BIT(31)
>>
>>  #define PLLE_MISC_SETUP_BASE_SHIFT 16
>>  #define PLLE_MISC_SETUP_BASE_MASK (0xffff << PLLE_MISC_SETUP_BASE_SHIFT)
>> @@ -910,7 +911,8 @@ const struct clk_ops tegra_clk_plle_ops = {
>>
>>  #if defined(CONFIG_ARCH_TEGRA_114_SOC) || \
>>         defined(CONFIG_ARCH_TEGRA_124_SOC) || \
>> -       defined(CONFIG_ARCH_TEGRA_132_SOC)
>> +       defined(CONFIG_ARCH_TEGRA_132_SOC) || \
>> +       defined(CONFIG_ARCH_TEGRA_210_SOC)
>>
>>  static int _pll_fixed_mdiv(struct tegra_clk_pll_params *pll_params,
>>                            unsigned long parent_rate)
>> @@ -1579,7 +1581,8 @@ struct clk *tegra_clk_register_plle(const char *name, const char *parent_name,
>>
>>  #if defined(CONFIG_ARCH_TEGRA_114_SOC) || \
>>         defined(CONFIG_ARCH_TEGRA_124_SOC) || \
>> -       defined(CONFIG_ARCH_TEGRA_132_SOC)
>> +       defined(CONFIG_ARCH_TEGRA_132_SOC) || \
>> +       defined(CONFIG_ARCH_TEGRA_210_SOC)
>>  static const struct clk_ops tegra_clk_pllxc_ops = {
>>         .is_enabled = clk_pll_is_enabled,
>>         .enable = clk_pll_enable,
> 
> 
> It looks like you might have missed changing one set of #if defined
> further down below to include CONFIG_ARCH_TEGRA_210_SOC :
> 
> #if defined(CONFIG_ARCH_TEGRA_124_SOC) || defined(CONFIG_ARCH_TEGRA_132_SOC)
...
> struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
...
> #endif
> 

No, this was intentional. tegra_clk_register_pllss isn't used on
Tegra210, it adds its own version "register_clk_register_pllss_tegra210"
which it uses and it doesn't need the tegra_clk_pllss_ops either. So it
should be fine without this.

-rhyland

-- 
nvpublic
