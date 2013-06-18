From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] tegrarcm: License update for miniloader files
Date: Mon, 17 Jun 2013 22:08:54 -0600
Message-ID: <51BFDD56.7060302@wwwdotorg.org>
References: <1371525937-2713-1-git-send-email-amartin@nvidia.com> <1371525937-2713-2-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371525937-2713-2-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/17/2013 09:25 PM, Allen Martin wrote:
> This changes the license under which the miniloader files are
> distributed to the same license used for the binary portions of the
> Tegra L4T distribution.  This should hopefully make the license more
> palatable to distributions.
> 
> Also changed the description to say that the license applies to all
> files in the miniloader directory instead of individually listing the
> files.  This should hopefully prevent it from becoming stale.

This still seems rather over-complex:-(

> +2.1.1  Rights.  Customer may install and use one copy of the SOFTWARE
> +on a single computer, and except for making one back-up copy of
> +the Software, may not otherwise copy the SOFTWARE.  This LICENSE
> +of SOFTWARE may not be shared or used concurrently on different
> +computers.
> +
> +2.1.2  Linux/FreeBSD Exception.  Notwithstanding the foregoing terms
> +of Section 2.1.1, SOFTWARE designed exclusively for use on the Linux or
> +FreeBSD operating systems, or other operating systems derived from the
> +source code to these operating systems, may be copied and redistributed,
> +provided that the binary files thereof are not modified in any way
> +(except for unzipping of compressed files).

Given that 2.1.2 appears to override 2.1.1 in the context of this SW,
why even include 2.1.1? I know we're re-using the L4T license here, but
I'd really prefer to just use something plain and simple that doesn't
include irrelevant lawyer-speak.

> +No Rental.  Customer may not rent or lease the SOFTWARE to someone
> +else.

Isn't that going to cause problems for distros? IANAL, but that doesn't
sound GPL compatible, since it's an additional restriction that I don't
think the GPL imposes.
