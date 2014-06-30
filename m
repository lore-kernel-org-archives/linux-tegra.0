From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] [tegra-uboot-flasher-scripts] Add support for norrin
 board
Date: Mon, 30 Jun 2014 15:29:08 -0600
Message-ID: <53B1D6A4.9070309@wwwdotorg.org>
References: <1404161040-10747-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404161040-10747-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/30/2014 02:44 PM, Allen Martin wrote:
> Add support for norrin (Tegra124 Chromebook reference design)

It would be nice to get naming capitalization right; Norrin not norrin.
I can fix that up when applying. In another patch, Venice2, SD card, CD,
DTB.

Note that since tegra-uboot-flasher builds all boards that it knows
about by default, and building for Norrin will fail until the U-Boot
patches make there way up to the main U-Boot tree, I'll need to add:

    'disabled': True,

... to norrin.board to prevent that. See the following commits for examples:

9a971ee7c3e3 Enable Jetson TK1 board by default
84484c2c521f Add support for Jetson TK1 board

Again, I can add that when applying.
