From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] sdhci: tegra: Remove warnings about missing
 device-tree properties
Date: Tue, 19 May 2020 19:33:38 +0300
Message-ID: <b4eb368e-adc2-7b77-3ae9-fefdcfddaf3d@gmail.com>
References: <20200516154314.14769-1-digetx@gmail.com>
 <CAPDyKFo_Xp-zipqE26iMv4CFwUoMCQZy3Zr63Cp=uzePgWX7BA@mail.gmail.com>
 <b634e7a5-9a30-3bd1-126d-be62e4dd73e1@gmail.com>
 <20200519162444.GD2113674@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <20200519162444.GD2113674@ulmo>
Content-Language: en-US
Sender: linux-mmc-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Adrian Hunter <adrian.hunter@intel.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

19.05.2020 19:24, Thierry Reding пишет:
> On Tue, May 19, 2020 at 05:05:27PM +0300, Dmitry Osipenko wrote:
>> 19.05.2020 10:28, Ulf Hansson пишет:
>>> On Sat, 16 May 2020 at 17:44, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>
>>>> Several people asked me about the MMC warnings in the KMSG log and
>>>> I had to tell to ignore them because these warning are irrelevant to
>>>> pre-Tegra210 SoCs.
>>>
>>> Why are the warnings irrelevant?
>>
>> That's what the DT binding doc says [1].
>>
>> [1]
>> https://www.kernel.org/doc/Documentation/devicetree/bindings/mmc/nvidia%2Ctegra20-sdhci.txt
>>
>> Although, looking at the driver's code and TRM docs, it seems that all
>> those properties are really irrelevant only to the older Terga20 SoC. So
>> the binding doc is a bit misleading.
>>
>> Nevertheless, the binding explicitly says that the properties are
>> optional, which is correct.
> 
> Optional only means that drivers must not fail if these properties
> aren't found, it doesn't mean that the driver can't warn that they
> are missing.
> 
> Quite possibly the only reason why they were made optional is because
> they weren't part of the bindings since the beginning. Anything added
> to a binding after the first public release has to be optional by
> definition, otherwise DT ABI wouldn't be stable.
> 
> I think these warnings were added on purpose, though I also see that
> there are only values for these in device tree for Tegra186 and Tegra194
> but not Tegra210 where these should also be necessary.
> 
> Adding Sowjanya who wrote this code. Perhaps she can clarify why the
> warnings were added. If these values /should/ be there on a subset of
> Tegra, then I think we should keep them, or add them again, but perhaps
> add a better way of identifying when they are necessary and when it is
> safe to work without them.
> 
> That said, looking at those checks I wonder if they are perhaps just
> wrong. Or at the very least they seem redundant. It looks to me like
> they can just be:
> 
> 	if (tegra_host->pinctrl_state_XYZ == NULL) {
> 		...
> 	}
> 
> That !IS_ERR(...) doesn't seem to do anything. But in that case, it's
> also obvious why we're warning about them on platforms where these
> properties don't exist in DT.
> 
> So I think we either need to add those values where appropriate so that
> the warning doesn't show, or we need to narrow down where they are
> really needed and add a corresponding condition.
> 
> But again, perhaps Sowjanya can help clarify if these really are only
> needed on Tegra210 and later or if these also apply to older chips.

Either way will be cleaner to convert the DT binding to YAML rather than
clutter the driver, IMO.
