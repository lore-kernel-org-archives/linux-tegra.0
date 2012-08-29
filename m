From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH RESEND] dma: tegra: add const to of_device_id.data's
 structure
Date: Wed, 29 Aug 2012 10:49:11 +0200
Message-ID: <20120829084911.GE28643@pengutronix.de>
References: <1346217447-19730-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1346217447-19730-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: vinod.koul@intel.com, djbw@fb.com, swarren@wwwdotorg.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, kernel@pengutronix.de
List-Id: linux-tegra@vger.kernel.org

Hello,

On Wed, Aug 29, 2012 at 10:47:27AM +0530, Laxman Dewangan wrote:
> The member "data" of structure of_device_id is changed to const
> pointer. Hence initializing this with const type data.
> This will fix the compilation warning like
> drivers/dma/tegra20-apb-dma.c:1217:9: warning: assignment discards 'c=
onst' qualifier from
> pointer target type [enabled by default]
>=20
> This warning came after the change
> ---------
> commit 98d7bbb9929bcc14e11ac8a55245a4f2dc174e17
> Author: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>     of: add const to struct *of_device_id.data
> ---------
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>
> Acked-by: Vinod Koul <vinod.koul@linux.intel.com>
I took the patch into my series now and split it in two to prevent
warnings in the middle of the series. I assumed the two acks for both
patches and send them in a moment in reply to this mail.

You can find the updated series

	git://git.pengutronix.de/git/ukl/linux.git ofdeviceiddata

Arnd or Olof, can you please update the corresponding branch arm-soc
from there?

Best regards and thanks
Uwe
