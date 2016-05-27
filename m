From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH] mfd: max77620: Fix FPS switch statements
Date: Fri, 27 May 2016 16:31:25 -0400
Message-ID: <9716c1c8-dd2b-8444-6ec9-567d07fe8971@nvidia.com>
References: <1463075104-26924-1-git-send-email-rklein@nvidia.com>
 <5734C2C2.2060207@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5734C2C2.2060207@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Lee Jones <lee.jones@linaro.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 5/12/2016 1:52 PM, Laxman Dewangan wrote:
> 
> On Thursday 12 May 2016 11:15 PM, Rhyland Klein wrote:
>> When configuring FPS during probe, assuming a DT node is present for
>> FPS, the code can run into a problem with the switch statements in
>> max77620_config_fps() and max77620_get_fps_period_reg_value(). Namely,
>> in the case of chip->chip_id == MAX77620, it will set
>> fps_[mix|max]_period but then fall through to the default switch case
>> and return -EINVAL. Returning this from max77620_config_fps() will
>> cause probe to fail.
>>
> 
> Thanks for fixes.
> Missed when converting if-else to switch.
> 
> Reviewed-by: Laxman Dewangan <ldewangan@nvidia.com>
> 

Lee, I noticed this hasn't been merged yet, but without it platforms
using the max77620 can easily (if it has FPS nodes) fail to probe. Is
there anything blocking it?

-rhyland

-- 
nvpublic
