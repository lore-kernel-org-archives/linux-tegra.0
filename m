From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH V2 2/2] ARM: dt: Add SD controller configuration to Tegra
 Cardhu
Date: Sun, 26 Feb 2012 13:51:57 -0800
Message-ID: <20120226215157.GB11189@quad.lixom.net>
References: <1328138997-25665-1-git-send-email-swarren@nvidia.com>
 <1328138997-25665-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1328138997-25665-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 01, 2012 at 04:29:57PM -0700, Stephen Warren wrote:
> Cardhu uses Tegra's SD ports as follows:
> SDMMC1: User SD slot, with GPIOs for power, CD, and WP.
> SDMMC2: Not used
> SDMMC3: WiFi (currently disabled pending future investigation)
> SDMMC4: Internal eMMC
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, applied to for-3.4/dt


-Olof
