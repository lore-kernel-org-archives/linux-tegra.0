From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Reboot/shutdown failure due to "USB: EHCI: work around silicon
 bug in Intel's EHCI"
Date: Tue, 19 Mar 2013 14:34:46 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1303191420121.1302-100000@iolanthe.rowland.org>
References: <514773BD.6010803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <514773BD.6010803-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 18 Mar 2013, Stephen Warren wrote:

> Alan,
> 
> In v3.9-rc3, I find that "reboot" and "shutdown" hang on Tegra. I
> bisected it to commit 6402c79 "USB: EHCI: work around silicon bug in
> Intel's EHCI controllers", and confirmed that running v3.9-rc3 with just
> that one patch reverted does solve the problem.
> 
> Do you have any idea what the problem might be, or is there anything I
> can do to help debug this? Thanks.

Is there any way to find out where the hangup occurs?  For example, can
you get anything from Alt-SysRq-W?

Failing that, can you put some printk statements in
drivers/usb/host/ehci-hcd.c, in the ehci_halt(),
ehci_silence_controller(), and ehci_shutdown() routines?  (Although I 
suspect this may not help because the hangup occurs somewhere else...)

Alan Stern
