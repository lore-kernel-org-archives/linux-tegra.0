From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 00/19] Move PMC clocks into Tegra PMC driver
Date: Wed, 8 Jan 2020 03:40:23 +0300
Message-ID: <f6a28f8d-5061-0be5-2530-966c3a25aaf4@gmail.com>
References: <1578370458-3686-1-git-send-email-skomatineni@nvidia.com>
 <20200107122152.GD1964183@ulmo>
 <1f7d3c1e-115c-e08e-240b-c4df9e68543d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1f7d3c1e-115c-e08e-240b-c4df9e68543d@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

07.01.2020 19:50, Sowjanya Komatineni пишет:
> 
> On 1/7/20 4:21 AM, Thierry Reding wrote:
>> On Mon, Jan 06, 2020 at 08:13:59PM -0800, Sowjanya Komatineni wrote:
>>> This patch series moves Tegra PMC clocks from clock driver to pmc driver
>>> along with the device trees changes and audio driver which uses one of
>>> the pmc clock for audio mclk.
>>>
>>> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 and blink controls which
>>> are currently registered by Tegra clock driver using clk_regiser_mux and
>>> clk_register_gate which performs direct Tegra PMC register access.
>>>
>>> When Tegra PMC is in secure mode, any access from non-secure world will
>>> not go through.
>>>
>>> This patch series adds these Tegra PMC clocks and blink controls to
>>> Tegra
>>> PMC driver with PMC as clock provider and removes them from Tegra clock
>>> driver.
>>>
>>> PMC clock clk_out_1 is dedicated for audio mclk from Tegra30 thru
>>> Tegra210
>>> and clock driver does inital parent configuration for it and enables
>>> them.
>>> But this clock should be taken care by audio driver as there is no need
>>> to have this clock pre enabled.
>>>
>>> So, this series also includes patch that updates ASoC driver to take
>>> care of parent configuration for mclk if device tree don't specify
>>> initial parent configuration using assigned-clock-parents and controls
>>> audio mclk enable/disable during ASoC machine startup and shutdown.
>>>
>>> DTs are also updated to use clk_out_1 as audio mclk rather than extern1.
>>>
>>> This series also includes a patch for mclk fallback to extern1 when
>>> retrieving mclk fails to have this backward compatible of new DT with
>>> old kernels.
>> Hi Sowjanya,
>>
>> this looks like it's almost ready to merge. Can you highlight if there
>> are any build-time or runtime dependencies between the patches? The
>> audio driver changes seem to be mostly isolated from the rest by the
>> fallback implementation for legacy device trees.
>>
>> Is there anything that I need to keep in mind when applying these? And
>> would it be fine for Mark to pick up the ASoC patches separately from
>> the rest?
>>
>> Thierry
> 
> Yes, ASoC patches can be picked separately.
> 
> dependencies are b/w clock and pmc driver patches.

Technically, the ASoC compatibility patches should be applied before the
CaR changes. But perhaps it's not critical if audio fails during git's
bisection.
