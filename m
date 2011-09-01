From: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: [PATCH 1/3] staging:iio:magnetometer:ak8975 Don't use
	irq_to_gpio()
Date: Thu, 01 Sep 2011 10:07:26 +0100
Message-ID: <4E5F4B4E.5060801@cam.ac.uk>
References: <1314819657-828-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1314819657-828-1-git-send-email-swarren@nvidia.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: devel-bounces@linuxdriverproject.org
To: Stephen Warren <swarren@nvidia.com>
Cc: devel@driverdev.osuosl.org, Andrew Chew <achew@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, linux-iio@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Russell King <linux@arm.linux.org.uk>
List-Id: linux-tegra@vger.kernel.org

On 08/31/11 20:40, Stephen Warren wrote:
> Tegra doesn't have irq_to_gpio() any more, and ak8975 is included in
> tegra_defconfig. This causes a build failure. Solve this with a heavy-handed
> method for now.
> 
> I suspect the long-term solution is to pass both the IRQ and GPIO IDs
> to the driver; the GPIO ID coming from either platform data, or perhaps
> enhancing struct i2c_client to add a gpio field alongside irq.
Definitely on the platform data front. We need some means of doing this now
hence my patch putting most trivial form of that in.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
Acked-by: Jonathan Cameron <jic23@cam.ac.uk>
> ---
> Russell, now that irq_to_gpio() is going away, can you comment on how
> you'd like to fix drivers that do this kind of thing? Thanks.
> 
>  drivers/staging/iio/magnetometer/ak8975.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/staging/iio/magnetometer/ak8975.c b/drivers/staging/iio/magnetometer/ak8975.c
> index a17fa9f..bd40e32 100644
> --- a/drivers/staging/iio/magnetometer/ak8975.c
> +++ b/drivers/staging/iio/magnetometer/ak8975.c
> @@ -477,7 +477,7 @@ static int ak8975_probe(struct i2c_client *client,
>  	int err;
>  
>  	/* Grab and set up the supplied GPIO. */
> -	eoc_gpio = irq_to_gpio(client->irq);
> +	eoc_gpio = -1; /* FIXME: irq_to_gpio(client->irq) */
>  
>  	/* We may not have a GPIO based IRQ to scan, that is fine, we will
>  	   poll if so */
