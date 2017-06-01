From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 14/22] gpu: host1x: Forbid relocation address shifting in
 the firewall
Date: Thu, 1 Jun 2017 21:51:44 +0300
Message-ID: <34b2d0b4-0e53-98b6-6859-34b8f3e32251@kapsi.fi>
References: <cover.1495498184.git.digetx@gmail.com>
 <15311f1c044c3ff26624e2a980b0c477b1cf33b2.1495498184.git.digetx@gmail.com>
 <56ee62e7-a53b-0270-837a-2ae6f0a848cc@kapsi.fi>
 <0a4181f5-2e19-31ed-2a8b-3314a0481c81@gmail.com>
 <58379261-a17a-fc59-e29b-c670eafbbce5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58379261-a17a-fc59-e29b-c670eafbbce5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/01/2017 09:44 PM, Dmitry Osipenko wrote:
> On 01.06.2017 21:37, Dmitry Osipenko wrote:
>> On 01.06.2017 20:39, Mikko Perttunen wrote:
>>> Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> On 05/23/2017 03:14 AM, Dmitry Osipenko wrote:
>>>> Incorrectly shifted relocation address will cause a lower memory corruption
>>>> and likely a hang on a write or a read of an arbitrary data in case of IOMMU
>>>> absent. As of now there is no use for the address shifting (at least on
>>>> Tegra20) and adding a proper shifting / sizes validation is much more work.
>>>
>>> Perhaps change to "As of now there is no use for the address shifting on
>>> Tegra20" if you post another revision.
>>>
>> I'll post a new revision of the series after getting comments to the all
>> patches, to not churn the ML. Thank you very much for the reviews!
>>
> 
> However, given your previous comments to this patch, I'll probably add a bypass
> of the shit checking in case of IOMMU presence.
> 

I don't think that's needed - the firewall will deny pretty much all VIC 
submissions due to is_addr_reg not being implemented so it cannot 
reasonably be used on modern Tegras anyway.
