From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Date: Fri, 26 Jun 2020 16:59:45 +0300
Message-ID: <b46516eb-4077-c3ac-83d0-d8c57660dc3e@gmail.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
 <20200626114040.GA3143884@ulmo> <20200626133837.GE3278063@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200626133837.GE3278063-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

26.06.2020 16:38, Daniel Vetter пишет:
> On Fri, Jun 26, 2020 at 01:40:40PM +0200, Thierry Reding wrote:
>> On Fri, Jun 26, 2020 at 01:06:58PM +0200, Karol Herbst wrote:
>>> On Tue, Jun 23, 2020 at 3:03 PM Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org> wrote:
>>>>
>>>> # Host1x/TegraDRM UAPI proposal
>>>>
>>>> This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace
>>>> the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in
>>>> many ways.
>>>>
>>>> I haven't written any implementation yet -- I'll do that once there is
>>>> some agreement on the high-level design.
>>>>
>>>> Current open items:
>>>>
>>>> * The syncpoint UAPI allows userspace to create sync_file FDs with
>>>> arbitrary syncpoint fences. dma_fence code currently seems to assume all
>>>> fences will be signaled, which would not necessarily be the case with
>>>> this interface.
>>>> * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
>>>> Not sure if they are still needed.
>>>>
>>>
>>> Hi, as this wasn't addressed here (and sorry if I missed it): is there
>>> an open source userspace making use of this UAPI? Because this is
>>> something which needs to be seen before it can be included at all.
>>
>> There's a set of commits that implement an earlier draft here:
>>
>>     https://github.com/thierryreding/linux/tree/for-5.6/drm-tegra-destage-abi
>>
>> and corresponding changes to libdrm to make use of that and implement
>> tests using the various generations of VIC here:
>>
>>     https://cgit.freedesktop.org/~tagr/drm/log/
>>
>> Before actually jumping to an implementation we wanted to go over the
>> design a bit more to avoid wasting a lot of work, like we've done in
>> the past. Turns out it isn't easy to get everyone to agree on a good
>> ABI. Who would've thought? =)
>>
>> I expect that once the discussion around the ABI settles Mikko will
>> start on implementing this ABI in the kernel and we'll update the
>> libdrm patches to make use of the new ABI as well.
> 
> Do we have more than libdrm and tests for this, like something somewhat
> functional? Since tegradrm landed years ago we've refined the criteria a
> bit in this regard, latest version is explicit in that it needs to be
> something that's functional (for end-users in some form), not just
> infrastructure and tests.

We have Opentegra [1] and VDPAU [2] userspace drivers for older Tegra
SoCs that have been using the staging UAPI for years now.

[1] https://github.com/grate-driver/xf86-video-opentegra
[2] https://github.com/grate-driver/libvdpau-tegra

The UAPI and the kernel driver updates are very needed for these drivers
because of the missing UAPI synchronization features and performance
problems of the kernel driver.

So we already have some real-world userspace for the testing!

It's not the first and not the second time we're discussing the Tegra
DRM UAPI changes, but this time it feels like there is a good chance
that it will finally materialize and I'm very happy about it :)
