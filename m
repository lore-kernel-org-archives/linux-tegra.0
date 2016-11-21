From: Lamar Hansford <Lamar.Hansford-2/lGf/aFiT5Wk0Htik3J/w@public.gmane.org>
Subject: Terga 30 CPI Issue
Date: Mon, 21 Nov 2016 16:10:22 +0000
Message-ID: <F9D95AC275991E48901933FBF3337AB0C2D6DF02@ex-02>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello,
I am using a Terga 30 with multiple PCIe cards.  I am experiencing a hard (non-recoverable) lock-up which occurs whenever the following wr/rd sequence is followed:
* wr(a) -> rd(a)

Where you write then immediately read the same address.  Validated by GPIO write before and after (2nd GPIO change never happens).

I have removed this sequence from my driver (ath9k) and the device is stable for days with a single card.  However, when (multiple cards are added (same type) the lock-up still occurs.

It appears that the AXI bus is hung, preventing execution by any of the cores.
I see that there is a register FPCI_TIMEOUT defined in the spec.  I hope that by enabling the bus timeout I can get the system to gracefully recover.  But I cannot determine which register location it is mapped to.

* Is this an internally mapped setting?
* If not what register?  Is there a way to set this

I do see where the interrupt can be enabled but not the FPCI Timeout register itself (section 32.4.1.1).

Any help would be appreciated,
-Lamar


This email and any attachments may contain private, confidential and privileged material for the sole use of the intended recipient. If you are not the intended recipient, please immediately delete this email and any attachments.
