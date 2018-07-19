From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1] memory: tegra: Don't invoke Tegra30+ specific memory
 timing setup on Tegra20
Date: Thu, 19 Jul 2018 16:30:48 +0100
Message-ID: <39607791-3e71-7784-37db-4e05a316d7a8@nvidia.com>
References: <20180719132453.16860-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180719132453.16860-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 19/07/18 14:24, Dmitry Osipenko wrote:
> This fixes irrelevant "tegra-mc 7000f000.memory-controller: no memory
> timings for RAM code 0 registered" warning message during of kernels
> boot-up on Tegra20.

Looking at the tegra20-emc.txt bindings doc [0], the 'nvidia,ram-code'
property is also valid for Tegra20. In fact, I see this warning on the
Tegra30 Cardhu because this property is not populated. So I think that
this warning is valid and harmless.

Cheers
Jon

[0] Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt
-- 
nvpublic
