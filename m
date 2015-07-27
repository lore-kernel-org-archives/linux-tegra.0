From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] Add E2220-1170 board
Date: Mon, 27 Jul 2015 13:25:22 -0600
Message-ID: <55B685A2.9030305@wwwdotorg.org>
References: <1437774920-30799-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437774920-30799-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/24/2015 03:55 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> E2220-1170 is a Tegra210 reference board.
>
> The following pins have missing gpio_init_val data in the spreadsheet,
> and were manually fixed to be out0 per discussion with the systems
> engineering team:
>
> lcd_bl_en_pv1
> lcd_rst_pv2
> usb_vbus_en1_pcc5

I've applied this series.
