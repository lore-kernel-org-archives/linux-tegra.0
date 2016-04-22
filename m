From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V4 4/4] gpio: tegra: Add support for gpio debounce
Date: Fri, 22 Apr 2016 13:53:03 -0600
Message-ID: <571A811F.6030102@wwwdotorg.org>
References: <1461319754-12040-1-git-send-email-ldewangan@nvidia.com>
 <1461319754-12040-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1461319754-12040-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org
Cc: gnurou@gmail.com, thierry.reding@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/22/2016 04:09 AM, Laxman Dewangan wrote:
> NVIDIA's Tegra210 support the HW debounce in the GPIO controller
> for all its GPIO pins.
>
> Add support for setting debounce timing by implementing the
> set_debounce callback of gpiochip.

Reviewed-by: Stephen Warren <swarren@nvidia.com>
