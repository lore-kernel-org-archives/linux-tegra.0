From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH V2 2/4] i2c: tegra: Support DVC controller in device tree
Date: Mon, 19 Dec 2011 17:57:10 -0800
Message-ID: <20111220015710.GB27789@quad.lixom.net>
References: <1324189772-26914-1-git-send-email-swarren@nvidia.com>
 <1324189772-26914-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1324189772-26914-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Dec 17, 2011 at 11:29:30PM -0700, Stephen Warren wrote:
> One of the Tegra I2C blocks is inside the DVC (Digital Voltage Controller)
> block. This block is identical to the rest of the I2C blocks, except that
> it only supports master mode, it has registers moved around, and it needs
> some extra init to get it into I2C mode.  The register moves are handled
> by i2c_readl and i2c_writel
> 
> This patch adds a new compatible value for controllers of this "DVC"
> type; I figured that this approach was reasonable, as opposed to adding
> an is-dvc property under the existing compatible value, since the HW
> truly is different.
> 
> v2: Call of_device_is_compatible() to determine is_dvc, instead of storing
> the flag in tegra_i2c_of_match[]'s .data field.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

I've applied this one as well to the tegra for-3.3/drivers. Ben, let me know if
you want it through your tree but since it mostly fixes device tree usage
I figured it's OK for us to take.


-Olof
