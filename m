From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] drm/tegra: return with probe defer if GPIO subsystem is
 not ready
Date: Fri, 26 Jul 2019 18:00:47 +0300
Message-ID: <72141479-4ee8-d151-90dc-168e5c9a79c2@gmail.com>
References: <20180726133606.14587-1-stefan@agner.ch>
 <de84d04c902d1f7f22b6f024b853a1c7@agner.ch>
 <cd14bca0a1f1e097265602a1d5f0c0f5@agner.ch>
 <f035a8ba-ffa7-b98b-a444-db8b4bbd34ec@gmail.com>
 <d02d9605797d784dc941c9d98769bf5d@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d02d9605797d784dc941c9d98769bf5d@agner.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: thierry.reding@gmail.com, airlied@linux.ie, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

26.07.2019 17:57, Stefan Agner пишет:
> On 2019-07-26 16:46, Dmitry Osipenko wrote:
>> 26.07.2019 17:23, Stefan Agner пишет:
>>> Hi Thierry, Hi Dave,
>>>
>>> On 2018-09-07 01:31, Stefan Agner wrote:
>>>> On 26.07.2018 06:36, Stefan Agner wrote:
>>>>> If the GPIO subsystem is not ready make sure to return -EPROBE_DEFER
>>>>> instead of silently continuing without HPD.
>>>>>
>>>>> Reported-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>>>>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>>>>
>>>> I think this did not get merged yet, any chance to get it in?
>>>
>>> Any chance to get this in in the next merge window?
>>
>> The patch isn't relevant anymore (since v5.3) because the code was
>> changed and now propagates the proper error code in a case of error,
>> please see [1].
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.3-rc1&id=bbad640709fd43ff77b8838c409c977c0b28430c
> 
> Oh I see, I accidentally checked in Linux 5.2. Sorry for the noise and
> thanks for the link!

No problems, you're welcome.
