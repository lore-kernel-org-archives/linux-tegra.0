From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 0/4] EMC fixes for Tegra30+
Date: Mon, 15 Oct 2018 15:34:18 +0300
Message-ID: <ba166fc6-839e-017a-a7b9-057b5c4e1d3a@gmail.com>
References: <20180830185404.7224-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830185404.7224-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 8/30/18 9:54 PM, Dmitry Osipenko wrote:
> Hello,
> 
> This patch series fixes couple bugs in the memory self-refresh code.
> The EMC / MC state is properly restored after patches being applied,
> please review.
> 
> Dmitry Osipenko (4):
>   ARM: tegra: Fix missed EMC registers latching on resume from LP1 on
>     Tegra30+
>   ARM: tegra: Fix DRAM refresh-interval clobbering on resume from LP1 on
>     Tegra30
>   ARM: tegra: Restore memory arbitration on resume from LP1 on Tegra30+
>   ARM: tegra: Clear EMC interrupts on resume from LP1 on Tegra30+
> 
>  arch/arm/mach-tegra/iomap.h         |  9 ++++++++
>  arch/arm/mach-tegra/sleep-tegra30.S | 32 +++++++++++++++++++++++++++--
>  2 files changed, 39 insertions(+), 2 deletions(-)
> 

ping
