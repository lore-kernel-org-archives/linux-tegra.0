From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/4] pinctrl: tegra: driver layout/consistency fixes
Date: Tue, 03 Mar 2015 13:21:01 -0700
Message-ID: <54F617AD.6070208@wwwdotorg.org>
References: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 02/24/2015 02:00 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>
> Various non-semantic tweaks and layout/consistency fixes for existing
> Tegra pinctrl drivers.
>
> Move the definition of DRV_PINGROUP_REG() before the definition of
> PINGROUP() so that a future SoC driver can invoke the former from the
> latter.
>
> PINGROUP_BIT_Y(n) is just n, so replace it with n.
>
> Re-wrap the parameters to *PINGROUP().
>
> Keep various enums sorted in the Tegra124 driver.
>
> Various white-space consistency fixes.
>
> These changes aim to update existing drivers to be consistent with future
> SoC drivers. While we could ignore these tweaks to the existing drivers,
> I'd like to keep everything as consistent as possible for easy comparison.
> Besides, I auto-generate the drivers, and maintaining special-cases to
> keep the differences in place is annoying.

Linus, does this series look OK?
