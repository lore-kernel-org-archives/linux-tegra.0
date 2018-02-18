From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 2/3] soc: rockchip: power-domain: Use
 of_clk_get_parent_count() instead of open coding
Date: Sun, 18 Feb 2018 11:09:25 -0800
Message-ID: <CAEG3pNCioW_FVXj3-j4KC_yO6ZYGXQB_eanHWSb9NUE9kYsWag@mail.gmail.com>
References: <1516375101-29836-1-git-send-email-geert+renesas@glider.be>
 <1516375101-29836-3-git-send-email-geert+renesas@glider.be>
 <11171053.oOJPuGlHoK@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <11171053.oOJPuGlHoK@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk <linux-clk@vger.kernel.org>, "Stephen Boyd <sboyd@codeaurora.org>,
 Emilio Lopez <emilio@elopez.com.ar>, Hans de Goede <hdegoede@redhat.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Heiko, Geert,

On Sat, Feb 10, 2018 at 8:35 AM, Heiko Stuebner <heiko@sntech.de> wrote:
> Hi Geert,
>
> Am Freitag, 19. Januar 2018, 16:18:20 CET schrieb Geert Uytterhoeven:
>> As of_clk_get_parent_count() returns zero on failure, while
>> of_count_phandle_with_args() might return a negative error code, this
>> also fixes the issue of possibly using a negative number in the
>> allocation below.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  drivers/soc/rockchip/pm_domains.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/rockchip/pm_domains.c b/drivers/soc/rockchip/pm_domains.c
>> index 5c342167b9db7a16..9936038d38771784 100644
>> --- a/drivers/soc/rockchip/pm_domains.c
>> +++ b/drivers/soc/rockchip/pm_domains.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/of_address.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>
> not wanting to be to nitpicky, but clk-provider.h seems that it should be
> used from drivers exposing clocks to the system, not from clock users.
>
> I just remember that in the past clk maintainers tried to keep their
> layering intact, so I've included them for clarification.
>
> Mike, Stephen: the power-domain driver of Rockchip socs needs
> to toggle all clocks of domain peripherals when turning a domain
> on or off, so has a variable list of clocks in the clocks property in dt.
> Hence the of_count_... call which could be replaced with
> of_clk_get_parent_count to not open-code this.

Moving of_clk_get_parent_count to clk.h seems reasonable to me. It's
more of an of-specific helper than a provider-specific helper.

Anyone up to submit a patch so that this one doesn't need to include
clk-provider.h?

Regards,
Mike

>
>
> Heiko
>
>>  #include <linux/regmap.h>
>>  #include <linux/mfd/syscon.h>
>>  #include <dt-bindings/power/rk3288-power.h>
>> @@ -391,7 +392,7 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
>>               return -EINVAL;
>>       }
>>
>> -     clk_cnt = of_count_phandle_with_args(node, "clocks", "#clock-cells");
>> +     clk_cnt = of_clk_get_parent_count(node);
>>       pd = devm_kzalloc(pmu->dev,
>>                         sizeof(*pd) + clk_cnt * sizeof(pd->clks[0]),
>>                         GFP_KERNEL);
>>
>
>



-- 
Michael Turquette
CEO
BayLibre - At the Heart of Embedded Linux
http://baylibre.com/
