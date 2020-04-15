From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v7 6/9] media: tegra: Add Tegra210 Video input driver
Date: Wed, 15 Apr 2020 12:51:34 -0700
Message-ID: <2ad9352f-cb65-1643-e540-a21f9c570266@nvidia.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <f831408b-bbf4-3047-20e3-5bebfa9fc1ad@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com, sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/15/20 12:21 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 15.04.2020 21:53, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>>>>>>> Have you tried to test this driver under KASAN? I suspect that
>>>>>>>> you just
>>>>>>>> masked the problem, instead of fixing it.
>> Tested with kmemleak scan and did not see any memory leaks
> You should get use-after-free and not memleak.
I don't see use-after-free bugs during the testing.

But as mentioned when direct vi/csi client driver unbind happens while=20
video device node is kept opened, vi driver remove will free vi=20
structure memory but actual video device memory which is part of=20
channels remains but list head gets lost when vi structure is freed.

So, when device node is released and executes release callback as list=20
head is lost it can't free allocated channels which is not good.

This happens only with direct host1x client vi/csi driver unbind.

Need to find better place to free host1x client driver data structure to=20
allow direct client driver unbind->bind.
