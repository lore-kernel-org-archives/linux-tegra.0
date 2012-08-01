From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 09/10] of: Add of_pci_parse_ranges()
Date: Wed, 01 Aug 2012 10:07:27 -0600
Message-ID: <5019543F.3080601@wwwdotorg.org>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de> <1343332512-28762-10-git-send-email-thierry.reding@avionic-design.de> <50183B03.2090809@gmail.com> <20120801065437.GB26791@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120801065437.GB26791-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/01/2012 12:54 AM, Thierry Reding wrote:
> On Tue, Jul 31, 2012 at 03:07:31PM -0500, Rob Herring wrote:
>> On 07/26/2012 02:55 PM, Thierry Reding wrote:
>>> This new function parses the ranges property of PCI device
>>> nodes into an array of struct resource elements. It is useful
>>> in multiple-port PCI host controller drivers to collect
>>> information about the ranges that it needs to forward to the
>>> respective ports.
>> 
>> It seems to me that some of the DT PCI code in
>> arch/powerpc/kernel/pci* like pci_process_bridge_OF_ranges()
>> should apply for ARM as well.
>> 
>> Each arch defining their own pci controller structs complicates
>> this, but I would think at least the DT parsing can be common.
> 
> Yes, there's quite a lot of room for refactoring. When I first
> started work on this there had been some discussion about whether
> it would make sense to move PCI controller drivers into a common
> location to make it easier to refactor but the consensus at the
> time was that this should not be done.

In the long term, if we end up with a separate arch/aarch64/, I think
we'll have to move the PCIe (and any other) drivers to a common
location. Still, I imagine there is plenty of time until that's mandatory.
