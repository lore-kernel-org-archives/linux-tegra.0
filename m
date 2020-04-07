From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Tue, 7 Apr 2020 15:22:05 -0700
Message-ID: <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
 <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/7/20 3:08 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 08.04.2020 00:08, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>>> I think you need a semaphore with resource count =3D 2.
>>> we hold on to issuing capture if more than 2 buffers are queued and it
>>> continues only after fifo has min 1 slot empty
>>
>> Just want to close on this part of feedback. Hope above explanation is
>> clear regarding triggering/issuing at max 2 frame capture to VI HW and
>> also regarding capture threads where they use wait_event_interruptible
>> to prevent blocking waiting for buffers to be available for captures.
>>
>> So no changes related to this part are needed in v7.
>  From what I see in the code, you "hold on" by making kthread to spin in
> a busy-loop while caps_inflight >=3D SYNCPT_FIFO_DEPTH. So some change
> should be needed to prevent this.
>
> The wait_event_interruptible seems should be okay.

We don't want to prevent that as we already have buffers available for=20
capture so as soon as VI HW issuing single shot is done and when min 1=20
slot is empty we should continue with issuing for another capture.

As long as buffers are available, we should continue to capture and=20
should not hold
