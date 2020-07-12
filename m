From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Enable CPUFREQ userspace governor
Date: Sun, 12 Jul 2020 13:48:41 +0300
Message-ID: <857e47b0-e226-72b7-3855-f668c49c0739@gmail.com>
References: <20200712103114.24825-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200712103114.24825-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

12.07.2020 13:31, Jon Hunter пишет:
> Enable the CPUFREQ userspace governor in the tegra_defconfig so that
> we can test CPUFREQ with the userspace governor with this configuration
> on 32-bit Tegra devices.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  The_Yellow_Theme_24-192.wav      | 0
>  arch/arm/configs/tegra_defconfig | 1 +
>  2 files changed, 1 insertion(+)

>  create mode 100644 The_Yellow_Theme_24-192.wav
> 
> diff --git a/The_Yellow_Theme_24-192.wav b/The_Yellow_Theme_24-192.wav
> new file mode 100644

Hello, Jon! This looks like something unrelated to this patch :)
