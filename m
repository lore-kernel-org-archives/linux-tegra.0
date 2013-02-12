From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V3 1/2] get_maintainer: allow keywords to match filenames
Date: Mon, 11 Feb 2013 16:00:26 -0800
Message-ID: <1360627226.4707.6.camel@joe-AO722>
References: <1360626016-23332-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360626016-23332-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 2013-02-11 at 16:40 -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Allow K: entries in MAINTAINERS to match directly against filenames;
> either those extracted from patch +++ or --- lines, or those specified
> on the command-line using the -f option.
[]
> I don't think setting exact_pattern_match_hash would be appropriate here;
> at least for intended Tegra use case, this feature is to ensure that all
> Tegra-related driver changes get Cc'd to the Tegra mailing list. Setting
> exact_pattern_match_hash would prevent git history parsing for e.g. S-o-b
> tags, which still seems like it would be useful. Hence, this flag isn't
> set.

And I don't think that's necessary because for filenames,
you could add the appropriate control to the MAINTAINERS

"K:	^pattern$"

> The value in $hash{$tvi} doesn't seem relevant, so I just assign 0.

0 is good.

It would be relevant if --pattern-depth was set.

> Joe, I'm not sure if you care where this gets merged; could it go through
> arm-soc together with patch 2/2? A quick look at git history of the
> script in linux-next indicates there won't be conflicts doing that.

I don't care how it gets merged.

Andrew Morton typically picks these up but
if you want to get it merged separately,
I don't see a problem.

trivial comment below:

> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
[]
> @@ -611,6 +611,10 @@ sub get_maintainers {
>  				    $hash{$tvi} = $value_pd;
>  				}
>  			    }
> +			} elsif ($type eq "K") {

This should probably be 'K' to match the other
'F' use above it.
