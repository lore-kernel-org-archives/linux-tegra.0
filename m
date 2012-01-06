From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: select required CPU and L2 errata options
Date: Fri, 06 Jan 2012 19:36:37 +0100
Message-ID: <4535343.dMzhSsBukX@ax5200p>
References: <1325719752-818-1-git-send-email-olof@lixom.net> <3197939.ZpLiSGWdou@ax5200p> <20230.64932.51663.410120@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20230.64932.51663.410120-tgku4HJDRZih8lFjZTKsyTAV6s6igYVG@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikael Pettersson <mikpe-1zs4UD6AkMk@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 06 January 2012 14:56:52 Mikael Pettersson wrote:
> Marc Dietrich writes:
>  > On Thursday 05 January 2012 10:40:48 Doug Anderson wrote:
>  > > I can't comment on the L2 stuff (haven't looked there), but just
>  > > going
>  > > by Cortex-A9 revisions (T25 has roughly r1p1 and T30 has r2p7),
>  > > I've
>  > > got this table:
>  > > 
>  > > Errata             T25 (A9 ~r1p1)   T30 (A9 r2p7)    Applies to
>  > > ARM_ERRATA_364296                                    pre A8
>  > > ARM_ERRATA_411920                                    pre A8
>  > > ARM_ERRATA_430973                                    A8
>  > > ARM_ERRATA_458693                                    A8
>  > > ARM_ERRATA_460075                                    A8
>  > > ARM_ERRATA_720789  yes                               A9 (prior to
>  > > r2p0) ARM_ERRATA_742230  yes                               A9
>  > > (r1p0..r2p2) ARM_ERRATA_742231                                   
>  > > A9 (r2p0..r2p2) ARM_ERRATA_743622                                
>  > >    A9 (r2p0..r2p2) ARM_ERRATA_751472  yes              yes       
>  > >       A9 (prior to r3p0) ARM_ERRATA_754322                   yes 
>  > >             A9 (r2p*, r3p*) ARM_ERRATA_754327  yes               
>  > >                A9 (prior to r2p0) ARM_ERRATA_764369  yes         
>  > >     yes              A9 MPCore (all revs)
>  > > 
>  > > ...so that means we should also be adding in 720789 (T2x), 751472
>  > > (T2x, T30), 754322 (T30), 754327 (T2x), 764369 (T2x, T30).
>  > 
>  > AFAIK, 720789 (TLBIASIDIS and TLBIMVAIS operations can broadcast a
>  > faulty ASID) is fixed in userspace (or gcc) nowadays (at least in
>  > Ubuntu) so I think this can be neglected.
> 
> Not everyone uses Ubuntu.

yeah, I know. I just said this because nvidias reference filesystem is based 
upon it.

> Can you provide a reference to the corresponding gcc and/or Ubuntu patch?

all I found in the haste is 
https://bugs.launchpad.net/ubuntu/+source/eglibc/+bug/739374

I think in the end gcc was patched not emit get/set_tls syscalls but to use 
MCR/MRC cp15 ops (sorry, I don't know what this means - just copied from irc 
log). This meant that the whole userspace needed recompilation. It is possible 
that all newer gcc behave like this. As far as I understood, enabling the 
erratum in the kernel with fixed userspace will make the problem reapear. 
Someone with more knowledge may correct me.

> (I got a Tegra-2 based trimslice last summer, but it's been completely
> unreliable under load (hangs hard during "make -j2" gcc bootstraps),
> hence I'm looking for patches or any other information that can help
> me fix or work around whatever bugs it has.)

I think this can't be related to the erratum above because it manifestated 
itself in a segfault or illegal instruction userspace error.

Did you tried to ask in the trimslice forum about this error?

Marc
