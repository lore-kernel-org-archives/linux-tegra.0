From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: use generated pinmux for Beaver board
Date: Mon, 02 Mar 2015 20:16:09 +0100
Message-ID: <1425323769.2182.0.camel@lynxeye.de>
References: <1420495066-19221-1-git-send-email-dev@lynxeye.de>
	 <54AB0B68.7050704@wwwdotorg.org> <1420591830.25483.16.camel@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420591830.25483.16.camel-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, den 07.01.2015, 01:50 +0100 schrieb Lucas Stach:
> Am Montag, den 05.01.2015, 15:08 -0700 schrieb Stephen Warren:
> > On 01/05/2015 02:57 PM, Lucas Stach wrote:
> > > Replace the current incomplete pinmux setup with a proper one generated
> > > using the tegra pinmux scripts.
> > 
> > I assume this is identical to the existing content, it's just that the 
> > node sort order changed to match the auto-generation order?
> > 
> Yes auto-generation changes the representation of the nodes a bit, but I
> made sure to keep the properties of the existing kernel DT pinmux where
> they were different from the U-Boot pinmux.
> 
> > If so,
> > Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
This has not been applied. Could anyone please pick this up, so it
doesn't miss yet another merge window?

Thanks,
Lucas
