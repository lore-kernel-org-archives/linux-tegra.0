From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 5/6] usb: host: ehci-tegra: Use devm_ioremap_resource
 instead of devm_ioremap
Date: Mon, 12 May 2014 10:58:26 -0600
Message-ID: <5370FDB2.40704@wwwdotorg.org>
References: <1399723210-21569-1-git-send-email-gautam.vivek@samsung.com> <1399723210-21569-6-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399723210-21569-6-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shc_work-JGs/UdohzUI@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/10/2014 06:00 AM, Vivek Gautam wrote:
> Using devm_ioremap_resource() API should actually be preferred over
> devm_ioremap(), since the former request the mem region first and then
> gives back the ioremap'ed memory pointer.
> devm_ioremap_resource() calls request_mem_region(), therby preventing
> other drivers to make any overlapping call to the same region.

This patch on its own works OK on Tegra. However, if a similar patch
were to be applied to the Tegra PHY driver, then I expect that would
break USB on Tegra. The reason is that the Tegra USB controller and PHY
registers are interleaved a bit randomly within the same address range,
and rather than call out which individual addresses are relevant to the
controller and the PHY, the DT for both devices just specifies the same
whole range, and the drivers only touch the appropriate registers within
the range. Perhaps we should have described that as an MFD rather than
separate DT nodes and devices, but that's not what we ended up with.
