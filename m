From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clocksource/drivers/tegra: rework for compensation of
 suspend time
Date: Thu, 11 Apr 2019 15:21:37 +0200
Message-ID: <b66bd5ef-1ab4-aa5e-6e97-5ccb7f7dd1cc@linaro.org>
References: <20190402030234.13488-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402030234.13488-1-josephl@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 02/04/2019 05:02, Joseph Lo wrote:
> Since the clocksource framework has the support for suspend time
> compensation. Re-work the driver to use that, so we can reduce the
> duplicate code.
> 
> Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---


Awesome, thanks for this patch.

Applied for 5.2

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
