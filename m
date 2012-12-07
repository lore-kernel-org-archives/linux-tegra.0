From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: i915 freakout with latest 3.7 git
Date: Fri, 7 Dec 2012 22:08:13 +0100
Message-ID: <CAKMK7uEd_KY+FS9UKqRcFnKuUo5_8TnWnAVgLm7ogtbKU7OVNg@mail.gmail.com>
References: <20121203173951.GA25384@fancy-poultry.org>
	<CAKMK7uEGTWgPO-wf7aNLC+y9zLYPyy6f_djn6D-Gx-n6bFqcJA@mail.gmail.com>
	<20121204123522.GA32419@fritha.org>
	<1498848.rM1KKK5er8@al>
	<CAKMK7uHH8U64w5kWVp1oOnhTHkStGoJHJx1KazCQ2-gaCAm0Sg@mail.gmail.com>
	<20121207170704.GA24395@fancy-poultry.org>
	<CAKMK7uHNn9b1TdUaUn=4DFhF=zBtZToOtF2uSRf2doVCTOdzaQ@mail.gmail.com>
	<20121207204406.GA26309@fritha.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121207204406.GA26309-iEI8Y0CNJBYdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinz Diehl <htd-iEI8Y0CNJBYdnm+yROfE0A@public.gmane.org>
Cc: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, intel-gfx <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 7, 2012 at 9:44 PM, Heinz Diehl <htd-iEI8Y0CNJBYdnm+yROfE0A@public.gmane.org> wrote:
> On 07.12.2012, Daniel Vetter wrote:
>> > I think I can reliably reproduce the hang on my machine now. I have to
>> > try some HD-videos on Youtube while writing a big file with dd. The
>> > hang often occurs withing max. 5 min.
>
>> That sounds pretty awesome: Just to check, is this already with rc6
>> disable? Also, which gpu chip?
>
> This is with latest 3.7-git and i915.i915_enable_rc6=0.
> Attached is a logfile/dmesg after booting with debug options on which
> hopefully shows you the gpu chip.
>
>> Sure, always glad to help excellent bug reporters along. My usual
>> kernel bisect howto is:
>> http://www.reactivated.net/weblog/archives/2006/01/using-git-bisect-to-find-buggy-kernel-patches/
>> It seems to server rather well thus far.

ilk with rc6 disabled, and the two hangs you've attached both die on
the MI_FLUSH in between a 3D primitive and a 2D blit, like all the
other non-rc6 hangs we've seen thus far that indicate that 3.7
regressed. This A looks _very_ good. I'm adding lists again so that
people are updated and can check whether I've analyzed the
error_states correctly. For reference I've uploaded your dmesg and
error_states at

http://people.freedesktop.org/~danvet/stuff/gpu-hang.tar.bz2

> Thanks, I've read it and think that will be pretty easy (technically).
> Am I right to download Linus' tree first, and so compile an 3.7.0-rc1,
> and if I can reproduce the bug with it, it should be a little bit of a
> shorter way to get the offending patch bisected?
>
>> Good luck with the exams!
>
> Thanks! :-)
>
>> Yeah, something in 3.7 seems to have blown up - we have a few reports
>> all claiming that 3.6 is solid, while 3.7 is not :(
>
> I'll try my very best to detect the offending patch. So stay tuned ;-)

Yeah, this would be very good information to move forward with this bug.

Thanks a lot for your hard work in helping with reproducing this bug.

Yours, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
