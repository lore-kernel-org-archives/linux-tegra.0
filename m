From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 4/5] ASoC: Process card->widgets after all probe
 routines
Date: Tue, 19 Apr 2011 19:52:39 +0100
Message-ID: <20110419185238.GL1765@opensource.wolfsonmicro.com>
References: <1303238777-14277-1-git-send-email-swarren@nvidia.com>
 <1303238777-14277-4-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1303238777-14277-4-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 19, 2011 at 12:46:16PM -0600, Stephen Warren wrote:

> Without this, if tegra_wm8903 is modified to provide controls,
> widgets, and routes through data rather than calling registration
> functions, tegra_wm8903_event_* will crash, because w->codec==NULL.

This will break other things as it means that we can't route to the DAPM
widgets that are added from machine init functions (eg, those that set
up jacks) which is a more common case - see the changelog for the code
you're modifying.  

There's also the fact that these widgets should be being created in the
card DAPM context so I'm a bit concerned that they're getting a CODEC at
all.  The dereferencing you're trying to do isn't good, you're looking
for a CODEC to find the card for widgets in the card DAPM context which
shouldn't be associated with any particular CODEC in the first place.
You should just find the card based on the DAPM context you're in.
