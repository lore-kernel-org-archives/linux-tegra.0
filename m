From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
Date: Mon, 29 May 2017 11:57:25 +0200
Message-ID: <CAK8P3a1Kv_RhKL43ie6co_N5pDXvRHd7Uq8g70qt80WkxuhzLw@mail.gmail.com>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
 <CAK8P3a3QACHYqtCO1z_FpW0nXEtx356wCDha_=SNXU872=q1UQ@mail.gmail.com>
 <20170529084809.GA2192@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20170529084809.GA2192@mai>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, "moderated list:ARM/OXNAS platform support" <linux-oxnas-Xt5XgHjqiBU06sgRBLv0+0B+6BGkLq7r@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:ARM/STI ARCHITECTURE" <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel-5NWGOfrQmneRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, Alexander Shiyan <shc>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 29, 2017 at 10:48 AM, Daniel Lezcano
<daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, May 29, 2017 at 10:41:52AM +0200, Arnd Bergmann wrote:
>> On Sat, May 27, 2017 at 11:58 AM, Daniel Lezcano
>> <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > The CLOCKSOUCE_OF_DECLARE macro is used widely for the timers to declare the
>> > clocksource at early stage. However, this macro is also used to initialize
>> > the clockevent if any, or the clockevent only.
>> >
>> > It was originally suggested to declare another macro to initialize a
>> > clockevent, so in order to separate the two entities even they belong to the
>> > same IP. This was not accepted because of the impact on the DT where splitting
>> > a clocksource/clockevent definition does not make sense as it is a Linux
>> > concept not a hardware description.
>> >
>> > On the other side, the clocksource has not interrupt declared while the
>> > clockevent has, so it is easy from the driver to know if the description is
>> > for a clockevent or a clocksource, IOW it could be implemented at the driver
>> > level.
>> >
>> > So instead of dealing with a named clocksource macro, let's use a more generic
>> > one: TIMER_OF_DECLARE.
>> >
>> > The patch has not functional changes.
>> >
>> > Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> Could you either leave the old name as an alias for one release, or introduce
>> the new name as an alias now for 4.13?
>>
>> I think that that would make it easier to merge new drivers. Otherwise this
>> looks good to me,
>
>
> New drivers should go through my tree, so I can catch them with the old macro
> name and do the change.

Sure, they should, and it's quite likely that you won't even need the fallback,
I've just seen too many cases where a similar assumption turned out wrong,
that I'd just pick the safer option just in case whenever I do an API change.

Things that could go wrong include:

- A platform maintainer wants to add a new platform and has a for-next
  branch that gets merged into linux-next, with parts of it going through
  different maintainers, and now they have to choose between a branch
  that doesn't build without the timer branch, or one that break for-next
  unless Stephen applies a fixup

- Some architecture maintainer didn't get the memo and adds an instance of
  CLOCKSOUCE_OF_DECLARE in architecture specific code without asking
  having the patch reviewed first

- A platform has a branch with complex cross-tree dependencies and
  it need to get merged in an unconventional way.

- You make a mistake and accidentally merge one driver for an unusual
  architecture that escapes your test matrix.

While those all are unlikely to happen in a particular merge window, they do
happen occasionally and tend to cause a lot of pain.

       Arnd
