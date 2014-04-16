From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: as3722: fix handling of GPIO invert bit
Date: Wed, 16 Apr 2014 10:21:04 -0600
Message-ID: <534EADF0.1020907@wwwdotorg.org>
References: <1397611505-17917-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397611505-17917-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/15/2014 07:25 PM, Andrew Bresticker wrote:
> The AS3722_GPIO_INV bit will always be blindly overwritten by
> as3722_pinctrl_gpio_set_direction() and will be ignored when
> setting the value of the GPIO in as3722_gpio_set() since the
> enable_gpio_invert flag is never set.  This will cause an
> initially inverted GPIO to toggle when requested as an output,
> which could be problematic if, for example, the GPIO controls
> a critical regulator.
> 
> Instead of setting up the enable_gpio_invert flag, uust leave
> the invert bit alone and check it before setting the GPIO value.

Reviewed-by: Stephen Warren <swarren@nvidia.com>
Tested-by: Stephen Warren <swarren@nvidia.com>

(not with a 'scope or anything, but an affected system boots in a stable
fashion with this applied)

Should this be CC: stable?
