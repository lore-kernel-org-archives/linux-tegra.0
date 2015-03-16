From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: tegra: use signed bitfields for optional fields
Date: Mon, 16 Mar 2015 10:59:44 -0600
Message-ID: <55070C00.5040804@wwwdotorg.org>
References: <1426377952-12383-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1426377952-12383-1-git-send-email-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: linus.walleij@linaro.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 03/14/2015 06:05 PM, Stefan Agner wrote:
> Optional fields are set to -1 by various preprocessor macros. Make
> sure the struct fields can actually store them.

> diff --git a/drivers/pinctrl/pinctrl-tegra.h b/drivers/pinctrl/pinctrl-tegra.h

> -	u32 mux_bit:6;
> -	u32 pupd_bit:6;
> -	u32 tri_bit:6;
...
> +	s8 mux_bit:6;
> +	s8 pupd_bit:6;
> +	s8 tri_bit:6;

Could we make these s32s instead? According to the C standard, the type 
should be a signed or unsigned int, and s32 matches that better than s8 
for existing Tegra 32-bit platforms. Equally, for bitfields that don't 
fit into the remaining space within a container (s8 above), 
implementations are allowed to either span bitfields across multiple 
containers, or pad the current container and start the bitfield in the 
next container. Using the larger s32 as the "container" yields less 
opportunity for potential padding and thus wasting space.

Do you observe any increase in the sizes reported by 
"${CROSS_COMPILE}size pinctrl-tegra*.o" with this patch?
