From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/2] ASoC: DT: Add digital microphone binding to PAZ00
 board.
Date: Sun, 26 Feb 2012 14:21:05 -0800
Message-ID: <20120226222105.GG11189@quad.lixom.net>
References: <1329161391-10197-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1329161391-10197-1-git-send-email-leon-2ukJVAZIZ/Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 13, 2012 at 09:29:51PM +0200, Leon Romanovsky wrote:
> This patch adds device tree binding of digital microphone to PAZ00
> board.
> 
> Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>

Leon,

It's probably easiest if you split this in two, send the binding update to Mark
and the dts file to me -- the dts base that this applies on top of sits in the
tegra tree, and the binding file sits in the ASoC tree. It's easiest to just
split the patch for now.

So, please resend the dts update separately.


Thanks,

-Olof
