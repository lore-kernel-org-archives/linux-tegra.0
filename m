From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 5/8] ARM: tegra: Add auxiliary data for nvhost
Date: Tue, 27 Nov 2012 08:33:12 +0200
Message-ID: <50B45EA8.7000502@nvidia.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-6-git-send-email-tbergstrom@nvidia.com> <50B3FDCC.7080709@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B3FDCC.7080709-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 27.11.2012 01:39, Stephen Warren wrote:
> Clock names shouldn't be passed in platform data; instead, clk_get()
> should be passed the device object and device-relative (i.e. not global)
> clock name. I expect if the driver is fixed to make this change, the
> changes to tegra*_clocks_data.c won't be needed either.

Isn't this code doing exactly that - getting a device relative clock,
nvhost_module_init() in nvhost.acm.c:

(...)
	/* initialize clocks to known state */
	while (pdata->clocks[i].name && i < NVHOST_MODULE_MAX_CLOCKS) {
		long rate = pdata->clocks[i].default_rate;
		struct clk *c;

		c = devm_clk_get(&dev->dev, pdata->clocks[i].name);
		if (IS_ERR_OR_NULL(c)) {
			dev_err(&dev->dev, "Cannot get clock %s\n",
					pdata->clocks[i].name);
			return -ENODEV;
		}

		rate = clk_round_rate(c, rate);
		clk_prepare_enable(c);
		clk_set_rate(c, rate);
		clk_disable_unprepare(c);
		pdata->clk[i] = c;
		i++;
	}
(...)

Without the clock changes, the clocks in board files are now assigned to
devid "tegra_grhost". I guess the correct way to do this would be to
assign them to "tegra-gr2d" (2d, epp) and "host1x" - except if we also
want to drop "tegra-" from the device name.

Terje
