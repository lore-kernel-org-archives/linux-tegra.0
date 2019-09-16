From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] drm/tegra: switch to using devm_gpiod_get_optional
Date: Mon, 16 Sep 2019 09:54:24 -0700
Message-ID: <20190916165424.GD237523@dtor-ws>
References: <20190915071323.GA36596@dtor-ws>
 <20190916135904.GA7488@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190916135904.GA7488@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 16, 2019 at 03:59:04PM +0200, Thierry Reding wrote:
> On Sun, Sep 15, 2019 at 12:13:23AM -0700, Dmitry Torokhov wrote:
> > We do not really need to use API that fetches GPIO data from an
> > arbitrary device tree node, as we are dealing with device tree node
> > assigned to the device structure. We can easily switch to
> > devm_gpiod_get_optional() plus gpiod_set_consumer_name() and clean up
> > the code.
> > 
> > Note this is part of efforts to get rid of [devm_]gpiod_get_from_of_node
> > in drivers so that gpiolib can be cleaned up.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/output.c | 18 +++++++-----------
> >  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> We can't do that. There's a special case in rgb.c that sets
> output->of_node to something different than output->dev, so we actually
> need to pass the struct device_node * separately.

Ugh, brainfart on my part. I totally read it is output->dev.of_node,
similar to another driver I was looking at...

Please discard, there will be another patch changing
devm_gpiod_get_from_of_node() to devm_fwnode_gpiod_get() once Linus
merges this new GPIO method.

Thanks.

-- 
Dmitry
