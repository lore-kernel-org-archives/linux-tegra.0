From: Mirza Krak <mirza.krak@gmail.com>
Subject: Re: [PATCH V3 1/6] clk: tegra: add TEGRA20_CLK_NOR to init table
Date: Thu, 3 Nov 2016 13:26:20 +0100
Message-ID: <CALw8SCWyLAw=yZ-W_nAFuDAazpa4HJfZuzqLDKQKYLWjV5JzYw@mail.gmail.com>
References: <1477576872-2665-1-git-send-email-mirza.krak@gmail.com>
 <1477576872-2665-2-git-send-email-mirza.krak@gmail.com> <df12a1f0-316d-64a4-54fe-f7559742eeca@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <df12a1f0-316d-64a4-54fe-f7559742eeca@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux@armlinux.org.uk, pdeschrijver@nvidia.com, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

2016-11-03 11:06 GMT+01:00 Jon Hunter <jonathanh@nvidia.com>:
> Hi Mirza,
>
> On 27/10/16 15:01, Mirza Krak wrote:
>>
>> From: Mirza Krak <mirza.krak@gmail.com>
>>
>> Add TEGRA20_CLK_NOR to init table and set default rate to 92 MHz which
>> is max rate.
>>
>> The maximum rate value of 92 MHz is pulled from the downstream L4T
>> kernel.
>
>
> Thanks for adding this. I assume that this is from an L4T r16 release with a
> v3.1 kernel. I had a quick poke through the kernel sources for v3.1 but was
> unable to see where this is set. Obviously v3.1 did not have CCF and so
> everything seems to be in the arch/arm/mach-tegra directory for setting up
> clocks. Can you point me to the appropriate sources so I can ACK this?

I use the kernel sources provided by Toradex, and these sources are
based on L4T r16 release.

http://git.toradex.com/cgit/linux-toradex.git/tree/arch/arm/mach-tegra/tegra2_clocks.c?h=tegra#n2463



Best Regards
Mirza Krak
