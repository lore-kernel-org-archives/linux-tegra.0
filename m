From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 2/2] clk: tegra: divider: Support enable-bit for Super
 clocks
Date: Tue, 29 Oct 2019 16:20:36 +0300
Message-ID: <74ee0e7f-c257-8fdf-bf3f-eefab3281dfa@gmail.com>
References: <20190723025245.27754-1-digetx@gmail.com>
 <20190723025245.27754-2-digetx@gmail.com>
 <20191028144157.GD27141@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191028144157.GD27141@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

28.10.2019 17:41, Peter De Schrijver пишет:
> On Tue, Jul 23, 2019 at 05:52:45AM +0300, Dmitry Osipenko wrote:
>> All Super clocks have a divider that has the enable bit.
>>
> 
> This is broken to begin with. The only clock of this type in upstream is SCLK
> I think. However, this clock is not a normal divider, it's a skipper, so
> the normal divider logic doesn't work for it. In practice this clock is
> only used when scaling SCLK, which is not (yet) done in the upstream
> kernel due to the complex DVFS relationship between sclk, hclk and pclk.
> A driver for it can be found here:
> https://nv-tegra.nvidia.com/gitweb/?p=linux-4.9.git;a=blob;f=drivers/clk/tegra/clk-skipper.c;h=f5da4f6ca44fe194c87f66be70c708e9791db74d;hb=eb8dd21affa2be45fc29be8c082194ac4032393a
> As you can see in that tree, we eventually splitted sclk into three
> clocks:
> 
> sclk_mux (controls SCLK_BURST_POLICY register)
> sclk (controls SOURCE_SYS register which is like a normal peripheral
> clock but without the mux)
> sclk_skipper (controls SCLK_DIVIDER)

I'll drop this patch, thanks again for the clarification.
