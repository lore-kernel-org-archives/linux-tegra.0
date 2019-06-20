From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V9] i2c: tegra: remove BUG() macro
Date: Thu, 20 Jun 2019 14:53:56 +0530
Message-ID: <bac4fc16-858f-0ede-0c36-7c60e215ea77@nvidia.com>
References: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, Dmitry Osipenko <digetx@gmail.com>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On Tuesday 18 June 2019 04:39 PM, Bitan Biswas wrote:
> The usage of BUG() macro is generally discouraged in kernel, unless
> it's a problem that results in a physical damage or loss of data.
> This patch removes unnecessary BUG() macros and replaces the rest
> with warning.
>
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>
Acked By: Laxman Dewangan <ldewangan@nvidia.com>

Thanks,
Laxman
