From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: CPU idle LP2 breaks MSI on TrimSlice
Date: Wed, 3 Apr 2013 17:10:34 +0800
Message-ID: <1364980234.16957.75.camel@jlo-ubuntu-64.nvidia.com>
References: <20130403075454.GA25174@avionic-0098.mockup.avionic-design.de>
	 <1364976857.16957.56.camel@jlo-ubuntu-64.nvidia.com>
	 <20130403084036.GA28417@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130403084036.GA28417-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-04-03 at 16:40 +0800, Thierry Reding wrote:
> On Wed, Apr 03, 2013 at 04:14:17PM +0800, Joseph Lo wrote:
> > On Wed, 2013-04-03 at 15:54 +0800, Thierry Reding wrote:
> > BTW, you can also check the minimal interval to keep the connection
> > alive. For Tegra20, it need at lease 10 mS for CPU cluster power down.
> > It means when CPU go into LP2, even there is an interrupt wake up him
> > immediately. The CPU need to wait for power ready. It's 10mS. Only
> > Tegra20 had this limitation.
> 
> Okay, theoretically we could have something like the following sequence:
> 
>   1) user runs "ifconfig eth0 up"
>   2) driver programs network interface to bring up link
>   3) driver waits for IRQ
>   4) CPU goes to idle
>   5) MSI is received
5.5) interrupt delivered to interrupt controller
>   6) CPU is woken up by interrupt controller
>   7) CPU needs 10 ms before power is ready
(The 10mS is the interval for PMIC to make the power of vdd_cpu rail
ready.)
8) CPU handle the ISR of MSI or R8169.

I am not sure the time interval cause some functions can't work anymore
on MSI or R8169. If this is the case, you may need a work around to
trigger interrupt more frequently to make CPU not go into LP2 when PCIe
ethernet working.

BTW, the interrupt shouldn't lost, I didn't see this case before. The
device interrupt was always routed to CPU0.

You may check the interrupt interval in the case. And the interrupt
number is still counted or not when CPU idle LP2 enabled.


> No matter how long the CPU needs to wake up. Or maybe I didn't
> understand what you were saying.
> 
> Thierry
> 
> [0]: https://gitorious.org/thierryreding/linux/blobs/tegra/next/drivers/pci/host/pci-tegra.c
> 
> * Unknown Key
> * 0x7F3EB3A1
