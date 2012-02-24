From: Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: PCIe device tree support
Date: Fri, 24 Feb 2012 22:46:06 +0530
Message-ID: <CAHM4w1k1_Yp56tpfPqDxT1WHQWRB5xe_Zs-BEj+n5rVmuyAJiw@mail.gmail.com>
References: <20120220191804.GA14499@avionic-0098.adnet.avionic-design.de>
	<74CDBE0F657A3D45AFBB94109FB122FF17BD8BC302@HQMAIL01.nvidia.com>
	<20120222082449.GA15157@avionic-0098.adnet.avionic-design.de>
	<CAErSpo4TfpGmx+HZ1ZnZwj3ZP_cQMCzkMT+6JK6ztYp2zWJcxw@mail.gmail.com>
	<20120223060355.GA21091@avionic-0098.mockup.avionic-design.de>
	<CAErSpo7wSB-uCjV4YeA-fUOHPtugn4ASXScN3MndVybfkk8mOw@mail.gmail.com>
	<20120224065921.GA28932@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120224065921.GA28932-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I too had similar query.
I have written a PCIe host driver for SPEAr platform (ARM Arch).
This driver is registered on paltform bus.
It is for Designware IP, so I believe that most of its part
can be re-usaable for other person.
 have kept common and SPEAr specific part separately.
But,  I am not sure about its best location.
I believe best would have been to keep in driver/pci/pcie/hosts/.
But it uses pci_common_init function which is specific to ARM platform.
So it limits option to arch/arm.
But, if I keep it in arch/arm/mach-spear13xx/ , then it will limit others
from using synopsys specific code.

What do you suggest?

Regards
Pratyush


On Fri, Feb 24, 2012 at 12:29 PM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> * Bjorn Helgaas wrote:
>> I agree that if the code isn't shared at all, there's no point in
>> putting it in a generic place like drivers/pci/.
>
> Alright, I'll keep the driver in arch/arm/mach-tegra/ then.
>
> Thierry
