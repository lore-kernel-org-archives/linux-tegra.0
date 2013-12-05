From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 3/3] ARM: tegra: correct Colibri T20 regulator settings
Date: Thu, 05 Dec 2013 10:12:43 -0700
Message-ID: <52A0B40B.7040903@wwwdotorg.org>
References: <cover.1386108712.git.stefan@agner.ch> <fc7440a2f4bf9ab95e47a911c0e0b3b6a2250356.1386108712.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fc7440a2f4bf9ab95e47a911c0e0b3b6a2250356.1386108712.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/03/2013 03:18 PM, Stefan Agner wrote:
> Set the parent of the regulators LDO2 to LDO9 according to the
> schematic. Set the base voltage to 3.3V, there is only 3.3V on the
> module itself.
> 
> Set the Core and CPU voltage to the specified voltages of 1.2V and
> 1.0V respectivly.
> 
> LDO6 should deliver 2.85V. The attached peripherals were not in
> use so far.

Does this depend on patch 1/3 or 2/3, or can I apply it to the Tegra
tree which doesn't include those patches?

If this does depend on patch 1/3 or 2/3... this patch feels a bit big to
apply to the MFD tree. Perhaps patch 1/3 and 2/3 could be applied alone
to a topic branch in the MFD tree so I can merge that into the Tegra
tree in order to apply this?
