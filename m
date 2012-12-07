From: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>
Subject: Re: i915 freakout with latest 3.7 git
Date: Fri, 07 Dec 2012 21:53:40 +0000
Message-ID: <f5ae8a$7ojl8o@fmsmga002.fm.intel.com>
References: <20121203173951.GA25384@fancy-poultry.org> <CAKMK7uEGTWgPO-wf7aNLC+y9zLYPyy6f_djn6D-Gx-n6bFqcJA@mail.gmail.com> <20121204123522.GA32419@fritha.org> <1498848.rM1KKK5er8@al> <CAKMK7uHH8U64w5kWVp1oOnhTHkStGoJHJx1KazCQ2-gaCAm0Sg@mail.gmail.com> <20121207170704.GA24395@fancy-poultry.org> <CAKMK7uHNn9b1TdUaUn=4DFhF=zBtZToOtF2uSRf2doVCTOdzaQ@mail.gmail.com> <20121207204406.GA26309@fritha.org> <CAKMK7uEd_KY+FS9UKqRcFnKuUo5_8TnWnAVgLm7ogtbKU7OVNg@mail.gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKMK7uEd_KY+FS9UKqRcFnKuUo5_8TnWnAVgLm7ogtbKU7OVNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Heinz Diehl <htd-iEI8Y0CNJBYdnm+yROfE0A@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, intel-gfx <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 7 Dec 2012 22:08:13 +0100, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:
> ilk with rc6 disabled, and the two hangs you've attached both die on
> the MI_FLUSH in between a 3D primitive and a 2D blit, like all the
> other non-rc6 hangs we've seen thus far that indicate that 3.7
> regressed. This A looks _very_ good. I'm adding lists again so that
> people are updated and can check whether I've analyzed the
> error_states correctly. For reference I've uploaded your dmesg and
> error_states at

The error states do disappear into a black hole during the execution of
a 3DPRIMITIVE. The similarity between the two appear that the WM kernel
loaded for the 3DPRIMITIVE both appear to be recently bound, and were
the last kernels to be bound in the batch. Coincidence? Maybe, the
INSTDONE in both cases is again the same highly unusual condition
suggesting that the EU died.  However, both error-states also suggest
that a fresh surface was uploaded for the same 3DPRIMITIVE - but I'm
having to guess since the error-state doesn't include the auxiliary
state for me to check. One thing you can try is SNA, which packs its
batches differently with the advantage that more auxiliary state is
included in the error-state. It also packs all the kernels into a
single buffer which will reduce the frequency at which it is paged
out/in. So if you can reproduce with SNA (use Option "AccelMethod"
"SNA" in a device section of your xorg.conf snippet) I expect the
error-state to be quite different and hopefully shed some more light on
the issue.
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
