From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 30 Apr 2020 17:26:09 +0300
Message-ID: <8369a113-d85d-a50c-f9e7-fe5df8270aed@gmail.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.04.2020 01:00, Sowjanya Komatineni пишет:
> +		chan = kzalloc(sizeof(*chan), GFP_KERNEL);
> +		if (!chan) {
> +			ret = -ENOMEM;
> +			return ret;

return -ENOMEM;

> +		}
