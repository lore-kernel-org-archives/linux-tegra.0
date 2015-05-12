From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v4] pmu/gk20a: PMU boot support
Date: Tue, 12 May 2015 18:04:30 +0900
Message-ID: <CAAVeFuL8R=hcO2u8xCZB6GuM58Kgx6RzW2oWwKPcwrs4bj4rqQ@mail.gmail.com>
References: <1428921530-28556-1-git-send-email-acourbot@nvidia.com>
 <552B9D8A.5050202@nvidia.com> <CACAvsv4MC3hq5_DJ5c7NPfEYyrsG2vPMjadEhC+H4zcWzc+F=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACAvsv4MC3hq5_DJ5c7NPfEYyrsG2vPMjadEhC+H4zcWzc+F=Q@mail.gmail.com>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Ben,

On Fri, May 1, 2015 at 8:01 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 13 April 2015 at 20:42, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Ben, I guess our main remaining concern with this patch is how it should
>> integrate wrt. the existing PMU code. Since it is designed to interact with
>> the NVIDIA firmware, maybe we should use a different base code, or do you
>> think we can somehow share code and data structures?
> Hey Alexandre,
>
> Sorry for the delay in responding to this.

It is my turn to apologize - I was (well still am, technically :)) on
holidays and have just started unpiling my inbox...

>
> My original thinking with transitioning to use NVIDIA's firmware was
> that I'd modify our firmware interfaces to match yours, and share the
> code.  I haven't started on any of this yet due to not having any word
> on how you guys will be shipping the images, etc.  It would be nice to
> have some communication on these things :)

Indeed. For the first time with Maxwell GPUs, NVIDIA-provided firmware
will be required for GPUs to operate properly. This raises several
questions:

- Should the firmware be released under /lib/firmware/nouveau or
/lib/firmware/nvidia ? (this directory already exists for Tegra USB
firmware and makes more sense to me, since the firmware is not
Nouveau-specific)
- For GPCCS/FECS firmware, should we release the netlist "pack" file
or adopt the same format as Nouveau does? (1 file per firmware)
- Should we keep the current files names (e.g. nvxx_fucxxxx[cd]), or
try to switch to more meaningful ones?
- What about signature files that are required for secure boot?
- Knowing that NVIDIA's firmware ABI is a (very slowly) moving target,
it is worth to aim at ABI compatibility, or should we assume different
paths for Nouveau and NVIDIA firmware? If ABI incompatibilities are
introduced in the way, how do we handle versioning?

All these issues make me tend towards having a separate handling of
NVIDIA-released firmware (location, format, and ABI). It will also
make the firmware easier to release if conversions are not necessary
on the way out. What are your thoughts on this?

> I'm suspecting you won't be wanting to modify our falcon assembly, so
> I guess I'll set aside some time to use this patch as a base and
> transition our ucode to boot using it?  Then you guys can build more
> stuff on top of that.  I'm also happy to let you modify our ucode if
> you wish :)

There may be legal issues with us touching the Nouveau firmware. But
as I stated above, the first question is do we want to bother with
this compatiblity at all?
