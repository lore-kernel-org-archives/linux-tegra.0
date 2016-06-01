From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH] mfd: max77620: Fix FPS switch statements
Date: Wed, 1 Jun 2016 11:29:29 -0400
Message-ID: <55393f24-75ce-67b3-2933-3b7aeccb12ce@nvidia.com>
References: <1463075104-26924-1-git-send-email-rklein@nvidia.com>
 <5734C2C2.2060207@nvidia.com>
 <9716c1c8-dd2b-8444-6ec9-567d07fe8971@nvidia.com>
 <20160531073022.GA1729@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160531073022.GA1729@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 5/31/2016 3:30 AM, Lee Jones wrote:
> On Fri, 27 May 2016, Rhyland Klein wrote:
> 
>> On 5/12/2016 1:52 PM, Laxman Dewangan wrote:
>>>
>>> On Thursday 12 May 2016 11:15 PM, Rhyland Klein wrote:
>>>> When configuring FPS during probe, assuming a DT node is present for
>>>> FPS, the code can run into a problem with the switch statements in
>>>> max77620_config_fps() and max77620_get_fps_period_reg_value(). Namely,
>>>> in the case of chip->chip_id == MAX77620, it will set
>>>> fps_[mix|max]_period but then fall through to the default switch case
>>>> and return -EINVAL. Returning this from max77620_config_fps() will
>>>> cause probe to fail.
>>>>
>>>
>>> Thanks for fixes.
>>> Missed when converting if-else to switch.
>>>
>>> Reviewed-by: Laxman Dewangan <ldewangan@nvidia.com>
>>>
>>
>> Lee, I noticed this hasn't been merged yet, but without it platforms
>> using the max77620 can easily (if it has FPS nodes) fail to probe. Is
>> there anything blocking it?
> 
> Yes, it was sent too late in the cycle.
> 

Ok, thanks.

-rhyland

-- 
nvpublic
