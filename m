From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH] mfd: max77620: Fix FPS switch statements
Date: Tue, 14 Jun 2016 12:50:24 -0400
Message-ID: <8e25e615-e2db-ad9b-2aad-cc44599c58d1@nvidia.com>
References: <1463075104-26924-1-git-send-email-rklein@nvidia.com>
 <20160607080538.GG1525@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160607080538.GG1525@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 6/7/2016 4:05 AM, Lee Jones wrote:
> On Thu, 12 May 2016, Rhyland Klein wrote:
> 
>> When configuring FPS during probe, assuming a DT node is present for
>> FPS, the code can run into a problem with the switch statements in
>> max77620_config_fps() and max77620_get_fps_period_reg_value(). Namely,
>> in the case of chip->chip_id == MAX77620, it will set
>> fps_[mix|max]_period but then fall through to the default switch case
>> and return -EINVAL. Returning this from max77620_config_fps() will
>> cause probe to fail.
>>
>> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
>> ---
>>  drivers/mfd/max77620.c | 2 ++
>>  1 file changed, 2 insertions(+)
> 
> Applied to -fixes with Thierry and Laxman's Acks.
> 

I don't see this in linux-next yet (as of 20160614). Can we get this
merged there to.

-rhyland

-- 
nvpublic
