From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: tegra: correct Beaver pinmux
Date: Fri, 26 Feb 2016 12:53:38 -0700
Message-ID: <56D0AD42.9050507@wwwdotorg.org>
References: <1456514310-27605-1-git-send-email-dev@lynxeye.de>
 <56D0A748.6060104@wwwdotorg.org> <1456515384.20487.2.camel@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456515384.20487.2.camel-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/26/2016 12:36 PM, Lucas Stach wrote:
> Am Freitag, den 26.02.2016, 12:28 -0700 schrieb Stephen Warren:
>> On 02/26/2016 12:18 PM, Lucas Stach wrote:
>>> Update pinmux to get rid of invalid uses of the rsvd1 function,
>>> which lead
>>> to the mux settings on those pins to not be applied.
>>>
>>> Also add correct drive settings, derived from the Tegra3 TRM, for
 >
> Your comment from v1 is addressed here  ^^^^^^^^^^^^^^^^^^^^^^^^

Oh right, sorry about that.
