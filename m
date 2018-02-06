From: stefan-XLVq0VzYD2Y@public.gmane.org
Subject: Re: TK1 System Freeze
Date: Tue, 06 Feb 2018 08:51:19 +0100
Message-ID: <19526d1015c3c60e8bbdf26ec9d082bb@agner.ch>
References: <1511135854.13661.3.camel@toradex.com>
 <7d874417cbb2067bcb4f49af000f9f03@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7d874417cbb2067bcb4f49af000f9f03-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 13.01.2018 01:19, Stefan Agner wrote:
> Hi Marcel, Hi Thierry,
> 
> On 2017-11-20 00:57, Marcel Ziswiler wrote:
>> Hi there
>>
>> I lately was tasked to run some legacy Qt4e [1] application on Apalis
>> TK1. It should really only draw directly to the Linux frame buffer
>> /dev/fb0. Strangely as soon as that application is started the whole
>> system freezes. Running it with the VNC backend or a pure frame buffer
>> emulation it works just fine. So it must have something to do with the
>> particular way the frame buffer is done on TK1. So far no attempt in
>> debugging this any further bear any fruit. Whether stracing what the
>> application is doing nor tracing the linux kernel side of things
>> revealed where exactly the freeze happens. As I feared some kind of a
>> configuration issue on Apalis TK1 I also tried the same on Jetson TK1
>> with latest stock Linux kernel 4.14. However the same freeze happens.
> 
> This is still the case with 4.15-rc7.
> 
> While dd is not enough to reproduce it, using a simple fbdev application
> such as ts_calibrate seems to be sufficient. Qt and ts_calibrate use
> mmap for the framebuffer. The system seems to freeze when it tries to
> write into the mapped area (at the memset line):
> https://github.com/kergoth/tslib/blob/master/tests/fbutils-linux.c#L160
> 
> Is this a known problem? Any idea?

Thierry, anybody else, any idea? This should be easily reproducible on
Jetson TK1.

--
Stefan

 
>>
>> Has anybody ever seen a similar complete system freeze? Any ideas what
>> it may be or how we could debug this any further?
>>
>> [1] https://layers.openembedded.org/layerindex/recipe/43622/
>>
>> Cheers
>>
>> Marcel
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
