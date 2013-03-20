From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Reboot/shutdown failure due to "USB: EHCI: work around silicon
 bug in Intel's EHCI"
Date: Wed, 20 Mar 2013 10:40:04 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1303201026310.1701-100000@iolanthe.rowland.org>
References: <5148F7A1.2090901@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5148F7A1.2090901-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andreas Bombe <aeb-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 19 Mar 2013, Stephen Warren wrote:

> On 03/19/2013 04:48 PM, Stephen Warren wrote:
> > On 03/19/2013 02:07 PM, Alan Stern wrote:
> ...
> >> A dmesg log with CONFIG_USB_DEBUG enabled would be helpful.  We ought
> >> to be able to tell where khubd is getting stuck.
> > 
> > Hmmm. Enabling CONFIG_USB_DEBUG appears to mask the problem. I assume
> > this is some kind of timing/race condition, unless there's some code
> > with required side-effects hiding under ifdef CONFIG_USB_DEBUG somehow?
> 
> Some further information: I added some printks, which are hopefully
> obvious from the text below, and in the failing case, I see:
> 
> > [    1.291277] single_unlink_async: qh ee31bc40 qh_state set to UNLINK_WAIT
> > [    1.297960] start_iaa_cycle: qh ee31bc40 qh_state changing UNLINK_WAIT -> UNLINK
> ...
> > [    6.452331] ehci_urb_dequeue: qh ee31bc40 attempting dequeue (qh_stated 2)
> 
> This is with CONFIG_USB_DEBUG disabled. That seems to happen to the very
> first (and only) URB(?) ever issued.

There should be a call to ehci_end_async_unlink shortly after 
start_iaa_cycle.

> If I enable CONFIG_USB_DEBUG, then I see the more expected:
> 
> > [    1.540410] single_unlink_async: qh ee0c0300 qh_state set to UNLINK_WAIT
> > [    1.547094] start_iaa_cycle: qh ee0c0300 qh_state changing UNLINK_WAIT -> UNLINK
> > [    1.554487] start_iaa_cycle: qh ee0c0300 qh_state was UNLINK; processing
> 
> followed by a whole slew of subsequent URBs being submitted and processed.
> 
> Perhaps the issue is that start_iaa_cycle() (or whatever triggers it)
> only happens when there's an URB in state UNLINK, but not when there's
> only one in state UNLINK_WAIT, so that it only happens once rather than
> the required twice? I'm not sure why a timing difference would affect
> this though, unless there's some loop in the IAA processing that happens
> to do both the UNLINK_WAIT->UNLINK change, and the processing of the URB
> in the UNLINK state in one invocation sometimes, but not others?

A possible explanation for a timing difference is that the IAA
mechanism simply isn't working right on your controller, so the IAA
watchdog timer expires.  It's worth pointing out that your second log
excerpt above has messages spaced at intervals of 7 ms, which is
strange considering that the second line should get printed almost
immediately after the first.  Excessively long delays like this do
point in the direction of a timer expiration.

Anyway, there _is_ a mistake in the "work around silicon bug" patch; I
forgot to update the timeout handler.  Does the patch below help?  You 
should build it without CONFIG_USB_DEBUG; I changed the ehci_vdbg to 
ehci_info so that it would show up in the log regardless and we can see 
if it gets triggered.

(Sven, this patch should replace the one I sent you earlier.)

Alan Stern



Index: 3.8/drivers/usb/host/ehci-timer.c
===================================================================
--- 3.8.orig/drivers/usb/host/ehci-timer.c
+++ 3.8/drivers/usb/host/ehci-timer.c
@@ -305,7 +305,8 @@ static void ehci_iaa_watchdog(struct ehc
 	 * (a) SMP races against real IAA firing and retriggering, and
 	 * (b) clean HC shutdown, when IAA watchdog was pending.
 	 */
-	if (ehci->async_iaa) {
+//	if (ehci->async_iaa) {
+	if (1) {
 		u32 cmd, status;
 
 		/* If we get here, IAA is *REALLY* late.  It's barely
@@ -329,7 +330,7 @@ static void ehci_iaa_watchdog(struct ehc
 			ehci_writel(ehci, STS_IAA, &ehci->regs->status);
 		}
 
-		ehci_vdbg(ehci, "IAA watchdog: status %x cmd %x\n",
+		ehci_info(ehci, "IAA watchdog: status %x cmd %x\n",
 				status, cmd);
 		end_unlink_async(ehci);
 	}

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
