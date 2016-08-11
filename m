From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/6] i2c: tegra: Remove non device-tree support
Date: Thu, 11 Aug 2016 20:29:14 +0530
Message-ID: <57AC92C2.7050405@nvidia.com>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com> <1470910620-9898-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1470910620-9898-3-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 11 August 2016 03:46 PM, Jon Hunter wrote:
> Tegra has only supported device-tree for platform/board configuration
> for quite some time now and so simplify the Tegra I2C driver by dropping
> code for non device-tree platforms/boards.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
