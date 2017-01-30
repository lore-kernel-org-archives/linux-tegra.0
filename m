From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] I2c: busses - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 09:07:15 +0100
Message-ID: <20170130080715.wuvx7ro3kuneolnu@pengutronix.de>
References: <CGME20170130050324epcas3p28c9adcffd7bc40e1733cdeef1e5240d5@epcas3p2.samsung.com>
 <1485752587-30107-1-git-send-email-shailendra.v@samsung.com>
 <20170130071217.GG3585@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170130071217.GG3585-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.shailesh-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ashish.kalra-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Shailendra Verma <shailendra.capricorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello,

On Mon, Jan 30, 2017 at 08:12:17AM +0100, Thierry Reding wrote:
> On Mon, Jan 30, 2017 at 10:33:07AM +0530, Shailendra Verma wrote:
> > of_device_get_match_data could return NULL, and so can cause
> > a NULL pointer dereference later.
> > 
> > Signed-off-by: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  drivers/i2c/busses/i2c-tegra.c |    4 ++++
> >  1 file changed, 4 insertions(+)
> 
> This will never happen. Any match in the OF table that would cause the
> ->probe() to occur has a valid .data pointer associated with it.

Theoretically you could (I think) bind that driver to a node with

	compatible = "tegra-i2c";

Anyhow, even if today there was no possibility this could happen, that's
something that might easily be changed by a future change. So I doubt
"this will never happen" stays true for sure and being defensive is a
good idea. And even a BUG would be better than a silent NULL pointer
dereference.

Just my € 0.02
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
