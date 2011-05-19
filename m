From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] tty/serial: Update of_serial's XSCALE port type to
 be generic
Date: Thu, 19 May 2011 13:11:11 -0600
Message-ID: <20110519191111.GK5109@ponder.secretlab.ca>
References: <1305218474-4087-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1305218474-4087-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 12, 2011 at 10:41:13AM -0600, Stephen Warren wrote:
> Instead of adding a specific nvidia,tegra250-uart entry, add a generic
> xscale entry that can be used by any XSCALE-compatible device. This avoids
> us having to add a new entry per vendor to of_serial.c, just like all the
> other already extant entries.
> 
> I assume this patch will be squashed into or replace
> b9e7db240617f12dd371b0a363042fb007e97ed7
> tty/serial: Add devicetree support for nVidia Tegra serial ports
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/tty/serial/of_serial.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/tty/serial/of_serial.c b/drivers/tty/serial/of_serial.c
> index 0d3f138..bfc1c2e 100644
> --- a/drivers/tty/serial/of_serial.c
> +++ b/drivers/tty/serial/of_serial.c
> @@ -168,7 +168,7 @@ static struct of_device_id __devinitdata of_platform_serial_table[] = {
>  	{ .compatible = "ns16550",  .data = (void *)PORT_16550, },
>  	{ .compatible = "ns16750",  .data = (void *)PORT_16750, },
>  	{ .compatible = "ns16850",  .data = (void *)PORT_16850, },
> -	{ .compatible = "nvidia,tegra250-uart",  .data = (void *)PORT_XSCALE, },
> +	{ .compatible = "xscale",   .data = (void *)PORT_XSCALE, },

As previously discussed (and repeating here just for the historical
record), this isn't really the right thing since the port isn't
actually an Xscale port and has a subtly different behaviour.  The
solution discussed in our other thread about the tegra serial port
should be pursued.

g.
