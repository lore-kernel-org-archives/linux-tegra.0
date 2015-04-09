From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 4/8] clk: tegra: Fix duplicate const for parent names
Date: Thu, 9 Apr 2015 12:33:16 +0200
Message-ID: <CAJKOXPfQW-9m7a5S8oRy7dpHLOodvVq44vHV=wVnG8WjOeP_EA@mail.gmail.com>
References: <1428499339-29569-1-git-send-email-k.kozlowski@samsung.com>
	<1428499339-29569-5-git-send-email-k.kozlowski@samsung.com>
	<20150409100036.GK12103@ulmo>
	<CAJKOXPd4KsZ-pLDUtyWwyJviZyFWQKVLTVpW_6_Yye2o=3xy0g@mail.gmail.com>
	<20150409101947.GM12103@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20150409101947.GM12103@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Alexandre Courbot <gnurou@gmail.com>, Barry Song <baohua@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tomasz.figa@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

2015-04-09 12:19 GMT+02:00 Thierry Reding <thierry.reding@gmail.com>:
> On Thu, Apr 09, 2015 at 12:07:59PM +0200, Krzysztof Kozlowski wrote:
>> 2015-04-09 12:00 GMT+02:00 Thierry Reding <thierry.reding@gmail.com>:
>> > On Wed, Apr 08, 2015 at 03:22:15PM +0200, Krzysztof Kozlowski wrote:
>> >> Replace duplicated const keyword for 'emc_parent_clk_names' with proper
>> >> array of const pointers to const strings.
>> >>
>> >> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> >> ---
>> >>  drivers/clk/tegra/clk-emc.c | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > This would probably better go in via the Tegra tree since the patch that
>> > contains this has only made it to linux-next.
>> >
>> > Stephen, Mike, any objections to me taking this?
>>
>> Applying this without the change for const-ness of parent_names (patch
>> by Sascha Hauer sent before mine [1]) would introduce a warning -
>> assign of const to non-const. Any idea to solve it? Immutable branch?
>
> Right, I had missed that. Immutable branch would work, though perhaps
> it'd be easier to just defer this until after v4.1-rc1. The warning
> shouldn't happen if we leave out this single patch and apply it later
> on, right?

That would be fine with me. I think it would better to apply patches
now if they are applicable.

Best regards,
Krzysztof
