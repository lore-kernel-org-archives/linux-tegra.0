From: Heinz Diehl <htd-iEI8Y0CNJBYdnm+yROfE0A@public.gmane.org>
Subject: Re: i915 freakout with latest 3.7 git
Date: Sat, 8 Dec 2012 14:06:48 +0100
Message-ID: <20121208130648.GA3311@fritha.org>
References: <20121203173951.GA25384@fancy-poultry.org>
 <CAKMK7uEGTWgPO-wf7aNLC+y9zLYPyy6f_djn6D-Gx-n6bFqcJA@mail.gmail.com>
 <20121204123522.GA32419@fritha.org>
 <1498848.rM1KKK5er8@al>
 <CAKMK7uHH8U64w5kWVp1oOnhTHkStGoJHJx1KazCQ2-gaCAm0Sg@mail.gmail.com>
 <20121207170704.GA24395@fancy-poultry.org>
 <CAKMK7uHNn9b1TdUaUn=4DFhF=zBtZToOtF2uSRf2doVCTOdzaQ@mail.gmail.com>
 <20121207204406.GA26309@fritha.org>
 <CAKMK7uEd_KY+FS9UKqRcFnKuUo5_8TnWnAVgLm7ogtbKU7OVNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uEd_KY+FS9UKqRcFnKuUo5_8TnWnAVgLm7ogtbKU7OVNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, intel-gfx <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07.12.2012, Daniel Vetter wrote: 

[....]

I did a "git bisect" betweeb 3.6 and 3.7-rc8 and ended up with
this. Unfortunately, git can't revert this patch on top of master, sp
I have not been able to test if a revert will cure the problem.

After reading on the net that Peter (Lekensteyn) already ended up with
bisecting the same patch and it didn't work for him reverting it on
top of 3-7-rc4, I'm somewhat clueless..

What else can I do to help finding the cause?

Heinz


[root@wildsau linux-git]# git bisect good
6c085a728cf000ac1865d66f8c9b52935558b328 is the first bad commit
commit 6c085a728cf000ac1865d66f8c9b52935558b328
Author: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>
Date:   Mon Aug 20 11:40:46 2012 +0200

    drm/i915: Track unbound pages
    
    When dealing with a working set larger than the GATT, or even the
    mappable aperture when touching through the GTT, we end up with
    evicting
    objects only to rebind them at a new offset again later. Moving an
    object into and out of the GTT requires clflushing the pages, thus
    causing a double-clflush penalty for rebinding.
    
    To avoid having to clflush on rebinding, we can track the pages as
    they
    are evicted from the GTT and only relinquish those pages on memory
    pressure.
    
    As usual, if it were not for the handling of out-of-memory
    condition and
    having to manually shrink our own bo caches, it would be a net
    reduction
    of code. Alas.
    
    Note: The patch also contains a few changes to the last-hope
    evict_everything logic in i916_gem_execbuffer.c - we no longer try
    to
    only evict the purgeable stuff in a first try (since that's
    superflous
    and only helps in OOM corner-cases, not fragmented-gtt trashing
    situations).
    
    Also, the extraction of the get_pages retry loop from bind_to_gtt
    (and
    other callsites) to get_pages should imo have been a separate
    patch.
    
    v2: Ditch the newly added put_pages (for unbound objects only) in
    i915_gem_reset. A quick irc discussion hasn't revealed any
    important
    reason for this, so if we need this, I'd like to have a git
    blame'able
    explanation for it.
    
    v3: Undo the s/drm_malloc_ab/kmalloc/ in get_pages that Chris
    noticed.
    
    Signed-off-by: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>
    [danvet: Split out code movements and rant a bit in the commit
    message
    with a few Notes. Done v2]
    Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>

:040000 040000 c4f02e0d05a570d0baf9d2f19a6c276c06a55142
df93a56308637e3840353c3c9425ec96c3422dcc M	drivers
[root@wildsau linux-git]# 
