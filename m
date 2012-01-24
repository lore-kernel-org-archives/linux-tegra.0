From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH V2 1/4] ARM: dt: tegra: Add Tegra APB DMA device tree
 binding
Date: Tue, 24 Jan 2012 00:42:49 -0800
Message-ID: <20120124084249.GA14682@quad.lixom.net>
References: <1326323397-23931-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1326323397-23931-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wed, Jan 11, 2012 at 04:09:54PM -0700, Stephen Warren wrote:
> Document binding, and add the node to tegra*.dtsi.
> 
> The driver isn't actually instantiated from this node yet, but the I2S
> binding will rely on being able to refer to the APB DMA node using a
> phandle.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: Added this to tegra30.dtsi too. Fixed interrupt IDs. Fixed reg to
> include all the per-channel registers.

Thanks, applied 1-4.


-Olof
