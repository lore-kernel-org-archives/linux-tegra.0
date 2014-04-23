From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 5/7] mfd: cros_ec: Sync to the latest
 cros_ec_commands.h from EC sources
Date: Wed, 23 Apr 2014 13:36:50 +0100
Message-ID: <20140423123650.GF640@lee--X1>
References: <1398185154-19404-1-git-send-email-dianders@chromium.org>
 <1398185154-19404-6-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398185154-19404-6-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: swarren@nvidia.com, wsa@the-dreams.de, abrestic@chromium.org, dgreid@chromium.org, olof@lixom.net, sjg@chromium.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Bill Richardson <wfrichar@chromium.org>, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 22 Apr 2014, Doug Anderson wrote:

> From: Bill Richardson <wfrichar@chromium.org>
>=20
> This just updates include/linux/mfd/cros_ec_commands.h to match the
> latest EC version (which is the One True Source for such things).  Se=
e
> <https://chromium.googlesource.com/chromiumos/platform/ec>
>=20
> [dianders: took today's ToT version from the Chromium OS EC; deleted
> references to cros_ec_dev and cros_ec_lpc since those aren't upstream
> yet]
>=20
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Tested-by: Andrew Bresticker <abrestic@chromium.org>
> Tested-by: Stephen Warren <swarren@nvidia.com>
> ---
> Changes in v2: None
>=20
>  drivers/mfd/cros_ec.c                |    2 +-
>  include/linux/mfd/cros_ec.h          |    4 +-
>  include/linux/mfd/cros_ec_commands.h | 1128 ++++++++++++++++++++++++=
+++++++---
>  3 files changed, 1059 insertions(+), 75 deletions(-)

Waiting for other subsystems to Ack, so for now:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
