From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] Add support for Nyan
Date: Mon, 24 Nov 2014 10:08:11 -0700
Message-ID: <547365FB.7010408@wwwdotorg.org>
References: <1416757251-4588-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416757251-4588-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/23/2014 08:40 AM, Simon Glass wrote:
> Add support for Tegra124 Nyan. Pinmux is based on norrin with a single
> change for the reset GPIO.

Allen, can you please confirm the reset GPIO setting for Norrin in the 
pinmux patch you sent? It seems as if the two boards truly are this 
identical, the reset pin would be too.

Perhaps the issue is that one of these patches assumes 
APB_MISC_PP_PINMUX_GLOBAL_0's CLAMP_INPUTS_WHEN_TRISTATED bit is set, 
whereas the other assumes it is clear? The latest guidance is that that 
bit should always be clear now, although not all pinmux spreadsheets 
have been updated to conform with this. Can you both confirm the value 
your pinmux settings expect, or were tested with?
