From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] I2c: busses - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 12:15:53 +0100
Message-ID: <20170130111553.cbwxu23lzd46qtt7@pengutronix.de>
References: <CGME20170130050324epcas3p28c9adcffd7bc40e1733cdeef1e5240d5@epcas3p2.samsung.com>
 <1485752587-30107-1-git-send-email-shailendra.v@samsung.com>
 <20170130071217.GG3585@ulmo.ba.sec>
 <20170130080715.wuvx7ro3kuneolnu@pengutronix.de>
 <20170130085455.GP3585@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170130085455.GP3585@ulmo.ba.sec>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Shailendra Verma <shailendra.v@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, p.shailesh@samsung.com, ashish.kalra@samsung.com, Shailendra Verma <shailendra.capricorn@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 30, 2017 at 09:54:55AM +0100, Thierry Reding wrote:
> On Mon, Jan 30, 2017 at 09:07:15AM +0100, Uwe Kleine-König wrote:
> > Hello,
> > 
> > On Mon, Jan 30, 2017 at 08:12:17AM +0100, Thierry Reding wrote:
> > > On Mon, Jan 30, 2017 at 10:33:07AM +0530, Shailendra Verma wrote:
> > > > of_device_get_match_data could return NULL, and so can cause
> > > > a NULL pointer dereference later.
> > > > 
> > > > Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>
> > > > ---
> > > >  drivers/i2c/busses/i2c-tegra.c |    4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > 
> > > This will never happen. Any match in the OF table that would cause the
> > > ->probe() to occur has a valid .data pointer associated with it.
> > 
> > Theoretically you could (I think) bind that driver to a node with
> > 
> > 	compatible = "tegra-i2c";
> 
> That's not a valid compatible string and I don't think this could end up
> anywhere that would make the driver bind. Even if it did I think it'd be

Look at platform_match() in drivers/base/platform.c. If
of_driver_match_device fails it might still match based on
strcmp(pdev->name, drv->name).

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
