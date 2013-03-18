From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Reboot/shutdown failure due to "USB: EHCI: work around silicon bug
 in Intel's EHCI"
Date: Mon, 18 Mar 2013 14:06:21 -0600
Message-ID: <514773BD.6010803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Alan,

In v3.9-rc3, I find that "reboot" and "shutdown" hang on Tegra. I
bisected it to commit 6402c79 "USB: EHCI: work around silicon bug in
Intel's EHCI controllers", and confirmed that running v3.9-rc3 with just
that one patch reverted does solve the problem.

Do you have any idea what the problem might be, or is there anything I
can do to help debug this? Thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
