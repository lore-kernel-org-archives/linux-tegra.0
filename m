From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V3 2/2] MAINTAINERS: update Tegra section to capture all
 Tegra files
Date: Mon, 11 Feb 2013 16:02:48 -0800
Message-ID: <1360627368.4707.8.camel@joe-AO722>
References: <1360626016-23332-1-git-send-email-swarren@wwwdotorg.org>
	 <1360626016-23332-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360626016-23332-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 2013-02-11 at 16:40 -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The intent is to ensure that all Tegra-related patches are sent to the
> linux-tegra@ mailing list, so people can keep up-to-date on all misc
> driver changes.
> 
> Doing this with a keyword is far simpler and more compact than listing
> all Tegra-related drivers, even if wildcards were used.
> 
> Words such as integrate or integrator are common. Ensure the character
> right before "tegra" isn't a-z (case-insensitive), to make sure the
> keyword doesn't match those.
> 
> The only files that the keyword doesn't match are the NVEC driver. Add
> the linux-tegra mailing list to the NVEC entry to solve this.

You should probably add some commentary/documentation
to the K: section description of MAINTAINERS in patch 1/2.

Something about K: patterns also matching filenames.

	K: Keyword perl extended regex pattern to match content in a
	   patch or file.  For instance:
	   K: of_get_profile
	      matches patches or files that contain "of_get_profile"
	   K: \b(printk|pr_(info|err))\b
	      matches patches or files that contain one or more of the words
	      printk, pr_info or pr_err
	   One regex pattern per line.  Multiple K: lines acceptable.
