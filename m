From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/2] mfd: tps65910: Fix crash in i2c_driver .probe
Date: Tue, 18 Jun 2013 11:16:10 +0200
Message-ID: <20130618091610.GG7161@zurbaran>
References: <1371491257-23791-1-git-send-email-ttynkkynen@nvidia.com>
 <1371491257-23791-2-git-send-email-ttynkkynen@nvidia.com>
 <51BF5281.2030105@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51BF5281.2030105-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 17, 2013 at 12:16:33PM -0600, Stephen Warren wrote:
> On 06/17/2013 11:47 AM, Tuomas Tynkkynen wrote:
> > Commit "i2c: core: make it possible to match a pure device tree driver"
> > changed semantics of the i2c probing for device tree devices.
> > Device tree probed devices now get a NULL i2c_device_id pointer.
> > This caused kernel panics due to NULL dereference.
> 
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> (although I imagine I'd need to retest if there was a v2 to address my
> previous comments)
I would prefer seeing a v2, especially to address the pmic_plat_data
overwriting issue.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
