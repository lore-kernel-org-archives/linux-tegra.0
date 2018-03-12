From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] soc: rockchip: power-domain: Use
 of_clk_get_parent_count() instead of open coding
Date: Mon, 12 Mar 2018 15:32:25 -0700
Message-ID: <152089394512.147033.16036395348488651030@swboyd.mtv.corp.google.com>
References: <1516375101-29836-1-git-send-email-geert+renesas@glider.be>
 <1516375101-29836-3-git-send-email-geert+renesas@glider.be>
 <11171053.oOJPuGlHoK@phil>
 <CAEG3pNCioW_FVXj3-j4KC_yO6ZYGXQB_eanHWSb9NUE9kYsWag@mail.gmail.com>
 <CAMuHMdVsb+5T-DYfF9v6ANhVxhRk6_r+XPA34mW7Q=90HnitAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdVsb+5T-DYfF9v6ANhVxhRk6_r+XPA34mW7Q=90HnitAA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Jonathan Hunter <jonathanh@nvidia.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk <linux-clk@vger.kernel.org>, "Stephen Boyd <sboyd@codeaurora.org>,
 Emilio Lopez <emilio@elopez.com.ar>,
 Hans de Goede <hdegoede@redhat.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Quoting Geert Uytterhoeven (2018-03-02 05:15:35)
> Hi Mike,
> 
> On Sun, Feb 18, 2018 at 8:09 PM, Michael Turquette
> <mturquette@baylibre.com> wrote:
> > Moving of_clk_get_parent_count to clk.h seems reasonable to me. It's
> > more of an of-specific helper than a provider-specific helper.
> >
> > Anyone up to submit a patch so that this one doesn't need to include
> > clk-provider.h?
> 
> I gave it a try.
> Just moving of_clk_get_parent_count() from clk-provider.h to clk.h causes
> breakage, as half of the clock providers using of_clk_get_parent_count()
> do not include <linux/clk.h>:
> 
>     drivers/clk/at91/clk-generated.c
>     drivers/clk/at91/clk-main.c
>     drivers/clk/at91/clk-master.c
>     drivers/clk/at91/clk-programmable.c
>     drivers/clk/at91/clk-slow.c
>     drivers/clk/at91/clk-smd.c
>     drivers/clk/at91/clk-usb.c
>     drivers/clk/at91/sckc.c
>     drivers/clk/clk-axi-clkgen.c
>     drivers/clk/clk-gpio.c
>     drivers/clk/clk-hsdk-pll.c
>     drivers/clk/h8300/clk-div.c
>     drivers/clk/h8300/clk-h8s2678.c
>     drivers/clk/renesas/clk-div6.c
>     drivers/clk/ti/composite.c
>     drivers/clk/ti/gate.c
>     drivers/clk/ti/mux.c
> 
> So our options are:
>   1. Add #include <linux/clk.h> to each of the above,
>   2. Add #include <linux/clk.h> to <linux/clk-provider.h>,
>   3. Do nothing, i.e. users of of_clk_get_parent_count () need to
>       #include <linux/clk-provider.h>, cfr. this patch series.
> 
> Any preference? Any option I'm missing?
> 

#2 is a definite no.

How about option #4? Move of_clk_get_parent_count() and
of_clk_get_parent_name() to a new include/linux/of_clk.h, include that
in clk-provider.h, and then have non-clk provider drivers include that
file? After that, we can also move of_clk_init() into this new file, and
then non-provider arch code can call of_clk_init() without including the
provider APIs. I'd also like to get rid of the include of linux/of.h in
clk-provider.h, but that's a ways away.
