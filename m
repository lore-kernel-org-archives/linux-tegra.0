From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] USB: ehci-tegra: don't call set_irq_flags(IRQF_VALID)
Date: Wed, 18 Apr 2012 15:09:30 -0600
Message-ID: <4F8F2D8A.8000205@wwwdotorg.org>
References: <1334781820-27105-1-git-send-email-swarren@wwwdotorg.org> <20120418210150.GA31756@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120418210150.GA31756-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/18/2012 03:01 PM, Greg KH wrote:
> On Wed, Apr 18, 2012 at 02:43:40PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> This call is not needed; the IRQ controller should (and does) set up
>> interrupts correctly. set_irq_flags() isn't exported to modules, to
>> this also fixes compilation of ehci-tegra.c as a module.
> 
> So this is needed for the 3.4-final release, right?

Yes. I haven't tested it anywhere than next-20120416, but I believe it
is applicable and should work anywhere the patch applies.
