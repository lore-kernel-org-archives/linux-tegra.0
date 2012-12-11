From: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>
Subject: Re: i915 freakout with latest 3.7 git
Date: Tue, 11 Dec 2012 10:24:01 +0000
Message-ID: <84c8a8$6tcpes@orsmga001.jf.intel.com>
References: <20121203173951.GA25384@fancy-poultry.org> <CAKMK7uEGTWgPO-wf7aNLC+y9zLYPyy6f_djn6D-Gx-n6bFqcJA@mail.gmail.com> <20121204123522.GA32419@fritha.org> <1498848.rM1KKK5er8@al> <CAKMK7uHH8U64w5kWVp1oOnhTHkStGoJHJx1KazCQ2-gaCAm0Sg@mail.gmail.com> <20121207170704.GA24395@fancy-poultry.org> <CAKMK7uHNn9b1TdUaUn=4DFhF=zBtZToOtF2uSRf2doVCTOdzaQ@mail.gmail.com> <20121207204406.GA26309@fritha.org> <CAKMK7uEd_KY+FS9UKqRcFnKuUo5_8TnWnAVgLm7ogtbKU7OVNg@mail.gmail.com> <f5ae8a$7ojl8o@fmsmga002.fm.intel.com> <20121208143053.GA3376@fritha.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121208143053.GA3376-iEI8Y0CNJBYdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinz Diehl <htd-iEI8Y0CNJBYdnm+yROfE0A@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, intel-gfx <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, 8 Dec 2012 15:30:53 +0100, Heinz Diehl <htd-iEI8Y0CNJBYdnm+yROfE0A@public.gmane.org> wrote:
> On 08.12.2012, Chris Wilson wrote: 
> 
> > One thing you can try is SNA, which packs its
> > batches differently with the advantage that more auxiliary state is
> > included in the error-state. It also packs all the kernels into a
> > single buffer which will reduce the frequency at which it is paged
> > out/in. So if you can reproduce with SNA (use Option "AccelMethod"
> > "SNA" in a device section of your xorg.conf snippet) I expect the
> > error-state to be quite different and hopefully shed some more light on
> > the issue.
> 
> I tried this with latest 3.7-rc8 git, but no matter how hard I try, I
> can't get the gpu to hang (with i915.915_enable_rc6=0). Will use this 
> as my default kernel the next few days and see if the hang occurs by
> chance.

Can you confirm one thing: are you able to reproduce the hangs at all on
3.7-rc8, using your original setup?
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
