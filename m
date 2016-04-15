From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH 1/2] clk: tegra: Fix pllre Tegra210 and add pll_re_out1
Date: Fri, 15 Apr 2016 11:29:22 -0400
Message-ID: <571108D2.2040501@nvidia.com>
References: <1458590333-8898-1-git-send-email-rklein@nvidia.com>
 <20160412152336.GF25160@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160412152336.GF25160@ulmo.ba.sec>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 4/12/2016 11:23 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Mon, Mar 21, 2016 at 03:58:52PM -0400, Rhyland Klein wrote:
>> Use a new Tegra210 version of the pll_register_pllre function to
>> allow setting the proper settings for the m and n div fields.
>>
>> Additionally define PLL_RE_OUT1 on Tegra210.
> 
> It'd be nice to specify what that additional clock is used for. No need
> to repost for that, I can add it when applying.
> 

Its not currently directly used on the A44 platform I was testing with,
but from what I understand, it is connected to the Tegra210 debug
interfaces and so its probably good to have it defined in case it is
needed for some debugging.

-rhyland

-- 
nvpublic
