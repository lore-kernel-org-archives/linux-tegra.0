From: Heinz Diehl <htd-iEI8Y0CNJBYdnm+yROfE0A@public.gmane.org>
Subject: Re: i915 freakout with latest 3.7 git
Date: Tue, 11 Dec 2012 17:11:21 +0100
Message-ID: <20121211161121.GA1889@fritha.org>
References: <CAKMK7uEGTWgPO-wf7aNLC+y9zLYPyy6f_djn6D-Gx-n6bFqcJA@mail.gmail.com>
 <20121204123522.GA32419@fritha.org>
 <1498848.rM1KKK5er8@al>
 <CAKMK7uHH8U64w5kWVp1oOnhTHkStGoJHJx1KazCQ2-gaCAm0Sg@mail.gmail.com>
 <20121207170704.GA24395@fancy-poultry.org>
 <CAKMK7uHNn9b1TdUaUn=4DFhF=zBtZToOtF2uSRf2doVCTOdzaQ@mail.gmail.com>
 <20121207204406.GA26309@fritha.org>
 <CAKMK7uEd_KY+FS9UKqRcFnKuUo5_8TnWnAVgLm7ogtbKU7OVNg@mail.gmail.com>
 <20121208130648.GA3311@fritha.org>
 <20121211102225.GP11556@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121211102225.GP11556-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, intel-gfx <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11.12.2012, Daniel Vetter wrote: 

> Can you please test the patch at
> 
> https://bugs.freedesktop.org/attachment.cgi?id=70111
> 
> That one should disable all effects of the unbound tracking, since a
> revert of the below commit conflicts.

I applied this patch to Linus' git from today. "Boom" after about 1
min.

The errorstate file is here:

http://www.fritha.org/i915/errorstate3.tar.bz2

Heinz
