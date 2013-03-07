From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/2] get_maintainer: create filename-only regex match type
Date: Wed, 06 Mar 2013 16:06:07 -0800
Message-ID: <1362614767.2093.29.camel@joe-AO722>
References: <1362613005-31439-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1362613005-31439-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Stephen Warren <swarren@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-03-06 at 16:36 -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> Create a new N: entry type in MAINTAINERS which performs a regex match
> against filenames; either those extracted from patch +++ or --- lines,
> or those specified on the command-line using the -f option.

NAK

At least get the prefix right and remove the
now incorrect filename matches in K:

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9561658..1671842 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -90,6 +90,9 @@ Descriptions of section entries:
>  	   F:	drivers/net/*	all files in drivers/net, but not below
>  	   F:	*/net/*		all files in "any top level directory"/net
>  	   One pattern per line.  Multiple F: lines acceptable.
> +	N: Files and directories with regex patterns.
> +	   K:	[^a-z]tegra	all files whose patch contains the word tegra

N: not K:

> +	   One pattern per line.  Multiple N: lines acceptable.
>  	X: Files and directories that are NOT maintained, same rules as F:
>  	   Files exclusions are tested before file matches.
>  	   Can be useful for excluding a specific subdirectory, for instance:

and remove the K: descriptions that show filename too.

> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index ce4cc83..27dc5cb 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -611,7 +611,7 @@ sub get_maintainers {
>  				    $hash{$tvi} = $value_pd;
>  				}
>  			    }
> -			} elsif ($type eq 'K') {
> +			} elsif ($type eq 'K' || $type eq 'N') {
>  			    if ($file =~ m/$value/x) {
>  				$hash{$tvi} = 0;
>  			    }

Remove K:  It has no value here.
