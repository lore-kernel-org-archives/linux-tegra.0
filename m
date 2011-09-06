From: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH REPOST 0/3] i2c: tegra: Outstanding patches
Date: Wed, 7 Sep 2011 00:15:20 +0100
Message-ID: <20110906231520.GB25655@freya.fluff.org>
References: <1314726370-8193-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1314726370-8193-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 30, 2011 at 11:46:07AM -0600, Stephen Warren wrote:
> For convenience, here's a repost of the outstanding patches for the Tegra
> I2C driver.

applied all of them.

in future, it would be helpful to have just i2c-tegra on the
front of the subject. fixed these up and put them in pull req
to linus
 
> Doug Anderson (1):
>   i2c: tegra: fix possible race condition after tx
> 
> John Bonesio (1):
>   i2c: Tegra: Add of_match_table
> 
> Mike Rapoport (1):
>   i2c: i2c-tegra: add I2C_FUNC_SMBUS_EMUL
> 
>  drivers/i2c/busses/i2c-tegra.c |   60 ++++++++++++++++++++++++++++++----------
>  1 files changed, 45 insertions(+), 15 deletions(-)
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-i2c" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
