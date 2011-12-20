From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v4 1/3] ASoC: Add utility to set a card's name from
 device tree
Date: Tue, 20 Dec 2011 01:05:55 +0000
Message-ID: <20111220010554.GQ2860@opensource.wolfsonmicro.com>
References: <1323730536-19915-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1323730536-19915-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 12, 2011 at 03:55:34PM -0700, Stephen Warren wrote:
> Implement snd_soc_of_parse_card_name(), a utility function that sets a
> card's name from device tree. The machine driver specifies the DT
> property to use, since this is binding-specific.

Applied all three, thanks.
