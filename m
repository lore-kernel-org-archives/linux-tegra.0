From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Add pinmux board file for Cardhu
Date: Tue, 31 Jan 2012 23:39:26 -0800
Message-ID: <20120201073926.GG7399@quad.lixom.net>
References: <1327511715-27350-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1327511715-27350-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 25, 2012 at 10:15:15AM -0700, Stephen Warren wrote:
> For now, this just sets up the pinmux and GPIOs required for the SD
> card slot.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This will hopefully be replaced by the pinmux DT binding in the near
> future, but until that happens, Tegra30 pinmux functionality needs to
> be exposed somehow to unblock getting drivers tested on Tegra30.
> 
> This of course depends on my recently posted patches that implement a
> pinctrl subsystem driver for Tegra.
> 
> (Peter said: Boot tested on Cardhu, MMC still doesn't work but that might
> have another rootcause...)

Thanks, applied.


-Olof
