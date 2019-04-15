From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] ARM: tegra: cpuidle: Handle tick broadcasting within
 cpuidle core on Tegra20/30
Date: Mon, 15 Apr 2019 22:38:44 +0300
Message-ID: <1351acef-d0aa-1a2b-eded-02d8fd99d0b0@gmail.com>
References: <20190224152114.6161-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190224152114.6161-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

24.02.2019 18:21, Dmitry Osipenko пишет:
> Tegra20/30 drivers do not handle the tick_broadcast_enter() error which
> potentially could happen when CPU timer isn't permitted to be stopped.
> Let's just move out the broadcasting to the CPUIDLE core by setting the
> respective flag in the Tegra20/30 drivers. This patch doesn't fix any
> problem because currently tick_broadcast_enter() could fail only on
> ARM64, so consider this change as a minor cleanup.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/mach-tegra/cpuidle-tegra20.c | 11 ++---------
>  arch/arm/mach-tegra/cpuidle-tegra30.c |  9 +--------
>  2 files changed, 3 insertions(+), 17 deletions(-)
Hello Jon and Thierry,

Could you please pick up this patch? Thanks in advance.
