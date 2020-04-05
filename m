From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 00:11:27 +0300
Message-ID: <40102767-ecdb-e958-66f4-45d11464069c@gmail.com>
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
...
> +static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
> +{
> +	struct tegra_vi_channel *chan, *tmp;
> +	unsigned int port_num;
> +	unsigned int nchannels = vi->soc->vi_max_channels;
> +	int ret = 0;
> +
> +	for (port_num = 0; port_num < nchannels; port_num++) {
> +		/*
> +		 * Do not use devm_kzalloc as memory is freed immediately
> +		 * when device instance is unbound but application might still
> +		 * be holding the device node open. Channel memory allocated
> +		 * with kzalloc is freed during video device release callback.
> +		 */
> +		chan = kzalloc(sizeof(*chan), GFP_KERNEL);

Why anyone would want to unbind this driver in practice?

I think it should make more sense to set suppress_bind_attrs=true.
