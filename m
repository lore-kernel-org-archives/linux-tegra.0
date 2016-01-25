From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2 2/5] core: add support for secure boot
Date: Mon, 25 Jan 2016 11:17:41 +0900
Message-ID: <CAAVeFuJadD7nAP+3UVK4HrvdZ+BCXzch9NMb3UTTrz1hr7Z=9Q@mail.gmail.com>
References: <1453097447-12152-1-git-send-email-acourbot@nvidia.com>
 <1453097447-12152-3-git-send-email-acourbot@nvidia.com> <CACvgo50P8JQ5EkCEMmnGQGO4jMsc0O4cRB1QO04V0KQS7Y8AYA@mail.gmail.com>
 <56A0CB7A.9010104@gmail.com> <CACvgo53cqvn73=Ks-syi=12eO7vrjRcwKJHpgfHh75hHT0sPkQ@mail.gmail.com>
 <CAAVeFuLXwo0hb7Z_h3+gOA4u+fp0u=zLPuGxFBW+uY0MsQY-aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuLXwo0hb7Z_h3+gOA4u+fp0u=zLPuGxFBW+uY0MsQY-aQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 25, 2016 at 11:15 AM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Jan 21, 2016 at 9:31 PM, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 21 January 2016 at 12:13, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 01/21/2016 10:09 PM, Emil Velikov wrote:
>>>> Hi Alexandre,
>>>>
>>>> On 18 January 2016 at 06:10, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>>
>>>> [snip]
>>>>> +static const char *
>>>>> +managed_falcons_names[] = {
>>>>> +       [NVKM_SECBOOT_FALCON_PMU] = "PMU",
>>>>> +       [NVKM_SECBOOT_FALCON_RESERVED] = "<invalid>",
>>>> "<reserved>" perhaps ? we already have one invalid below.
>>> Does <reserved> really mean: "we don't want to tell you?" here? :)
>>>
>> That or we have some secret WIP that we're haven't decided if it'll work out :-)
>
> That's just how it appears on our end. :) But since this enum does not
> seem to be used by the hardware anyway, I will simply remove the
> "_RESERVED" entry. Thanks.

Meh, stupid me - these values also appear in the firmware files, so I
must keep the same numbering, and thus the _RESERVED entry. Sorry for
the noise.
