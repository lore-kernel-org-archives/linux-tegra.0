From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Enable CROS_EC_PROTO for ChromeOS EC mfd
 driver
Date: Wed, 19 Aug 2015 21:29:46 +0200
Message-ID: <55D4D92A.7010107@osg.samsung.com>
References: <1439881599-22348-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439881599-22348-1-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

On 08/18/2015 09:06 AM, Javier Martinez Canillas wrote:
> The ChromeOS mfd driver (MFD_CROS_EC) select the CROS_EC_PROTO config
> symbol because the driver uses some communication helper functions in
> drivers/platform/chrome/cros_ec_proto.c but other drivers depends on
> CROS_EC_PROTO instead. Mixing select and depends can lead to circular
> Kconfig dependencies so the MFD_CROS_EC select should be changed to a
> depends on CROS_EC_PROTO instead.
> 
> But doing so will break git bisect-ability since MFD_CROS_EC will not
> be enabled anymore unless the default configs first explicitly enable
> the CROS_EC_PROTO dependency.
> 
> Also enable CHROME_PLATFORMS since the CROS_EC_PROTO symbol is inside
> that submenu.
> 
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---

This patch has been superseded by the "[PATCH 0/6] ChromeOS EC
Kconfig cleanups" series: https://lkml.org/lkml/2015/8/19/194

Please just ignore it.

Best regards,
--
Javier Martinez Canillas
Open Source Group
Samsung Research America
