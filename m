From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RESEND/PATCH] usb: host: ehci-tegra: fix PHY error handling
Date: Tue, 02 Apr 2013 09:33:56 -0600
Message-ID: <515AFA64.3050107@wwwdotorg.org>
References: <1363868603-14525-1-git-send-email-balbi@ti.com> <514B4137.2020707@wwwdotorg.org> <20130402083604.GJ30286@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130402083604.GJ30286-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/02/2013 02:36 AM, Felipe Balbi wrote:
> Hi again,
> 
> On Thu, Mar 21, 2013 at 11:19:51AM -0600, Stephen Warren wrote:
>> On 03/21/2013 06:23 AM, Felipe Balbi wrote:
>>> PHY layer no longer returns NULL, we must switch from
>>> IS_ERR_OR_NULL() to IS_ERR().
>> 
>> The patches that I'll put into my topic branch are not yet
>> complete; Venu first posted them a couple days back and there are
>> a number of issues that will require a repost.
> 
> is your topic branch ready now ? I'm about to close my tree for
> v3.10, we already have -rc5 tagged and I want to leave my pull
> request cooking in next for a while.

Unfortunately not.

Venu's patch series had a bunch of runtime bugs, and I also found out
that the DT binding /still/ wasn't fully thought out. As such, this
series won't be applied for 3.10.

I still have a vague (and probably naive) hope that the updated
bindings and DT file modifications can be applied on the Tegra side in
the next few days so that for 3.11 there won't be any inter-tree
dependencies. However, we'll just have to wait and see whether Venu
has found the bugs yet.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
