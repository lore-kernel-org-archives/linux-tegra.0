From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/7] mfd: cros_ec: spi: calculate delay between
 transfers correctly
Date: Wed, 23 Apr 2014 13:33:41 +0100
Message-ID: <20140423123341.GB640@lee--X1>
References: <1398185154-19404-1-git-send-email-dianders@chromium.org>
 <1398185154-19404-2-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398185154-19404-2-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: swarren@nvidia.com, wsa@the-dreams.de, abrestic@chromium.org, dgreid@chromium.org, olof@lixom.net, sjg@chromium.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, David Hendricks <dhendrix@chromium.org>, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

> From: David Hendricks <dhendrix@chromium.org>
>=20
> To avoid spamming the EC we calculate the time between the previous
> transfer and the current transfer and force a delay if the time delta
> is too small.
>=20
> However, a small miscalculation causes the delay period to be
> far too short. Most noticably this impacts commands with a long
> turnaround time such as EC firmware reads and writes.
>=20
> Signed-off-by: David Hendricks <dhendrix@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Tested-by: Andrew Bresticker <abrestic@chromium.org>
> Tested-by: Stephen Warren <swarren@nvidia.com>
> ---
> Changes in v2: None
>=20
>  drivers/mfd/cros_ec_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Waiting for other subsystems to Ack, so for now:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
