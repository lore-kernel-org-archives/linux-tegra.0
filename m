From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 0/2] Tegra30+ CPU suspend-resume bug-fixes
Date: Thu, 25 Jul 2019 16:43:35 +0300
Message-ID: <03de1cbe-7f0d-a7f0-edca-ee3b6b8c8417@gmail.com>
References: <20190707230358.10672-1-digetx@gmail.com>
 <f81a974b-4e64-9b66-0399-519480f53c31@gmail.com>
 <20190725094010.GK12715@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725094010.GK12715@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

25.07.2019 12:40, Peter De Schrijver пишет:
> On Tue, Jul 23, 2019 at 04:28:35AM +0300, Dmitry Osipenko wrote:
>> 08.07.2019 2:03, Dmitry Osipenko пишет:
>>> Hello,
>>>
>>> This small series addresses two suspend-resume bugs: one affects Tegra30+
>>> due to a typo in the code, other fixes CPU hang on Tegra30 specifically.
>>>
>>> Please review and apply, thanks!
>>>
>>> Dmitry Osipenko (2):
>>>   ARM: tegra: Fix FLOW_CTLR_HALT register clobbering by tegra_resume()
>>>   ARM: tegra: Use WFE for power-gating on Tegra30
>>>
>>>  arch/arm/mach-tegra/reset-handler.S |  6 +++---
>>>  arch/arm/mach-tegra/sleep-tegra30.S |  4 +++-
>>>  drivers/soc/tegra/flowctrl.c        | 19 +++++++++++++++++--
>>>  3 files changed, 23 insertions(+), 6 deletions(-)
>>>
>>
>> Hello Peter,
>>
>> We were talking about these fixes on the IRC not so long time ago, does
>> it look good to you? Care to give an ACK?
> 
> Acked-By Peter De Schrijver <pdeschrijver@nvidia.com>
> 

Thanks!
