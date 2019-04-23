From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 6/7] mfd: max77620: Support device-tree properly
Date: Tue, 23 Apr 2019 21:27:19 +0300
Message-ID: <5813f448-590c-0f6a-ec22-d2b5fa36cf03@gmail.com>
References: <20190422191350.27527-1-digetx@gmail.com>
 <20190422191350.27527-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190422191350.27527-7-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

22.04.2019 22:13, Dmitry Osipenko пишет:
> For some unknown reason the driver for Max77620 doesn't wire up the
> device-tree support properly and nothing in kernel creates I2C device
> for the driver (and never did), moreover device-tree files for NVIDIA
> Tegra210/186/194 boards already have nodes for Max77620. Hence add the
> missing of_match_table to make driver actually usable.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

I found out that I2C core actually parses the compatible value of the device-tree node for the driver-device matching and hence it's enough to have the id_table solely. I'll drop this patch in v3.
