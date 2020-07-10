From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH 15/23] seq_file: switch over direct seq_read method
 calls to seq_read_iter
Date: Fri, 10 Jul 2020 14:58:13 +0200
Message-ID: <20200710125813.GA8246@lst.de>
References: <20200707174801.4162712-1-hch@lst.de> <20200707174801.4162712-16-hch@lst.de> <5a2a97f1-58b5-8068-3c69-bb06130ffb35@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5a2a97f1-58b5-8068-3c69-bb06130ffb35-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Luis Chamberlain <mcgrof-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Iurii Zaikin <yzaikin-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 10, 2020 at 01:55:29PM +0100, Jon Hunter wrote:
> Following this change, I have noticed that several debugfs entries can
> no longer be read on some Tegra platforms. For example ...
> 
> $ sudo cat /sys/kernel/debug/usb/xhci/3530000.usb/event-ring/cycle
> cat: /sys/kernel/debug/usb/xhci/3530000.usb/event-ring/cycle: Invalid
> argument
> 
> $ sudo cat /sys/kernel/debug/emc/available_rates
> 
> 
> cat: /sys/kernel/debug/emc/available_rates: Invalid argument
> 
> $ sudo cat /sys/kernel/debug/bpmp/debug/proc/testint
> cat: /sys/kernel/debug/bpmp/debug/proc/testint: Invalid argument
> 
> $ sudo cat /sys/kernel/debug/pcie/ports
> 
> 
> cat: /sys/kernel/debug/pcie/ports: Invalid argument
> 
> I have reverted the above drivers to use seq_read() instead of
> seq_read_iter() and they work again. Have you seen any problems with this?

I haven't seen any of that.  But some of these files should also
exist on x86, so let me try to reproduce it.
