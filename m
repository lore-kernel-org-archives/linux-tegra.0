From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] ARM: tegra: enforce PM requirement
Date: Mon, 25 Feb 2019 18:13:23 +0300
Message-ID: <ac4bd28e-6ba9-2da7-7bdf-8f11bee83bd2@gmail.com>
References: <1549365418-26283-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549365418-26283-1-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, linux@armlinux.org.uk, jhogan@kernel.org
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

05.02.2019 14:16, Sameer Pujar пишет:
> Drivers need to handle !PM case with work arounds for managing clocks
> and power explicitly, which is not really necessary when PM support on
> tegra is in good shape. In fact ARM 64-bit tegra platforms enforce PM

Tegra

> support and there is no reason why this cannot be done for 32-bit.
> 
> This patch selects PM unconditionally and drivers can rely on runtime
> PM framework for clock and power management.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
> ---

You probably should explain in the commit message what driver need this right now and why.
