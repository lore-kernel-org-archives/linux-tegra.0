From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
Date: Fri, 24 Apr 2020 18:07:41 +0300
Message-ID: <3155e0d2-94b0-6e0a-bf35-b3560c201039@gmail.com>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

24.04.2020 06:55, Sowjanya Komatineni пишет:

Is this driver compiled as a single kernel module file?

> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
> +MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
> +MODULE_LICENSE("GPL v2");
...
> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
> +MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
> +MODULE_LICENSE("GPL v2");

I don't think that these macros are needed in that case.
The video.c should be enough, isn't it?
