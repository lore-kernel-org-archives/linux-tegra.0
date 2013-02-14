From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dt: add header to define tegra20 clocks
Date: Thu, 14 Feb 2013 10:54:28 -0700
Message-ID: <511D24D4.6070805@wwwdotorg.org>
References: <1360791198-29462-1-git-send-email-swarren@wwwdotorg.org> <1360823899-17846-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360823899-17846-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/13/2013 11:38 PM, Hiroshi Doyu wrote:
> To replace magic number in "clocks = <&tegra_car 28>;"

I like the concept here; I was thinking about doing this today, but you
beat me to it:-) Feel free to create the Tegra30 header too, and modify
all the *.dts* files.

To address other comments in this thread: Yes, I think that we will want
to modify the clock driver to include this header to avoid
duplication/errors (that will require adjusting Linux's include path),
and also remove the list of IDs from the binding document; it can just
refer the the new header by name and cause the header to *be* part of
the binding document.
