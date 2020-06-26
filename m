From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Date: Fri, 26 Jun 2020 14:13:23 +0300
Message-ID: <cb935527-2eb9-23f3-a823-d6b849fc3c94@kapsi.fi>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 6/26/20 2:06 PM, Karol Herbst wrote:
> On Tue, Jun 23, 2020 at 3:03 PM Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org> wrote:
>>
>> # Host1x/TegraDRM UAPI proposal
>>
>> This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace
>> the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in
>> many ways.
>>
>> I haven't written any implementation yet -- I'll do that once there is
>> some agreement on the high-level design.
>>
>> Current open items:
>>
>> * The syncpoint UAPI allows userspace to create sync_file FDs with
>> arbitrary syncpoint fences. dma_fence code currently seems to assume all
>> fences will be signaled, which would not necessarily be the case with
>> this interface.
>> * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
>> Not sure if they are still needed.
>>
> 
> Hi, as this wasn't addressed here (and sorry if I missed it): is there
> an open source userspace making use of this UAPI? Because this is
> something which needs to be seen before it can be included at all.
> 

Hi Karol,

not currently, but once we have hashed out the design a little bit (and 
I'm back from vacation), I'll work on open source userspace and 
converting existing code using the staging UAPI to this one.

Mikko
