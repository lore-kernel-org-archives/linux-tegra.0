From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH V2 1/2] ARM: tegra: Add pinmux board file for Cardhu
Date: Sun, 26 Feb 2012 13:51:41 -0800
Message-ID: <20120226215141.GA11189@quad.lixom.net>
References: <1328138997-25665-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1328138997-25665-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 01, 2012 at 04:29:56PM -0700, Stephen Warren wrote:
> For now, this just sets up the pinmux and GPIOs required for the SD
> card slot.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2:
> * Set PULL_UP for CMD and DATA pins on SD interface
> * Add power GPIO for SDMMC1
> * Add pinmux configuration for SDMMC4
> 
> This will hopefully be replaced by the pinmux DT binding in the near
> future, but until that happens, Tegra30 pinmux functionality needs to
> be exposed somehow to unblock getting drivers tested on Tegra30.

Thanks, applied to for-3.4/boards.


-Olof
