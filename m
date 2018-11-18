From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clockevents/drivers/tegra20: Remove obsolete inclusion of
 <asm/smp_twd.h>
Date: Sun, 18 Nov 2018 02:26:07 +0100
Message-ID: <0f432792-cdaa-e1bd-1357-326b08ce0a83@linaro.org>
References: <20181115100037.17706-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181115100037.17706-1-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 15/11/2018 11:00, Geert Uytterhoeven wrote:
> As of commit da4a686a2cfb077a ("ARM: smp_twd: convert to use CLKSRC_OF
> init"), this header file is no longer used.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
Applied.

Thanks!

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
