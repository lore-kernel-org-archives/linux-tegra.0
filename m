From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/8] clk: Constify pointers to parent names in init data
Date: Thu, 9 Apr 2015 09:23:50 +0200
Message-ID: <CAJKOXPemyM8fa1gy5n=Kpeva2VBK+KguLF6_nrUtXeq3zjFAnQ@mail.gmail.com>
References: <1428499339-29569-1-git-send-email-k.kozlowski@samsung.com>
	<1428499339-29569-4-git-send-email-k.kozlowski@samsung.com>
	<5525BB7F.7070609@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <5525BB7F.7070609@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Ralf Baechle <ralf@linux-mips.org>, Max Filippov <jcmvbkbc@gmail.com>, Mike Turquette <mturquette@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Barry Song <baohua@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: linux-tegra@vger.kernel.org

2015-04-09 1:36 GMT+02:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 04/08/15 06:22, Krzysztof Kozlowski wrote:
>> The 'parent_names' member of 'clk_init_data' is not modified so it can
>> be made as an array of const pointers to constant strings.
>>
>> Some drivers (e.g. arch/mips/alchemy/common/clock.c) already pass such
>> data.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> ---
>
> Sascha sent a similar patch a few days ago.
>
> http://lkml.kernel.org/r/1427825817-26773-2-git-send-email-s.hauer@pengutronix.de

Indeed, so this patch can be skipped. I see that whole Sasha's
patchset is at v11 so maybe you could pick up only that patch? That
would allow applying other patches from here.

Best regards,
Krzysztof
