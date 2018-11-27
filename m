From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V2] clk: tegra: Return the exact clock rate from
 clk_round_rate
Date: Tue, 27 Nov 2018 22:40:08 +0300
Message-ID: <00e78319-7d97-e57e-9450-7e3ab7707ed8@gmail.com>
References: <20180925214940.15188-1-decatf@gmail.com>
 <153973003125.5275.211113451006447179@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153973003125.5275.211113451006447179@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Robert Yang <decatf@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 17.10.2018 1:47, Stephen Boyd wrote:
> Quoting Robert Yang (2018-09-25 14:49:40)
>> The current behavior is that clk_round_rate would return the same clock
>> rate passed to it for valid PLL configurations. This change will return
>> the exact rate the PLL will provide in accordance with clk API.
>>
>> Signed-off-by: Robert Yang <decatf@gmail.com>
>> ---
> 
> I'm waiting for someone from Nvidia/Tegra background to review this
> change.
> 

Apparently Peter is taking a pause. I think Thierry's ACK to V1 should be still valid here.

Also, if this helps:

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
