From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: PCIe MSI support
Date: Thu, 24 Nov 2011 14:42:45 -0800
Message-ID: <CAOesGMjDFsAvvUg8tMt+MbwODVoz3SmW0gqcRsCdD_Zhcz5p4Q@mail.gmail.com>
References: <20111124195704.GA15417@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111124195704.GA15417-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Thu, Nov 24, 2011 at 11:57 AM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> Hi,
>
> I was wondering whether anyone had gotten MSI to work with Tegra2? The code
> in arch/arm/mach-tegra/pcie.c has some comments saying that it currently
> isn't supported.
>
> Looking through the Tegra2 TRM didn't show much related to MSI. In particular
> there doesn't seem to be any mention of the AFI controller or any of it's
> registers (except of how to enable/disable the AFI clock or reset the
> controller).
>
> Furthermore I wasn't able to get PCIe to work on Harmony with a mainline
> kernel. Is something missing or am I just doing something wrong?

I think there might be an issue with regulator setup for pci-e, I got
a vague bug report off-list from someone about it but I'm normally not
using devices with pci-e on them myself.

Note that trimslice does enable pci-e, so you can use that for comparison.

> I can make
> it work with the Vibrante kernel, but that doesn't have MSI support either.
> Since we're looking at designing an evaluation board with PCIe support I'm
> very interested in seeing this supported in mainline. If there's anything I
> can do to help, please let me know. Also if anyone can provide more insight
> than the TRM, that would be great.

I have no idea if MSI is supported or not. You are aware of the errata
list for PCI-e on Tegra though, right? You might want to consider the
implications of said problems before you decide to use PCI-e on a
product.

On more MSI details; I suggest you try to get access to internal
information through your Nvidia FAE -- I don't have any more
information on it than you do but if I wanted to find out that is the
route I would take myself.


Regards,

-Olof
