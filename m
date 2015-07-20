From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 0/9] i2c: slave: improve i2c client address spaces and their
 DT support
Date: Mon, 20 Jul 2015 16:13:13 -0600
Message-ID: <55AD7279.5090203@wwwdotorg.org>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437142109-31975-1-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/17/2015 08:08 AM, Wolfram Sang wrote:
> As promised here is my RFC to improve address spaces for I2C. This should give
> i2c seperate address spaces for standard clients, 10 bit clients, and our own
> slave clients. So, you can now have a 7 bit slave at 0x50 and a 10 bit slave at
> 0x050. Or, you can have a slave driver listening at some address and at the
> same time have a client driver talking to this address. Note that this is only
> the core support for that separation, I am still not sure if there is hardware
> being able talking to its own slave address, but we will see.
>
> This RFC and while I did some quick tests, it is not thoroughly tested. But I
> wanted to push it out before I leave the computer for the weekend. It still
> shows what path I chose to solve the problem. So, comments on that and further
> testing are more than welcome!
>
> BTW Andrey, I did not modify your patch and couldn't get the i2c-slave-eeprom driver
> to work with my Jetson TK1. Does this work for you?

This approach makes sense to me.

I'd expect patch 2/9 "dt-bindings: add header for generic I2C flags in 
bindings" to document the flags (or at least mention their existence, 
and point at the new header file) in the core I2C bindings document.

Please consider the series,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(ack rather than review since I didn't review patch 1, and mostly 
concentrated on reviewing the concepts of how slaves were represented 
rather than the coding details).
