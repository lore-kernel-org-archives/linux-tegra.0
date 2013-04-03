From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: CPU idle LP2 breaks MSI on TrimSlice
Date: Wed, 3 Apr 2013 16:14:17 +0800
Message-ID: <1364976857.16957.56.camel@jlo-ubuntu-64.nvidia.com>
References: <20130403075454.GA25174@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130403075454.GA25174-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-04-03 at 15:54 +0800, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> Hi Joseph,
> 
> I didn't want to hijack the other thread, so I'm starting a new one.
> I've recently been trying to get the PCIe ethernet device on TrimSlice
> working on top of the Tegra PCIe rework patches that I've been carrying
> for quite a while.
> 
> A bit of background: when I last tried this back in January things still
> worked fine, but I noticed that they aren't working on recent linux-next
> versions. I was able to track down next-20130123 as the last working
> version and next-20130128 as the first broken one (anything in between
> didn't boot properly).
> 
> It turns out that the introduction of CPU idle (LP2) seems to have
> introduced this breakage. Normally what I'd do is:
> 
> 	$ ifconfig eth0 up
> 
> and wait for a few seconds for the kernel to report that a link has been
> detected, after which running
> 
> 	$ dhcpcd eth0
> 
> will successfully obtain an IP address. However, with the CPU idle
> support enabled, the network interface no longer detects a link. The
> reason for this is that the MSI that would usually occur after link
> detection by the hardware never occurs when LP2 is enabled.
> 
> I've verified on top of next-20130402 that commenting out entry "1" in
> tegra_idle_states (LP2) in cpuidle-tegra20.c "fixes" the issue. I'm able
> to obtain an IP address via DHCP and use the network interface as usual.
> 
> I already talked to Stephen and Peter about this on IRC and none of us
> could come up with a good explanation. Since you wrote the CPU idle
> support I thought you might be able to shed some light on this.
> 
Do you mean after enabling CPU idle LP2 the PCIe ethernet driver not
work anymore? Does the driver use any runtime PM and generic power
domain that hook to the LP2 state of CPU idle?

Can you point me out the driver source? Because I don't have any device
that support PCIe interface. I may not have chance to repo this. But
normally, the idle driver should not break driver.

BTW, you can also check the minimal interval to keep the connection
alive. For Tegra20, it need at lease 10 mS for CPU cluster power down.
It means when CPU go into LP2, even there is an interrupt wake up him
immediately. The CPU need to wait for power ready. It's 10mS. Only
Tegra20 had this limitation.
