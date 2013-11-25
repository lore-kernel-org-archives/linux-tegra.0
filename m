From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 11/31] dma: add channel request API that supports
	deferred probe
Date: Mon, 25 Nov 2013 20:52:25 +0000
Message-ID: <20131125205224.GT16735@n2100.arm.linux.org.uk>
References: <528E4F55.9070204@wwwdotorg.org> <CAPcyv4jTUVjhFFXP8RL2jCqFj1MqxSCKQYvfdLHTj+1PRDDL3Q@mail.gmail.com> <528F95A9.2050305@wwwdotorg.org> <CAPcyv4iXmBmcsHDc7yjxxbH7sO8m1nVoEO6PUibuDeb1Wtge+g@mail.gmail.com> <528F9DF9.6080706@wwwdotorg.org> <20131123003442.GH16735@n2100.arm.linux.org.uk> <5293883A.8050808@wwwdotorg.org> <20131125175330.GQ16735@n2100.arm.linux.org.uk> <52938F75.7020108@wwwdotorg.org> <20131125202808.GN2760@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131125202808.GN2760-kDjWylLy9wD0K7fsECOQyeGNnDKD8DIp@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 25, 2013 at 09:28:08PM +0100, Gerhard Sittig wrote:
> See 2771399a "fs_enet: cleanup clock API use" or b3bfce2bc "i2c:
> mpc: cleanup clock API use" for an example.

And had I seen that change I'd have commented thusly:

+       /* make clock lookup non-fatal (the driver is shared among platforms),
+        * but require enable to succeed when a clock was specified/found,
+        * keep a reference to the clock upon successful acquisition
+        */
+       clk = devm_clk_get(&ofdev->dev, "per");
+       if (!IS_ERR(clk)) {
+               err = clk_prepare_enable(clk);
+               if (err) {
+                       ret = err;
+                       goto out_free_fpi;
+               }
+               fpi->clk_per = clk;
+       }

 out_put:
        of_node_put(fpi->phy_node);
+       if (fpi->clk_per)
+               clk_disable_unprepare(fpi->clk_per);

        of_node_put(fep->fpi->phy_node);
+       if (fep->fpi->clk_per)
+               clk_disable_unprepare(fep->fpi->clk_per);

So, lets consider what happens if clk_get() inside devm_clk_get() returns
NULL.

* devm_clk_get() allocates its tracking structure, and sets the clk pointer
  to be freed to NULL.
* !IS_ERR(NULL) is true, so we call clk_prepare_enable(NULL).  This succeeds.
* We store NULL into fpi->clk_per.
* The error cleanup/teardown paths check for a NULL pointer, and fail to
  call the CLK API in that case.

This is not very nice.  Better solution:

	fpi->clk_per = PTR_ERR(-EINVAL);
	clk = devm_clk_get(&ofdev->dev, "per");
	if (!IS_ERR(clk)) {
		err = clk_prepare_enable(clk);
		if (err) {
			ret = err;
			goto out_free_fpi;
		}
		fpi->clk_per = clk;
	}

...

        of_node_put(fpi->phy_node);
        if (!IS_ERR(fpi->clk_per))
                clk_disable_unprepare(fpi->clk_per);
