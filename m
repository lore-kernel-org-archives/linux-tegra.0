From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clk: tegra: Move mipi-cal initialization into clk-tegra1[12]4.c
Date: Wed, 8 Oct 2014 09:19:53 -0700
Message-ID: <CAOw6vbJnrdv2Hn=bY5RQyjjzKXqgCXayMyBvc6MqYq1EtdR8rw@mail.gmail.com>
References: <1410360725-4286-1-git-send-email-seanpaul@chromium.org>
 <1410360725-4286-2-git-send-email-seanpaul@chromium.org> <541079A8.9080304@wwwdotorg.org>
 <20140918112621.GK26779@tbergstrom-lnx.Nvidia.com> <CAOw6vb+pyD9fk63rQHV5S3ar2hrWKb-HRf6ZP8odxbvz7FJ+Vw@mail.gmail.com>
 <20140919112802.GO26779@tbergstrom-lnx.Nvidia.com> <CAOw6vbLxNXSw3xfLZk4KKXGSJhbrHR9LEAPJ3hKHZMCN6WeV0w@mail.gmail.com>
 <CAOw6vbKozeDR+2KCTwhwRoNY7+k=FB96Vc7sHXKy4SFYMVEeHQ@mail.gmail.com> <20141008151019.GB4809@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141008151019.GB4809-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 8, 2014 at 8:10 AM, Peter De Schrijver
<pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On Tue, Oct 07, 2014 at 01:07:29PM -0700, Sean Paul wrote:
>> On Wed, Oct 1, 2014 at 11:38 AM, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> > On Fri, Sep 19, 2014 at 7:28 AM, Peter De Schrijver
>> > <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> >> On Thu, Sep 18, 2014 at 08:59:53PM +0200, Sean Paul wrote:
>> >>> On Thu, Sep 18, 2014 at 7:26 AM, Peter De Schrijver
>> >>> <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> >>> > On Wed, Sep 10, 2014 at 06:17:44PM +0200, Stephen Warren wrote:
>> >>> >> On 09/10/2014 08:52 AM, Sean Paul wrote:
>> >>> >> > This patch moves the mipi-cal gate registration down into the SoC
>> >>> >> > specific files to reflect the different in parent between them.
>> >>> >> >
>> >>> >> > Without this change, MIPI calibration will fail on K1 devices if
>> >>> >> > the 72MHz clock is off.
>> >>> >>
>> >>> >> This isn't a problem with this patch per se, but I notice that what's
>> >>> >> removed from clk-tegra-periph.c is data in a table, whereas open-coded
>> >>> >> calls are added to clk-tegra*.c. It'd be nice if the open-coded calls in
>> >>> >> clk-tegra*.c could be converted to a table (simply with SoC-specific
>> >>> >> data) and processed by the same function. Peter, would that make sense?
>> >>> >
>> >>> > Maybe yes. I will look into this. For this patch, it would make more sense
>> >>> > to keep the entry in clk-tegra-periph.c as it can be used by both Tegra124
>> >>> > and Tegra132.
>> >>> >
>> >>>
>> >>> How do you suggest we switch the parent based on 124 vs 132 if it
>> >>> remains in clk-tegra-periph.c?
>> >>>
>> >>
>> >> I would change the parent of mipi-cal in clk-tegra-periph.c to clk72mhz and
>> >> use a different mechanism for Tegra114.
>> >>
>> >
>> > Hi Peter,
>> > Sorry for the delay, I'm just getting back to this now.
>> >
>> > I'm still unclear on how you propose we alter mipi-cal in tegra114.
>> > AFAICT, we can't re-parent it since it's a gate clock. Can you please
>> > be a little more specific (and forgive my ignorance wrt this driver,
>> > it's still new to me)?
>> >
>>
>> Ping. Can I get some advice on this?
>>
>
> Sorry about the late reply. But you could do something like:
>
>
> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
> index 37f32c4..a9a3b69 100644
> --- a/drivers/clk/tegra/clk-tegra-periph.c
> +++ b/drivers/clk/tegra/clk-tegra-periph.c
> @@ -524,7 +524,7 @@ static struct tegra_periph_init_data gate_clks[] = {
>         GATE("hda2hdmi", "clk_m", 128, TEGRA_PERIPH_ON_APB, tegra_clk_hda2hdmi, 0),
>         GATE("bsea", "clk_m", 62, 0, tegra_clk_bsea, 0),
>         GATE("bsev", "clk_m", 63, 0, tegra_clk_bsev, 0),
> -       GATE("mipi-cal", "clk_m", 56, 0, tegra_clk_mipi_cal, 0),
> +       GATE("mipi-cal", "clk72mhz", 56, 0, tegra_clk_mipi_cal, 0),
>         GATE("usbd", "clk_m", 22, 0, tegra_clk_usbd, 0),
>         GATE("usb2", "clk_m", 58, 0, tegra_clk_usb2, 0),
>         GATE("usb3", "clk_m", 59, 0, tegra_clk_usb3, 0),
> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> index f760f31..8b44a8f 100644
> --- a/drivers/clk/tegra/clk-tegra114.c
> +++ b/drivers/clk/tegra/clk-tegra114.c
> @@ -720,7 +720,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
>         [tegra_clk_csi] = { .dt_id = TEGRA114_CLK_CSI, .present = true },
>         [tegra_clk_i2c2] = { .dt_id = TEGRA114_CLK_I2C2, .present = true },
>         [tegra_clk_uartc] = { .dt_id = TEGRA114_CLK_UARTC, .present = true },
> -       [tegra_clk_mipi_cal] = { .dt_id = TEGRA114_CLK_MIPI_CAL, .present = true },
>         [tegra_clk_emc] = { .dt_id = TEGRA114_CLK_EMC, .present = true },
>         [tegra_clk_usb2] = { .dt_id = TEGRA114_CLK_USB2, .present = true },
>         [tegra_clk_usb3] = { .dt_id = TEGRA114_CLK_USB3, .present = true },
> @@ -1230,6 +1229,11 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
>                                clk_base + CLK_SOURCE_EMC,
>                                29, 3, 0, NULL);
>
> +       clk = tegra_clk_register_periph_gate("mipi-cal", "clk_m", 0, clk_base,
> +                                       CLK_SET_RATE_PARENT, 56,
> +                                       periph_clk_enb_refcnt);
> +       clks[TEGRA114_CLK_MIPI_CAL] = clk;
> +
>         for (i = 0; i < ARRAY_SIZE(tegra_periph_clk_list); i++) {
>                 data = &tegra_periph_clk_list[i];
>                 clk = tegra_clk_register_periph(data->name,
>
> The advantage would be that this also solves the problem for Tegra132 and
> hopefully for future chips. So Tegra114 would be the odd ball out which is
> handled manually.
>

Indeed, this does seem like a better solution. I hadn't considered
doing it this way.

Would you mind posting a proper patch for it, so that I can pick it up
in the Chromium tree?

Thanks,

Sean



>> I've also got 2 other outstanding tegra clock patches that have not
>> received a response:
>> - clk: tegra124: Add init data for dsi lp clocks
>> - clk/tegra: Fix mux typo, s/pll_m/clk_m/
>>
>
> I will have a look.
>
> Cheers,
>
> Peter.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
