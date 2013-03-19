From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Reboot/shutdown failure due to "USB: EHCI: work around silicon
 bug in Intel's EHCI"
Date: Tue, 19 Mar 2013 16:07:25 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1303191604530.1302-100000@iolanthe.rowland.org>
References: <5148B338.6070001@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5148B338.6070001-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 19 Mar 2013, Stephen Warren wrote:

> Yes, sysrq seems to work over the serial console:-)
> 
> >  * Will now restart
> > 
> > *** break sent ***
> > [  180.765213] SysRq : Show Blocked State
> > [  180.768963]   task                PC stack   pid father
> > [  180.774182] khubd           D c0517678     0    21      2 0x00000000
> > [  180.780559] [<c0517678>] (__schedule+0x348/0x6dc) from [<c02ebc90>] (usb_kill_urb+0x88/0xd4)
> > [  180.788984] [<c02ebc90>] (usb_kill_urb+0x88/0xd4) from [<c02ecb70>] (usb_start_wait_urb+0xa4/0x13c)
> > [  180.798012] [<c02ecb70>] (usb_start_wait_urb+0xa4/0x13c) from [<c02ecd98>] (usb_control_msg+0x98/0xcc)
> > [  180.807301] [<c02ecd98>] (usb_control_msg+0x98/0xcc) from [<c02e4394>] (hub_port_init+0x5e0/0x9d0)
> > [  180.816242] [<c02e4394>] (hub_port_init+0x5e0/0x9d0) from [<c02e6640>] (hub_port_connect_change+0x1f4/0x970)
> > [  180.826050] [<c02e6640>] (hub_port_connect_change+0x1f4/0x970) from [<c02e70fc>] (hub_events+0x340/0x8c4)
> > [  180.835598] [<c02e70fc>] (hub_events+0x340/0x8c4) from [<c02e76a8>] (hub_thread+0x28/0x1b8)
> > [  180.843941] [<c02e76a8>] (hub_thread+0x28/0x1b8) from [<c0041268>] (kthread+0xa4/0xb0)

> I assume you only want the back-traces, not the reset of the sysrq spew?

Yes.  It looks like khubd is your problem.

> BTW, I have also occasionally noticed some either hung task or RCU spew
> related to usb_kill_urb at other times (i.e. when not rebooting), IIRC
> (which I may not; I may be remembering what happens if I just leave the
> reboot hung for a few minutes, as shown below):
> 
> > [  240.670335] INFO: task khubd:21 blocked for more than 120 seconds.
> > [  240.676516] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > [  240.684336] khubd           D c0517678     0    21      2 0x00000000

Right.  It's another symptom of the same thing.  This problem occurs 
well before shutdown -- something is causing khubd to hang and that 
messes up everything else.

A dmesg log with CONFIG_USB_DEBUG enabled would be helpful.  We ought
to be able to tell where khubd is getting stuck.

Alan Stern
