From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC,libdrm 1/3] tegra: Add stream library
Date: Fri, 28 Dec 2012 11:20:03 +0200
Message-ID: <50DD6443.1060300@nvidia.com>
References: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com> <1355407268-32381-2-git-send-email-amerilainen@nvidia.com> <50DD407B.3030306@gmail.com> <50DD4E2C.2070104@nvidia.com> <50DD50E1.80006@gmail.com> <50DD5D6D.3090504@nvidia.com> <50DD6098.60900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50DD6098.60900-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Francis Hart <fhart-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/28/2012 11:04 AM, Mark Zhang wrote:
> On 12/28/2012 04:50 PM, Arto Merilainen wrote:
>>
>> In my opinion asking tegra_stream_begin() to put a bad fence into the
>> stream is a case we should never be. assert() kills the application
>> immediately (in debug builds) and usually this helps the programmer for
>> 1) finding bugs 2) not doing bad code.
>>
>
> Yep, I agree. But in release builds, assert does nothing. So this
> checking doesn't make sense and also a wrong fence will be pushed into
> command buffer silently. And we always use release version in real
> products, so we can't count on this "assert".

The only pro of using assert is low (=no :-) ) overhead in release builds.

>
>> "Silencing" is not a good solution especially in this case:
>> tegra_stream_flush() returns an invalid fence when flushing fails. If
>> the application chains submits (i.e. do a blit and then do another using
>> the output of the first blit) it is crucial to be sure the first submit
>> has been performed before starting the second one.
>>
>
> Yes. So I suggest doing fence checking at the beginning of the
> "tegra_stream_begin", if invalid fence found, return an error.
>

This sounds reasonable.

- Arto
