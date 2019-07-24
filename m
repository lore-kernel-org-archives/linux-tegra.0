From: Viswanath L <viswanathl@nvidia.com>
Subject: Re: [PATCH v2] drm/tegra: sor: Enable HDA interrupts at plugin
Date: Wed, 24 Jul 2019 12:11:13 +0530
Message-ID: <5142f8d7-a387-a556-8209-536439be4925@nvidia.com>
References: <1563787632-19762-1-git-send-email-viswanathl@nvidia.com>
 <11288075-f34a-222c-66da-2bfd13db987c@gmail.com>
 <fe7a0f13-4e85-56db-7629-92c6a8f67014@nvidia.com>
 <5281fd84-bbe8-8482-0224-068b87349aaa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5281fd84-bbe8-8482-0224-068b87349aaa@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hello Dmitry, I have pushed new patch set v3=20
(https://patchwork.ozlabs.org/patch/1135605/). Request you to kindly review=
.

Thanks.

On 7/23/2019 3:48 PM, Dmitry Osipenko wrote:
> 23.07.2019 13:11, Viswanath L =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Thanks for your comments, Dmitry. Please see my responses inline.
>>
>> On 7/23/2019 6:00 AM, Dmitry Osipenko wrote:
>>> 22.07.2019 12:27, Viswanath L =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> HDMI plugout calls runtime suspend, which clears interrupt registers
>>>> and causes audio functionality to break on subsequent plugin; setting
>>>> interrupt registers in sor_audio_prepare() solves the issue
>>> Hello Viswanath,
>>>
>>> A dot should be in the end of sentence, please. And should be better to
>>> s/plugin/plug-in/ in the commit's message/title because 'plugin' sounds
>>> as a noun.
>> [VL] Yes, I'll make the above changes.
>>> Please don't version patch as v2 if v1 wasn't ever sent out.
>> [VL] Now that I have sent v2, shall I continue with v2 for the next
>> patch? Apologies for this oversight.
> v3 should be good.
>
>>> You should add a stable tag here to get patch backported into stable
>>> kernel versions:
>>>
>>> Cc: <stable@vger.kernel.org>
>> [VL] Yes, will add.
>>>> Signed-off-by: Viswanath L <viswanathl@nvidia.com>
>>> The kernel upstreaming rules require a full name. I'm pretty sure that =
L
>>> isn't yours surname.
>> [VL] My name appears as "Viswanath L" in all company records and email
>> lists. I would strongly prefer to keep it this way, unless that is an
>> absolute no-no.
> I guess it should be okay, but a full name is much more preferable.
