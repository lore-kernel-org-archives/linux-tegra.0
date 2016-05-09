From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH v2] clk: tegra: Initialize UTMIPLL when enabling PLLU
Date: Mon, 9 May 2016 18:25:36 -0400
Message-ID: <57310E60.1080000@nvidia.com>
References: <1462566015-12306-1-git-send-email-rklein@nvidia.com>
 <20160509052500.GB18753@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160509052500.GB18753@ulmo.ba.sec>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>
List-Id: linux-tegra@vger.kernel.org

On 5/9/2016 1:25 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Fri, May 06, 2016 at 04:20:15PM -0400, Rhyland Klein wrote:
>> From: Andrew Bresticker <abrestic@chromium.org>
>>
>> Move the UTMIPLL initialization code from the clk-tegra<chip>.c
>> files into clk-pll.c and perform the initialization sequence when
>> PLLU is enabled.
>>
>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>>
>> [rklein: Merged in some later fixes for potential deadlocks]
>>
>> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
>> ---
>> v2:
>>  - Swapped out __clk_lookup for 2 calls to clk_hw_get_parent
>>
>>  drivers/clk/tegra/clk-pll.c      | 484 +++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/tegra/clk-tegra114.c | 155 +------------
>>  drivers/clk/tegra/clk-tegra124.c | 156 +------------
>>  drivers/clk/tegra/clk-tegra210.c | 182 +--------------
>>  drivers/clk/tegra/clk-tegra30.c  | 113 +--------
>>  drivers/clk/tegra/clk.h          |  17 ++
>>  6 files changed, 510 insertions(+), 597 deletions(-)
> 
> The commit message should mention *why* this change is necessary. It's
> fairly obvious what you're doing by looking at the code, but the commit
> message is an opportunity to let others know why this is necessary or
> worthwhile. Does it fix a bug? Is this clean up? It seems important to
> me when you say "perform the initialization sequence when PLLU is
> enabled", but as it is I don't understand why.
> 
> 

How about something along these lines as a better description:

Move the UTMIPLL initialization code form clk-tegra<chip>.c files into
clk-pll.c. UTMIPLL was being configured and set in HW control right
after registration. However, when the clock init_table is processed and
child clks of PLLU are enabled, it will call in and enable PLLU as well,
and initiate SW enabling sequence even though PLLU is already in HW
control. This leads to getting UTMIPLL stuck with a SEQ_BUSY status.
Doing the initialization once during pllu_enable means we configure it
properly into HW control.

A side effect of the commonization/localization of the UTMIPLL init
code, is that it corrects some errors that were present for earlier
generations. For instance, in clk-tegra124.c, it used to have:

#define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 6)

when the correct shift to use is present in the new version:

#define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 27)

which matches the Tegra124 TRM register definition.

-rhyland

P.S. I can also see the correction of the bit offsets could be moved to
another patch too, but with the reorg, I wasn't sure if it was worth it.
If you think it makes sense, I can do a patch to correct those first,
and then this one.

-- 
nvpublic
