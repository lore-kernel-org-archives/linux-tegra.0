From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: tegra: T114: add DFLL DVCO reset control
Date: Wed, 19 Jun 2013 11:45:42 +0300
Message-ID: <20130619084542.GB3847@tbergstrom-lnx.Nvidia.com>
References: <20130607121505.21868.72360.stgit@dusk.lan>
 <20130607121901.21868.65416.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130607121901.21868.65416.stgit-orwA252wQtA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 07, 2013 at 02:19:09PM +0200, Paul Walmsley wrote:
> Add DFLL DVCO reset line control functions to the CAR IP block driver.
> 
> The DVCO present in the DFLL IP block has a separate reset line,
> exposed via the CAR IP block.  This reset line is asserted upon SoC
> reset.  Unless something (such as the DFLL driver) deasserts this
> line, the DVCO will not oscillate, although reads and writes to the
> DFLL IP block will complete.
> 
> Thanks to Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> for identifying this and
> saving hours of debugging time.
> 
> Signed-off-by: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers,

Peter.
