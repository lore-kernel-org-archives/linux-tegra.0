From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: CPU idle LP2 breaks MSI on TrimSlice
Date: Wed, 03 Apr 2013 10:41:44 -0600
Message-ID: <515C5BC8.3040902@wwwdotorg.org>
References: <20130403075454.GA25174@avionic-0098.mockup.avionic-design.de>  <1364976857.16957.56.camel@jlo-ubuntu-64.nvidia.com>  <20130403084036.GA28417@avionic-0098.mockup.avionic-design.de> <1364980234.16957.75.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364980234.16957.75.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/03/2013 03:10 AM, Joseph Lo wrote:
> On Wed, 2013-04-03 at 16:40 +0800, Thierry Reding wrote:
>> On Wed, Apr 03, 2013 at 04:14:17PM +0800, Joseph Lo wrote:
>>> On Wed, 2013-04-03 at 15:54 +0800, Thierry Reding wrote:
>>> BTW, you can also check the minimal interval to keep the connection
>>> alive. For Tegra20, it need at lease 10 mS for CPU cluster power down.
>>> It means when CPU go into LP2, even there is an interrupt wake up him
>>> immediately. The CPU need to wait for power ready. It's 10mS. Only
>>> Tegra20 had this limitation.
>>
>> Okay, theoretically we could have something like the following sequence:
>>
>>   1) user runs "ifconfig eth0 up"
>>   2) driver programs network interface to bring up link
>>   3) driver waits for IRQ
>>   4) CPU goes to idle
>>   5) MSI is received
> 5.5) interrupt delivered to interrupt controller
>>   6) CPU is woken up by interrupt controller
>>   7) CPU needs 10 ms before power is ready
> (The 10mS is the interval for PMIC to make the power of vdd_cpu rail
> ready.)
> 8) CPU handle the ISR of MSI or R8169.
> 
> I am not sure the time interval cause some functions can't work anymore
> on MSI or R8169. If this is the case, you may need a work around to
> trigger interrupt more frequently to make CPU not go into LP2 when PCIe
> ethernet working.
> 
> BTW, the interrupt shouldn't lost, I didn't see this case before. The
> device interrupt was always routed to CPU0.

Joseph,

The legacy interrupt controller steers interrupts to either the A9 CPUs
or the AVP. Does this legacy controller lose power when the A9 CPUs
enter LP2? If so, does it need reprogramming when resuming the A9 CPUs
from LP2?

Thierry,

I wonder if there's a way to look at the R8169 registers to see if the
interrupt status is present in its registers and it's simply that the
CPU didn't see the MSI?

Perhaps you can also check the legacy interrupt controller status
registers to see what's up. In particular:

a) Is the MSI interrupt configured to be steered to the A9s not the AVP?

b) Is the AVP status bit for that interrupt set?

References such as arch/arm/mach-tegra/irq.c and Tegra20 TRM section 3.2
would probably help in working that out. Also see Joseph's
recently-posted system suspend patches which add some suspend/resume
logic for the legacy IRQ controller.

There's some utility to read/write raw registers, but I forget its name.
If you don't have it and can't remember its name, I can mail you the
source for an equivalent that I wrote before I knew about it(!).
