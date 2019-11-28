From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 00/11] Move PMC clocks into Tegra PMC driver
Date: Thu, 28 Nov 2019 16:10:52 +0300
Message-ID: <174fd19d-50de-b854-e5c6-65493efd1ea0@gmail.com>
References: <1574830773-14892-1-git-send-email-skomatineni@nvidia.com>
 <79e7bd6a-f138-1e7d-6e0b-435adde3b3e5@gmail.com>
 <20191128122619.GB2300319@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191128122619.GB2300319@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com, mperttunen@nvidia.com, sboyd@kernel.org, gregkh@linuxfoundation.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

28.11.2019 15:26, Thierry Reding пишет:
> On Wed, Nov 27, 2019 at 05:31:34PM +0300, Dmitry Osipenko wrote:
>> 27.11.2019 07:59, Sowjanya Komatineni пишет:
>>> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 and blink controls which
>>> are currently registered by Tegra clock driver using clk_regiser_mux and
>>> clk_register_gate which performs direct Tegra PMC register access.
>>>
>>> When Tegra PMC is in secure mode, any access from non-secure world will
>>> not go through.
>>>
>>> This patch series adds these Tegra PMC clocks and blink controls to Tegra
>>> PMC driver with PMC as clock provider and removed them from Tegra clock
>>> driver. This also adds PMC specific clock id's to use in device tree and
>>> removed clock ids of PMC clock from Tegra clock driver.
>>>
>>> This series also includes patch to update clock provider from tegra_car
>>> to pmc in the device tree tegra210-smaug.dts that uses clk_out_2 from PMC.
>>>
>>> [v2]:	Changes between v1 and v2 are
>>> 	- v2 includes patches for adding clk_out_1, clk_out_2, clk_out_3,
>>> 	  blink controls to Tegra PMC driver and removing clk-tegra-pmc.
>>> 	- feedback related to pmc clocks in Tegra PMC driver from v1
>>> 	- Removed patches for WB0 PLLM overrides and PLLE IDDQ PMC programming
>>> 	  by the clock driver using helper functions from Tegra PMC.
>>>
>>>  	  Note:
>>> 	  To use helper functions from PMC driver, PMC early init need to
>>> 	  happen prior to using helper functions and these helper functions are
>>> 	  for PLLM Override and PLLE IDDQ programming in PMC during PLLM/PLLE
>>> 	  clock registration which happen in clock_init prior to Tegra PMC
>>> 	  probe.
>>> 	  Moving PLLM/PLLE clocks registration to happen after Tegra PMC
>>> 	  impacts other clocks EMC, MC and corresponding tegra_emc_init and
>>> 	  tegra_mc_init.
>>> 	  This implementation of configuring PMC registers thru helper
>>> 	  functions in clock driver needs proper changes across PMC, Clock,
>>> 	  EMC and MC inits to have it work across all Tegra platforms.
>>>
>>> 	  Currently PLLM Override is not enabled in the bootloader so proper
>>> 	  patches for this fix will be taken care separately.
>>
>> Hello Sowjanya,
>>
>> Could you please clarify what do you mean by "PLLM Override not enabled
>> in bootloader"?
>>
>> There is T124 Nyan Big Chromebook which is supported in upstream kernel,
>> it has PLLM Override set by bootloader. I also have T30 Nexus 7 tablet
>> which has the PLLM Override set by bootloader as well. It's not clear to
>> me whether this patch series is supposed to break these devices. If the
>> breakage is the case here, then I'm afraid you can't postpone supporting
>> the PLLM Override and a full-featured implementation is needed.
> 
> For some more background on why we chose to take this shortcut for now:
> Sowjanya was looking at the full-featured implementation and that ended
> up being a can of worms. The problem is that there are various inter-
> dependencies between the PLLM override and the MC/EMC clocks.
> 
> Unfortunately we depend a lot on the explicit ordering of driver probe,
> especially during early boot, so this started to get very complicated,
> very quickly.
> 
> The bottom line was basically that we would need to move a whole bunch
> of clocks to register at a very late point in time and support deferred
> probe throughout in order to make it all work together nicely. Sowjanya
> had a crack at that, and while the system ended up booting, there were a
> number of errors from the MC and IOMMU drivers.
> 
> At the end, we decided to take a look at that separately because, as was
> mentioned earlier, the PLLM override is not used on platforms where the
> PMC is locked down, so the existing PLLM override code is going to
> continue to work fine on the platforms where it's currently used.
> 
> Thierry

Thank you and Sowjanya for the clarification.

[snip]
