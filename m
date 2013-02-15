From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: remove warning dump if timeout happen in
 transfer
Date: Fri, 15 Feb 2013 20:18:26 +0100
Message-ID: <20130215191826.GC4351@the-dreams.de>
References: <1360845813-11334-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1360845813-11334-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 14, 2013 at 06:13:33PM +0530, Laxman Dewangan wrote:
> If timeout error occurs in the i2c transfer then it was dumping warning
> of call stack.
> 
> Remove the warning dump as there is may be possibility that some slave
> devices are busy and not responding the i2c communication.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I'd like to have the patch extended. Currently, i2c-tegra is the only
I2C user of BUG and BUG_ON. Could you maybe extend the patch to handle
those situations more gracefully while we are at it? From a glimpse,
these situations don't need a complete halt of the kernel?

Thanks,

   Wolfram
