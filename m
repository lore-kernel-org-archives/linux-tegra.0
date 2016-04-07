From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: tegra: clear park bit for all pins
Date: Thu, 7 Apr 2016 16:10:29 -0600
Message-ID: <5706DAD5.9020805@wwwdotorg.org>
References: <1460065028-26169-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1460065028-26169-1-git-send-email-rklein@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/07/2016 03:37 PM, Rhyland Klein wrote:
> Parking bits might not be cleared by the bootloader properly (if for
> instance it doesn't use the device configured by that pin). Clear
> the park bits for all the pins during pinctrl probe.
>
> This is present on T210 platforms but not earlier ones, so for earlier
> generations, set parked_reg = -1 to disable.
>
> The park bit is used to prevent glitching when reprogramming pinctrl
> registers.
>
> Based on work by:
> Shravani Dingari <shravanid@nvidia.com>
>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>

Acked-by: Stephen Warren <swarren@nvidia.com>

