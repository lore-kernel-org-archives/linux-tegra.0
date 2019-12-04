From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 00/11] thermal: clean up output of make W=1
Date: Wed, 4 Dec 2019 17:29:02 +0100
Message-ID: <4318ca22-2e7c-c529-e97d-73eec7266376@linaro.org>
References: <cover.1574242756.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1574242756.git.amit.kucheria@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>, linux-kernel@vger.kernel.org, edubezval@gmail.com, Amit Daniel Kachhap <amit.kachhap@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Guillaume La Roque <glaroque@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Javi Merino <javi.merino@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Jun Nie <jun.nie@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 20/11/2019 16:45, Amit Kucheria wrote:
> Cleanup output of make W=1 inside drivers/thermal. This should allow us to
> focus on real issues that tend to get lost in the noise much better.
> 
> There is no functional change. This series was generate on top of
> linux-next from 20191119.
> 
> Changes since v1:
> - Add review tags
> - Fixed up commit message for devfreq_cooling and samsung changes

Applied, thanks!


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
