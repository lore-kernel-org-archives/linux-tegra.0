From: "devendra.aaru" <devendra.aaru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm: mach-tegra: check wether we have debugfs enabled or not
Date: Wed, 17 Oct 2012 16:18:40 -0400
Message-ID: <CAHdPZaPa9CNL91oYmCi1wdPcZYB3kEGV52RDsy04WCOhPUWfxA@mail.gmail.com>
References: <1350501196-5632-1-git-send-email-devendra.aaru@gmail.com>
	<20121017201244.GN21164@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121017201244.GN21164-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 17, 2012 at 4:12 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
>
> So, you want to make this function hard-fail if a debugfs error occurs
> _or_ debugfs is not configured?  That doesn't seem to be a clever thing
> to do.


I was seeing some places where the check is only for the pointer null
or valid one that is returned by
the debugfs_create_file, and fixed it up using this macro by failing
out even if we dont have debugfs
enabled in kernel.

I am sure that i really dont' know any part of the ARM stuff, tried to
fix this too, because this function
also checks for the null pointer if debugfs_create_file failed to
create a file in debugfs and fails out if
it can't be able to create that, but it wont check for whether we have
debugfs enabled in kernel.

thanks,
