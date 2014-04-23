From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/7] mfd: cros_ec: spi: Increase cros_ec_spi deadline
 from 5ms to 100ms
Date: Wed, 23 Apr 2014 13:36:01 +0100
Message-ID: <20140423123601.GE640@lee--X1>
References: <1398185154-19404-1-git-send-email-dianders@chromium.org>
 <1398185154-19404-5-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398185154-19404-5-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: swarren@nvidia.com, wsa@the-dreams.de, abrestic@chromium.org, dgreid@chromium.org, olof@lixom.net, sjg@chromium.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 22 Apr 2014, Doug Anderson wrote:

> We're adding i2c tunneling to the list of things that goes over
> cros_ec.  i2c tunneling can be slooooooow, so increase our deadline t=
o
> 100ms to account for that.
>=20
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Tested-by: Andrew Bresticker <abrestic@chromium.org>
> Tested-by: Stephen Warren <swarren@nvidia.com>
> ---
> Changes in v2: None
>=20
>  drivers/mfd/cros_ec_spi.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)

Waiting for other subsystems to Ack, so for now:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
