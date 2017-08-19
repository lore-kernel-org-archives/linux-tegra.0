From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH 1/4] gpu: host1x: Enable Tegra186 syncpoint protection
Date: Sat, 19 Aug 2017 13:35:05 +0300
Message-ID: <6979443e-ad2b-1da6-f71c-61913242f257@kapsi.fi>
References: <20170818161553.27597-1-mperttunen@nvidia.com>
 <20170818161553.27597-2-mperttunen@nvidia.com>
 <d6d10aec-3d2a-99b3-a23d-41147478f412@gmail.com>
 <5ff98485-e8ac-75e0-ca8f-3887f8593ec4@kapsi.fi>
 <0c3682ea-3faf-0f36-eec0-3b5cf49c855c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0c3682ea-3faf-0f36-eec0-3b5cf49c855c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 08/19/2017 01:09 PM, Dmitry Osipenko wrote:
> On 19.08.2017 11:10, Mikko Perttunen wrote:
> [snip]
>>>> +    host1x_hw_syncpt_set_protection(host, true);
>>>
>>> Is it really okay to force the protection? Maybe protection should be enabled
>>> with a respect to CONFIG_TEGRA_HOST1X_FIREWALL? In that case we would have to
>>> avoid software jobs validation for Tegra124+.
>>
>> I don't quite get your comment. The hardware syncpt protection layer being
>> enabled should never hurt - it doesn't mess with any valid jobs. It's also only
>> on Tegra186 so I'm not sure where the Tegra124 comes from.
> 
> Right, it's the gather filter on T124+, my bad. This raises several questions.
> 
> 1) Why we have CONFIG_TEGRA_HOST1X_FIREWALL? Should it be always enforced or we
> actually want to be a bit more flexible and allow to disable it. Imagine that
> you are making a custom application and want to utilize channels in a different way.

I think it should be up to the user to decide whether they want the 
firewall or not. It's clearly the most useful on the older chips - 
especially Tegra20 due to lack of IOMMU. The performance penalty is too 
great to force it on always.

The programming model should always be considered the same - the rules 
of what you are allowed to do are the same whether the firewall, or any 
hardware-implemented protection features, are on or not.

> 
> 2) Since syncpoint protection is a T186 feature, what about previous
> generations? Should we validate syncpoints in software for them? We have
> 'syncpoint validation' patch staged in grate's kernel
> https://github.com/grate-driver/linux/commit/c8b6c82173f2ee9fead23380e8330b8099e7d5e7
> (I'll start sending out this and other patches after a bit more thorough
> testing.) Improperly used syncpoints potentially could allow one program to
> damage others.

Yes, I think the firewall should have this feature for older 
generations. We could disable the check on Tegra186, as you point 
towards in question 4.

> 
> 3) What exactly does gather filter? Could you list all the commands that it
> filters out, please?

According to the Tegra186 TRM (section 16.8.32), SETCLASS, SETSTRMID and 
EXTEND are filtered.

> 
> 4) What about T30/T114 that do not have gather filter? Should we validate those
> commands for them in a software firewall?

Yes, the firewall should validate that.

> 
> So maybe we should implement several layers of validation in the SW firewall.
> Like all layers for T20 (memory boundaries validation etc), software gather
> filter for T30/114 and software syncpoint validation for T30/114/124/210.
> 

That seems like a good idea.

Thanks,
Mikko
