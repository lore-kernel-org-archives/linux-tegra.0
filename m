From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 3/6] i2c: tegra: Use device name for adapter name
Date: Thu, 11 Aug 2016 20:29:41 +0530
Message-ID: <57AC92DD.8040608@nvidia.com>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com> <1470910620-9898-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1470910620-9898-4-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 11 August 2016 03:46 PM, Jon Hunter wrote:
> All Tegra I2C devices have the name "Tegra I2C adapter" which is not
> very useful when viewing the I2C adapter names via the sysfs. Therefore,
> use the device name, which is unique for each I2C device, instead.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
