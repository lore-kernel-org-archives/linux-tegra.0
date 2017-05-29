From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
Date: Mon, 29 May 2017 13:21:54 +0200
Message-ID: <CAK8P3a3MdvWMJyVqE63Ur330mC2wPZO7nFXjd_LukbTjiZtGdg@mail.gmail.com>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
 <CAK8P3a3QACHYqtCO1z_FpW0nXEtx356wCDha_=SNXU872=q1UQ@mail.gmail.com>
 <20170529084809.GA2192@mai>
 <CAK8P3a1Kv_RhKL43ie6co_N5pDXvRHd7Uq8g70qt80WkxuhzLw@mail.gmail.com>
 <20170529105509.GC2192@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170529105509.GC2192@mai>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Baruch Siach <baruch@tkos.co.il>, Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Santosh Shilimkar <ssantosh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, "moderated list:ARM/OXNAS platform support" <linux-oxnas@lists.tuxfamily.org>, Patrice Chotard <patrice.chotard@st.com>, Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>, Ingo Molnar <mingo@kernel.org>, "open list:ARM/STI ARCHITECTURE" <kernel@stlinux.com>, Alexandre Courbot <gnurou@gmail.com>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, Alexander Shiyan <shc>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 29, 2017 at 12:55 PM, Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On Mon, May 29, 2017 at 11:57:25AM +0200, Arnd Bergmann wrote:
>> On Mon, May 29, 2017 at 10:48 AM, Daniel Lezcano
>> <daniel.lezcano@linaro.org> wrote:
>> Things that could go wrong include:
>>
>> - A platform maintainer wants to add a new platform and has a for-next
>>   branch that gets merged into linux-next, with parts of it going through
>>   different maintainers, and now they have to choose between a branch
>>   that doesn't build without the timer branch, or one that break for-next
>>   unless Stephen applies a fixup
>>
>> - Some architecture maintainer didn't get the memo and adds an instance of
>>   CLOCKSOUCE_OF_DECLARE in architecture specific code without asking
>>   having the patch reviewed first
>>
>> - A platform has a branch with complex cross-tree dependencies and
>>   it need to get merged in an unconventional way.
>>
>> - You make a mistake and accidentally merge one driver for an unusual
>>   architecture that escapes your test matrix.
>>
>> While those all are unlikely to happen in a particular merge window, they do
>> happen occasionally and tend to cause a lot of pain.
>
> Hmm, that sounds scary :)
>
> There is no guarantee, when removing the alias, none of the above happens,
> right?

No, it's just both less likely and easier to work around.

> If the timer branch is in linux-next, that could be caugth before any of the
> above happens, no?

linux-next will find most of these problems, but it will still be more work
for the people that run into build failures when testing linux-next.

     Arnd
