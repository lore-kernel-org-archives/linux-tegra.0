From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 0/2] LP1/LP2 suspend-resume CPU clock fixes for Tegra30
Date: Mon, 15 Oct 2018 15:34:29 +0300
Message-ID: <d9e5dfc2-f4f3-9d79-d798-ecbbb50f1e45@gmail.com>
References: <20180830190454.8729-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830190454.8729-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 8/30/18 10:04 PM, Dmitry Osipenko wrote:
> Hello,
> 
> This patch-series fixes CPU hanging after suspend-resume / LP2 cpuidle
> on Tegra30. The bug really appears during stress-testing, like frequent
> suspending under variable load + the upcoming Tegra30 CPUFREQ driver.
> 
> Dmitry Osipenko (2):
>   ARM: tegra: Switch CPU to PLLP before powergating on Tegra30
>   ARM: tegra: Switch CPU to PLLP on resume from LP1 on Tegra30
> 
>  arch/arm/mach-tegra/sleep-tegra30.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

ping
