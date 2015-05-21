From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v4] pmu/gk20a: PMU boot support
Date: Thu, 21 May 2015 15:03:00 +0900
Message-ID: <CAAVeFuKOwLiOM-fkadp5dvutrxE-QHP-y=TmSVvBgJ5syHfiHg@mail.gmail.com>
References: <1428921530-28556-1-git-send-email-acourbot@nvidia.com>
 <552B9D8A.5050202@nvidia.com> <CACAvsv4MC3hq5_DJ5c7NPfEYyrsG2vPMjadEhC+H4zcWzc+F=Q@mail.gmail.com>
 <CAAVeFuL8R=hcO2u8xCZB6GuM58Kgx6RzW2oWwKPcwrs4bj4rqQ@mail.gmail.com> <CACAvsv7un7b38_s6Whu7JdOegNs-+3ci_GFYHAzwO5CL6KWA1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACAvsv7un7b38_s6Whu7JdOegNs-+3ci_GFYHAzwO5CL6KWA1Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 15, 2015 at 2:37 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 12 May 2015 at 19:04, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Ben,
>>
>> On Fri, May 1, 2015 at 8:01 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
>>> On 13 April 2015 at 20:42, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> =
wrote:
>>>> Ben, I guess our main remaining concern with this patch is how it =
should
>>>> integrate wrt. the existing PMU code. Since it is designed to inte=
ract with
>>>> the NVIDIA firmware, maybe we should use a different base code, or=
 do you
>>>> think we can somehow share code and data structures?
>>> Hey Alexandre,
>>>
>>> Sorry for the delay in responding to this.
>>
>> It is my turn to apologize - I was (well still am, technically :)) o=
n
>> holidays and have just started unpiling my inbox...
>>
>>>
>>> My original thinking with transitioning to use NVIDIA's firmware wa=
s
>>> that I'd modify our firmware interfaces to match yours, and share t=
he
>>> code.  I haven't started on any of this yet due to not having any w=
ord
>>> on how you guys will be shipping the images, etc.  It would be nice=
 to
>>> have some communication on these things :)
>>
>> Indeed. For the first time with Maxwell GPUs, NVIDIA-provided firmwa=
re
>> will be required for GPUs to operate properly. This raises several
>> questions:
>>
>> - Should the firmware be released under /lib/firmware/nouveau or
>> /lib/firmware/nvidia ? (this directory already exists for Tegra USB
>> firmware and makes more sense to me, since the firmware is not
>> Nouveau-specific)
> I think /lib/firmware/nvidia makes sense here too.
>
>> - For GPCCS/FECS firmware, should we release the netlist "pack" file
>> or adopt the same format as Nouveau does? (1 file per firmware)
>> - Should we keep the current files names (e.g. nvxx_fucxxxx[cd]), or
>> try to switch to more meaningful ones?
> I'd actually prefer to have the entire netlists bundled, that gives u=
s
> updated reg/ctx production values too as you guys tweak/update them
> for hw bugs (etc).  They're also nicer in that you get a single bundl=
e
> of everything that's required for that chipset+engine.

Good for me - actually that's the solution I implemented first before
deciding to go "=C3=A0 la Nouveau". ;) Some extra code will be needed, =
but
nothing crazy, and we will limit that feature to these chips for which
NVIDIA officially provides the firmware.

> I don't have too much opinion on naming.  The current model of
> nv{CHIPSET}_{UCODE_TYPE}{REGISTER_BASE}[CODE,DATA] was just nice and
> convenient to snprintf into a buffer :)

Since the firmware will be provided by us, shall we store it into
nvidia/<chip>/gpcfe.bin on linux-firmware?

>> - What about signature files that are required for secure boot?
> As with above, if it's possible to ship them in a single file with th=
e
> ucode that it belongs to, that'd be ideal.  It's not a huge deal
> though.

So here we actually have several files - it is kind of a mess
actually. However I could probably merge them into a single netlist
file like we did for the GPC/FE CS code.

>> - Knowing that NVIDIA's firmware ABI is a (very slowly) moving targe=
t,
>> it is worth to aim at ABI compatibility, or should we assume differe=
nt
>> paths for Nouveau and NVIDIA firmware? If ABI incompatibilities are
>> introduced in the way, how do we handle versioning?
> For incompatible changes, I think appending a -VERSION to each
> firmware blob is probably the simplest approach.  The driver can
> select the necessary codepath based on what it finds (probably trying
> newer versions first, obviously).

I agree. Hopefully we won't have too much of this.

>> All these issues make me tend towards having a separate handling of
>> NVIDIA-released firmware (location, format, and ABI). It will also
>> make the firmware easier to release if conversions are not necessary
>> on the way out. What are your thoughts on this?
> I'm not entirely set here, either way.  I somewhat think that
> initially I should adapt our interfaces to match, and a keep single
> code path as long as we can.  A lot of the changes so far have seemed
> minor enough we could stick conditionals on firmware version, and if
> fw changes come along that warrant a radical change in handling from
> the host, we can abstract it away then.
>
> But, I'm open to other suggestions :)

Right now my main concern is to get secure boot support in, and the
shortest path seems to be to not care about ABI compatibility between
Nouveau and NV firmwares (at least for PMU). Basically I am hoping
that you will agree to proceed this way in a first time. ^_^
