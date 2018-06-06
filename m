From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 0/5] Tegra20 External Memory Controller driver
Date: Wed, 6 Jun 2018 15:41:03 +0300
Message-ID: <9ef678f2-2046-373f-5de4-dcfff5dfe6a6@gmail.com>
References: <20180603223654.23324-1-digetx@gmail.com>
 <20180606104550.GK11810@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180606104550.GK11810@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 06.06.2018 13:45, Thierry Reding wrote:
> On Mon, Jun 04, 2018 at 01:36:49AM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> Couple years ago the Tegra20 EMC driver was removed from the kernel
>> due to incompatible changes in the Tegra's clock driver. This patchset
>> introduces a modernized EMC driver. Currently the sole purpose of the
>> driver is to initialize DRAM frequency to maximum rate during of the
>> kernels boot-up. Later we may consider implementing dynamic memory
>> frequency scaling, utilizing functionality provided by this driver.
>>
>> Changelog:
>>
>> v2:
>> 	- Minor code cleanups like consistent use of writel_relaxed instead
>> 	  of non-relaxed version, reworded error messages, etc.
>>
>> 	- Factored out use_pllm_ud bit checking into a standalone patch for
>> 	  consistency.
>>
>> Dmitry Osipenko (5):
>>   dt: bindings: tegra20-emc: Document interrupt property
>>   ARM: dts: tegra20: Add interrupt to External Memory Controller
>>   clk: tegra20: Turn EMC clock gate into divider
>>   clk: tegra20: Check whether direct PLLM sourcing is turned off for EMC
>>   memory: tegra: Introduce Tegra20 EMC driver
> 
> I took a brief look and didn't spot any dependencies between the clk and
> memory patches. Is it correct that these can be applied separately?

Yes, it is correct.
