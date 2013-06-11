From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 2/6] gpu: host1x: Fix syncpoint wait return value
Date: Tue, 11 Jun 2013 13:00:50 +0200
Message-ID: <CAKMK7uF=A9zZ3VgdwzU3gfOjXaYsCqfCUSPmkLdL98nKX94jFQ@mail.gmail.com>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
	<1368791388-31441-3-git-send-email-amerilainen@nvidia.com>
	<20130526101243.GB1652@mithrandir>
	<51A30372.6080907@nvidia.com>
	<20130528103927.GB11547@mithrandir>
	<86y5ay6hrn.fsf@miki.keithp.com>
	<20130611104800.GA29395@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130611104800.GA29395@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Keith Packard <keithp-aN4HjG94KOLQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "X.Org development" <xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jun 11, 2013 at 12:48 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, May 28, 2013 at 01:12:12PM -0600, Keith Packard wrote:
>> Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>
>>
>> > That doesn't sound right. Maybe drmIoctl() needs fixing instead. Looking
>> > at the history, drmIoctl() was introduced to automatically loop if a
>> > signal was received (commit 8b9ab108ec1f2ba2b503f713769c4946849b3cb2).
>> > However the ioctl(3p) manpage doesn't mention that ioctl() returns
>> > EAGAIN in case it is interrupted by a signal.
>>
>> EAGAIN is being returned when the GPU is wedged to ask the application
>> to re-submit the request, which will presumably be held until the  GPU
>> is un-wedged.
>
> Isn't that a bit risky? What if something special needs to be done to
> unwedge the GPU other than re-submit the request, or if it just can't
> be reasonably unwedged. In that case drmIoctl() will keep looping
> indefinitely.
>
> If the above is indeed the expected behaviour for drivers, then we need
> a different error code for the SYNCPT_WAIT ioctl. EAGAIN is the best fit
> and anything else doesn't quite match the use-case. A different option
> might be not to use drmIoctl() on Tegra.

We don't use the EAGAIN ioctl restarting to resubmit the batchbuffer
which blew up the gpu (that one has been submitted already in a
different ioctl call), but to be able to restart the ioctl after the
reset has completed: We need to kick every thread which is potentially
holding GEM locks and make sure that we block them (at a point where
they don't hold any locks) until the reset handler completed. To avoid
a validation nightmare we use the same codepaths as we use for signal
interrupts, so ioctl restarting is a very natural fit for this.

Resubmitting victim workloads when a gpu crash happened is something
the reset handler would do (kernel work item currently), not any
userspace process doing an ioctl. But atm we don't resubmit victimized
workloads.
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
