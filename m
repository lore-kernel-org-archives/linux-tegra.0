From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 01/10] PCI: Keep pci_fixup_irqs() around after init
Date: Fri, 07 Sep 2012 10:19:46 -0600
Message-ID: <504A1EA2.9030008@wwwdotorg.org>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de> <1343332512-28762-2-git-send-email-thierry.reding@avionic-design.de> <CAErSpo7v+i8i=mXCs7ZW8DtGTDN_4AEntwYLqGG8FcCzweySFg@mail.gmail.com> <20120815192814.GA12870@avionic-0098.mockup.avionic-design.de> <CAErSpo6cjOzJegJqXzmk59DChExcbLK1sOhwyAyQL4FZkTN21A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAErSpo6cjOzJegJqXzmk59DChExcbLK1sOhwyAyQL4FZkTN21A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/15/2012 01:42 PM, Bjorn Helgaas wrote:
> On Wed, Aug 15, 2012 at 1:28 PM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>> On Wed, Aug 15, 2012 at 10:06:27AM -0700, Bjorn Helgaas wrote:
>>> On Thu, Jul 26, 2012 at 12:55 PM, Thierry Reding
>>> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>>>> When using deferred driver probing, PCI host controller drivers may
>>>> actually require this function after the init stage.
>>>>
>>>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>>>> ---
>>>> Changes in v3:
>>>> - none
>>>>
>>>> Changes in v2:
>>>> - use __devinit annotations
>>>
>>> Your original patch removed __init completely.  Here you change it to
>>> __devinit.  That means we decide whether to discard the function based
>>> on whether CONFIG_HOTPLUG is supported.  But I think your point is not
>>> about hotplug; it's merely that we should be able to scan a PCI bus
>>> after init-time.  We ought to be able to do a late PCI scan even if
>>> hotplug is not supported.
>>>
>>> Therefore, I'd be inclined to remove __init completely unless you have
>>> another reason for preferring __devinit.
>>
>> I thought __devinit would resolve to nothing if HOTPLUG is defined and
>> __init otherwise. That seemed more appropriate. However you are right
>> that it is useful to always have it available, so I'm fine with removing
>> the annotations altogether. Do you want me to follow up with a patch? Or
>> can you just take the first version? I'm not sure if it still applies.
> 
> You're right about how __devinit works.  It's just that I don't think
> hotplug is actually relevant here.  We're trying to make
> pci_fixup_irqs() work after init, whether it's because of hotplug or
> simply because the arch scans host bridges after init.
> 
> I applied this to my "next" branch.  Thanks!

Bjorn, I don't see this patch in next-20120907. Did it get dropped for
some reason?

For the full history, see: http://patchwork.ozlabs.org/patch/173495/.

Thanks.
