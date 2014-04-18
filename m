From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 5/7] mfd: cros_ec: Sync to the latest cros_ec_commands.h
 from EC sources
Date: Fri, 18 Apr 2014 11:29:23 -0600
Message-ID: <CAPnjgZ1hYvXp_OGPsMZGjg+15GSeE59n8XfgvRRQpP2Oa5bJJw@mail.gmail.com>
References: <1397757570-19750-1-git-send-email-dianders@chromium.org>
	<1397757570-19750-6-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1397757570-19750-6-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Stephen Warren <swarren@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Andrew Bresticker <abrestic@chromium.org>, Dylan Reid <dgreid@chromium.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Bill Richardson <wfrichar@chromium.org>, Samuel Ortiz <sameo@linux.intel.com>, lk <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 17 April 2014 11:59, Doug Anderson <dianders@chromium.org> wrote:
> From: Bill Richardson <wfrichar@chromium.org>
>
> This just updates include/linux/mfd/cros_ec_commands.h to match the
> latest EC version (which is the One True Source for such things).  See
> <https://chromium.googlesource.com/chromiumos/platform/ec>
>
> [dianders: took today's ToT version from the Chromium OS EC; deleted
> references to cros_ec_dev and cros_ec_lpc since those aren't upstream
> yet]
>
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>

Reviewed-by: Simon Glass <sjg@chromium.org>
