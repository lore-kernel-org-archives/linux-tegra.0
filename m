From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: PCIe MSI support
Date: Fri, 2 Dec 2011 10:55:01 -0800
Message-ID: <CAOesGMgoYKnv+ATSx9dnShqXJyjW1X1MoVB=bydBoCcH-rDb2w@mail.gmail.com>
References: <20111124195704.GA15417@avionic-0098.adnet.avionic-design.de>
	<CAOesGMjDFsAvvUg8tMt+MbwODVoz3SmW0gqcRsCdD_Zhcz5p4Q@mail.gmail.com>
	<20111202074342.GB10768@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111202074342.GB10768-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Thu, Dec 1, 2011 at 11:43 PM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> * Olof Johansson wrote:
>> Hi,
>>
>> On Thu, Nov 24, 2011 at 11:57 AM, Thierry Reding
>> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>> > Hi,
>> >
>> > I was wondering whether anyone had gotten MSI to work with Tegra2? The code
>> > in arch/arm/mach-tegra/pcie.c has some comments saying that it currently
>> > isn't supported.
>> >
>> > Looking through the Tegra2 TRM didn't show much related to MSI. In particular
>> > there doesn't seem to be any mention of the AFI controller or any of it's
>> > registers (except of how to enable/disable the AFI clock or reset the
>> > controller).
>> >
>> > Furthermore I wasn't able to get PCIe to work on Harmony with a mainline
>> > kernel. Is something missing or am I just doing something wrong?
>>
>> I think there might be an issue with regulator setup for pci-e, I got
>> a vague bug report off-list from someone about it but I'm normally not
>> using devices with pci-e on them myself.
>
> I've verified with a hardware engineer that the voltages indeed seem correct.
> Even the PCIe reference clock can be measured at the mini-PCIe connectors. So
> something must be going right.

Ok, that's interesting. I haven't had a chance to give my harmony a
spin with a pci-e card here lately, I'll try to give it a go as soon
as I can but it'll be a few more days.

>> Note that trimslice does enable pci-e, so you can use that for comparison.
>
> Trimslice doesn't seem to do much regarding PCIe initialization. It basically
> just calls the tegra_pcie_init() and has the pinmuxing set up via the pinmux
> table as opposed to Harmony.

Right.

> I'm thinking about ordering a Trimslice to use for comparison. Has anyone
> else verified that mainline has working PCIe for Trimslice? I think Mike
> Rapoport is no longer a regular on this list. His last commits seem to
> indicate that PCIe was working on Harmony as well at the time, so I'm a
> little confused about what might have happened since then.

PCI-e works on mainline on trimslice, I have verified that myself. It
has ethernet on pci-e, and both u-boot and the kernel can use it.



Regards,

Olof
