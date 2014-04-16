From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH] pinctrl: as3722: fix handling of GPIO invert bit
Date: Wed, 16 Apr 2014 13:29:20 -0700
Message-ID: <CAL1qeaG4e4gFOBLo1ePfSRLGiSaQW4UY7T1jkBHx9fv=yYCCUA@mail.gmail.com>
References: <1397611505-17917-1-git-send-email-abrestic@chromium.org>
	<534EADF0.1020907@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <534EADF0.1020907@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 16, 2014 at 9:21 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 04/15/2014 07:25 PM, Andrew Bresticker wrote:
>> The AS3722_GPIO_INV bit will always be blindly overwritten by
>> as3722_pinctrl_gpio_set_direction() and will be ignored when
>> setting the value of the GPIO in as3722_gpio_set() since the
>> enable_gpio_invert flag is never set.  This will cause an
>> initially inverted GPIO to toggle when requested as an output,
>> which could be problematic if, for example, the GPIO controls
>> a critical regulator.
>>
>> Instead of setting up the enable_gpio_invert flag, uust leave
>> the invert bit alone and check it before setting the GPIO value.
>
> Reviewed-by: Stephen Warren <swarren@nvidia.com>
> Tested-by: Stephen Warren <swarren@nvidia.com>
>
> (not with a 'scope or anything, but an affected system boots in a stable
> fashion with this applied)
>
> Should this be CC: stable?

I think so.  Kernels with venice2 support should probably have this.
I'll resend and fix the typo in the commit message.
