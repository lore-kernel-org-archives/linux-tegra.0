From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Date: Thu, 25 Jun 2020 12:19:43 +0300
Message-ID: <07886895-225b-6156-9217-e40cd611ccf3@kapsi.fi>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <3703cf87-457a-0e71-7693-5644735e438a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3703cf87-457a-0e71-7693-5644735e438a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 6/25/20 2:23 AM, Dmitry Osipenko wrote:
> 23.06.2020 15:09, Mikko Perttunen пишет:
>>
>> struct drm_tegra_channel_submit {
>>          __u32 channel_id;
>>          __u32 flags;
>>
>>          /**
>>           * [in] Timeout in microseconds after which the kernel may
>>           *   consider the job to have hung and may reap it and
>>           *   fast-forward its syncpoint increments.
>>           *
>>           *   The value may be capped by the kernel.
>>           */
>>          __u32 timeout;
> 
> What about to rename this to timeout_us? For clarity.
> 
>>          __u32 num_syncpt_incrs;
>>          __u32 num_relocations;
>>          __u32 num_commands;
>>
>>          __u64 syncpt_incrs;
>>          __u64 relocations;
>>          __u64 commands;
> 
> Let's also add "_ptr" postfix to all usrptr names, again for clarity.
> 
> It's always nice to have meaningful names :)
> 

Yep, good point. I'll fix this for next revision :)

Mikko
