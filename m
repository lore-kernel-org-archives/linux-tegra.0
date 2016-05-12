From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] mfd: max77620: Fix FPS switch statements
Date: Thu, 12 May 2016 23:22:02 +0530
Message-ID: <5734C2C2.2060207@nvidia.com>
References: <1463075104-26924-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463075104-26924-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>, Lee Jones <lee.jones@linaro.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 12 May 2016 11:15 PM, Rhyland Klein wrote:
> When configuring FPS during probe, assuming a DT node is present for
> FPS, the code can run into a problem with the switch statements in
> max77620_config_fps() and max77620_get_fps_period_reg_value(). Namely,
> in the case of chip->chip_id == MAX77620, it will set
> fps_[mix|max]_period but then fall through to the default switch case
> and return -EINVAL. Returning this from max77620_config_fps() will
> cause probe to fail.
>

Thanks for fixes.
Missed when converting if-else to switch.

Reviewed-by: Laxman Dewangan <ldewangan@nvidia.com>
