From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 3/3] thermal: tegra: add get_trend ops
Date: Mon, 30 Mar 2020 19:23:14 +0200
Message-ID: <156ef39f-4bb2-c7fb-7bf0-abc9e0067c62@linaro.org>
References: <1546510369-28491-1-git-send-email-wni@nvidia.com>
 <1546510369-28491-4-git-send-email-wni@nvidia.com>
 <bae5b0c3-3d7f-0b60-da96-730c7e8c4e5c@linaro.org>
 <ecabe3d8-274f-7c0e-f875-6968c65a4425@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ecabe3d8-274f-7c0e-f875-6968c65a4425-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, srikars-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Wei,

On 19/02/2019 03:15, Wei Ni wrote:

>>> +static int tegra_thermctl_get_trend(void *data, int trip, +
>>> enum thermal_trend *trend)

[ ... ]

>>> +	temp = tz->temperature; +	last_temp = tz->last_temperature; +
>>> mutex_unlock(&tz->lock); + +	if (temp > trip_temp) { +		if
>>> (temp >= last_temp) +			*trend = THERMAL_TREND_RAISING; +
>>> else +			*trend = THERMAL_TREND_STABLE; +	} else if (temp <
>>> trip_temp) { +		*trend = THERMAL_TREND_DROPPING; +	} else { +
>>> *trend = THERMAL_TREND_STABLE; +	} + +	return 0; +} + static
>>> const struct thermal_zone_of_device_ops tegra_of_thermal_ops =
>>> { .get_temp = tegra_thermctl_get_temp, .set_trip_temp =
>>> tegra_thermctl_set_trip_temp, +	.get_trend =
>>> tegra_thermctl_get_trend, };

It has been awhile since this patch was submitted and merged by
Eduardo. I replace him to co-maintain the thermal framework with Rui.

While figuring out the internals for code cleanup, I ended up in this
function above.

Why do you have to use this routine instead of the generic one in
get_tz_trend()?



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
