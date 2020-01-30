From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 5/9] ASoC: tegra: add Tegra210 based AHUB driver
Date: Thu, 30 Jan 2020 19:22:30 +0300
Message-ID: <ef701838-be43-e42c-9245-b28cda5ed9bb@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1580380422-3431-6-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com
List-Id: linux-tegra@vger.kernel.org

30.01.2020 13:33, Sameer Pujar пишет:
...
> +static int tegra_ahub_probe(struct platform_device *pdev)
> +{
> +	struct tegra_ahub *ahub;
> +	void __iomem *regs;
> +	int ret;
> +
> +	ahub = devm_kcalloc(&pdev->dev, 1, sizeof(*ahub), GFP_KERNEL);
> +	if (!ahub)
> +		return -ENOMEM;

ahub = devm_kzalloc(&pdev->dev, sizeof(*ahub), GFP_KERNEL);
