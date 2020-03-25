From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
Date: Wed, 25 Mar 2020 03:34:06 +0300
Message-ID: <8f44e42d-2008-fe53-f4fb-b57502da91a8@gmail.com>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

23.03.2020 20:52, Sowjanya Komatineni пишет:
> +static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan)
> +{
> +	/* disable clock gating to enable continuous clock */
> +	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, 0);
> +	/*
> +	 * Soft reset memory client interface, pixel format logic, sensor
> +	 * control logic, and a shadow copy logic to bring VI to clean state.
> +	 */
> +	vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xf);
> +	usleep_range(100, 200);
> +	vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0);

Is it safe to reset MCCIF without blocking and flushing memory requests
at first?
