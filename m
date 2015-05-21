From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v4] pmu/gk20a: PMU boot support
Date: Thu, 21 May 2015 18:46:02 +1000
Message-ID: <CACAvsv7TLxXZrGhwiDKzXGgVumWQEARJRV2x-97O8SbMj+3bRQ@mail.gmail.com>
References: <1428921530-28556-1-git-send-email-acourbot@nvidia.com>
	<552B9D8A.5050202@nvidia.com>
	<CACAvsv4MC3hq5_DJ5c7NPfEYyrsG2vPMjadEhC+H4zcWzc+F=Q@mail.gmail.com>
	<CAAVeFuL8R=hcO2u8xCZB6GuM58Kgx6RzW2oWwKPcwrs4bj4rqQ@mail.gmail.com>
	<CACAvsv7un7b38_s6Whu7JdOegNs-+3ci_GFYHAzwO5CL6KWA1Q@mail.gmail.com>
	<CAAVeFuKOwLiOM-fkadp5dvutrxE-QHP-y=TmSVvBgJ5syHfiHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuKOwLiOM-fkadp5dvutrxE-QHP-y=TmSVvBgJ5syHfiHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 21 May 2015 at 16:03, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, May 15, 2015 at 2:37 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
>> On 12 May 2015 at 19:04, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Hi Ben,
>>>
>>> On Fri, May 1, 2015 at 8:01 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>>>> On 13 April 2015 at 20:42, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:
>>>>> Ben, I guess our main remaining concern with this patch is how it=
 should
>>>>> integrate wrt. the existing PMU code. Since it is designed to int=
eract with
>>>>> the NVIDIA firmware, maybe we should use a different base code, o=
r do you
>>>>> think we can somehow share code and data structures?
>>>> Hey Alexandre,
>>>>
>>>> Sorry for the delay in responding to this.
>>>
>>> It is my turn to apologize - I was (well still am, technically :)) =
on
>>> holidays and have just started unpiling my inbox...
>>>
>>>>
>>>> My original thinking with transitioning to use NVIDIA's firmware w=
as
>>>> that I'd modify our firmware interfaces to match yours, and share =
the
>>>> code.  I haven't started on any of this yet due to not having any =
word
>>>> on how you guys will be shipping the images, etc.  It would be nic=
e to
>>>> have some communication on these things :)
>>>
>>> Indeed. For the first time with Maxwell GPUs, NVIDIA-provided firmw=
are
>>> will be required for GPUs to operate properly. This raises several
>>> questions:
>>>
>>> - Should the firmware be released under /lib/firmware/nouveau or
>>> /lib/firmware/nvidia ? (this directory already exists for Tegra USB
>>> firmware and makes more sense to me, since the firmware is not
>>> Nouveau-specific)
>> I think /lib/firmware/nvidia makes sense here too.
>>
>>> - For GPCCS/FECS firmware, should we release the netlist "pack" fil=
e
>>> or adopt the same format as Nouveau does? (1 file per firmware)
>>> - Should we keep the current files names (e.g. nvxx_fucxxxx[cd]), o=
r
>>> try to switch to more meaningful ones?
>> I'd actually prefer to have the entire netlists bundled, that gives =
us
>> updated reg/ctx production values too as you guys tweak/update them
>> for hw bugs (etc).  They're also nicer in that you get a single bund=
le
>> of everything that's required for that chipset+engine.
>
> Good for me - actually that's the solution I implemented first before
> deciding to go "=C3=A0 la Nouveau". ;) Some extra code will be needed=
, but
> nothing crazy, and we will limit that feature to these chips for whic=
h
> NVIDIA officially provides the firmware.
>
>> I don't have too much opinion on naming.  The current model of
>> nv{CHIPSET}_{UCODE_TYPE}{REGISTER_BASE}[CODE,DATA] was just nice and
>> convenient to snprintf into a buffer :)
>
> Since the firmware will be provided by us, shall we store it into
> nvidia/<chip>/gpcfe.bin on linux-firmware?
Sounds fine.

>
>>> - What about signature files that are required for secure boot?
>> As with above, if it's possible to ship them in a single file with t=
he
>> ucode that it belongs to, that'd be ideal.  It's not a huge deal
>> though.
>
> So here we actually have several files - it is kind of a mess
> actually. However I could probably merge them into a single netlist
> file like we did for the GPC/FE CS code.
If that's possible, that'd be great.

>
>>> - Knowing that NVIDIA's firmware ABI is a (very slowly) moving targ=
et,
>>> it is worth to aim at ABI compatibility, or should we assume differ=
ent
>>> paths for Nouveau and NVIDIA firmware? If ABI incompatibilities are
>>> introduced in the way, how do we handle versioning?
>> For incompatible changes, I think appending a -VERSION to each
>> firmware blob is probably the simplest approach.  The driver can
>> select the necessary codepath based on what it finds (probably tryin=
g
>> newer versions first, obviously).
>
> I agree. Hopefully we won't have too much of this.
>
>>> All these issues make me tend towards having a separate handling of
>>> NVIDIA-released firmware (location, format, and ABI). It will also
>>> make the firmware easier to release if conversions are not necessar=
y
>>> on the way out. What are your thoughts on this?
>> I'm not entirely set here, either way.  I somewhat think that
>> initially I should adapt our interfaces to match, and a keep single
>> code path as long as we can.  A lot of the changes so far have seeme=
d
>> minor enough we could stick conditionals on firmware version, and if
>> fw changes come along that warrant a radical change in handling from
>> the host, we can abstract it away then.
>>
>> But, I'm open to other suggestions :)
>
> Right now my main concern is to get secure boot support in, and the
> shortest path seems to be to not care about ABI compatibility between
> Nouveau and NV firmwares (at least for PMU). Basically I am hoping
> that you will agree to proceed this way in a first time. ^_^
If it's really that urgent, my suggestion is to submit the patches as
you did previously, keeping them confined to GK20A/GM20B, and I'll do
something nicer to support boards in general.

=46rankly, I'd have had secure boot support in the driver already had
NVIDIA played things a little differently...  Going forward, I'd like
to see NVIDIA not treating the Tegra parts of nouveau as a little
black box where anything goes and things are different from the rest
of the driver.  The chips operate, for the most part, identically to
their big siblings...

Thanks,
Ben.
