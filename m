From: stefan-XLVq0VzYD2Y@public.gmane.org
Subject: Re: TK1 System Freeze
Date: Wed, 07 Feb 2018 20:20:27 +0100
Message-ID: <3bc3dd406d4629175d4244a3a261c7e3@agner.ch>
References: <1511135854.13661.3.camel@toradex.com>
 <7d874417cbb2067bcb4f49af000f9f03@agner.ch>
 <19526d1015c3c60e8bbdf26ec9d082bb@agner.ch> <20180207175106.GA25486@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180207175106.GA25486@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07.02.2018 18:51, Thierry Reding wrote:
> On Tue, Feb 06, 2018 at 08:51:19AM +0100, stefan-XLVq0VzYD2Y@public.gmane.org wrote:
>> On 13.01.2018 01:19, Stefan Agner wrote:
>> > Hi Marcel, Hi Thierry,
>> >
>> > On 2017-11-20 00:57, Marcel Ziswiler wrote:
>> >> Hi there
>> >>
>> >> I lately was tasked to run some legacy Qt4e [1] application on Apalis
>> >> TK1. It should really only draw directly to the Linux frame buffer
>> >> /dev/fb0. Strangely as soon as that application is started the whole
>> >> system freezes. Running it with the VNC backend or a pure frame buffer
>> >> emulation it works just fine. So it must have something to do with the
>> >> particular way the frame buffer is done on TK1. So far no attempt in
>> >> debugging this any further bear any fruit. Whether stracing what the
>> >> application is doing nor tracing the linux kernel side of things
>> >> revealed where exactly the freeze happens. As I feared some kind of a
>> >> configuration issue on Apalis TK1 I also tried the same on Jetson TK1
>> >> with latest stock Linux kernel 4.14. However the same freeze happens.
>> >
>> > This is still the case with 4.15-rc7.
>> >
>> > While dd is not enough to reproduce it, using a simple fbdev application
>> > such as ts_calibrate seems to be sufficient. Qt and ts_calibrate use
>> > mmap for the framebuffer. The system seems to freeze when it tries to
>> > write into the mapped area (at the memset line):
>> > https://github.com/kergoth/tslib/blob/master/tests/fbutils-linux.c#L160
>> >
>> > Is this a known problem? Any idea?
>>
>> Thierry, anybody else, any idea? This should be easily reproducible on
>> Jetson TK1.
> 
> I was able to reproduce this on Venice2 (just because I was using it for
> unrelated work, I'm pretty certain this can be reproduced on Jetson TK1)
> and came up with a fix. I think the problem is that fbdev has an mmap()
> implementation that conflicts with what we do in DRM/KMS and therefore
> causes a hang. I've sent out a series with the fix. It'd be great if you
> two can check that this indeed fixes the issue for you on Apalis. It did
> fix the issue for me on Venice2.

Thanks for looking into this!

Yeah I suspected that missing mmap in fbdev emulation is the issue since
Tegra was pretty much the only "higher end" graphics driver which did
not overwrite the fbdev mmap callback.

FWIW, tested our use-case (Qt4e) on a patched 4.14, works like a charm!

> 
> Tested using fbdev.c from here:
> 
> 	https://patchwork.kernel.org/patch/743682/
> 
> This seems like it would have been broken since the dawn of time. Have
> you never encountered this before? Or has it only recently broken with
> newer kernels? We probably want this backported to all stable releases.

Yeah we discussed that too, we realized that only now when we tried to
use mainline with this legacy application.

Marcel remembered that he used to observe crashes when using fbdev &
X.org but never really bothered and just used modesetting...

It is kind of a nice DoS (as in Denial of System :-)). Agreed, this
should be backported.

--
Stefan
