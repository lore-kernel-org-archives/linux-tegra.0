From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/6] clk: tegra: add TEGRA20_CLK_NOR to init table
Date: Mon, 25 Jul 2016 14:28:48 +0200
Message-ID: <CALw8SCUPn2xzToHbPC2FPr7rVutcFOq7dwhqREmxoG=L4gT5ew@mail.gmail.com>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-2-git-send-email-mirza.krak@gmail.com> <20160725111735.GC21170@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160725111735.GC21170-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

2016-07-25 13:17 GMT+02:00 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On Tue, Jul 19, 2016 at 03:36:32PM +0200, Mirza Krak wrote:
>> From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Add TEGRA20_CLK_NOR to init tabel and set a "sane" default rate.
>>
>> Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/clk/tegra/clk-tegra20.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
>> index 837e5cb..aefc044 100644
>> --- a/drivers/clk/tegra/clk-tegra20.c
>> +++ b/drivers/clk/tegra/clk-tegra20.c
>> @@ -1047,6 +1047,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>>       { TEGRA20_CLK_SDMMC3, TEGRA20_CLK_PLL_P, 48000000, 0 },
>>       { TEGRA20_CLK_SDMMC4, TEGRA20_CLK_PLL_P, 48000000, 0 },
>>       { TEGRA20_CLK_SPI, TEGRA20_CLK_PLL_P, 20000000, 0 },
>> +     { TEGRA20_CLK_NOR, TEGRA20_CLK_PLL_P, 86500000, 0 },
>
> Yay for inconsistent naming in the hardware. It would've been nice if
> this clock was called GMI. Oh well...

I am allowed to change clk name? Can do that when I re-spin this series.

>
> Could you perhaps explain in the commit message why 86.5 MHz is a sane
> default? I'm totally unfamiliar with this controller, so maybe it's
> self-explanatory, but it seems a rather odd value for a clock frequency.

I used a value that I have in a downstream kernel based on the L4T.
This frequency is well tested and has worked for me, and wanted to
avoid setting it to maximum rate. My guess is that they used 86.5 MHz
because 92 MHz is max rate on Tegra2 and they put it slightly below
that.

What is otherwise recommended when initializing clocks? The rate could
depend on the chip that is attached but otherwise I would like to set
it close to max (or max) rate for performance.

Best Regards,
Mirza
