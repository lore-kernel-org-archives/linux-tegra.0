From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Fri, 10 Apr 2020 22:47:10 +0300
Message-ID: <775fa216-a010-4785-d6f8-28ac7c39333f@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.04.2020 04:25, Sowjanya Komatineni пишет:
> +	/* wait for syncpt counter to reach frame start event threshold */
> +	err = host1x_syncpt_wait(chan->frame_start_sp, thresh,
> +				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
> +	if (err) {
> +		dev_err(&chan->video.dev,
> +			"frame start syncpt timeout: %d\n", err);

I guess this and the other timeout should be dev_err_ratelimited().
