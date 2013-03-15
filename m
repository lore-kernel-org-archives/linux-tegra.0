From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: check the clk_prepare_enable() return value
Date: Fri, 15 Mar 2013 13:32:49 -0600
Message-ID: <51437761.6020901@wwwdotorg.org>
References: <1363361648-10326-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363361648-10326-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/15/2013 09:34 AM, Laxman Dewangan wrote:
> NVIDIA's Tegra SoC allows read/write of controller register only
> if controller clock is enabled. System hangs if read/write happens
> to registers without enabling clock.
> 
> clk_prepare_enable() can be fail due to unknown reason and hence
> adding check for return value of this function. If this function
> success then only access register otherwise return to caller with
> error.

Wolfram,

Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This is probably suitable for Cc: stable.
