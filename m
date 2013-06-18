From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] tegrarcm: Add version command
Date: Mon, 17 Jun 2013 21:58:57 -0600
Message-ID: <51BFDB01.6030606@wwwdotorg.org>
References: <1371525867-2551-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371525867-2551-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/17/2013 09:24 PM, Allen Martin wrote:
> Add command line option "--version" that prints the version number and
> exits.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I assume you'll apply all these.

Although...

> +static void print_version(char *progname)
> +{
> +	fprintf(stderr, "%s %s\n", PACKAGE_NAME, PACKAGE_VERSION);
> +}

I wonder if that shouldn't print to stdout; it's the requested output of
the command, not some error message.
