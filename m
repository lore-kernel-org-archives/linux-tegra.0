From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH] clk: tegra210: Add SLCG override gate clocks
Date: Mon, 14 Mar 2016 12:08:44 -0400
Message-ID: <56E6E20C.6020807@nvidia.com>
References: <1457638685-31007-1-git-send-email-rklein@nvidia.com>
 <20160314160551.GA21898@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160314160551.GA21898@ulmo.nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, Bill Huang <bilhuang@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 3/14/2016 12:05 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Thu, Mar 10, 2016 at 02:38:05PM -0500, Rhyland Klein wrote:
>> From: Bill Huang <bilhuang@nvidia.com>
>>
>> Add some SLCG (Second Level Clock Gating) override clocks to control
>> gating and un-gating their logics.
>>
>> Signed-off-by: Bill Huang <bilhuang@nvidia.com>
>> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
>> ---
>>  drivers/clk/tegra/clk-id.h               | 16 ++++++
>>  drivers/clk/tegra/clk-tegra210.c         | 91 ++++++++++++++++++++++++++++++++
>>  include/dt-bindings/clock/tegra210-car.h | 32 +++++------
>>  3 files changed, 123 insertions(+), 16 deletions(-)
> 
> There's no rationale given here about why we need this. What will these
> second level clock gates be used for? Why do we need these (seemingly)
> duplicate clock entries.
> 

These are going to be used in the to-be posted patchset around
powergating. As of now they are unused, which is why I hadn't added them
previously. I just wanted to try to get this dependency in before the
powergate series was posted.

-rhyland


-- 
nvpublic
