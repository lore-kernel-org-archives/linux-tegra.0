From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] clk: tegra210: Add SLCG override gate clocks
Date: Tue, 12 Apr 2016 18:41:50 +0100
Message-ID: <570D335E.9020202@nvidia.com>
References: <1457638685-31007-1-git-send-email-rklein@nvidia.com>
 <20160314160551.GA21898@ulmo.nvidia.com> <56E6E20C.6020807@nvidia.com>
 <56E7CA79.7060106@nvidia.com> <56F581BF.2070903@nvidia.com>
 <20160412152026.GE25160@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160412152026.GE25160@ulmo.ba.sec>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, Bill Huang <bilhuang@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 12/04/16 16:20, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Fri, Mar 25, 2016 at 02:21:51PM -0400, Rhyland Klein wrote:
>> On 3/15/2016 4:40 AM, Jon Hunter wrote:
>>>
>>> On 14/03/16 16:08, Rhyland Klein wrote:
>>>> On 3/14/2016 12:05 PM, Thierry Reding wrote:
>>>>>> Old Signed by an unknown key
>>>>>
>>>>> On Thu, Mar 10, 2016 at 02:38:05PM -0500, Rhyland Klein wrote:
>>>>>> From: Bill Huang <bilhuang@nvidia.com>
>>>>>>
>>>>>> Add some SLCG (Second Level Clock Gating) override clocks to control
>>>>>> gating and un-gating their logics.
>>>>>>
>>>>>> Signed-off-by: Bill Huang <bilhuang@nvidia.com>
>>>>>> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
>>>>>> ---
>>>>>>  drivers/clk/tegra/clk-id.h               | 16 ++++++
>>>>>>  drivers/clk/tegra/clk-tegra210.c         | 91 ++++++++++++++++++++++++++++++++
>>>>>>  include/dt-bindings/clock/tegra210-car.h | 32 +++++------
>>>>>>  3 files changed, 123 insertions(+), 16 deletions(-)
>>>>>
>>>>> There's no rationale given here about why we need this. What will these
>>>>> second level clock gates be used for? Why do we need these (seemingly)
>>>>> duplicate clock entries.
>>>>>
>>>>
>>>> These are going to be used in the to-be posted patchset around
>>>> powergating. As of now they are unused, which is why I hadn't added them
>>>> previously. I just wanted to try to get this dependency in before the
>>>> powergate series was posted.
>>>
>>> Yes we are using these on the Pixel C (aka. Smaug) and I suggested to
>>> Rhyland that we upstream them. Eventually we will use them but only
>>> after the core GenPD changes for Tegra are merged. From my perspective I
>>> was thinking it is better to reduce the changes between the chromeos
>>> 3.18 kernel and mainline. However, if you wish to wait until we need
>>> them I guess we can. Otherwise ...
>>>
>>> Acked-by: Jon Hunter <jonathanh@nvidia.com>
>>>
>>> Cheers
>>> Jon
>>>
>>
>> Thierry do you think we should hold off on this until Jon's patches are
>> ready or merge this sooner?
> 
> Jon, I think it would make sense for you to pick this up into your tree
> along with the rest of the patches that make use of them. Even if they
> end up being applied to different trees I'd like to see all of the work
> as a whole first.

Ok. That is fine with me.

Cheers
Jon
