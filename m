From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 2/3] regulator: tps6586x: add and use correct voltage
 table
Date: Thu, 05 Dec 2013 10:10:18 -0700
Message-ID: <52A0B37A.2020900@wwwdotorg.org>
References: <cover.1386108712.git.stefan@agner.ch> <127fe07e18665f93aa8d7c03e03164f1a049ddb6.1386108712.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <127fe07e18665f93aa8d7c03e03164f1a049ddb6.1386108712.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/03/2013 03:18 PM, Stefan Agner wrote:
> Depending on the regulator version, the voltage table might be 
> different. Use version specific regulator tables in order to
> select correct voltage table. For the following regulator versions
> different voltage tables are now used:
> 
> * TPS658623: Use correct voltage table for SM2 * TPS658643: New
> voltage table for SM2
> 
> Both versions are in use on the Colibri T20 module. Make use of
> the correct tables by requesting the correct SM2 voltage of 1.8V.
> 
> This change is not backward compatible since an old driver is not
> able to correctly set that value. The value 1.8V is out of range
> for the old driver and will refuse to probe the device. The
> regulator starts with default settings and the driver shows
> appropriate error messages.
> 
> On Colibri T20, the old value used to work with TPS658623 since
> the driver applied a wrong voltage table too. However, the
> TPS658643 used on V1.2 devices uses yet another voltage table and
> those broke that pseudo-compatibility. The regulator driver now has
> the correct voltage table for both regulator versions and those the
> correct voltage can be used in the device tree.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
(yes, taking this through the MFD tree with patch 1/3 makes sense)
