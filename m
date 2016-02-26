From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: tegra: correct Beaver pinmux
Date: Fri, 26 Feb 2016 12:28:08 -0700
Message-ID: <56D0A748.6060104@wwwdotorg.org>
References: <1456514310-27605-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456514310-27605-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/26/2016 12:18 PM, Lucas Stach wrote:
> Update pinmux to get rid of invalid uses of the rsvd1 function, which lead
> to the mux settings on those pins to not be applied.
>
> Also add correct drive settings, derived from the Tegra3 TRM, for SDIO1,
> which makes some more SD-cards work.

I replied the following to V1, which I don't see resolved:

 > I think it would be worth mentioning in the commit description where 
 > this[1] data came from.

[1] that was in response to the addition of the sdio1 drive settings.

Also, what is different in V2; is this actually V1 REPOST?
