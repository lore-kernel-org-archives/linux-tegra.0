From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RESEND/PATCH] usb: host: ehci-tegra: fix PHY error handling
Date: Thu, 21 Mar 2013 11:19:51 -0600
Message-ID: <514B4137.2020707@wwwdotorg.org>
References: <1363868603-14525-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363868603-14525-1-git-send-email-balbi-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/21/2013 06:23 AM, Felipe Balbi wrote:
> PHY layer no longer returns NULL, we must
> switch from IS_ERR_OR_NULL() to IS_ERR().

The patches that I'll put into my topic branch are not yet complete;
Venu first posted them a couple days back and there are a number of
issues that will require a repost.

I would suggest that you apply your patch to your tree, and when Venu
reposts his patches, he'll need to make sure he's rebased on top of this
patch.

Venu, just so you're clear: The device tree changes in your series (the
first 2 or 3 patches) will be applied to a branch based directly to
v3.9-rc1, which will then get merged into both Felipe's USB tree and the
Tegra tree. The USB driver changes in your series will then be applied
to Felipe's USB branch, so please make sure they apply there. Thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
