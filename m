From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/7] PCI: tegra: replace devm_request_and_ioremap by devm_ioremap_resource
Date: Mon, 19 Aug 2013 14:56:45 -0600
Message-ID: <5212868D.2050604@wwwdotorg.org>
References: <1376911241-27720-1-git-send-email-Julia.Lawall@lip6.fr> <1376911241-27720-2-git-send-email-Julia.Lawall@lip6.fr> <20130819120249.GA5740@ulmo> <alpine.DEB.2.02.1308191405450.2313@hadrien> <20130819121238.GB5740@ulmo> <alpine.DEB.2.02.1308191414360.2313@hadrien> <20130819193339.GB4961@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130819193339.GB4961@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/19/2013 01:33 PM, Thierry Reding wrote:
> On Mon, Aug 19, 2013 at 02:15:39PM +0200, Julia Lawall wrote:
>> 
>> 
>> On Mon, 19 Aug 2013, Thierry Reding wrote:
>> 
>>> On Mon, Aug 19, 2013 at 02:07:54PM +0200, Julia Lawall wrote:
>>>> 
>>>> 
>>>> On Mon, 19 Aug 2013, Thierry Reding wrote:
>>>> 
>>>>> On Mon, Aug 19, 2013 at 01:20:35PM +0200, Julia Lawall
>>>>> wrote:
>>>>>> From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
>>>>>> 
>>>>>> Use devm_ioremap_resource instead of
>>>>>> devm_request_and_ioremap.
>>>>>> 
>>>>>> This was done using the semantic patch 
>>>>>> scripts/coccinelle/api/devm_ioremap_resource.cocci
>>>>>> 
>>>>>> Error-handling code was manually removed from the
>>>>>> associated calls to platform_get_resource.
>>>>>> 
>>>>>> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
>>>>>> 
>>>>>> --- The first block of modified code is followed by a
>>>>>> call to devm_request_mem_region for pcie->cs with no
>>>>>> associated ioremap.  Should ioremap be used in this case
>>>>>> as well?
>>>>> 
>>>>> No. The pcie->cs resource is 256 MiB so it's challenging to
>>>>> map it at once. Furthermore it requires a non-linear
>>>>> mapping so we do it on demand.
>>>> 
>>>> OK, thanks for the explanation.  Is the comment, though, a
>>>> little misleading, since the mapping is not done here?
>>>> 
>>>> /* request and remap configuration space */
>>> 
>>> Yes, that's misleading. Given that it doesn't really add
>>> anything useful information either, perhaps I should just
>>> remove it.
>> 
>> OK, or maybe something like
>> 
>> /* request configuration space, but remap later, on demand */
>> 
>> To make it clear that something different is intended than the 
>> devm_ioremap_resources that come just before..
> 
> Yes, that works for me too. Can you respin the patch with the
> comment updated and my Acked-by and Tested-by so Bjorn can pick it
> up?

Just a note though: Since the Tegra PCIe driver is only being added in
v3.12-rc1, and that add is happening in the Tegra/arm-soc tree, Bjorn
won't be able to accept the patch until after v3.12-rc1. Perhaps the
arm-soc tree could take the patch before then though...
