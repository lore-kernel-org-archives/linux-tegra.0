From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Tegra: Enable Kaen HP_MUTE at boot
Date: Fri, 27 May 2011 22:14:14 +0800
Message-ID: <20110527141413.GB4240@opensource.wolfsonmicro.com>
References: <1306435610-27810-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1306435610-27810-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 26, 2011 at 12:46:50PM -0600, Stephen Warren wrote:
> We want the default state of the HP_MUTE signal to be asserted, so that
> the headphones are muted before the first audio playback. Without this,
> the headphones are left unmuted until shortly after the first audio
> playback completes.

Applied, thanks.
