From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 4 May 2020 10:44:17 +0300
Message-ID: <f1cbb602-163e-a539-aaa5-c7e947a8945b@gmail.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.04.2020 01:00, Sowjanya Komatineni пишет:
> +/*
> + * VI channel input data type enum.
> + * These data type enum value gets programmed into corresponding Tegra VI
> + * channel register bits.
> + */
> +enum tegra_image_dt {
> +	TEGRA_IMAGE_DT_YUV420_8 = 24,
> +	TEGRA_IMAGE_DT_YUV420_10,
> +
> +	TEGRA_IMAGE_DT_YUV420CSPS_8 = 28,
> +	TEGRA_IMAGE_DT_YUV420CSPS_10,
> +	TEGRA_IMAGE_DT_YUV422_8,
> +	TEGRA_IMAGE_DT_YUV422_10,
> +	TEGRA_IMAGE_DT_RGB444,
> +	TEGRA_IMAGE_DT_RGB555,
> +	TEGRA_IMAGE_DT_RGB565,
> +	TEGRA_IMAGE_DT_RGB666,
> +	TEGRA_IMAGE_DT_RGB888,
> +
> +	TEGRA_IMAGE_DT_RAW6 = 40,
> +	TEGRA_IMAGE_DT_RAW7,
> +	TEGRA_IMAGE_DT_RAW8,
> +	TEGRA_IMAGE_DT_RAW10,
> +	TEGRA_IMAGE_DT_RAW12,
> +	TEGRA_IMAGE_DT_RAW14,
> +};

Are these format IDs common to all Tegra SoCs or they unique to T210?
