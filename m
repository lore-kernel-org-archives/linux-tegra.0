From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 0/2] clk: Tegra124 PLLM fixes
Date: Thu, 25 Apr 2019 16:50:39 +0300
Message-ID: <d020b512-59be-51bd-39c1-4827e57b020c@gmail.com>
References: <20190411214835.19947-1-digetx@gmail.com>
 <46c12545-0e9e-93bf-2ccc-4577f4eb223e@gmail.com>
 <20190424083625.GQ12975@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424083625.GQ12975@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

24.04.2019 11:36, Peter De Schrijver пишет:
> On Fri, Apr 19, 2019 at 02:50:10PM +0300, Dmitry Osipenko wrote:
>> 12.04.2019 0:48, Dmitry Osipenko пишет:
>>> Hello, here are two trivial patches that are correcting PLLM on Tegra124.
>>> First fixes system lockup due to a bad hardware configuration, second
>>> removes usage of a non-existent register bit.
>>>
>>> Dmitry Osipenko (2):
>>>   clk: tegra: Fix PLLM programming on Tegra124+ when PMC overrides
>>>     divider
>>>   clk: tegra124: Remove lock-enable bit from PLLM
>>>
>>>  drivers/clk/tegra/clk-pll.c      | 4 ++--
>>>  drivers/clk/tegra/clk-tegra124.c | 3 +--
>>>  2 files changed, 3 insertions(+), 4 deletions(-)
>>>
>>
>> Hello Peter,
>>
>> The patches in this series are trivial and fixing the longstanding bug on Tegra124. Could you please take a look and and ACK the series if it looks good to you?
> 
> Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>                                                              

Thank you, Peter.


Stephen, is yours maintainer-tool able to pick up the "Acked-By" for the whole series or do I need to resend the series with a proper "Acked-by" tag added to every patch? Please let me know.
