From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Tue, 7 Apr 2020 17:00:42 -0700
Message-ID: <ea60b489-990e-4b15-e215-d93381a1371e@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
 <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
 <12a834ac-52b1-6dc0-7d3a-3e6a1fa85a2a@gmail.com>
 <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
 <b1726d33-0d35-9323-a747-407148d0104e@gmail.com>
 <eb80178f-30f4-8f46-51cd-ea3f4914b81d@nvidia.com>
 <dd16c560-ba8f-e7df-5dc4-5227e0043196@nvidia.com>
 <fea4f0a1-4a20-34d4-9eda-e4a599eeeffc@nvidia.com>
 <760d071e-0cbc-b3eb-9231-fb9f9ecb44a6@nvidia.com>
 <9e317f65-8a02-3b15-cfec-8e0d8374130e@gmail.com>
 <97b35910-4c93-123a-43a0-eb14476ed0f3@nvidia.com>
 <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
 <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
 <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
 <db7c7051-5674-cdb9-0aa4-ee94125b3024@gmail.com>
 <1a31cd60-739f-0660-1c45-31487d2f2128@nvidia.com>
 <603084a5-249a-4fe2-3646-e9335ef9ab43@nvidia.com>
 <7895b9c6-f27d-8939-73d7-67d785e1a8b7@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7895b9c6-f27d-8939-73d7-67d785e1a8b7-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/7/20 4:59 PM, Sowjanya Komatineni wrote:
>
> On 4/7/20 4:38 PM, Sowjanya Komatineni wrote:
>>
>> On 4/7/20 4:36 PM, Sowjanya Komatineni wrote:
>>>
>>> On 4/7/20 4:12 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 08.04.2020 01:22, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On 4/7/20 3:08 PM, Dmitry Osipenko wrote:
>>>>>> External email: Use caution opening links or attachments
>>>>>>
>>>>>>
>>>>>> 08.04.2020 00:08, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>> ...
>>>>>>>>> I think you need a semaphore with resource count =3D 2.
>>>>>>>> we hold on to issuing capture if more than 2 buffers are queued=20
>>>>>>>> and it
>>>>>>>> continues only after fifo has min 1 slot empty
>>>>>>> Just want to close on this part of feedback. Hope above=20
>>>>>>> explanation is
>>>>>>> clear regarding triggering/issuing at max 2 frame capture to VI=20
>>>>>>> HW and
>>>>>>> also regarding capture threads where they use=20
>>>>>>> wait_event_interruptible
>>>>>>> to prevent blocking waiting for buffers to be available for=20
>>>>>>> captures.
>>>>>>>
>>>>>>> So no changes related to this part are needed in v7.
>>>>>> =C2=A0 From what I see in the code, you "hold on" by making kthread =
to=20
>>>>>> spin in
>>>>>> a busy-loop while caps_inflight >=3D SYNCPT_FIFO_DEPTH. So some chan=
ge
>>>>>> should be needed to prevent this.
>>>>>>
>>>>>> The wait_event_interruptible seems should be okay.
>>>>> We don't want to prevent that as we already have buffers available=20
>>>>> for
>>>>> capture so as soon as VI HW issuing single shot is done and when=20
>>>>> min 1
>>>>> slot is empty we should continue with issuing for another capture.
>>>>>
>>>>> As long as buffers are available, we should continue to capture and
>>>>> should not hold
>>>>>
>>>> I suppose that taking a shot takes at least few milliseconds, which
>>>> should be unacceptable to waste.
>>> As long as buffers are in queue we have to keep processing each=20
>>> buffer and between buffers obviously we have to wait for previous=20
>>> frames to finish and this why we have separate thread for frame=20
>>> finish where we can have next buffer capture ready and issue while=20
>>> previous frame memory write happens
> Also we specified numbers buffers as 3 to vb2 queue. So this is rare=20
> case but to prevent issuing more than 2 at a time as VI HW is only=20
> double buffered and syncpt fifo max depth is 2 added this to be safer.

To be more clear, when more buffers are enqueued from userspace always=20
capture list will be full and thread will be busy in capture till either=20
error or stop stream request happens.
