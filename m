From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 08/10] of/address: Handle #address-cells > 2 specially
Date: Fri, 07 Sep 2012 10:24:04 -0600
Message-ID: <504A1FA4.9040302@wwwdotorg.org>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de> <1343332512-28762-9-git-send-email-thierry.reding@avionic-design.de> <50183DA3.8020308@gmail.com> <20120815200655.GC12870@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120815200655.GC12870-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/15/2012 02:06 PM, Thierry Reding wrote:
> On Tue, Jul 31, 2012 at 03:18:43PM -0500, Rob Herring wrote:
>> On 07/26/2012 02:55 PM, Thierry Reding wrote:
>>> When a bus specifies #address-cells > 2, of_bus_default_map()
>>> now assumes that the mapping isn't for a physical address but
>>> rather an identifier that needs to match exactly.
>>> 
>>> This is required by bindings that use multiple cells to
>>> translate a resource to the parent bus (device index, type,
>>> ...).
>>> 
>>> See here for the discussion:
>>> 
>>> https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-June/016577.html
>>>
>>>
>>> 
Originally-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>>> Signed-off-by: Thierry Reding
>>> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>> 
>> Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Hi Rob,
> 
> Were you going to take this through your DT tree? I'm trying to
> reduce the number of patches in this series to make it more
> manageable and split it into smaller chunks. There are also a
> couple of issues that need to be resolved so I don't know if I can
> get the whole series into shape for 3.7.
> 
> However if you don't think this patch is useful to be applied by
> itself I can also carry it until the complete series is ready.

Rob,

Are you able to take this patch now for 3.7, or should it be held off
until the Tegra PCIe driver is re-written and requires this
functionality (in which case I'd expect to take this through the Tegra
tree at that time).

For reference, it's at http://patchwork.ozlabs.org/patch/173497/.

Thanks.
