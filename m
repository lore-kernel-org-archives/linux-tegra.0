From: Laurentiu Tudor <laurentiu.tudor-3arQi8VN3Tc@public.gmane.org>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Date: Wed, 4 Mar 2020 15:48:53 +0200
Message-ID: <fb4d4ab5-0b9f-5912-a4c1-2f18bf273e11@nxp.com>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200228025700.GA856087@builder>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King - ARM Linux admin <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Diana Craciun <diana.craciun-0KzQaVfr69FBDgjK7y7TUQ@public.gmane.org>, Ioana Ciornei <ioana.ciornei-3arQi8VN3Tc@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello,

On 28.02.2020 04:57, Bjorn Andersson wrote:
> On Mon 09 Dec 07:07 PST 2019, Thierry Reding wrote:
> 
>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
> 
> Sorry for the slow response on this, finally got the time to go through
> this in detail and try it out on some Qualcomm boards.
> 
>> On some platforms, the firmware will setup hardware to read from a given
>> region of memory. One such example is a display controller that is
>> scanning out a splash screen from physical memory.
>>
> 
> This particular use case is the one that we need to figure out for
> Qualcomm devices as well; on some devices it's a simple splash screen
> (that on many devices can be disabled), but for others we have EFIFB
> on the display and no (sane) means to disable this.
> 
>> During Linux' boot process, the ARM SMMU will configure all contexts to
>> fault by default. This means that memory accesses that happen by an SMMU
>> master before its driver has had a chance to properly set up the IOMMU
>> will cause a fault. This is especially annoying for something like the
>> display controller scanning out a splash screen because the faults will
>> result in the display controller getting bogus data (all-ones on Tegra)
>> and since it repeatedly scans that framebuffer, it will keep triggering
>> such faults and spam the boot log with them.
>>
> 
> As my proposed patches indicated, the Qualcomm platform boots with
> stream mapping setup for the hardware used by the bootloader, but
> relying on the associated context banks not being enabled.
> 
> USFCFG in SCR0 is set and any faults resulting of this will trap into
> secure world and the device will be reset.
> 
>> In order to work around such problems, scan the device tree for IOMMU
>> masters and set up a special identity domain that will map 1:1 all of
>> the reserved regions associated with them. This happens before the SMMU
>> is enabled, so that the mappings are already set up before translations
>> begin.
>>
>> One thing that was pointed out earlier, and which I don't have a good
>> idea on how to solve it, is that the early identity domain is not
>> discarded. The assumption is that the standard direct mappings code of
>> the IOMMU framework will replace the early identity domain once devices
>> are properly attached to domains, but we don't have a good point in time
>> when it would be safe to remove the early identity domain.
>>
>> One option that I can think of would be to create an early identity
>> domain for each master and inherit it when that master is attached to
>> the domain later on, but that seems rather complicated from an book-
>> keeping point of view and tricky because we need to be careful not to
>> map regions twice, etc.
>>
> 
> The one concern I ran into with this approach (after resolving below
> issues) is that when the display driver probes a new domain will be
> created automatically and I get a stream of "Unhandled context fault" in
> the log until the driver has mapped the framebuffer in the newly
> allocated context.
> 
> This is normally not a problem, as we seem to be able to do this
> initialization in a few frames, but for the cases where the display
> driver probe defer this is a problem.

Also gave this a go on one of NXP's layerscape platforms, and 
encountered the same issue. However, given that in our case it's not 
about a framebuffer device but a firmware, it cause it to crash. :-(

Another apparent problem is that in the current implementation only one 
memory-region per device is supported. Actually it appears that this is 
a limitation of the DT reservation binding - it doesn't seem to allow 
specifying multiple regions per device. In our firmware case we would 
need support for multiple reserved regions (FW memory, FW i/o registers 
a.s.o).

---
Best Regards, Laurentiu
