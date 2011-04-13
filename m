From: Liam Girdwood <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: Tegra: Rename harmony.c to
 tegra_wm8903.c
Date: Wed, 13 Apr 2011 08:41:28 +0100
Message-ID: <1302680488.3600.12.camel@odin>
References: <1302630039-19514-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302630039-19514-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: broonie-yzvPICuk2ABKfpSzmGQP03H4hr9OvL1i0E9HWUfgJXw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 2011-04-12 at 11:40 -0600, Stephen Warren wrote:
> Soon, this machine driver will be updated to handle a number of Tegra boards
> using the WM8903 codec. Rename the file in advance to reflect this.
> 
> Fix the content of tegra_wm8903.c to match the rename; replace references
> to Harmony board with something more generic.
> 
> * s/struct tegra_harmony/struct tegra_wm8903/
> * s/harmony/machine/ # variable name
> * Similar rename for some functions
> * Similar comment fix
> * Similar MODULE_DESCRIPTION fix
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

All

Acked-by: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
