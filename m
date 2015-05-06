From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH v4 02/20] clk: tegra: periph: add new periph clks and
 muxes for Tegra210
Date: Wed, 6 May 2015 12:20:34 -0400
Message-ID: <554A3F52.9090608@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com> <1430757460-9478-3-git-send-email-rklein@nvidia.com> <5549F900.2050600@nvidia.com> <20150506141524.GE22098@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150506141524.GE22098@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jim Lin <jilin@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 5/6/2015 10:15 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Wed, May 06, 2015 at 07:20:32PM +0800, Jim Lin wrote:
>> On 05/05/2015 12:37 AM, Rhyland Klein wrote:
> [...]
>>> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
> [...]
>>> @@ -333,6 +497,11 @@ static u32 mux_clkm_48M_pllp_480M_idx[] = {
>>>  	[0] = 0, [1] = 2, [2] = 4, [3] = 6,
>>>  };
>>> +static const char *mux_clkm_pllre_clk32_480M[] = {
>>> +	"clk_m", "pll_re_out", "clk_32k", "pll_u_480M"
>>> +};
>>> +#define mux_clkm_pllre_clk32_480M_idx NULL
>> Please help to replace above
>>
>> #define mux_clkm_pllre_clk32_480M_idx NULL
>>
>> with
>>
>> static u32 mux_clkm_pllre_clk32_480M_idx[] = {
>>
>>        [0] = 0, [1] = 1, [2] = 2, [3] = 3,
>> };
> 
> Isn't that the default already if you specify NULL as index table?

It should be, so there shouldn't be a need to explicitly define this.

-rhyland

> 
> Thierry
> 
> * Unknown Key
> * 0x7F3EB3A1
> 


-- 
nvpublic
