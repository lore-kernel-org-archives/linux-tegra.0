From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 12/19] ASoC: tegra: Add initial parent configuration
 for audio mclk
Date: Sat, 28 Dec 2019 17:28:24 +0300
Message-ID: <0eaf3942-047b-2412-7843-315842dcf5d1@gmail.com>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
 <1576880825-15010-13-git-send-email-skomatineni@nvidia.com>
 <a6567ff1-7bc2-3ca5-1200-92a63eb44ddb@gmail.com>
 <1b79ab92-c163-3857-dd38-df35c509b823@gmail.com>
 <4fd01e04-8240-8562-467d-324f7adbdbdf@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4fd01e04-8240-8562-467d-324f7adbdbdf@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

28.12.2019 00:25, Sowjanya Komatineni пишет:
> 
> On 12/22/19 1:18 PM, Dmitry Osipenko wrote:
>> 23.12.2019 00:14, Dmitry Osipenko пишет:
>>> 21.12.2019 01:26, Sowjanya Komatineni пишет:
>>>> Tegra PMC clock clk_out_1 is dedicated for audio mclk from Tegra30
>>>> through Tegra210 and currently Tegra clock driver does initial parent
>>>> configuration for audio mclk "clk_out_1" and enables them by default.
>>>>
>>>> With the move of Tera PMC clocks from clock driver to Tegra PMC
>>>> driver, initial parent configuration for audio clocks are through
>>>> the device tree using assigned-clock-parents property.
>>>>
>>>> Default clock parents can be specified in device tree using
>>>> assigned-clocks and assigned-clock-parents and there is no need
>>>> to have clock driver do parent configuration and enable audio related
>>>> clocks.
>>>>
>>>> This patch has implementation for initial parent configuration in
>>>> audio driver when default parent configuration is not specified in the
>>>> device tree using assigned-clock properties and enables audio clocks
>>>> during the clock rate change.
>>>>
>>>> This patch configures PLLA_OUT0 as parent to extern1 and extern1
>>>> as parent to clk_out_1 and uses clk_out_1 as cdev1 clock to allow
>>>> mclk control from this driver.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>   sound/soc/tegra/tegra_asoc_utils.c | 71
>>>> ++++++++++++++++++++++----------------
>>>>   1 file changed, 41 insertions(+), 30 deletions(-)
>>>>
>>>> diff --git a/sound/soc/tegra/tegra_asoc_utils.c
>>>> b/sound/soc/tegra/tegra_asoc_utils.c
>>>> index 38535962029c..fc3135c08f43 100644
>>>> --- a/sound/soc/tegra/tegra_asoc_utils.c
>>>> +++ b/sound/soc/tegra/tegra_asoc_utils.c
>>>> @@ -7,6 +7,7 @@
>>>>    */
>>>>     #include <linux/clk.h>
>>>> +#include <linux/clk-provider.h>
>>> This is illegal, it is not a clock provider.
>>>
> __clk_is_enabled API is used in this patch to disable clock only when
> its enabled.

As I wrote in the other reply, this is a wrong solution since it works
around the problem and doesn't solve the root of the problem. Please fix
it properly in the next version.

> __clk_is_enabled API is from clk-provider.h

That's exactly the reason why it is in clk-provider.h, you absolutely
cannot use __clk_is_enabled() outside of clk providers because:

1. __clk_is_enabled doesn't use any lockings, so you need to be very
careful when using it

2. every function that is prefixed with __ is usually meant for internal
use only

3. tegra_asoc_utils is simply not a clk provider, such cases when you
need to do hacks in order to achieve something are a good indication
about that you're likely doing something wrong
