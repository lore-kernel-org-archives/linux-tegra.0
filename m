From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux 1/2] csv-to-board: handle missing gpio_init_vals
Date: Wed, 22 Jul 2015 13:15:51 -0600
Message-ID: <55AFEBE7.2000501@wwwdotorg.org>
References: <1437517833-721-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437517833-721-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/21/2015 04:30 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Some board spreadsheets have missing values in the gpio_init_val column.
> This occurs to handle initialization ordering quirks in downstream SW.
> Modify csv-to-board to handle such spreadsheets without throwing an
> error, but warn the user that they need to fix up the resultant config
> file with valid data.

I've applied the series.
