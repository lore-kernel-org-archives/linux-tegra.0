From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3] regmap: add iopoll-like atomic polling macro
Date: Sat, 11 Jan 2020 01:07:30 +0300
Message-ID: <b13b2e54-f867-d35b-c294-bfa8fbc5a6b7@gmail.com>
References: <1578546590-24737-1-git-send-email-spujar@nvidia.com>
 <fa5198bf-0001-3a57-017f-1b40e0188606@gmail.com>
 <b9f5459f-007e-3139-a3cf-c7dfd3fc335a@nvidia.com>
 <e1ab2304-2ef8-c50d-d9c7-21569b397c23@gmail.com>
 <b14d6130-8a9e-28ac-3ce6-dc6b9e3a3886@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b14d6130-8a9e-28ac-3ce6-dc6b9e3a3886@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org
Cc: jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

10.01.2020 07:50, Sameer Pujar пишет:
> 
> On 1/9/2020 7:27 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 09.01.2020 10:24, Sameer Pujar пишет:
>>> On 1/9/2020 11:30 AM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 09.01.2020 08:09, Sameer Pujar пишет:
>>>>> This patch adds a macro 'regmap_read_poll_timeout_atomic' that works
>>>>> similar to 'readx_poll_timeout_atomic' defined in linux/iopoll.h; This
>>>>> is atomic version of already available 'regmap_read_poll_timeout'
>>>>> macro.
>>>>>
>>>>> It should be noted that above atomic macro cannot be used by all
>>>>> regmaps.
>>>>> If the regmap is set up for atomic use (flat or no cache and MMIO)
>>>>> then
>>>>> only it can use.
>>>>>
>>>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>>>> ---
>>>> Could you please explain what is the targeted use-case here?
>>> I was trying to use regmap_read_poll_timeout() to poll for status change
>>> of a register. This resulted in "BUG: scheduling while atomic". The
>>> callback function, in which I was trying to use the macro, runs in
>>> atomic context. Hence new atomic macro is added. I was checking ALSA
>>> playback/capture and trigger() callback had to monitor some register
>>> status.
>>>
>>> In general, the new macro can be used in atomic callbacks where regmap
>>> interface is used and polling is required.
>>>
>> You should send a full patchset because it may turn out that the patch
>> which makes use of the new feature isn't correct or maybe the new
>> feature isn't really needed.
>>
>> If there was a previous discussion about the need for this change, then
>> you should provide a link to that discussion.
>>
>> Please note that usually changes without a real use-case in kernel are
>> not getting picked up or they are getting removed later on if nobody
>> makes use of them, so I assume this is a kind of an RFC patch for now.
> 
> OK. I will send this as part of the complete series. Thank you.
> 

Thanks! Please feel free to add me to the CC list, I'll take a look at
the patches.
