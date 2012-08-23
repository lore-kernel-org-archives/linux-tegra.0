From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Debugging U-Boot standalone apps on Tegra 2 board
Date: Thu, 23 Aug 2012 11:40:58 -0600
Message-ID: <50366B2A.7080306@wwwdotorg.org>
References: <50365CA3.6000103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50365CA3.6000103-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/23/2012 10:38 AM, Nuno Santos wrote:
> Hi
> 
> I'm currently running U-Boot on the Tegra2 Harmony board and I'd
> appreciate some help on how to debug U-Boot standalone applications. I'm
> currently stuck with some nasty bugs and without a debugger it will be
> extremely painful to fix them.
> 
> I read that using a JTAG device seems to be the best option. According
> to the technical specs of the Harmony board, JTAG is supported and
> looking at the board, there's apparently a debug port (J10). However,
> this port looks too tiny to be a regular JTAG interface.
> 
> Do you have any idea if a JTAG debugger is indeed supported? If so,
> could you please recommend me one that is compatible with this board?
> Otherwise, are you aware of an alternative approach for debugging the
> system?
> 
> I really appreciate your help on this. Thanks in advance.

I've CC'd a couple of people more involved in U-Boot and JTAG debugging.
For Harmony, I believe you need an external debug board to expose the
JTAG connector in a standard form-factor. I don't know if these are
available; it's probably best to ask whoever you got your Harmony from.
