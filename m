From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v7 6/9] media: tegra: Add Tegra210 Video input driver
Date: Wed, 15 Apr 2020 16:28:42 -0700
Message-ID: <c95cd2b6-8036-8c0a-25f3-6ea3fe35334a@nvidia.com>
References: <1586919463-30542-1-git-send-email-skomatineni@nvidia.com>
 <1586919463-30542-7-git-send-email-skomatineni@nvidia.com>
 <4118112f-f865-5460-6319-d71271fd78d1@gmail.com>
 <a69a8b34-beea-3ad0-e08e-f7df8b9e7047@nvidia.com>
 <6afa951e-d904-f3c0-053f-82a02fb18979@nvidia.com>
 <b1c78827-13ea-0c94-a575-97b5afc0ede1@nvidia.com>
 <5954a7e1-910e-7f48-56d3-e671b56ead74@nvidia.com>
 <d6a9e07c-474a-a076-8313-32f5f4ca8d64@nvidia.com>
 <786949a9-8507-7723-f29b-b91a216bfd28@nvidia.com>
 <f831408b-bbf4-3047-20e3-5bebfa9fc1ad@gmail.com>
 <2ad9352f-cb65-1643-e540-a21f9c570266@nvidia.com>
 <31924f2b-8f85-d28d-4f5d-4e232bff94a5@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <31924f2b-8f85-d28d-4f5d-4e232bff94a5-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Sorry please ignore.

We can't free vi during v4l2 device release as when no device nodes are=20
opened, vi free happens right away during host1x_video_remove.

With this tegra-video driver unbind ->bind will not work as vi memory=20
allocated during vi_probe gets freed during v4l2 device release so=20
during bind init() callback execution will crash as vi got freed while=20
vi driver is still bound to device.

Will wait for Hans/Thierry comments as I see dependency depending on=20
where unbind/bind happens.


On 4/15/20 4:08 PM, Sowjanya Komatineni wrote:
> With minor change of not using vi reference after=20
> host1x_client_unregister and freeing vi during v4l2 device release works.
>
> For csi, we can use devm_kzalloc for now untill we decide later if we=20
> want to expose async subdev nodes during sensor support.
>
> Will have this fix in v8 with a comment in vi_remove to make sure not=20
> to use vi reference after host1x_client_unregister.
>
> Will test more and will release v8 with above fix to allow direct=20
> host1x client driver unbind.
>
> Thanks
>
> sowjanya
>
>
> On 4/15/20 12:51 PM, Sowjanya Komatineni wrote:
>>
>> On 4/15/20 12:21 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 15.04.2020 21:53, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> ...
>>>>>>>>>> Have you tried to test this driver under KASAN? I suspect that
>>>>>>>>>> you just
>>>>>>>>>> masked the problem, instead of fixing it.
>>>> Tested with kmemleak scan and did not see any memory leaks
>>> You should get use-after-free and not memleak.
>> I don't see use-after-free bugs during the testing.
>>
>> But as mentioned when direct vi/csi client driver unbind happens=20
>> while video device node is kept opened, vi driver remove will free vi=20
>> structure memory but actual video device memory which is part of=20
>> channels remains but list head gets lost when vi structure is freed.
>>
>> So, when device node is released and executes release callback as=20
>> list head is lost it can't free allocated channels which is not good.
>>
>> This happens only with direct host1x client vi/csi driver unbind.
>>
>> Need to find better place to free host1x client driver data structure=20
>> to allow direct client driver unbind->bind.
>>
