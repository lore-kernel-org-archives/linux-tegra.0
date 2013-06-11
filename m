From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/6] gpu: host1x: Fix syncpoint wait return value
Date: Tue, 11 Jun 2013 14:09:31 +0200
Message-ID: <CAKMK7uGRW4uqsSaDEehTZwknZH+mNEgyKB6-4TgfgUOaTOcoLA@mail.gmail.com>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
	<1368791388-31441-3-git-send-email-amerilainen@nvidia.com>
	<20130526101243.GB1652@mithrandir>
	<51A30372.6080907@nvidia.com>
	<20130528103927.GB11547@mithrandir>
	<86y5ay6hrn.fsf@miki.keithp.com>
	<20130611104800.GA29395@mithrandir>
	<CAKMK7uF=A9zZ3VgdwzU3gfOjXaYsCqfCUSPmkLdL98nKX94jFQ@mail.gmail.com>
	<51B70D52.9060601@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51B70D52.9060601@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Keith Packard <keithp@keithp.com>, "X.Org development" <xorg-devel@lists.x.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jun 11, 2013 at 1:43 PM, Terje Bergstr=F6m <tbergstrom@nvidia.c=
om> wrote:
> On 11.06.2013 14:00, Daniel Vetter wrote:
>> We don't use the EAGAIN ioctl restarting to resubmit the batchbuffer
>> which blew up the gpu (that one has been submitted already in a
>> different ioctl call), but to be able to restart the ioctl after the
>> reset has completed: We need to kick every thread which is potential=
ly
>> holding GEM locks and make sure that we block them (at a point where
>> they don't hold any locks) until the reset handler completed. To avo=
id
>> a validation nightmare we use the same codepaths as we use for signa=
l
>> interrupts, so ioctl restarting is a very natural fit for this.
>>
>> Resubmitting victim workloads when a gpu crash happened is something
>> the reset handler would do (kernel work item currently), not any
>> userspace process doing an ioctl. But atm we don't resubmit victimiz=
ed
>> workloads.
>
> I don't understand the end-to-end of how resubmit is supposed to work=
=2E
> User space is not supposed to resubmit, but still EAGAIN is returned =
to
> user space, and drmIoctl() in user space just calls the came ioctl
> again. Sounds like drmIoctl() is completely wrong.

Maybe it wasn't clear, but -EAGAIN does _not_ resubmit work. -EAGAIN
is used to restart the ioctl if we had to kick a thread (to make sure
it doesn't hold any locks), e.g. for a blocking wait on oustanding
rendering. The codepaths taken work exactly as if the thread is
interrupt with a signal.

> In Tegra, when a job blows up, we reset the involved units, and set t=
he
> pushbuffer pointer of host1x to point to the next job, and re-enable
> units. There's no need for anybody to resubmit anything, as kernel
> already has them.

Yeah, that's how it works in i915.ko, too.
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
