From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 3/3] irqchip/gic-pm: use devm_clk_*() helpers
Date: Wed, 6 Mar 2019 13:21:43 +0000
Message-ID: <78b2d8e1-2dd0-e609-861b-420fcd884a9e@arm.com>
References: <1551868878-1131-1-git-send-email-spujar@nvidia.com>
 <1551868878-1131-3-git-send-email-spujar@nvidia.com>
 <487578fe-fa14-f1c4-fad9-ff47ebde2273@arm.com>
 <573022cf-e2e3-0e12-d16c-6d465b8af2ce@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <573022cf-e2e3-0e12-d16c-6d465b8af2ce@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, vkoul@kernel.org, dan.j.williams@intel.com, tglx@linutronix.de, jason@lakedaemon.net
Cc: thierry.reding@gmail.com, ldewangan@nvidia.com, mkumard@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 06/03/2019 12:00, Jon Hunter wrote:
> 
> On 06/03/2019 11:31, Marc Zyngier wrote:
>> Hi Sameer,
>> 
>> [unrelated to this email: anything that comes from NVIDIA reaches me
>>  encrypted with my public key. Not a big deal, but it'd be good if
>>  someone could fix that.]
>> 
>> On 06/03/2019 10:41, Sameer Pujar wrote:
>>> With pm_clk_*() usage, it is seen that clocks always remain ON. This
>>> happens because clocks are managed by BPMP on Tegra devices and clock
>>> enable/disable happens during prepare/unprepare phase. This patch
>>> avoids use of pm_clk_*() and replaces it with devm_clk_*() helpers.
>>>
>>> Suggested-by: Mohan Kumar D <mkumard@nvidia.com>
>>> Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> 
>> On its own, I'm not opposed to that patch.
>> 
>> But given that there is no in-tree platform using this, despite the code
>> sitting here for more than 2.5 years, this is just updating dead code.
>> 
>> Am I missing anything?
> 
> Nope, but we are working to fix that at long last. I hope in the next
> few months it will not longer be dormant! This driver is still very much
> important to our audio support for newer Tegra devices.

Can we at least make sure it gets compiled when an NVIDIA platform
(ARCH_TEGRA?) is selected? And if this isn't relevant to the current
platforms, then hold off until it actually makes sense.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
