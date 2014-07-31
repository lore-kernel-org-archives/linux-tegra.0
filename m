From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegra-pinmux-scripts] [PATCH] Add support for Norrin
Date: Thu, 31 Jul 2014 17:17:06 -0600
Message-ID: <53DACE72.2060602@wwwdotorg.org>
References: <1406846532-12611-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406846532-12611-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/31/2014 04:42 PM, Allen Martin wrote:
> Add support for Tegra124 Norrin FFD reference board (PM370).  Pinmux
> is based on PM370_T124_customer_pinmux_1.1 spreadsheet.

Oh good; I guess the Excel spreadsheet format was similar enough to 
Jetson TK1 and Venice2 so no changes were required to 
csv-to-board-tegra124-xlsx.py other than adding the board name. That's 
good news:-)

Out of curiosity, have you ported U-Boot to Norrin (32) and tried the 
auto-generated U-Boot tables that result from running 
soc-to-uboot-driver.py on this new data file?

> diff --git a/csv-to-board-tegra124-xlsx.py b/csv-to-board-tegra124-xlsx.py

> +    'norrin': 'PM370_T124_customer_pinmux_1.1.csv', # worksheet Customer_Configuration

I'd like to also get a patch (off-list) that adds 
PM370_T124_customer_pinmux_1.1.csv to the internal version of this repo. 
I assume you were able to git fetch my internal git tree from my dev 
machine? If you could send me a patch to add the csv file to 
nv-internal-data/ that would be great. I suppose we should find a better 
server than my dev machine too!

I'll likely apply this tomorrow morning.
