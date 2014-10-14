From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 13/14] drm/tegra: dsi: Add ganged mode support
Date: Tue, 14 Oct 2014 10:51:19 -0400
Message-ID: <CAOw6vbKjdG99z=+mz4QHVyw8w2Uv8FvXu5z3HEF2AioSfqXtiQ@mail.gmail.com>
References: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com> <1413195715-4719-13-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413195715-4719-13-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 13, 2014 at 6:21 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Implement ganged mode support for the Tegra DSI driver. The DSI host
> controller to gang up with is specified via a phandle in the device tree
> and the resolved DSI host controller used for the programming of the
> ganged-mode registers.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/gpu/nvidia,tegra20-host1x.txt         |   2 +
>  drivers/gpu/drm/tegra/dsi.c                        | 767 +++++++++++++++++----
>  drivers/gpu/drm/tegra/dsi.h                        |  14 +-
>  3 files changed, 666 insertions(+), 117 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> index b48f4ef31d93..4c32ef0b7db8 100644
> --- a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> +++ b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> @@ -191,6 +191,8 @@ of the following host1x client modules:
>    - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
>    - nvidia,edid: supplies a binary EDID blob
>    - nvidia,panel: phandle of a display panel
> +  - nvidia,ganged-mode: contains a phandle to a second DSI controller to gang
> +    up with in order to support up to 8 data lanes
>
>  - sor: serial output resource
>
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 584b771d8b2f..b7b205496e8c 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -11,6 +11,7 @@
>  #include <linux/host1x.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>
> @@ -54,6 +55,10 @@ struct tegra_dsi {
>
>         unsigned int video_fifo_depth;
>         unsigned int host_fifo_depth;
> +
> +       /* for ganged-mode support */
> +       struct tegra_dsi *master;
> +       struct tegra_dsi *slave;
>  };
>
>  static inline struct tegra_dsi *
> @@ -318,6 +323,21 @@ static const u32 pkt_seq_video_non_burst_sync_events[NUM_PKT_SEQ] = {
>         [11] = PKT_ID0(MIPI_DSI_BLANKING_PACKET) | PKT_LEN0(4),
>  };
>
> +static const u32 pkt_seq_command_mode[NUM_PKT_SEQ] = {
> +       [ 0] = 0,
> +       [ 1] = 0,
> +       [ 2] = 0,
> +       [ 3] = 0,
> +       [ 4] = 0,
> +       [ 5] = 0,
> +       [ 6] = PKT_ID0(MIPI_DSI_DCS_LONG_WRITE) | PKT_LEN0(3) | PKT_LP,
> +       [ 7] = 0,
> +       [ 8] = 0,
> +       [ 9] = 0,
> +       [10] = PKT_ID0(MIPI_DSI_DCS_LONG_WRITE) | PKT_LEN0(5) | PKT_LP,
> +       [11] = 0,
> +};
> +
>  static int tegra_dsi_set_phy_timing(struct tegra_dsi *dsi)
>  {
>         struct mipi_dphy_timing timing;
> @@ -329,7 +349,7 @@ static int tegra_dsi_set_phy_timing(struct tegra_dsi *dsi)
>         if (rate < 0)
>                 return rate;
>
> -       period = DIV_ROUND_CLOSEST(1000000000UL, rate * 2);
> +       period = DIV_ROUND_CLOSEST(NSEC_PER_SEC, rate * 2);
>
>         err = mipi_dphy_timing_get_default(&timing, period);
>         if (err < 0)
> @@ -426,26 +446,59 @@ static int tegra_dsi_get_format(enum mipi_dsi_pixel_format format,
>         return 0;
>  }
>
> -static int tegra_output_dsi_enable(struct tegra_output *output)
> +static void tegra_dsi_ganged_enable(struct tegra_dsi *dsi, unsigned int start,
> +                                   unsigned int size)
> +{
> +       u32 value;
> +
> +       tegra_dsi_writel(dsi, start, DSI_GANGED_MODE_START);
> +       tegra_dsi_writel(dsi, size << 16 | size, DSI_GANGED_MODE_SIZE);
> +
> +       value = DSI_GANGED_MODE_CONTROL_ENABLE;
> +       tegra_dsi_writel(dsi, value, DSI_GANGED_MODE_CONTROL);
> +}
> +
> +static void tegra_dsi_enable(struct tegra_dsi *dsi)
> +{
> +       u32 value;
> +
> +       value = tegra_dsi_readl(dsi, DSI_POWER_CONTROL);
> +       value |= DSI_POWER_CONTROL_ENABLE;
> +       tegra_dsi_writel(dsi, value, DSI_POWER_CONTROL);
> +
> +       if (dsi->slave)
> +               tegra_dsi_enable(dsi->slave);
> +}
> +
> +static unsigned int tegra_dsi_get_lanes(struct tegra_dsi *dsi)
> +{
> +       if (dsi->master)
> +               return dsi->master->lanes + dsi->lanes;
> +
> +       if (dsi->slave)
> +               return dsi->lanes + dsi->slave->lanes;
> +
> +       return dsi->lanes;
> +}
> +
> +static int tegra_dsi_configure(struct tegra_dsi *dsi, unsigned int pipe,
> +                              const struct drm_display_mode *mode)
>  {
> -       struct tegra_dc *dc = to_tegra_dc(output->encoder.crtc);
> -       struct drm_display_mode *mode = &dc->base.mode;
>         unsigned int hact, hsw, hbp, hfp, i, mul, div;
> -       struct tegra_dsi *dsi = to_dsi(output);
>         enum tegra_dsi_format format;
> -       unsigned long value;
>         const u32 *pkt_seq;
> +       u32 value;
>         int err;
>
> -       if (dsi->enabled)
> -               return 0;
> -
>         if (dsi->flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
>                 DRM_DEBUG_KMS("Non-burst video mode with sync pulses\n");
>                 pkt_seq = pkt_seq_video_non_burst_sync_pulses;
> -       } else {
> +       } else if (dsi->flags & MIPI_DSI_MODE_VIDEO) {
>                 DRM_DEBUG_KMS("Non-burst video mode with sync events\n");
>                 pkt_seq = pkt_seq_video_non_burst_sync_events;
> +       } else {
> +               DRM_DEBUG_KMS("Command mode\n");
> +               pkt_seq = pkt_seq_command_mode;
>         }
>
>         err = tegra_dsi_get_muldiv(dsi->format, &mul, &div);
> @@ -456,28 +509,29 @@ static int tegra_output_dsi_enable(struct tegra_output *output)
>         if (err < 0)
>                 return err;
>
> -       err = clk_enable(dsi->clk);
> -       if (err < 0)
> -               return err;
> -
> -       reset_control_deassert(dsi->rst);
> -
>         value = DSI_CONTROL_CHANNEL(0) | DSI_CONTROL_FORMAT(format) |
>                 DSI_CONTROL_LANES(dsi->lanes - 1) |
> -               DSI_CONTROL_SOURCE(dc->pipe);
> +               DSI_CONTROL_SOURCE(pipe);
>         tegra_dsi_writel(dsi, value, DSI_CONTROL);
>
>         tegra_dsi_writel(dsi, dsi->video_fifo_depth, DSI_MAX_THRESHOLD);
>
> -       value = DSI_HOST_CONTROL_HS | DSI_HOST_CONTROL_CS |
> -               DSI_HOST_CONTROL_ECC;
> +       value = DSI_HOST_CONTROL_HS;
>         tegra_dsi_writel(dsi, value, DSI_HOST_CONTROL);
>
>         value = tegra_dsi_readl(dsi, DSI_CONTROL);
> +
>         if (dsi->flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
>                 value |= DSI_CONTROL_HS_CLK_CTRL;
> +
>         value &= ~DSI_CONTROL_TX_TRIG(3);
> -       value &= ~DSI_CONTROL_DCS_ENABLE;
> +
> +       /* enable DCS commands for command mode */
> +       if (dsi->flags & MIPI_DSI_MODE_VIDEO)
> +               value &= ~DSI_CONTROL_DCS_ENABLE;
> +       else
> +               value |= DSI_CONTROL_DCS_ENABLE;
> +
>         value |= DSI_CONTROL_VIDEO_ENABLE;
>         value &= ~DSI_CONTROL_HOST_ENABLE;
>         tegra_dsi_writel(dsi, value, DSI_CONTROL);
> @@ -489,28 +543,106 @@ static int tegra_output_dsi_enable(struct tegra_output *output)
>         for (i = 0; i < NUM_PKT_SEQ; i++)
>                 tegra_dsi_writel(dsi, pkt_seq[i], DSI_PKT_SEQ_0_LO + i);
>
> -       /* horizontal active pixels */
> -       hact = mode->hdisplay * mul / div;
> +       if (dsi->flags & MIPI_DSI_MODE_VIDEO) {
> +               /* horizontal active pixels */
> +               hact = mode->hdisplay * mul / div;
>
> -       /* horizontal sync width */
> -       hsw = (mode->hsync_end - mode->hsync_start) * mul / div;
> -       hsw -= 10;
> +               /* horizontal sync width */
> +               hsw = (mode->hsync_end - mode->hsync_start) * mul / div;
> +               hsw -= 10;
>
> -       /* horizontal back porch */
> -       hbp = (mode->htotal - mode->hsync_end) * mul / div;
> -       hbp -= 14;
> +               /* horizontal back porch */
> +               hbp = (mode->htotal - mode->hsync_end) * mul / div;
> +               hbp -= 14;
>
> -       /* horizontal front porch */
> -       hfp = (mode->hsync_start  - mode->hdisplay) * mul / div;
> -       hfp -= 8;
> +               /* horizontal front porch */
> +               hfp = (mode->hsync_start - mode->hdisplay) * mul / div;
> +               hfp -= 8;
> +
> +               tegra_dsi_writel(dsi, hsw << 16 | 0, DSI_PKT_LEN_0_1);
> +               tegra_dsi_writel(dsi, hact << 16 | hbp, DSI_PKT_LEN_2_3);
> +               tegra_dsi_writel(dsi, hfp, DSI_PKT_LEN_4_5);
> +               tegra_dsi_writel(dsi, 0x0f0f << 16, DSI_PKT_LEN_6_7);
> +
> +               /* set SOL delay (for non-burst mode only) */
> +               tegra_dsi_writel(dsi, 8 * mul / div, DSI_SOL_DELAY);
> +
> +               /* TODO: implement ganged mode */
> +       } else {
> +               u16 bytes;
> +
> +               if (dsi->master || dsi->slave) {
> +                       /*
> +                        * For ganged mode, assume symmetric left-right mode.
> +                        */
> +                       bytes = 1 + (mode->hdisplay / 2) * mul / div;
> +               } else {
> +                       /* 1 byte (DCS command) + pixel data */
> +                       bytes = 1 + mode->hdisplay * mul / div;
> +               }
> +
> +               tegra_dsi_writel(dsi, 0, DSI_PKT_LEN_0_1);
> +               tegra_dsi_writel(dsi, bytes << 16, DSI_PKT_LEN_2_3);
> +               tegra_dsi_writel(dsi, bytes << 16, DSI_PKT_LEN_4_5);
> +               tegra_dsi_writel(dsi, 0, DSI_PKT_LEN_6_7);
> +
> +               value = MIPI_DCS_WRITE_MEMORY_START << 8 |
> +                       MIPI_DCS_WRITE_MEMORY_CONTINUE;
> +               tegra_dsi_writel(dsi, value, DSI_DCS_CMDS);
> +
> +               /* set SOL delay */
> +               if (dsi->master || dsi->slave) {
> +                       unsigned int lanes = tegra_dsi_get_lanes(dsi);
> +                       unsigned long delay, bclk, bclk_ganged;
> +
> +                       /* SOL to valid, valid to FIFO and FIFO write delay */
> +                       delay = 4 + 4 + 2;
> +                       delay = DIV_ROUND_UP(delay * mul, div * lanes);
> +                       /* FIFO read delay */
> +                       delay = delay + 6;
> +
> +                       bclk = DIV_ROUND_UP(mode->htotal * mul, div * lanes);
> +                       bclk_ganged = DIV_ROUND_UP(bclk * lanes / 2, lanes);
> +                       value = bclk - bclk_ganged + delay + 20;
> +               } else {
> +                       /* TODO: revisit for non-ganged mode */
> +                       value = 8 * mul / div;
> +               }
> +
> +               tegra_dsi_writel(dsi, value, DSI_SOL_DELAY);
> +       }
> +
> +       if (dsi->slave) {
> +               err = tegra_dsi_configure(dsi->slave, pipe, mode);
> +               if (err < 0)
> +                       return err;
> +
> +               /*
> +                * TODO: Support modes other than symmetrical left-right
> +                * split.
> +                */
> +               tegra_dsi_ganged_enable(dsi, 0, mode->hdisplay / 2);
> +               tegra_dsi_ganged_enable(dsi->slave, mode->hdisplay / 2,
> +                                       mode->hdisplay / 2);
> +       }
> +
> +       return 0;
> +}
> +
> +static int tegra_output_dsi_enable(struct tegra_output *output)
> +{
> +       struct tegra_dc *dc = to_tegra_dc(output->encoder.crtc);
> +       const struct drm_display_mode *mode = &dc->base.mode;
> +       struct tegra_dsi *dsi = to_dsi(output);
> +       u32 value;
> +       int err;
>
> -       tegra_dsi_writel(dsi, hsw << 16 | 0, DSI_PKT_LEN_0_1);
> -       tegra_dsi_writel(dsi, hact << 16 | hbp, DSI_PKT_LEN_2_3);
> -       tegra_dsi_writel(dsi, hfp, DSI_PKT_LEN_4_5);
> -       tegra_dsi_writel(dsi, 0x0f0f << 16, DSI_PKT_LEN_6_7);
> +       if (dsi->enabled)
> +               return 0;
>
> -       /* set SOL delay */
> -       tegra_dsi_writel(dsi, 8 * mul / div, DSI_SOL_DELAY);
> +       err = tegra_dsi_configure(dsi, dc->pipe, mode);
> +       if (err < 0)
> +               return err;
>
>         /* enable display controller */
>         value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
> @@ -531,28 +663,79 @@ static int tegra_output_dsi_enable(struct tegra_output *output)
>         tegra_dc_writel(dc, GENERAL_ACT_REQ, DC_CMD_STATE_CONTROL);
>
>         /* enable DSI controller */
> -       value = tegra_dsi_readl(dsi, DSI_POWER_CONTROL);
> -       value |= DSI_POWER_CONTROL_ENABLE;
> -       tegra_dsi_writel(dsi, value, DSI_POWER_CONTROL);
> +       tegra_dsi_enable(dsi);
>
>         dsi->enabled = true;
>
>         return 0;
>  }
>
> +static int tegra_dsi_wait_idle(struct tegra_dsi *dsi, unsigned long timeout)
> +{
> +       u32 value;
> +
> +       timeout = jiffies + msecs_to_jiffies(timeout);
> +
> +       while (time_before(jiffies, timeout)) {
> +               value = tegra_dsi_readl(dsi, DSI_STATUS);
> +               if (value & DSI_STATUS_IDLE)
> +                       return 0;
> +
> +               usleep_range(1000, 2000);
> +       }
> +
> +       return -ETIMEDOUT;
> +}
> +
> +static void tegra_dsi_video_disable(struct tegra_dsi *dsi)
> +{
> +       u32 value;
> +
> +       value = tegra_dsi_readl(dsi, DSI_CONTROL);
> +       value &= ~DSI_CONTROL_VIDEO_ENABLE;
> +       tegra_dsi_writel(dsi, value, DSI_CONTROL);
> +
> +       if (dsi->slave)
> +               tegra_dsi_video_disable(dsi->slave);
> +}
> +
> +static void tegra_dsi_ganged_disable(struct tegra_dsi *dsi)
> +{
> +       tegra_dsi_writel(dsi, 0, DSI_GANGED_MODE_START);
> +       tegra_dsi_writel(dsi, 0, DSI_GANGED_MODE_SIZE);
> +       tegra_dsi_writel(dsi, 0, DSI_GANGED_MODE_CONTROL);
> +}
> +
> +static void tegra_dsi_disable(struct tegra_dsi *dsi)
> +{
> +       u32 value;
> +
> +       if (dsi->slave) {
> +               tegra_dsi_ganged_disable(dsi->slave);
> +               tegra_dsi_ganged_disable(dsi);
> +       }
> +
> +       value = tegra_dsi_readl(dsi, DSI_POWER_CONTROL);
> +       value &= ~DSI_POWER_CONTROL_ENABLE;
> +       tegra_dsi_writel(dsi, value, DSI_POWER_CONTROL);
> +
> +       if (dsi->slave)
> +               tegra_dsi_disable(dsi->slave);
> +
> +       usleep_range(5000, 10000);
> +}
> +
>  static int tegra_output_dsi_disable(struct tegra_output *output)
>  {
>         struct tegra_dc *dc = to_tegra_dc(output->encoder.crtc);
>         struct tegra_dsi *dsi = to_dsi(output);
>         unsigned long value;
> +       int err;
>
>         if (!dsi->enabled)
>                 return 0;
>
> -       /* disable DSI controller */
> -       value = tegra_dsi_readl(dsi, DSI_POWER_CONTROL);
> -       value &= ~DSI_POWER_CONTROL_ENABLE;
> -       tegra_dsi_writel(dsi, value, DSI_POWER_CONTROL);
> +       tegra_dsi_video_disable(dsi);
>
>         /*
>          * The following accesses registers of the display controller, so make
> @@ -576,39 +759,68 @@ static int tegra_output_dsi_disable(struct tegra_output *output)
>                 tegra_dc_writel(dc, GENERAL_ACT_REQ, DC_CMD_STATE_CONTROL);
>         }
>
> -       clk_disable(dsi->clk);
> +       err = tegra_dsi_wait_idle(dsi, 100);
> +       if (err < 0)
> +               dev_dbg(dsi->dev, "failed to idle DSI: %d\n", err);
> +
> +       tegra_dsi_disable(dsi);
>
>         dsi->enabled = false;
>
>         return 0;
>  }
>
> +static void tegra_dsi_set_timeout(struct tegra_dsi *dsi, unsigned long bclk,
> +                                 unsigned int vrefresh)
> +{
> +       unsigned int timeout;
> +       u32 value;
> +
> +       /* one frame high-speed transmission timeout */
> +       timeout = (bclk / vrefresh) / 512;
> +       value = DSI_TIMEOUT_LRX(0x2000) | DSI_TIMEOUT_HTX(timeout);
> +       tegra_dsi_writel(dsi, value, DSI_TIMEOUT_0);
> +
> +       /* 2 ms peripheral timeout for panel */
> +       timeout = 2 * bclk / 512 * 1000;
> +       value = DSI_TIMEOUT_PR(timeout) | DSI_TIMEOUT_TA(0x2000);
> +       tegra_dsi_writel(dsi, value, DSI_TIMEOUT_1);
> +
> +       value = DSI_TALLY_TA(0) | DSI_TALLY_LRX(0) | DSI_TALLY_HTX(0);
> +       tegra_dsi_writel(dsi, value, DSI_TO_TALLY);
> +
> +       if (dsi->slave)
> +               tegra_dsi_set_timeout(dsi->slave, bclk, vrefresh);
> +}
> +
>  static int tegra_output_dsi_setup_clock(struct tegra_output *output,
>                                         struct clk *clk, unsigned long pclk,
>                                         unsigned int *divp)
>  {
>         struct tegra_dc *dc = to_tegra_dc(output->encoder.crtc);
>         struct drm_display_mode *mode = &dc->base.mode;
> -       unsigned int timeout, mul, div, vrefresh;
>         struct tegra_dsi *dsi = to_dsi(output);
> -       unsigned long bclk, plld, value;
> +       unsigned int mul, div, vrefresh, lanes;
> +       unsigned long bclk, plld;
>         int err;
>
> +       lanes = tegra_dsi_get_lanes(dsi);
> +
>         err = tegra_dsi_get_muldiv(dsi->format, &mul, &div);
>         if (err < 0)
>                 return err;
>
> -       DRM_DEBUG_KMS("mul: %u, div: %u, lanes: %u\n", mul, div, dsi->lanes);
> +       DRM_DEBUG_KMS("mul: %u, div: %u, lanes: %u\n", mul, div, lanes);
>         vrefresh = drm_mode_vrefresh(mode);
>         DRM_DEBUG_KMS("vrefresh: %u\n", vrefresh);
>
>         /* compute byte clock */
> -       bclk = (pclk * mul) / (div * dsi->lanes);
> +       bclk = (pclk * mul) / (div * lanes);
>
>         /*
>          * Compute bit clock and round up to the next MHz.
>          */
> -       plld = DIV_ROUND_UP(bclk * 8, 1000000) * 1000000;
> +       plld = DIV_ROUND_UP(bclk * 8, USEC_PER_SEC) * USEC_PER_SEC;
>
>         /*
>          * We divide the frequency by two here, but we make up for that by
> @@ -640,25 +852,13 @@ static int tegra_output_dsi_setup_clock(struct tegra_output *output,
>          * not working properly otherwise. Perhaps the PLLs cannot generate
>          * frequencies sufficiently high.
>          */
> -       *divp = ((8 * mul) / (div * dsi->lanes)) - 2;
> +       *divp = ((8 * mul) / (div * lanes)) - 2;
>
>         /*
>          * XXX: Move the below somewhere else so that we don't need to have
>          * access to the vrefresh in this function?
>          */
> -
> -       /* one frame high-speed transmission timeout */
> -       timeout = (bclk / vrefresh) / 512;
> -       value = DSI_TIMEOUT_LRX(0x2000) | DSI_TIMEOUT_HTX(timeout);
> -       tegra_dsi_writel(dsi, value, DSI_TIMEOUT_0);
> -
> -       /* 2 ms peripheral timeout for panel */
> -       timeout = 2 * bclk / 512 * 1000;
> -       value = DSI_TIMEOUT_PR(timeout) | DSI_TIMEOUT_TA(0x2000);
> -       tegra_dsi_writel(dsi, value, DSI_TIMEOUT_1);
> -
> -       value = DSI_TALLY_TA(0) | DSI_TALLY_LRX(0) | DSI_TALLY_HTX(0);
> -       tegra_dsi_writel(dsi, value, DSI_TO_TALLY);
> +       tegra_dsi_set_timeout(dsi, bclk, vrefresh);
>
>         return 0;
>  }
> @@ -695,7 +895,7 @@ static int tegra_dsi_pad_enable(struct tegra_dsi *dsi)
>
>  static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
>  {
> -       unsigned long value;
> +       u32 value;
>
>         tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
>         tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> @@ -720,14 +920,17 @@ static int tegra_dsi_init(struct host1x_client *client)
>         struct tegra_dsi *dsi = host1x_client_to_dsi(client);
>         int err;
>
> -       dsi->output.type = TEGRA_OUTPUT_DSI;
> -       dsi->output.dev = client->dev;
> -       dsi->output.ops = &dsi_ops;
> -
> -       err = tegra_output_init(drm, &dsi->output);
> -       if (err < 0) {
> -               dev_err(client->dev, "output setup failed: %d\n", err);
> -               return err;
> +       /* Gangsters must not register their own outputs. */
> +       if (!dsi->master) {
> +               dsi->output.type = TEGRA_OUTPUT_DSI;
> +               dsi->output.dev = client->dev;
> +               dsi->output.ops = &dsi_ops;
> +
> +               err = tegra_output_init(drm, &dsi->output);
> +               if (err < 0) {
> +                       dev_err(client->dev, "output setup failed: %d\n", err);
> +                       return err;
> +               }
>         }
>
>         if (IS_ENABLED(CONFIG_DEBUG_FS)) {
> @@ -736,12 +939,6 @@ static int tegra_dsi_init(struct host1x_client *client)
>                         dev_err(dsi->dev, "debugfs setup failed: %d\n", err);
>         }
>
> -       err = tegra_dsi_pad_calibrate(dsi);
> -       if (err < 0) {
> -               dev_err(dsi->dev, "MIPI calibration failed: %d\n", err);
> -               return err;
> -       }
> -
>         return 0;
>  }
>
> @@ -756,16 +953,20 @@ static int tegra_dsi_exit(struct host1x_client *client)
>                         dev_err(dsi->dev, "debugfs cleanup failed: %d\n", err);
>         }
>
> -       err = tegra_output_disable(&dsi->output);
> -       if (err < 0) {
> -               dev_err(client->dev, "output failed to disable: %d\n", err);
> -               return err;
> -       }
> -
> -       err = tegra_output_exit(&dsi->output);
> -       if (err < 0) {
> -               dev_err(client->dev, "output cleanup failed: %d\n", err);
> -               return err;
> +       if (!dsi->master) {
> +               err = tegra_output_disable(&dsi->output);
> +               if (err < 0) {
> +                       dev_err(client->dev, "output failed to disable: %d\n",
> +                               err);
> +                       return err;
> +               }
> +
> +               err = tegra_output_exit(&dsi->output);
> +               if (err < 0) {
> +                       dev_err(client->dev, "output cleanup failed: %d\n",
> +                               err);
> +                       return err;
> +               }
>         }
>
>         return 0;
> @@ -792,20 +993,299 @@ static int tegra_dsi_setup_clocks(struct tegra_dsi *dsi)
>         return 0;
>  }
>
> +static const char * const error_report[16] = {
> +       "SoT Error",
> +       "SoT Sync Error",
> +       "EoT Sync Error",
> +       "Escape Mode Entry Command Error",
> +       "Low-Power Transmit Sync Error",
> +       "Peripheral Timeout Error",
> +       "False Control Error",
> +       "Contention Detected",
> +       "ECC Error, single-bit",
> +       "ECC Error, multi-bit",
> +       "Checksum Error",
> +       "DSI Data Type Not Recognized",
> +       "DSI VC ID Invalid",
> +       "Invalid Transmission Length",
> +       "Reserved",
> +       "DSI Protocol Violation",
> +};
> +
> +static int tegra_dsi_read_response(struct tegra_dsi *dsi,
> +                                  const struct mipi_dsi_msg *msg,
> +                                  unsigned int count)
> +{
> +       u8 *rx = msg->rx_buf;
> +       unsigned int i, j, k;
> +       size_t size = 0;
> +       u16 errors;
> +       u32 value;
> +
> +       /* read and parse packet header */
> +       value = tegra_dsi_readl(dsi, DSI_RD_DATA);
> +
> +       switch (value & 0x3f) {
> +       case MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT:
> +               errors = (value >> 8) & 0xffff;
> +               dev_dbg(dsi->dev, "Acknowledge and error report: %04x\n",
> +                       errors);
> +               for (i = 0; i < ARRAY_SIZE(error_report); i++)
> +                       if (errors & BIT(i))
> +                               dev_dbg(dsi->dev, "  %2u: %s\n", i,
> +                                       error_report[i]);
> +               break;
> +
> +       case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_1BYTE:
> +               rx[0] = (value >> 8) & 0xff;
> +               break;
> +
> +       case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_2BYTE:
> +               rx[0] = (value >>  8) & 0xff;
> +               rx[1] = (value >> 16) & 0xff;
> +               break;
> +
> +       case MIPI_DSI_RX_DCS_LONG_READ_RESPONSE:
> +               size = ((value >> 8) & 0xff00) | ((value >> 8) & 0xff);
> +               break;
> +
> +       case MIPI_DSI_RX_GENERIC_LONG_READ_RESPONSE:
> +               size = ((value >> 8) & 0xff00) | ((value >> 8) & 0xff);
> +               break;
> +
> +       default:
> +               dev_err(dsi->dev, "unhandled response type: %02x\n",
> +                       value & 0x3f);
> +               break;
> +       }
> +
> +       size = min(size, msg->rx_len);
> +
> +       if (msg->rx_buf && size > 0) {
> +               for (i = 0, j = 0; i < count - 1; i++, j += 4) {
> +                       u8 *rx = msg->rx_buf + j;
> +
> +                       value = tegra_dsi_readl(dsi, DSI_RD_DATA);
> +
> +                       for (k = 0; k < 4 && (j + k) < msg->rx_len; k++)
> +                               rx[j + k] = (value >> (k << 3)) & 0xff;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int tegra_dsi_transmit(struct tegra_dsi *dsi, unsigned long timeout)
> +{
> +       tegra_dsi_writel(dsi, DSI_TRIGGER_HOST, DSI_TRIGGER);
> +
> +       timeout = jiffies + msecs_to_jiffies(timeout);
> +
> +       while (time_before(jiffies, timeout)) {
> +               u32 value = tegra_dsi_readl(dsi, DSI_TRIGGER);
> +               if ((value & DSI_TRIGGER_HOST) == 0)
> +                       return 0;
> +
> +               usleep_range(1000, 2000);
> +       }
> +
> +       DRM_DEBUG_KMS("timeout waiting for transmission to complete\n");
> +       return -ETIMEDOUT;
> +}
> +
> +static int tegra_dsi_wait_for_response(struct tegra_dsi *dsi,
> +                                      unsigned long timeout)
> +{
> +       timeout = jiffies + msecs_to_jiffies(250);
> +
> +       while (time_before(jiffies, timeout)) {
> +               u32 value = tegra_dsi_readl(dsi, DSI_STATUS);
> +               u8 count = value & 0x1f;
> +
> +               if (count > 0)
> +                       return count;
> +
> +               usleep_range(1000, 2000);
> +       }
> +
> +       DRM_DEBUG_KMS("peripheral returned no data\n");
> +       return -ETIMEDOUT;
> +}
> +
> +static ssize_t tegra_dsi_host_transfer(struct mipi_dsi_host *host,
> +                                      const struct mipi_dsi_msg *msg)
> +{
> +       struct tegra_dsi *dsi = host_to_tegra(host);
> +       const u8 *tx = msg->tx_buf;
> +       unsigned int count, i, j;
> +       u32 value;
> +       int err;
> +
> +       /* maximum FIFO depth is 1920 words */
> +       if (msg->tx_len > dsi->video_fifo_depth * 4)
> +               return -ENOSPC;
> +
> +       /* reset underflow/overflow flags */
> +       value = tegra_dsi_readl(dsi, DSI_STATUS);
> +       if (value & (DSI_STATUS_UNDERFLOW | DSI_STATUS_OVERFLOW)) {
> +               value = DSI_HOST_CONTROL_FIFO_RESET;
> +               tegra_dsi_writel(dsi, value, DSI_HOST_CONTROL);
> +               usleep_range(10, 20);
> +       }
> +
> +       value = tegra_dsi_readl(dsi, DSI_POWER_CONTROL);
> +       value |= DSI_POWER_CONTROL_ENABLE;
> +       tegra_dsi_writel(dsi, value, DSI_POWER_CONTROL);
> +
> +       usleep_range(5000, 10000);
> +
> +       value = DSI_HOST_CONTROL_CRC_RESET | DSI_HOST_CONTROL_TX_TRIG_HOST |
> +               DSI_HOST_CONTROL_CS | DSI_HOST_CONTROL_ECC;
> +
> +       if ((msg->flags & MIPI_DSI_MSG_USE_LPM) == 0)
> +               value |= DSI_HOST_CONTROL_HS;
> +
> +       /*
> +        * The host FIFO has a maximum of 64 words, so larger transmissions
> +        * need to use the video FIFO.
> +        */
> +       if (msg->tx_len > dsi->host_fifo_depth * 4)
> +               value |= DSI_HOST_CONTROL_FIFO_SEL;
> +
> +       tegra_dsi_writel(dsi, value, DSI_HOST_CONTROL);
> +
> +       /*
> +        * For reads and messages with explicitly requested ACK, generate a
> +        * BTA sequence after the transmission of the packet.
> +        */
> +       if ((msg->flags & MIPI_DSI_MSG_REQ_ACK) ||
> +           (msg->rx_buf && msg->rx_len > 0)) {
> +               value = tegra_dsi_readl(dsi, DSI_HOST_CONTROL);
> +               value |= DSI_HOST_CONTROL_PKT_BTA;
> +               tegra_dsi_writel(dsi, value, DSI_HOST_CONTROL);
> +       }
> +
> +       value = DSI_CONTROL_LANES(0) | DSI_CONTROL_HOST_ENABLE;
> +       tegra_dsi_writel(dsi, value, DSI_CONTROL);
> +
> +       /* write packet header */
> +       value = ((msg->channel & 0x3) << 6) | (msg->type & 0x3f);
> +
> +       if (tx && msg->tx_len > 0)
> +               value |= tx[0] <<  8;
> +
> +       if (tx && msg->tx_len > 1)
> +               value |= tx[1] << 16;
> +
> +       tegra_dsi_writel(dsi, value, DSI_WR_DATA);
> +
> +       /* write payload (if any) */
> +       if (msg->tx_len > 2) {
> +               for (j = 2; j < msg->tx_len; j += 4) {
> +                       value = 0;
> +
> +                       for (i = 0; i < 4 && j + i < msg->tx_len; i++)
> +                               value |= tx[j + i] << (i << 3);
> +
> +                       tegra_dsi_writel(dsi, value, DSI_WR_DATA);
> +               }
> +       }
> +
> +       err = tegra_dsi_transmit(dsi, 250);
> +       if (err < 0)
> +               return err;
> +
> +       if ((msg->flags & MIPI_DSI_MSG_REQ_ACK) ||
> +           (msg->rx_buf && msg->rx_len > 0)) {
> +               err = tegra_dsi_wait_for_response(dsi, 250);
> +               if (err < 0)
> +                       return err;
> +
> +               count = err;
> +
> +               value = tegra_dsi_readl(dsi, DSI_RD_DATA);
> +               switch (value) {
> +               case 0x84:
> +                       /*
> +                       dev_dbg(dsi->dev, "ACK\n");
> +                       */
> +                       break;
> +
> +               case 0x87:
> +                       /*
> +                       dev_dbg(dsi->dev, "ESCAPE\n");
> +                       */
> +                       break;
> +
> +               default:
> +                       dev_err(dsi->dev, "unknown status: %08x\n", value);
> +                       break;
> +               }
> +
> +               if (count > 1) {
> +                       err = tegra_dsi_read_response(dsi, msg, count);
> +                       if (err < 0)
> +                               dev_err(dsi->dev,
> +                                       "failed to parse response: %d\n",
> +                                       err);
> +               }
> +       }
> +
> +       return 0;

Hi Thierry,
According to the comment in drm_mipi_dsi.h, this should return "the
number of bytes transmitted for write packets or the number of bytes
received for read packets" on success.

Sean

> +}
> +
> +static int tegra_dsi_ganged_setup(struct tegra_dsi *dsi)
> +{
> +       struct clk *parent;
> +       int err;
> +
> +       /* make sure both DSI controllers share the same PLL */
> +       parent = clk_get_parent(dsi->slave->clk);
> +       if (!parent)
> +               return -EINVAL;
> +
> +       err = clk_set_parent(parent, dsi->clk_parent);
> +       if (err < 0)
> +               return err;
> +
> +       return 0;
> +}
> +
>  static int tegra_dsi_host_attach(struct mipi_dsi_host *host,
>                                  struct mipi_dsi_device *device)
>  {
>         struct tegra_dsi *dsi = host_to_tegra(host);
> -       struct tegra_output *output = &dsi->output;
>
>         dsi->flags = device->mode_flags;
>         dsi->format = device->format;
>         dsi->lanes = device->lanes;
>
> -       output->panel = of_drm_find_panel(device->dev.of_node);
> -       if (output->panel) {
> -               if (output->connector.dev)
> +       if (dsi->slave) {
> +               int err;
> +
> +               dev_dbg(dsi->dev, "attaching dual-channel device %s\n",
> +                       dev_name(&device->dev));
> +
> +               err = tegra_dsi_ganged_setup(dsi);
> +               if (err < 0) {
> +                       dev_err(dsi->dev, "failed to set up ganged mode: %d\n",
> +                               err);
> +                       return err;
> +               }
> +       }
> +
> +       /*
> +        * Slaves don't have a panel associated with them, so they provide
> +        * merely the second channel.
> +        */
> +       if (!dsi->master) {
> +               struct tegra_output *output = &dsi->output;
> +
> +               output->panel = of_drm_find_panel(device->dev.of_node);
> +               if (output->panel && output->connector.dev) {
> +                       drm_panel_attach(output->panel, &output->connector);
>                         drm_helper_hpd_irq_event(output->connector.dev);
> +               }
>         }
>
>         return 0;
> @@ -818,10 +1298,10 @@ static int tegra_dsi_host_detach(struct mipi_dsi_host *host,
>         struct tegra_output *output = &dsi->output;
>
>         if (output->panel && &device->dev == output->panel->dev) {
> +               output->panel = NULL;
> +
>                 if (output->connector.dev)
>                         drm_helper_hpd_irq_event(output->connector.dev);
> -
> -               output->panel = NULL;
>         }
>
>         return 0;
> @@ -830,8 +1310,29 @@ static int tegra_dsi_host_detach(struct mipi_dsi_host *host,
>  static const struct mipi_dsi_host_ops tegra_dsi_host_ops = {
>         .attach = tegra_dsi_host_attach,
>         .detach = tegra_dsi_host_detach,
> +       .transfer = tegra_dsi_host_transfer,
>  };
>
> +static int tegra_dsi_ganged_probe(struct tegra_dsi *dsi)
> +{
> +       struct device_node *np;
> +
> +       np = of_parse_phandle(dsi->dev->of_node, "nvidia,ganged-mode", 0);
> +       if (np) {
> +               struct platform_device *gangster = of_find_device_by_node(np);
> +
> +               dsi->slave = platform_get_drvdata(gangster);
> +               of_node_put(np);
> +
> +               if (!dsi->slave)
> +                       return -EPROBE_DEFER;
> +
> +               dsi->slave->master = dsi;
> +       }
> +
> +       return 0;
> +}
> +
>  static int tegra_dsi_probe(struct platform_device *pdev)
>  {
>         struct tegra_dsi *dsi;
> @@ -846,10 +1347,16 @@ static int tegra_dsi_probe(struct platform_device *pdev)
>         dsi->video_fifo_depth = 1920;
>         dsi->host_fifo_depth = 64;
>
> +       err = tegra_dsi_ganged_probe(dsi);
> +       if (err < 0)
> +               return err;
> +
>         err = tegra_output_probe(&dsi->output);
>         if (err < 0)
>                 return err;
>
> +       dsi->output.connector.polled = DRM_CONNECTOR_POLL_HPD;
> +
>         /*
>          * Assume these values by default. When a DSI peripheral driver
>          * attaches to the DSI host, the parameters will be taken from
> @@ -863,68 +1370,83 @@ static int tegra_dsi_probe(struct platform_device *pdev)
>         if (IS_ERR(dsi->rst))
>                 return PTR_ERR(dsi->rst);
>
> +       err = reset_control_deassert(dsi->rst);
> +       if (err < 0) {
> +               dev_err(&pdev->dev, "failed to bring DSI out of reset: %d\n",
> +                       err);
> +               return err;
> +       }
> +
>         dsi->clk = devm_clk_get(&pdev->dev, NULL);
>         if (IS_ERR(dsi->clk)) {
>                 dev_err(&pdev->dev, "cannot get DSI clock\n");
> -               return PTR_ERR(dsi->clk);
> +               err = PTR_ERR(dsi->clk);
> +               goto reset;
>         }
>
>         err = clk_prepare_enable(dsi->clk);
>         if (err < 0) {
>                 dev_err(&pdev->dev, "cannot enable DSI clock\n");
> -               return err;
> +               goto reset;
>         }
>
>         dsi->clk_lp = devm_clk_get(&pdev->dev, "lp");
>         if (IS_ERR(dsi->clk_lp)) {
>                 dev_err(&pdev->dev, "cannot get low-power clock\n");
> -               return PTR_ERR(dsi->clk_lp);
> +               err = PTR_ERR(dsi->clk_lp);
> +               goto disable_clk;
>         }
>
>         err = clk_prepare_enable(dsi->clk_lp);
>         if (err < 0) {
>                 dev_err(&pdev->dev, "cannot enable low-power clock\n");
> -               return err;
> +               goto disable_clk;
>         }
>
>         dsi->clk_parent = devm_clk_get(&pdev->dev, "parent");
>         if (IS_ERR(dsi->clk_parent)) {
>                 dev_err(&pdev->dev, "cannot get parent clock\n");
> -               return PTR_ERR(dsi->clk_parent);
> -       }
> -
> -       err = clk_prepare_enable(dsi->clk_parent);
> -       if (err < 0) {
> -               dev_err(&pdev->dev, "cannot enable parent clock\n");
> -               return err;
> +               err = PTR_ERR(dsi->clk_parent);
> +               goto disable_clk_lp;
>         }
>
>         dsi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
>         if (IS_ERR(dsi->vdd)) {
>                 dev_err(&pdev->dev, "cannot get VDD supply\n");
> -               return PTR_ERR(dsi->vdd);
> +               err = PTR_ERR(dsi->vdd);
> +               goto disable_clk_lp;
>         }
>
>         err = regulator_enable(dsi->vdd);
>         if (err < 0) {
>                 dev_err(&pdev->dev, "cannot enable VDD supply\n");
> -               return err;
> +               goto disable_clk_lp;
>         }
>
>         err = tegra_dsi_setup_clocks(dsi);
>         if (err < 0) {
>                 dev_err(&pdev->dev, "cannot setup clocks\n");
> -               return err;
> +               goto disable_vdd;
>         }
>
>         regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         dsi->regs = devm_ioremap_resource(&pdev->dev, regs);
> -       if (IS_ERR(dsi->regs))
> -               return PTR_ERR(dsi->regs);
> +       if (IS_ERR(dsi->regs)) {
> +               err = PTR_ERR(dsi->regs);
> +               goto disable_vdd;
> +       }
>
>         dsi->mipi = tegra_mipi_request(&pdev->dev);
> -       if (IS_ERR(dsi->mipi))
> -               return PTR_ERR(dsi->mipi);
> +       if (IS_ERR(dsi->mipi)) {
> +               err = PTR_ERR(dsi->mipi);
> +               goto disable_vdd;
> +       }
> +
> +       err = tegra_dsi_pad_calibrate(dsi);
> +       if (err < 0) {
> +               dev_err(dsi->dev, "MIPI calibration failed: %d\n", err);
> +               goto mipi_free;
> +       }
>
>         dsi->host.ops = &tegra_dsi_host_ops;
>         dsi->host.dev = &pdev->dev;
> @@ -932,7 +1454,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
>         err = mipi_dsi_host_register(&dsi->host);
>         if (err < 0) {
>                 dev_err(&pdev->dev, "failed to register DSI host: %d\n", err);
> -               return err;
> +               goto mipi_free;
>         }
>
>         INIT_LIST_HEAD(&dsi->client.list);
> @@ -943,12 +1465,26 @@ static int tegra_dsi_probe(struct platform_device *pdev)
>         if (err < 0) {
>                 dev_err(&pdev->dev, "failed to register host1x client: %d\n",
>                         err);
> -               return err;
> +               goto unregister;
>         }
>
>         platform_set_drvdata(pdev, dsi);
>
>         return 0;
> +
> +unregister:
> +       mipi_dsi_host_unregister(&dsi->host);
> +mipi_free:
> +       tegra_mipi_free(dsi->mipi);
> +disable_vdd:
> +       regulator_disable(dsi->vdd);
> +disable_clk_lp:
> +       clk_disable_unprepare(dsi->clk_lp);
> +disable_clk:
> +       clk_disable_unprepare(dsi->clk);
> +reset:
> +       reset_control_assert(dsi->rst);
> +       return err;
>  }
>
>  static int tegra_dsi_remove(struct platform_device *pdev)
> @@ -967,7 +1503,6 @@ static int tegra_dsi_remove(struct platform_device *pdev)
>         tegra_mipi_free(dsi->mipi);
>
>         regulator_disable(dsi->vdd);
> -       clk_disable_unprepare(dsi->clk_parent);
>         clk_disable_unprepare(dsi->clk_lp);
>         clk_disable_unprepare(dsi->clk);
>         reset_control_assert(dsi->rst);
> diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.h
> index 5ce610d08d77..bad1006a5150 100644
> --- a/drivers/gpu/drm/tegra/dsi.h
> +++ b/drivers/gpu/drm/tegra/dsi.h
> @@ -21,9 +21,16 @@
>  #define DSI_INT_STATUS                 0x0d
>  #define DSI_INT_MASK                   0x0e
>  #define DSI_HOST_CONTROL               0x0f
> +#define DSI_HOST_CONTROL_FIFO_RESET    (1 << 21)
> +#define DSI_HOST_CONTROL_CRC_RESET     (1 << 20)
> +#define DSI_HOST_CONTROL_TX_TRIG_SOL   (0 << 12)
> +#define DSI_HOST_CONTROL_TX_TRIG_FIFO  (1 << 12)
> +#define DSI_HOST_CONTROL_TX_TRIG_HOST  (2 << 12)
>  #define DSI_HOST_CONTROL_RAW           (1 << 6)
>  #define DSI_HOST_CONTROL_HS            (1 << 5)
> -#define DSI_HOST_CONTROL_BTA           (1 << 2)
> +#define DSI_HOST_CONTROL_FIFO_SEL      (1 << 4)
> +#define DSI_HOST_CONTROL_IMM_BTA       (1 << 3)
> +#define DSI_HOST_CONTROL_PKT_BTA       (1 << 2)
>  #define DSI_HOST_CONTROL_CS            (1 << 1)
>  #define DSI_HOST_CONTROL_ECC           (1 << 0)
>  #define DSI_CONTROL                    0x10
> @@ -39,9 +46,13 @@
>  #define DSI_SOL_DELAY                  0x11
>  #define DSI_MAX_THRESHOLD              0x12
>  #define DSI_TRIGGER                    0x13
> +#define DSI_TRIGGER_HOST               (1 << 1)
> +#define DSI_TRIGGER_VIDEO              (1 << 0)
>  #define DSI_TX_CRC                     0x14
>  #define DSI_STATUS                     0x15
>  #define DSI_STATUS_IDLE                        (1 << 10)
> +#define DSI_STATUS_UNDERFLOW           (1 <<  9)
> +#define DSI_STATUS_OVERFLOW            (1 <<  8)
>  #define DSI_INIT_SEQ_CONTROL           0x1a
>  #define DSI_INIT_SEQ_DATA_0            0x1b
>  #define DSI_INIT_SEQ_DATA_1            0x1c
> @@ -104,6 +115,7 @@
>  #define DSI_PAD_CONTROL_3              0x51
>  #define DSI_PAD_CONTROL_4              0x52
>  #define DSI_GANGED_MODE_CONTROL                0x53
> +#define DSI_GANGED_MODE_CONTROL_ENABLE (1 << 0)
>  #define DSI_GANGED_MODE_START          0x54
>  #define DSI_GANGED_MODE_SIZE           0x55
>  #define DSI_RAW_DATA_BYTE_COUNT                0x56
> --
> 2.1.2
>
