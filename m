From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Reboot/shutdown failure due to "USB: EHCI: work around silicon
 bug in Intel's EHCI"
Date: Tue, 19 Mar 2013 17:41:21 -0600
Message-ID: <5148F7A1.2090901@wwwdotorg.org>
References: <Pine.LNX.4.44L0.1303191604530.1302-100000@iolanthe.rowland.org> <5148EB2C.1080402@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5148EB2C.1080402-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/19/2013 04:48 PM, Stephen Warren wrote:
> On 03/19/2013 02:07 PM, Alan Stern wrote:
...
>> A dmesg log with CONFIG_USB_DEBUG enabled would be helpful.  We ought
>> to be able to tell where khubd is getting stuck.
> 
> Hmmm. Enabling CONFIG_USB_DEBUG appears to mask the problem. I assume
> this is some kind of timing/race condition, unless there's some code
> with required side-effects hiding under ifdef CONFIG_USB_DEBUG somehow?

Some further information: I added some printks, which are hopefully
obvious from the text below, and in the failing case, I see:

> [    1.291277] single_unlink_async: qh ee31bc40 qh_state set to UNLINK_WAIT
> [    1.297960] start_iaa_cycle: qh ee31bc40 qh_state changing UNLINK_WAIT -> UNLINK
...
> [    6.452331] ehci_urb_dequeue: qh ee31bc40 attempting dequeue (qh_stated 2)

This is with CONFIG_USB_DEBUG disabled. That seems to happen to the very
first (and only) URB(?) ever issued.

If I enable CONFIG_USB_DEBUG, then I see the more expected:

> [    1.540410] single_unlink_async: qh ee0c0300 qh_state set to UNLINK_WAIT
> [    1.547094] start_iaa_cycle: qh ee0c0300 qh_state changing UNLINK_WAIT -> UNLINK
> [    1.554487] start_iaa_cycle: qh ee0c0300 qh_state was UNLINK; processing

followed by a whole slew of subsequent URBs being submitted and processed.

Perhaps the issue is that start_iaa_cycle() (or whatever triggers it)
only happens when there's an URB in state UNLINK, but not when there's
only one in state UNLINK_WAIT, so that it only happens once rather than
the required twice? I'm not sure why a timing difference would affect
this though, unless there's some loop in the IAA processing that happens
to do both the UNLINK_WAIT->UNLINK change, and the processing of the URB
in the UNLINK state in one invocation sometimes, but not others?
