From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] pmu/gk20a: PMU boot support.
Date: Thu, 12 Mar 2015 18:11:40 -0400
Message-ID: <CAKb7UvgDq-FzZwAZ8VwbhaVHi4B29jXL5qjOCQ47TWfqDBDQaA@mail.gmail.com>
References: <1426055631-1166-1-git-send-email-dgoyal@nvidia.com>
	<CAKb7Uvj0xMvDWjKjGzbD6Tk0NArfkh4Vjvt4eRQ8XoHgR+7bsg@mail.gmail.com>
	<25b5050176544f47b0ac74d4086f145c@bgmail104.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <25b5050176544f47b0ac74d4086f145c-7W72rfoJkVm6sJks/06JalaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I guess Alexandre will help you prepare this for upstream inclusion,
but just want to make sure that my main point makes it across -- this
is a 3K line patch. Please try to split it up into patches that add no
more than 300 lines at a time, preferably fewer (but this isn't always
possible). Ideally each patch should introduce one conceptual unit. Of
course different people might draw the line of "conceptual unit"
differently, but try to do it so that each one becomes 100-300 lines
of code :)

These aren't hard limits by the way, but good rules of thumb to go by
when sending patches for upstream inclusion.

Cheers,

  -ilia

On Thu, Mar 12, 2015 at 1:20 AM, Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Mirkin,
>
> Your observations are quiet correct.
> After the boot code is submitted successfully, I will submit the code to configure & enable features of PMU.(This will be done by sending cmds to PMU).
>
> Now talking about this patch:
> Apart from just the boot code, I have also included some things in this patch that I can remove for now(I will include these things in later digestible chunks):
>
> - Debugfs support (can be removed for now)
> - Debug support for dumping PMU falcon registers(can be removed for now)
> - PMU interacts with Kernel via interrupt mechanism.
>   For interaction with PMU, we have
>   defined command structs, functions to prepare/validate and send commands to PMU.
>   This infrastructure is basically to send commands to PMU.(right now it can be removed though we still require to receive messages from PMU to know if it has booted successfully).
>
> But this will be all that I will be able to remove from this patch.
> Can I go ahead with removing above suggestions?
>
> Regards,
> Deepak G
>
> -----Original Message-----
> From: ibmirkin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org [mailto:ibmirkin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org] On Behalf Of Ilia Mirkin
> Sent: Wednesday, March 11, 2015 10:41 PM
> To: Deepak Goyal
> Cc: Ben Skeggs; Alexandre Courbot; nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [Nouveau] [PATCH] pmu/gk20a: PMU boot support.
>
> Hi Deepak,
>
> There's... a lot of stuff going on here. Can you describe the goal of
> this patch (which could then be used as the patch commit message)? The
> current one basically boils down to "Add support for loading PMU", but
> merely loading the fw into a fuc engine is just a handful lines of
> code. Also, except in rare cases, it's customary to split up patches
> of this size into smaller, more reviewable chunks, which add on bits
> of functionality as they go.
>
> From what I can tell, you're adding the kernel-side interface for a
> hypothetical (and presumably closed-source) PMU blob that NVIDIA will
> supply. In essence, the blob is expected to implement a RTOS which
> runs on the PMU's falcon CPU. There are a bunch of API's implemented
> by this blob that the host can call, but it also does things on its
> own. For the kernel side, each of these API calls should probably be a
> separate patch (after an initial "just load it and do nothing" style
> patch). Or perhaps have the infrastructure that you add first and then
> something that implements the API calls.
>
> Cheers,
>
>   -ilia
>
>
> On Wed, Mar 11, 2015 at 2:33 AM, Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> It adds PMU boot support.It loads PMU
>> firmware into PMU falcon.RM/Kernel driver
>> receives INIT ack (through interrupt mechanism)
>> from PMU when PMU boots with success.
>>
>> Signed-off-by: Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drm/nouveau/include/nvkm/subdev/pmu.h |   26 +-
>>  drm/nouveau/nvkm/subdev/pmu/base.c    |  108 ++
>>  drm/nouveau/nvkm/subdev/pmu/gk20a.c   | 2131 ++++++++++++++++++++++++++++++++-
>>  drm/nouveau/nvkm/subdev/pmu/gk20a.h   |  369 ++++++
>>  drm/nouveau/nvkm/subdev/pmu/priv.h    |  264 ++++
>>  5 files changed, 2884 insertions(+), 14 deletions(-)
>>  create mode 100644 drm/nouveau/nvkm/subdev/pmu/gk20a.h
>>
