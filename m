From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RESEND/PATCH] usb: host: ehci-tegra: fix PHY error handling
Date: Thu, 21 Mar 2013 11:37:08 -0600
Message-ID: <514B4544.4090904@wwwdotorg.org>
References: <1363868603-14525-1-git-send-email-balbi@ti.com> <514B4137.2020707@wwwdotorg.org> <20130321173100.GB16186@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130321173100.GB16186-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/21/2013 11:31 AM, Felipe Balbi wrote:
> On Thu, Mar 21, 2013 at 11:19:51AM -0600, Stephen Warren wrote:
>> On 03/21/2013 06:23 AM, Felipe Balbi wrote:
>>> PHY layer no longer returns NULL, we must switch from
>>> IS_ERR_OR_NULL() to IS_ERR().
>> 
>> The patches that I'll put into my topic branch are not yet
>> complete; Venu first posted them a couple days back and there are
>> a number of issues that will require a repost.
>> 
>> I would suggest that you apply your patch to your tree, and when
>> Venu
> 
> alright, in that case, can I get yours or Venu's Acked-by ?

Sure,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Although I didn't really think through any interactions with Venu's
patch set, I imagine the rebase will be trivial, since the patch is
pretty simple, so it shouldn't cause any issues.
