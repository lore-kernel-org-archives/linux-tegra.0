From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 2/2] rtc: tegra: Implement suspend clock source
Date: Fri, 14 Jun 2019 15:35:14 +0300
Message-ID: <d3de8c42-3718-d87d-3c38-af18c671036c@gmail.com>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <20190614104747.19712-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614104747.19712-2-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

14.06.2019 13:47, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The suspend clock source for Tegra210 and earlier is currently
> implemented in the Tegra timer driver. However, the suspend clock source
> code accesses registers that are part of the RTC hardware block, so both
> can step on each others' toes. In practice this isn't an issue, but
> there is no reason why the RTC driver can't implement the clock source,
> so move the code over to the tegra-rtc driver.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---


[snip]

> +static struct tegra_rtc_info *to_tegra_rtc(struct clocksource *clksrc)
> +{
> +	return container_of(clksrc, struct tegra_rtc_info, clksrc);
> +}

Shouldn't hurt to inline this function explicitly because I assume that it won't get
inlined with a certain kernel configurations, like with enabled ftracing for example.
