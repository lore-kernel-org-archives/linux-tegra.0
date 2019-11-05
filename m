From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v9 19/19] PM / devfreq: tegra20/30: Add Dmitry as a
 maintainer
Date: Tue, 5 Nov 2019 13:07:18 +0900
Message-ID: <0e7db72b-37ff-a36e-11fe-727ed43c26a6@samsung.com>
References: <20191104215617.25544-1-digetx@gmail.com>
        <CGME20191104221855epcas4p3761ca7e09ffa66b686be8b5a840ea383@epcas4p3.samsung.com>
        <20191104215617.25544-20-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191104215617.25544-20-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 11. 5. 오전 6:56, Dmitry Osipenko wrote:
> I was contributing to the NVIDIA Tegra20+ devfreq drivers recently and
> want to help keep them working and evolving in the future.
> 
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9f69d01da3a6..4b9679988514 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10632,6 +10632,15 @@ F:	include/linux/memblock.h
>  F:	mm/memblock.c
>  F:	Documentation/core-api/boot-time-mm.rst
>  
> +MEMORY FREQUENCY SCALING DRIVERS FOR NVIDIA TEGRA
> +M:	Dmitry Osipenko <digetx@gmail.com>
> +L:	linux-pm@vger.kernel.org
> +L:	linux-tegra@vger.kernel.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mzx/devfreq.git
> +S:	Maintained
> +F:	drivers/devfreq/tegra20-devfreq.c
> +F:	drivers/devfreq/tegra30-devfreq.c
> +
>  MEMORY MANAGEMENT
>  L:	linux-mm@kvack.org
>  W:	https://protect2.fireeye.com/url?k=9d0ba644-c09508de-9d0a2d0b-0cc47a336fae-300ed90f1ba3077c&u=http://www.linux-mm.org/
> 

Looks good to me. 

But, the merge conflict might be occurred.
After getting the review from Myungjoo,
you better to send this patch separately
based on the latest MAINTAINERS file.

Thanks for your all efforts.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
