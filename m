From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/7] mfd: cros_ec: spi: Add mutex to cros_ec_spi
Date: Wed, 23 Apr 2014 13:34:38 +0100
Message-ID: <20140423123438.GC640@lee--X1>
References: <1398185154-19404-1-git-send-email-dianders@chromium.org>
 <1398185154-19404-3-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398185154-19404-3-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: swarren@nvidia.com, wsa@the-dreams.de, abrestic@chromium.org, dgreid@chromium.org, olof@lixom.net, sjg@chromium.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 22 Apr 2014, Doug Anderson wrote:

> The main transfer function for cros_ec_spi can be called by more than
> one client at a time.  Make sure that those clients don't stomp on
> each other by locking the bus for the duration of the transfer
> function.
>=20
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Tested-by: Andrew Bresticker <abrestic@chromium.org>
> Tested-by: Stephen Warren <swarren@nvidia.com>
> ---
> Changes in v2: None
>=20
>  drivers/mfd/cros_ec_spi.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)

Waiting for other subsystems to Ack, so for now:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
